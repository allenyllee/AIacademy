'
R 語言探索性資料分析與資料視覺化
流程控制 (Flow control)
'

setwd("D:/Dropbox/Sinica_Project/Theta/AIA/lectures")

### Loop ====

# 創造一個從 1 到 10000，中間跨 2 的數值變數
# create a numeric variable from 1 to 100 with interval equal to 2
a <- seq(1,10000,2) # seq(start, stop, interval)
print(a[1:20]) # print first 20 elements in the variable "a"

# 每個數值都平方，使用 "for loop"
# square to each element in the variable with "for loop"
start.time <- proc.time() # proc.time() 回傳 CPU 時間
for (index in a) {
  print(index^2)
}
end.time <- proc.time()
time.loop.for <- end.time - start.time
print(time.loop.for)

# 每個數值都平方，使用 "while"
# square to each element in the variable with "while"
start.time <- proc.time()
index <- 1
while(index <= length(a) ){
  print(a[index]^2)
  index <- index + 1
}
end.time <- proc.time()
time.loop.while <- end.time - start.time
print(time.loop.while)

# 每個數值都平方，使用 vector
# square to each element in the variable directly
start.time <- proc.time()
print(a^2)
end.time <- proc.time()
time.loop.noloop <- end.time - start.time
print(time.loop.noloop)

print(time.loop.for)
print(time.loop.while)
print(time.loop.noloop)
### Condition control ====

# 條件式
# 基本用法: 用於數字向量 (>, == , < , or: |, and: &)
# basic usage: with numeric vector (>, == , < , or: |, and: &)
this.is.a.numeric_vec <- c(1,2,3,4,5)
x <- this.is.a.numeric_vec > 3 # 對向量的每個元素檢查是否大於3
print(x)
this.is.a.numeric_vec[this.is.a.numeric_vec > 3] # 回傳大於3的元素
this.is.a.numeric_vec[this.is.a.numeric_vec < 3 | this.is.a.numeric_vec > 3] # 回傳小於3或大於3的元素
this.is.a.numeric_vec[this.is.a.numeric_vec > 2 & this.is.a.numeric_vec < 4] # 回傳大於2且小於4的元素

# 條件式
# 基本用法: 用於文字向量
# basic usage: with character vector
this.is.a.char_vec <- c("a","b","c","d","a","c")
x <- this.is.a.char_vec != "c"
print(x)
this.is.a.char_vec[this.is.a.char_vec != "c"]

# 用於 data.frame
# conditional statement in data frame
head(mtcars)

which(mtcars$mpg > mean(mtcars$mpg)) # 回傳是true的項目index
sum(mtcars$mpg > mean(mtcars$mpg)) # 因為true被視為1，可以用sum() 計算為true的項目有幾個

mtcars[mtcars$mpg > mean(mtcars$mpg), ] # 回傳mpg欄中 中大於平均值的項目
nrow(mtcars[mtcars$mpg > mean(mtcars$mpg), ]) #回傳項目的總數


unique(mtcars$carb) # 回傳出現過的元素值(重複的值只算一次)

x <- which(mtcars$mpg > mean(mtcars$mpg) & mtcars$carb == 1) # 回傳mpg 欄中大於平均值, 且crab 值等於1 的項目index
print(x)
mtcars[x,]

# 條件判斷式
# condition statement
a <- sample(1:100, 10, replace = F) # 從1~100中隨機抽取，取出不放回(replace=F)
print(a)
for (i in a) {
  if (i <= 10 ) {
    print( paste(i, " is less than or equal to 10", sep = "") )
  } else if (i > 10 & i < 50) {
    print( paste(i, " is larger than 10 and smaller than 50"))
  } else {
    print( paste(i, " is larger than 50"))
  }
}

### Customized function ====

# 自訂義一個平方後加 1 的函式
# Define a function that squre(x) and add 1
squre_add_1 <- function(x, y = 10) { # y 的default 為 10
  # You can do anything here
  tmp <- x^2 + 1 + y
  
  # You have to return something to get output
  return(tmp)
}
squre_add_1(10) # y 使用default
squre_add_1(10, 2)

# 將前面判斷大小的範例轉成以向量進行, 結合 sapply 與 customized function
# Combine sapply and customized function to check element status in the variable list
check.status <- function(x) {
  if (x <= 10 ) {
    print("debug 1")
    out <- paste(x, " is less than or equal to 10", sep = " ?") # paste() 作用是連接字串
    return(out) 
  } else if (x > 10 & x < 50) {
    print("debug 2")
    out <- paste(x, " is larger than 10 and smaller than 50", sep = " |")
    return(out)
  } else {
    print("debug 3")
    out <- paste(x, " is larger than 50")
    return(out) 
  }
  print("debug 0")
  return("0") 
}

# sapply() 的執行順序跟for loop不同，
# for loop 是一個元素一個元素往下執行，所以可以看到對每個元素先print debug再 return
# 而sapply() 是以指令為單位，對所有元素操作一遍，在往下一個指令對所有元素操作一遍，以此類推...
sapply(a, check.status)

for(i in a){
  print(check.status(i))
}



### END  ==== 
# This is the end of this section
rm(list = ls()) # clear all variables

