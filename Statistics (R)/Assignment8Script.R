setwd("L:/Jess/School/")
load("mlb11.RData")
View(mlb11)

#display the relationship between runs and at-bats
plot(mlb11$runs ~ mlb11$at_bats)
#quantify the strength of the relationship with the correlation coefficient.
cor(mlb11$runs, mlb11$at_bats)
#select the line that you think does the best job of going through the cloud of points
plot_ss(x = mlb11$at_bats, y = mlb11$runs)
#select the line that minimizes the sum of squared residuals
plot_ss(x = mlb11$at_bats, y = mlb11$runs, showSquares = TRUE)
#use the lm function in R to fit the linear model 
m1 <- lm(runs ~ at_bats, data = mlb11)
summary(m1)
#Fit a new model that uses homeruns to predict runs
m2 <- lm(runs ~ homeruns, data = mlb11)
summary(m2)
#create a scatterplot with the least squares line laid on top.
plot(mlb11$runs ~ mlb11$at_bats)
abline(m1)
#check for (1) linearity, (2) nearly normal residuals, and (3) constant variability.
plot(m1$residuals ~ mlb11$at_bats)
abline(h = 0, lty = 3) # adds a horizontal dashed line at y = 0
#histogram
hist(m1$residuals)
#normal probaility plot
qqnorm(m1$residuals)
qqline(m1$residuals) # adds diagonal line to the normal prob plot
