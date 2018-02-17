# =================
# 介面認識與套件安裝
# =================

# ctrl+enter to execute
1+1 # ctrl+enter to execute this line

# mark below lines and ctrl+enter to execute all lines
2+2
3+3
4+4

# assign environment varible
a <- 2
b <- 3

# show function help
help(plot)

# plot 5 points (x,y) from (1,1) to (5,5)
plot(1:5,1:5)

# load library 
library(data.table)

# install packages e1071
install.packages("e1071")

# load package e1071
library(e1071)

# show all installed packages
installed.packages()

# check if 'data.table' packages were installed
rownames(installed.packages()) # get each row names
'data.table' %in% rownames(installed.packages()) # return if string "data.table" in row names

# open new dataframe to show all installed package
View(installed.packages()) 

# execrise

# 1. 請在執行區 (command line) 搜尋 as.numeric 的函式說明
# 2. 請檢查 data.table 與 e1071 這兩個套件是否已經被安裝
# 3. 若沒有安裝，請用 install.packages 安裝缺少的套件

# ================
# 資料型態與向量運算
# ================

# R 裡面的index 是從1開始不是0
this.is.a.numeric_item2 <- c(101,201,301,101)

this.is.a.numeric_item2[1]
this.is.a.numeric_item2[1:3]

this.is.a.character_item2 <- "abcbabd"
temp <- strsplit(x = this.is.a.character_item2, split = "b")[[1]]
print(temp)
"c" %in% temp # %in% 檢查前面的字串是否存在後面的變數中
"C" %in% temp # case sensitive
tolower("C") %in% temp # change case


### Factor ====
'
Factor 的主要目的: 省空間 -- numeric vector + levels
The main idea of factor is to use memory efficiently -- numeric vector + levels
'
this.is.a.character_list <- c("A","B","C","B","A","A")

help(factor)

this.is.a.character_to_factor <- factor(this.is.a.character_list)
str(this.is.a.character_to_factor) # show strucure
# result: Factor w/ 3 levels "A","B","C": 1 2 3 2 1 1
# 原本的A B C 變成3個level, mapping到數字1 2 3, 所以原本的list 轉成數字表示
levels(this.is.a.character_to_factor) # show levels

# 因子可以是有順序性的
# Factor can be ordered by add "ordered = TRUE, levels = ..."
this.is.a.character_to_factor2 <- factor(this.is.a.character_list, 
                                         ordered = TRUE, 
                                         levels = c("C","B","A")) # 可以指定level的順序，由小到大: C=1, B=2, A=3
str(this.is.a.character_to_factor2)
# result: Ord.factor w/ 3 levels "C"<"B"<"A": 3 2 1 2 3 3
# 原本的 ("A","B","C","B","A","A") 變成 3 2 1 2 3 3
levels(this.is.a.character_to_factor2)


### list ====
# 建立一個含有多種資料型態在內的 list 
# Create a list with several data types inside

this.is.a.list <- list(100,
                       c(200,300,400),
                       'a',
                       c('cat','dog')
)
print(this.is.a.list)

# 用 [[ ]] 取得 list 中的 element
# To access the element in the list, use [[ ]]
length(this.is.a.list) # list 的長度
seq(length(this.is.a.list)) # 建立一個長度為list的數字向量
for (i in seq(length(this.is.a.list))) {
  # print the ith element in the list
  print(this.is.a.list[[i]]) 
}

### data.frame ==== 類似execl 的表格
mtcars
View(mtcars) # show mtcars in new tabs of data.frame

# 檢視資料集的前 n 行與後 n 行
# Examine the first/last few rows of the data frame
help(head)
head(mtcars)
head(mtcars, 5)
tail(mtcars) # n defaulf is 6

# 檢視資料的列名稱與欄名稱
# Examine the row names and column names of the data frame
rownames(mtcars)
colnames(mtcars)

# 檢視資料集中，每個欄位的資料型態
# Examine the type of the data frame of each column
mtcars$mpg
mtcars$hp
typeof(mtcars$mpg)

?sapply # sapply 對每個column 做同樣的動作
sapply(mtcars, typeof) # 對mtcars 每個col 取typeof

# 檢視資料集的摘要
# Examine the basic infomation and summary of the data frame
str(mtcars) # 了解資料的型態
summary(mtcars) # 了解資料的最大最小中位數分位數NA數...等

# 資料集中的某欄數值可以透過 $ 記號取得，或是用 "var"
# access a variable of data frame through $ or "var"
mtcars$mpg # will return vector
mtcars[, "mpg"] # will return vector #有逗號會回傳vector
mtcars[1:5, "mpg"] #取出前1~5 個mpg的值
mtcars["mpg"] # will return a data frame # 沒逗號會回傳data.frame

# 也可以透過 $ 創造新的欄位
# create new column through $
colnames(mtcars)
mtcars$hp.mpg <- mtcars$hp / mtcars$mpg # 建立一個新欄位hp.mpg = hp / mpg
print(head(mtcars[c("hp", "mpg", "hp.mpg")]))
colnames(mtcars)

# 選取特定列與欄資料
# access certain row and columns
mtcars[5, ] # display the 5th row of the data frame
mtcars[c(2,3,4), ] # display the 2 to 4 rows of the data frame
mtcars[2:4, ] # same as above
mtcars[c(2,3,5), ] # display 2,3,5 row

mtcars[c(2,3,4), c("mpg","cyl")]

### END  ==== 
# This is the end of this section
?rm
a <- c(1,2,3,4)
b <- c("a", "b", "c", "d")

rm(a) # only clear a
ls() # 列出環境變數
rm(list = ls()) # clear all variables

# ========================================
# execrise
# ========================================
# 1. 在向量 (1,4,2,NA,7,20,NA,15,10,5) 中，以中位數填補 NA

list <- c(1,4,2,NA,7,20,NA,15,10,5)

list[which(is.na(list))] <- median(list, na.rm = TRUE)
print(list)

# 2. 先用以下指令抓取資料
# ● movies = read.csv('https://goo.gl/ByTnpD', sep='|', stringsAsFactors=FALSE)
# 抓取後，請檢查所有欄位的資料型態
movies = read.csv('https://goo.gl/ByTnpD', sep='|', stringsAsFactors=FALSE)

sapply(movies, typeof)

# 3. 將金額的欄位 (票房, box) 轉換成數值型態，並分別計算票房前
# 10 名與後 10 名的金額總和

movie_list <- movies[, c("rank","box")]
num_of_item = 10

# =======
# method 1: for loop
# =======

# r - Creating a data frame from two vectors using cbind - Stack Overflow
# https://stackoverflow.com/questions/12787551/creating-a-data-frame-from-two-vectors-using-cbind
df <- data.frame(head=c(head(movie_list, num_of_item)[,"box"]), tail=c(tail(movie_list, num_of_item)[,"box"]))

# r - How to convert a factor to an integer\numeric without a loss of information? - Stack Overflow
# https://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-an-integer-numeric-without-a-loss-of-information

#install.packages("varhandle")
library(varhandle)
df <- unfactor(df)

df$head <- strsplit(x= df$head, split = "\\$")
df$tail <- strsplit(x= df$tail, split = "\\$")

# note: 如果要assign value 給該變數的 index i, 必須先初始化該變數
# 否則會出現 Error: object 'head_list2' not found
head_list2 = 0
tail_list2 = 0

for (i in seq(num_of_item) ){
  head_list2[i] <- as.numeric(df$head[[i]][2])
  tail_list2[i] <- as.numeric(df$tail[[i]][2])
}

sum(head_list2)
sum(tail_list2)


# =======
# method 2: unlist()
# =======
head_list <- strsplit(x= head(movie_list, num_of_item)[,"box"], split = "\\$")
tail_list <- strsplit(x= tail(movie_list, num_of_item)[,"box"], split = "\\$")

head_list2 = as.numeric(unlist(head_list)[2*(1:num_of_item)])
tail_list2 = as.numeric(unlist(tail_list)[2*(1:num_of_item)])

sum(head_list2)
sum(tail_list2)

# =======
# method 3: colsplit()
# =======
library(reshape2)
head_list2 <- colsplit(string=head(movie_list, num_of_item)[,"box"], pattern="\\$", names=c("Part1", "Part2"))[2]
tail_list2 <- colsplit(string=tail(movie_list, num_of_item)[,"box"], pattern="\\$", names=c("Part1", "Part2"))[2]

sum(head_list2)
sum(tail_list2)


# 4. 建立一個欄位新的 “year.pass” 紀錄自上映至今過了幾年，再計
# 算年平均票房，列出年平均票房最高的前 5 名電影

# r - month language in the as.date function - Stack Overflow
# https://stackoverflow.com/questions/18380514/month-language-in-the-as-date-function
Sys.setlocale("LC_TIME", "C") 
date <- as.Date(movies$date, "%B %d, %Y")
days.pass = as.numeric(Sys.Date() - date)

movies$year.pass <- days.pass/365


# =======
# method 1: for loop
# =======
box = 0 # initialized as numeric
for (i in seq(length(movies$box)) ){
  box[i] <- as.numeric(strsplit(movies$box, split="\\$")[[i]][2])
}
movies$box.per.year <- box/movies$year.pass

# sorting - rank and order in R - Stack Overflow
# https://stackoverflow.com/questions/12289224/rank-and-order-in-r
# rank returns a vector with the "rank" of each value. the number in the first position is the 9th lowest. order returns the indices that would put the initial vector x in order.
head(movies$name[order(movies$box.per.year, decreasing = TRUE)],5)



# =======
# method 2: unlist()
# =======
# r - Extract vectors from strsplit list without using a loop - Stack Overflow
# https://stackoverflow.com/questions/8996134/extract-vectors-from-strsplit-list-without-using-a-loop

cc <- strsplit(movies$box, split="\\$")
box <- as.numeric(unlist(cc)[2*(1:length(movies$box))])

movies$box.per.year <- box/movies$year.pass
head(movies$name[order(movies$box.per.year, decreasing = TRUE)],5)


# =======
# method 3: colsplit()
# =======
# r - Extract vectors from strsplit list without using a loop - Stack Overflow
# https://stackoverflow.com/questions/8996134/extract-vectors-from-strsplit-list-without-using-a-loop

library(reshape2)
box <- colsplit(string=movies$box, pattern="\\$", names=c("Part1", "Part2"))[2]

movies$box.per.year <- box/movies$year.pass
head(movies$name[order(movies$box.per.year, decreasing = TRUE)],5)

# ===========================

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

# ==================================
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



# =================================
### Customized function ====

a <- sample(1:100, 10, replace = F) # 從1~100中隨機抽取，取出不放回(replace=F)
print(a)

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

# ========================================
# execrise
# ========================================

#1a. 建立一個函式 check.fizz_and_buzz(x)
#● 當 input x 為 3 的倍數時，回傳 “Fizz”
#● 當 input x 為 5 的倍數時，回傳 “Buzz”
#● 當 input x 同時為 3 & 5 的倍數時，回傳 “FizzBuzz”
#● 當 input x 不為以上條件時
#○ 若 x 除以 7 的餘數小於 4，回傳 “Hi”
#○ 若 x 除以 7 的餘數大於等於 4，回傳 “Bye”

check.fizz_and_buzz <- function(x){
  
  out <- ""
  
  #x <- 19
  
  if(x %% 3 == 0){
    out <- paste(out, "Fizz", sep="")
  }
  
  #out
  
  if(x %% 5 == 0){
    out <- paste(out, "Buzz", sep="")
  }
  
  #out
  
  if (out == ""){
    if (x %% 7 < 4){
      out <- "Hi"
    }else{
      out <- "Bye"
    }
  }
  
  #out
  return(out)
}

# check
a <- c(1:100)

sapply(a[a%%3==0 & a%%5==0],check.fizz_and_buzz)
sapply(a[a%%3==0 & a%%5!=0],check.fizz_and_buzz)
sapply(a[a%%3!=0 & a%%5==0],check.fizz_and_buzz)
sapply(a[a%%3!=0 & a%%5!=0 & a%%7<4],check.fizz_and_buzz)
sapply(a[a%%3!=0 & a%%5!=0 & a%%7>=4],check.fizz_and_buzz)



#1b. 用迴圈印出 1 到 1000 呼叫 check.fizz_and_buzz 的結果

start_time <- proc.time()
for (i in c(1:1000)){
  print(check.fizz_and_buzz(i))
}
end_time <- proc.time()
elaps_time <- end_time - start_time
print(elaps_time)

#1c. 請以 sapply 執行 check.fizz_and_buzz, 範圍 1:1000，比較兩者速度
start_time <- proc.time()
sapply(c(1:1000),check.fizz_and_buzz)
end_time <- proc.time()
elaps_time <- end_time - start_time
print(elaps_time)



#2. 找出 mtcars 中，disp 高於中位數的車款

mtcars
mtcars[mtcars$disp > median(mtcars$disp),]
rownames(mtcars[mtcars$disp > median(mtcars$disp),]) # 不要忘記data.frame[row,col] 取得row 之後要加上逗號

# ================================
# Splitting a Large Data File in R using Strsplit and R Connection - Stack Overflow
# https://stackoverflow.com/questions/31645148/splitting-a-large-data-file-in-r-using-strsplit-and-r-connection/48728760#48728760
# ================================

# 1. Read original data into lines
lines <- c("A|1\tB|2\t0.5\t0.4", "C|3\tD|4\t0.9\t1", "E|5\tF|6\t0.7\t0.2")
lines

# 2. Load reshape2 library to import function colsplit, then use it with pattern "\t" to split lines into 4 columns named 1,2,3,4.
library(reshape2)
linessplit <- colsplit(lines, pattern="\t", names=c(1:4))
linessplit

# 3. That's make a function to take a row, split into rows and select the row we want.

# Take the first row of linessplit into colsplit:
tmp <- colsplit(linessplit[1,], pattern="\\|", names=c(1:2))
tmp

# Take transpose:
tmp <- t(colsplit(linessplit[1,], pattern="\\|", names=c(1:2)))
tmp

# Select first row:
tmp[1,]

# Make above steps a function split_n_select:
split_n_select <- function(x, sel=c(1), pat="\\|", nam=c(1:2)){
  tmp <- t(colsplit(x, pattern=pat, names=nam))
  tmp[sel,]
}

# 4. Use sapply to apply function split_n_select to each row in linessplit 
linessplit2 <- sapply(linessplit, split_n_select)
linessplit2

# 5. You can also select the second row by adding sel=c(2)
linessplit2 <- sapply(linessplit, split_n_select, sel=c(2))
linessplit2

# =====================
#What is the meaning of the "." (dot) in R? - Cross Validated
#https://stats.stackexchange.com/questions/10712/what-is-the-meaning-of-the-dot-in-r


a <- list(b=1)

class(a) # 物件a 的類別原本是 list
class(a) <- "myclass" # 指定物件a 的類別為 myclass
class(a) # 新的類別為 myclass

?class()
# Many R objects have a class attribute, a character vector giving 
# the names of the classes from which the object inherits. If the 
# object does not have a class attribute, it has an implicit class, 
# "matrix", "array" or the result of mode(x) (except that integer 
# vectors have implicit class "integer").

?UseMethod()
# When a function calling UseMethod("fun") is applied to an object 
# with class attribute c("first", "second"), the system searches 
# for a function called fun.first and, if it finds it, applies it 
# to the object.

# 宣告一個函數 myfunciton 使用 tmp 方法
myfunciton <- function(x,...) UseMethod("tmp")

# 定義tmp 方法套用到 myclass 類別的物件時的動作
tmp.myclass <- function(x,...) x$b+5

# 將函數myfunciton (使用tmp方法) 套用在物件a (屬於myclass)
myfunciton(a)

rm(list = ls())

# ====================
#r - Meaning of ~. (tilde dot) argument? - Stack Overflow
#https://stackoverflow.com/questions/13446256/meaning-of-tilde-dot-argument

# The left hand is the dependent variable, the right hand is 
# the independent variable. Much like y = bx + c means that y ~ x.
plot( mpg ~ cyl, data= mtcars ) # mpg (y) 對 cyl (x) 作圖

plot( cyl ~ mpg, data= mtcars ) # cyl (y) 對 mpg (x) 作圖

plot( cyl ~ ., data= mtcars ) # cyl (y) 對 除了cyl以外的欄位 (x) 作圖(分開畫)

plot( ~ ., data= mtcars ) # 對所有的組合從mpg vs. mpg 到 carb vs. carb 作圖 (畫在同一張)

mtcars

?lm # lm is used to fit linear models.

lm( mpg ~ ., data= mtcars) # 用 mpg (y) 對其他變數(x)做線性回歸

# =====================


