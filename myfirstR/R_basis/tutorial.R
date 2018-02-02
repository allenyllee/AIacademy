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








