#31 January 2019
vec1
length(vec1)
logic1 <- vec1<15
logic1
vec1[logic1]
new_vec <- vec1[logic1]
new_vec
sort(vec1)
sort(vec1, decreasing = TRUE)
order(vec1)
vec1[order(vec1)]
seq(1,10,2)
seq(1,10,length.out=25)
rep(1:3,5)
rep(1:3, each=5)
#removing NAs
vec2 <- c("a", "b", "c", NA)
is.na(vec2)
!is.na(vec2)
vec2[!is.na(vec2)]
set.seed(100)
sample(vec1)
sample(vec1,3) #sample 3 element without replacement
sample(vec1, 3, replace = T)

##
library(datasets)
library(help="datasets")
class(airquality)
class(10)
sapply(airquality, class)
summary(airquality)
head(airquality)
fix(airquality)
rownames(airquality)
colnames(airquality)
nrow(airquality)
ncol(airquality)
#cbind = column bind (append DFs with same # of rows)
#||ly rbind(df1,df2)


myDf1 <- data.frame(vec1, vec2)
myDf1$vec1 
myDf1
myDf1[c(1:5), c(2)]
subset(airquality, Day==1, select = -Temp)
airquality[which(airquality$Day==1), -c(4)]

#Sampling
set.seed(100)
trainIndex <- sample(c(1:nrow(airquality)), size = nrow(airquality)*0.7, replace = F)
airquality[trainIndex, ]
airquality[-trainIndex, ]

#merging dataframes
set.seed(100)
df1 = data.frame(StudentId = c(1:10), Subject = sample(c("Math", "Science", "Arts"), 10, replace=T))
summary(df1)
df1
df2 = data.frame(StudentNum = c(2, 4, 6, 12), Sport = sample(c("Football", "Tennis", "Chess"), 4, replace=T))
df2
table(airquality$Month[c(1:60)], airquality$Temp[c(1:60)])

#error handling
options(show.error.messages=T)
1<-1

