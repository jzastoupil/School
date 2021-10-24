#Load the atheism.RData into R. 
setwd("L:/Jess/School/")
load("atheism.RData")
View(atheism)

#create a new dataframe called us12 that contains 
#only the rows in atheism associated with respondents 
#to the 2012 survey from the United States
us12 <- subset(atheism, nationality == "United States" & year == "2012")
#calculate the proportion of atheist responses
ath_prop <- sum(us12$response == 'atheist') / length(us12$response)
ath_prop
#construct confidence interval
prop.test(table(us12$response)[1], sum(table(us12$response)), correct=F)
#margin of error
usME = (.06518465-.03805375)/2 

#calculate CI for 2 other countries
#Romania
rom12 <- subset(atheism, nationality == "Romania" & year == "2012")
prop.test(table(rom12$response)[1], sum(table(rom12$response)), correct=F)
romME = (.017625805-0.005236212)/2

#Germany
ger12 <- subset(atheism, nationality == "Germany" & year == "2012")
prop.test(table(ger12$response)[1], sum(table(ger12$response)), correct=F)
gerME = (.1832445-.1208853)/2


n <- 1000
#make a vector p that is a sequence from 0 to 1 
#with each number separated by 0.01
p <- seq(0, 1, 0.01)
#find ME
me <- 2 * sqrt(p * (1 - p)/n)
#create a plot of ME vs. p
plot(me ~ p)

#change plot layout
par(mfrow = c(2,2))

#Simulate 500 samples of size 1040 from population
p <- 0.1
n <- 1040
p_hats <- rep(0, 5000)

for (i in 1:5000) {
  samp <- sample(c("atheist", "non_atheist"), n, replace = TRUE, prob = c(p, 1 - p))
  p_hats[i] <- sum(samp == "atheist")/n
}
#plot histogram
hist(p_hats, main = "p = 0.1, n = 1040", xlim = c(0, 0.18))

#summarize
summary(p_hats)
sd(p_hats)

#Repeat for n = 400 and p = 0.1
p <- 0.1
n <- 400
p_hats <- rep(0, 5000)

for (i in 1:5000) {
  samp <- sample(c("atheist", "non_atheist"), n, replace = TRUE, prob = c(p, 1 - p))
  p_hats[i] <- sum(samp == "atheist")/n
}
#plot histogram
hist(p_hats, main = "p = 0.1, n = 400", xlim = c(0, 0.18))

#summarize
summary(p_hats)
sd(p_hats)


#Repeat for n = 1040 and p = 0.02
p <- 0.02
n <- 1040
p_hats <- rep(0, 5000)

for (i in 1:5000) {
  samp <- sample(c("atheist", "non_atheist"), n, replace = TRUE, prob = c(p, 1 - p))
  p_hats[i] <- sum(samp == "atheist")/n
}
#plot histogram
hist(p_hats, main = "p = 0.02, n = 1040", xlim = c(0, 0.18))

#summarize
summary(p_hats)
sd(p_hats)

#Repeat for n = 400 and p = 0.02
p <- 0.02
n <- 400
p_hats <- rep(0, 5000)

for (i in 1:5000) {
  samp <- sample(c("atheist", "non_atheist"), n, replace = TRUE, prob = c(p, 1 - p))
  p_hats[i] <- sum(samp == "atheist")/n
}
#plot histogram
hist(p_hats, main = "p = 0.02, n = 400", xlim = c(0, 0.18))

#summarize
summary(p_hats)
sd(p_hats)

#reset layout
par(mfrow = c(1,1))
