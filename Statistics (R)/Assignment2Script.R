load("C:/Users/jzast/Desktop/School/cdc.RData")
names(cdc)
#how many variables and cases
dim(cdc)
names(cdc)
#variable type for genhlth
print(class("cdc$genhlth"))
#variable type for weight
print(class("cdc$weight"))
#variable type for smoke100
print(class("cdc$smoke100"))
#view a few rows
head(cdc)
tail(cdc)
#datasummary
summary(cdc$weight)
mean(cdc$weight)
var(cdc$weight)
median(cdc$weight)
#sample frequency
table(cdc$smoke100)
#relative frequency
table(cdc$smoke100)/20000
#create barplot
barplot(table(cdc$smoke100))
smoke = table(cdc$smoke100)
barplot(smoke)
#smokers across gender
gender_smokers = table(cdc$gender, cdc$smoke100)
mosaicplot(gender_smokers)
#numerical summary for gender
summary(cdc$gender)
#relative frequency distribution of genhlth
table(cdc$genhlth)/20000
#Subsetting
#return specific subset of data (row/column)
cdc[567, 6]
#see the weights for the first 10 respondents 
cdc[1:10, 6]
#all of the data for the first 10 respondents
cdc[1:10, ]
#all data
cdc[, 6]
cdc$weight
# weight for item 567
cdc$weight[567]
#weight for the first 10 respondents
cdc$weight[1: 10]
#extract just the data for the men in the sample
mdata = subset(cdc,cdc$gender=="m")
head(mdata)
#data for men over the age of 30
m_and_over30 = subset(cdc,cdc$gender=="m" & cdc$age>30)
#take people who are men or over the age of 30
m_or_over30 = subset(cdc, cdc$gender=="m" | cdc$age>30)
#respondents under the age of 23 that have smoked at least 100 cigarettes in their lifetime
under23_and_smoke = subset(cdc, cdc$smoke100==1 & cdc$age<23)
#how many people in the sample are under the age of 23 and have smoked at least 100 cigarettes in their lifetime?
dim(under23_and_smoke)
#box plot of height
boxplot(cdc$height)
#summary
summary(cdc$height)
#compare the heights of men and women
boxplot(cdc$height ~ cdc$gender)
#add BMI
bmi = (cdc$weight/cdc$height^2) * 703
#plot BMI and Health
boxplot(bmi ~ cdc$genhlth)
#plot BMI and exercise
boxplot(bmi ~ cdc$exerany)
#histograms
hist(cdc$age)
hist(bmi)
hist(bmi, breaks = 50)
#scatterplot of weight vd desired weight
plot(x = cdc$weight, y=cdc$wtdesire, type = "l")
