setwd("C:/Users/jzast/Desktop/School")
load("present.rdata")
#Check out variable information in data
dim(present)
names(present)
#Show variable vectors
present$boys
present$girls
#plot girls by year
plot(x = present$year, y = present$girls)
plot(x = present$year, y = present$girls, type = "l")
?plot
#add variables
present$boys + present$girls
#Create new variable
present$total <- present$boys + present$girls
#plot new variable
plot(present$year, present$total, type = "l")
#check out which.max function
?which.max
which.max(present$total)
#get ratio of boys to girls
present$boys/(present$boys + present$girls)
plot(x = present$year, y=present$boys/(present$boys + present$girls), type = "l")
sum(present$boys > present$girls, na.rm=TRUE)
#max of absolute difference between number of boys and girls born in each year
which.max(abs(present$boys - present$girls))
