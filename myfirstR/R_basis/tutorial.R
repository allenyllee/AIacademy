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



