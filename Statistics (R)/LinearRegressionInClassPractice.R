### Linear Regression Example ###

## Load data from the package faraway ##
#install.packages("faraway") #You only need to install this package once!
library(faraway)
data(twins)

############################################################
### SIMPLE LINEAR REGRESSION WITH A CONTINUOUS PREDICTOR ###
############################################################

## Plot the relationship ##
par(mar=c(4.5,4.5,0.5,0.5))
plot(twins$Foster ~ twins$Biological, 
     xlab = "biological IQ", ylab = "foster IQ", pch = 20, 
     col = "blue", cex = 1.25, las = 1, cex.axis = 1.5, cex.lab = 1.5)

## Compute correlation coefficient and the fitted model ##
r1 = cor(twins$Foster, twins$Biological)
fit1 = lm(twins$Foster ~ twins$Biological)

## Summarize the results of the model ##
summary(fit1)

## Plot the Results ##
par(mar=c(4.5,4.5,0.5,0.5))
plot(twins$Foster ~ twins$Biological, 
     xlab = "biological IQ", ylab = "foster IQ", pch = 20, 
     col = "blue", cex = 1.25, las = 1, cex.axis = 1.5, cex.lab = 1.5)
abline(fit1, col = "red", lwd = 2)
text(paste("R = ", round(r1,3)), x = 80, y = 125, cex = 1.5)

## Check conditions ##
# Scatterplot #
plot(twins$Foster ~ twins$Biological, 
     xlab = "biological IQ", ylab = "foster IQ", pch = 20, 
     col = "blue", cex = 1.25, las = 1, cex.axis = 1.5, cex.lab = 1.5)

# Residual Plot #
plot(twins$Biological, resid(fit1), 
     xlab = "biological IQ", ylab = "Residuals", pch = 20, 
     col = "blue", cex = 1.25, las = 1, cex.axis = 1.5, cex.lab = 1.5,
     ylim=c(-15,15))
abline(0,0)
dev.off()

# Q-Q plot #
dev.new()
qqnorm(resid(fit1), col="navy", pch=20)
qqline(resid(fit1), col="navy")


############################################################
### SIMPLE LINEAR REGRESSION WITH A Discrete PREDICTOR ###
############################################################

## Plot the relationship #
par(mar=c(4.5,4.5,0.5,0.5))
plot(twins$Foster ~ as.numeric(twins$Social), 
     xlab = "biological IQ", ylab = "foster IQ", pch = 20, 
     col = "blue", cex = 1.25, las = 1, cex.lab = 1.5, xaxt="n")
axis(side=1,at=c(1,2,3),labels = c("High", "Low", "Middle"))
dev.off()

## Compute the fitted model ##
fit2 = lm(twins$Foster ~ twins$Social)

## Summarize the results of the model ##
summary(fit2)


############################################################
###             MULTIPLE LINEAR REGRESSION               ###
############################################################
## Compute the fitted model ##
fit3 = lm(twins$Foster ~ twins$Biological + twins$Social)

## Summarize the results of the model ##
summary(fit3)

## Normal probability plot of residuals ##
qqnorm(resid(fit3)); qqline(resid(fit3))

## Histogram of the residuals ##
hist(resid(fit3), main="Histogram of Residuals", xlab="Residuals")

## Scatterplot of residuals vs fitted value ##
plot(fitted.values(fit3), resid(fit3), ylim=c(-15,15), pch=20,
     main="Residuals vs Fitted Values", xlab="Fitted Values", ylab="Residuals")
abline(0,0)

## Scatterplot of residuals vs order collected ##
plot(resid(fit3), ylim=c(-15,15), pch=20,
     main="Residuals vs Order of Data Collection", xlab="Ordered values", ylab="Residuals")
abline(0,0)

## Linear Relationship ##
dev.new()
par(mfrow=c(2,2))
plot(twins$Foster ~ twins$Biological, xlab="Biological IQ", ylab="Foster IQ")
plot(twins$Foster ~ ifelse(twins$Social=="high", 1, 0), xlab="Social = High", ylab="Foster IQ")
plot(twins$Foster ~ ifelse(twins$Social=="middle", 1, 0), xlab="Social = Middle", ylab="Foster IQ")
plot(twins$Foster ~ ifelse(twins$Social=="low", 1, 0), xlab="Social = Low", ylab="Foster IQ")

