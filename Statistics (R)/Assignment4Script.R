setwd("L:/Jess/School/")
load("ames.RData")
#create variables
area <- ames$Gr.Liv.Area
price <- ames$SalePrice
#summary stats
summary(area)
hist(area)
#estimating the mean living area  using sample function
samp0 <- sample(area, 50)
samp1 <- sample(area, 50)
#compare samples
summary(samp0)
summary(samp1)
hist(samp0)
hist(samp1)
#average living area of homes using samp1
mean(samp1)
#generate 5000 samples and compute the sample mean of each.
sample_means50 <- rep(NA, 5000)
for (i in 1: 5000) {
  samp <- sample(area, 50)
  sample_means50[i] <- mean(samp)
}
hist(sample_means50)
#adjust the bin width of histogram 
hist(sample_means50, breaks = 25)
summary(sample_means50)
#Additional sampling distrubutions
sample_means10 <- rep(NA, 5000)
sample_means100 <- rep(NA, 5000)
for (i in 1: 5000) {
  samp <- sample(area, 10)
  sample_means10[i] <- mean(samp)
  samp <- sample(area, 100)
  sample_means100[i] <- mean(samp)
}
#plot the three distributions on top of one another.
par(mfrow = c(3, 1))
xlimits = range(sample_means10)
hist(sample_means10, breaks = 20, xlim = xlimits)
hist(sample_means50, breaks = 20, xlim = xlimits)
hist(sample_means100, breaks = 20, xlim = xlimits)
#reset the plot settings 
par(mfrow=c(1,1))

#Take a random sample of size 50 from price
sampprice <- sample(price, 50)
summary(sampprice)
#taking 5000 samples from the population of size 50 
#and computing 5000 sample means. 
sample_means50 <- rep(NA, 5000)
for (i in 1: 5000) {
  samp <- sample(price, 50)
  sample_means50[i] <- mean(samp)
}
hist(sample_means50)

#Change your sample size from 50 to 150, then compute 
#the sampling distribution using the same method as above
sample_means150 <- rep(NA, 5000)
for (i in 1: 5000) {
  samp <- sample(price, 150)
  sample_means150[i] <- mean(samp)
}
hist(sample_means150)

#Compare the distribution of the original population price to the sampling distribution 
par(mfrow = c(2, 1))
xlimits = range(price)
hist(price,  xlim = xlimits)
hist(sample_means150,   xlim = xlimits)
par(mfrow = c(1, 1))

