#################################################
## Intro to R workshop - Example Code
##    2017-09-22
##################################################

#Set working directory to location of the data you downloaded
setwd("~/Documents/WorkshopMaterials/LATIS_Workshops/Intro_to_R_F18")

#####################
## Activity 2
#####################

read.csv("atus.csv", header=TRUE)

data <- read.csv("atus.csv", header=TRUE)

class(data)
names(data)
dim(data)
head(data)
tail(data)
str(data)
summary(data)
View(data)


#####################
## Activity 3
#####################

#re-read in data to specify missing values
data <- read.csv("atus.csv", header=TRUE, na.strings=c("9999", "9995", "99999.99"))
summary(data)


#find variable to rename
names(data)
which(names(data) == "WT06")
names(data)[7] <-  "CASEWEIGHT"

#Alternatively, you can replace the numeric column position with the which() function above that returns the variable position:
names(data)[which(names(data)=="WT06")] <- "CASEWEIGHT"

#check that it renamed correctly
head(data)
View(data)

#create a new data frame object for this subset
midwest <- subset(data, data$REGION == "Midwest")

#check to make sure it worked correctly
summary(midwest)

#use ifelse() to create a new variable indicating whether the respondent was at work on the data of data collection
midwest$atwork <- ifelse(midwest$EMPSTAT == "Employed - at work", 1, 0) 

#check to make sure it worked
summary(factor(midwest$atwork))

# now create a new variable that contains the hours spent on personal care
midwest$ACT_PCARE_HRS <- midwest$ACT_PCARE/60

#4. Create a histogram of hours worked
hist(midwest$ACT_PCARE_HRS)

#you can adjust the title and x/y labels:
hist(midwest$ACT_PCARE_HRS, main="Time Spent on Personal Care - Midwest", xlab="Hours")


###############################
# Activity 4
###############################

#write out as a .csv (base R)
# by default, R includes the row names as the first column of the csv file - often these are meaningless and results in an extra column with the row number. We will specify not to write that out with the "row.names" arugement.
write.csv(midwest, file="Midwest_ATUS_subset.csv", row.names=FALSE)

#save as an Rdata file
save(midwest, data, file="ATUS&Midwest_subset.Rdata")

#export a plot
# first initialize the device, in this case we will save as a png
png(file="Histogram_time_pcare_Midwest.png")
#next, run your plot
hist(midwest$ACT_PCARE_HRS, main="Time Spent on Personal Care - Midwest", xlab="Hours")
#then, turn off the device to close the file
dev.off()