setwd("L:/Jess/School/")
load("ames.RData")
population <- ames$Gr.Liv.Area
samp <- sample(population, 60)
sample_mean <- mean(samp)
se <- sd(samp)/sqrt(60)
lower <- sample_mean - 1.96 * se
upper <- sample_mean + 1.96 * se
c(lower, upper)
mean(population)
#create empty vectors to save the means and standard deviations 
samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60
#loop to calculate the means and standard deviations 
#of 50 random samples
for(i in 1:50){
  samp <- sample(population, n)           # obtain a sample of size n = 60 from the population
  samp_mean[i] <- mean(samp)           # save sample mean in ith element of samp_mean
  samp_sd[i] <- sd(samp)                     # save sample sd in ith element of samp_sd
}
#construct the confidence intervals
lower <- samp_mean - 1.96 * samp_sd/sqrt(n)
upper <- samp_mean + 1.96 * samp_sd/sqrt(n)
#view the first interval.
c(lower[1], upper[1])
#plot the CIs
plot_ci(lower, upper, mean(population))
#Calculate 50 confidence intervals at the 99% confidence level
lower99 <- samp_mean - 2.58 * samp_sd/sqrt(n)
upper99 <- samp_mean + 2.58 * samp_sd/sqrt(n)
plot_ci(lower99, upper99, mean(population))




