'
Quiz
R 語言探索性資料分析與資料視覺化
簡易模型使用及模型結果視覺化

'

library(data.table)
library(ggplot2)
library(scales)
library(e1071)
library(randomForest)
load('data/ggplot2_finished.RData')

df.allshop.info[is.na(n.share), n.share := 0]
DT <- df.allshop.info[, -c(1:5,7,13,16,18:19), with=F]

# linear regression
lm.fit <- lm(n.favorite ~ ., data = DT)
lm.select <- step(lm.fit)

summary(lm.fit)    # see R2 vs. adjusted R2
summary(lm.select) # see R2 vs. adjusted R2

lm.predict <- predict(lm.select, newdata = DT)
lm.result <- data.table(y = DT$n.favorite, yp = lm.predict)

# svm
svm.fit <- svm(n.favorite ~ ., data = DT)
svm.predict <- predict(svm.fit, newdata = DT)
svm.result <- data.table(y = DT$n.favorite, yp = svm.predict)

# random forest
rf.fit <- randomForest(n.favorite ~ ., data = DT)
rf.predict <- predict(rf.fit, newdata = DT)
rf.result <- data.table(y = DT$n.favorite, yp = rf.predict)

# scatter plot
ggplot(lm.result, aes(y, yp)) + 
  geom_point() + 
  geom_abline(slope = 1, lty = 2, color = 'red') +
  theme_bw()

ggplot(svm.result, aes(y, yp)) + 
  geom_point() + 
  geom_abline(slope = 1, lty = 2, color = 'red') +
  theme_bw()

ggplot(rf.result, aes(y, yp)) +
  geom_point() + 
  geom_abline(slope = 1, lty = 2, color = 'red') +
  theme_bw()

# combine them all
fit.result <- data.table(y_actual = DT$n.favorite, 
                         linear = lm.predict,
                         svm = svm.predict,
                         rf = rf.predict)

# scatter plot
fit.result.long <- melt(data = fit.result, id.vars = "y_actual")
rmse <- function(y.true, y.pred){
  sqrt(mean((y.true-y.pred)^2))
}
rmse.result <- fit.result.long[, .(rmse=rmse(y_actual, value)), by=variable]

ggplot(fit.result.long, aes(y_actual, value, color=variable)) +
  geom_point() +
  geom_abline(slope = 1, lty = 2, color = 'red') +
  geom_text(data = rmse.result, aes(label=paste0("RMSE: ", round(rmse, 2)),
                                    x=-Inf, y=Inf, hjust=0, vjust=1),
            size = 4,
            inherit.aes = F) +
  # the bigger hjust, the left label was placed; the bigger vjust, the low label was placed.
  facet_wrap(~ variable) +
  theme_bw()

# error distribution
abs.err.result <- fit.result[, lapply(.SD, function(x) abs(x-get("y_actual"))), .SDcols=-1]
abs.err.result <- melt(data = abs.err.result, measure.vars = 1:3)

ggplot(abs.err.result, aes(value, color = variable)) + 
  stat_ecdf() + 
  labs(y="cumulative probability", color="model type", x="absolute error") +
  theme_bw()

ggplot(abs.err.result, aes(variable, value, color = variable)) + 
  geom_boxplot() + 
  labs(y="absolute error") +
  theme_bw()

# cross validation with 8:2
i <- sample(1:nrow(DT), size = round(nrow(DT)*0.8))
train <- DT[i,]
test <- DT[-i,]

lm.fit <- lm(n.favorite ~ ., data = train)
lm.select <- step(lm.fit)

summary(lm.fit)    # see R2 vs. adjusted R2
summary(lm.select) # see R2 vs. adjusted R2

lm.predict <- predict(lm.select, newdata = DT)
lm.result <- data.table(y = DT$n.favorite, yp = lm.predict)
lm.result[i, type := 'train']
lm.result[-i, type := 'test']

# svm
svm.fit <- svm(n.favorite ~ ., data = train)
svm.predict <- predict(svm.fit, newdata = DT)
svm.result <- data.table(y = DT$n.favorite, yp = svm.predict)
svm.result[i, type := 'train']
svm.result[-i, type := 'test']

# random forest
rf.fit <- randomForest(n.favorite ~ ., data = train)
rf.predict <- predict(rf.fit, newdata = DT)
rf.result <- data.table(y = DT$n.favorite, yp = rf.predict)
rf.result[i, type := 'train']
rf.result[-i, type := 'test']

# combine result again
fit.result <- data.table(y_actual = DT$n.favorite, 
                         linear = lm.predict,
                         svm = svm.predict,
                         rf = rf.predict,
                         type = rf.result$type)
# compare rmse
fit.result.long <- melt(data = fit.result, id.vars = c("y_actual", "type"))
rmse.result <- fit.result.long[, .(rmse=rmse(y_actual, value)),
                               by=.(variable, type)]

ggplot(rmse.result, aes(variable, rmse, color=type, group=type)) +
  geom_point() +
  geom_line() +
  theme_bw()
