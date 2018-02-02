'
R 語言探索性資料分析與資料視覺化
資料型態與向量操作 (Data types and vector operation)
'

# 將此行轉向你的程式碼放置路徑
# Target to the folder where you put the codes
setwd("D:/Dropbox/Sinica_Project/Theta/AIA/lectures")

### Number and String ====

this.is.a.numeric_item <- 101
this.is.a.numeric_item2 <- c(101,201,301,101)
this.is.a.character_item <- "101" # to define a character variable, use bracket or double bracket
this.is.a.character_item2 <- "abcbabd"

# function: typeof
# 列出一個變數 (物件) 的屬性
# Show the type of a variable (object)
typeof(this.is.a.numeric_item)
typeof(this.is.a.numeric_item2)
typeof(this.is.a.character_item)
typeof(this.is.a.character_item2)


# 數值變數才可以進行數學運算
# Only numeric variable can do mathematical operation
this.is.a.numeric_item + 101
this.is.a.numeric_item2[2] + 101
this.is.a.numeric_item2 + 101 # 對所有元素+101
print(this.is.a.character_item) # 文字會被雙引號括起來
this.is.a.character_item + 101 # this line will make a error

print(this.is.a.numeric_item)
print(this.is.a.character_item)
this.is.a.numeric_item + this.is.a.character_item # this line will make a error

# 數字型的字串變數可以被轉為數值變數, 非數字型文字會變成 NA
# A numeric-like character variables can be converted to a numeric variable. Non-numeric-like character will become NA.
print(this.is.a.character_item)
this.is.a.numeric_item.from.character <- as.numeric(this.is.a.character_item)
print(this.is.a.numeric_item.from.character)
print(this.is.a.character_item2)
this.is.a.numeric_item2.from.character2 <- as.numeric(this.is.a.character_item2)
print(this.is.a.numeric_item2.from.character2)

typeof(this.is.a.numeric_item.from.character)
typeof(this.is.a.numeric_item2.from.character2) # however, NA still be seen as double

this.is.a.numeric_item + this.is.a.numeric_item.from.character

### 警告: 任何數字對 NA 進行數學操作，都會返回 NA
### Warning: any math operation with NA will return NA
1 + NA
print(this.is.a.numeric_item)
print(this.is.a.numeric_item2.from.character2)
this.is.a.numeric_item + this.is.a.numeric_item2.from.character2

this.is.a.numeric_list <- c(1,2,3,4)
this.is.a.numeric_list2 <- c(1,2,3,4, NA)

sum(this.is.a.numeric_list)
sum(this.is.a.numeric_list2) # 只要有一個NA 就返回NA
sum(this.is.a.numeric_list2, na.rm = TRUE) # 將NA移除

mean(this.is.a.numeric_list2, na.rm = TRUE)

# 檢視變數列中，是否有 NA (以及NA 在哪)
# Check NA in the variable list
print(this.is.a.numeric_list2)
is.na(this.is.a.numeric_list2)
which(is.na(this.is.a.numeric_list2))

# 找到NA後，用mean取代
this.is.a.numeric_list2[which(is.na(this.is.a.numeric_list2))] <- mean(this.is.a.numeric_list2, na.rm = TRUE)
this.is.a.numeric_list2

# 字串形式可以被用任意字符切開
# Character can be splited by a character
print(this.is.a.character_item2)
help(strsplit)
strsplit(x = this.is.a.character_item2, split = "b")

# 尋找特定字眼是否出現在變數列中
# Find specific term in the variable list
# 注意: strsplit 回傳 double array, 要先取出一個
temp <- strsplit(x = this.is.a.character_item2, split = "b")[[1]]
print(temp)
"c" %in% temp # %in% 檢查前面的字串是否存在後面的變數中
"C" %in% temp
tolower("C") %in% temp


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


