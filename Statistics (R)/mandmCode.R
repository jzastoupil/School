#setwd("~/1STThomas/In-ClassPractice/CategoricalData")

dat <- read.csv("mandms.csv", header=T, row.names=1)


CLV <- c(0.124, 0.135, 0.131, 0.205, 0.207, 0.198)
HKP <- c(0.125, 0.125, 0.125, 0.25, 0.25, 0.125)

dat <- dat[-nrow(dat), 1:6]

freq <- as.data.frame(t(apply(dat, 2, sum))); row.names(freq) <- "Frequency"
N <- sum(freq)

### 1.	Is the true proportion of yellow M&M's less than 0.135? ###           
prop.test(x=freq$Yellow, n=N, p=0.135, alternative = "less", correct=F)

### 2.	Is there a difference between the proportions of orange and blue M&M's? ###
prop.test(x=c(freq$Orange, freq$Blue), n=c(N, N), alternative = "two.sided", correct=F)

### 3.	Do the reported proportions seem to be correct? ###
null.probs <- c(0.25, 0.125, 0.125, 0.125, 0.125, 0.25)
chisq.test(freq, p=null.probs)

### 4.	Do the proportions vary by plant? ###
dat2 <- as.table(cbind(CLV, HKP)*1000)
row.names(dat2) <- c("Brown", "Yellow", "Red", "Orange", "Blue", "Green")
chisq.test(dat2)
