setwd("L:/Jess/School/")
load("nc.RData")
summary(nc)
#compare the means of the distributions 
by(nc$weight, nc$habit, mean)
#conduct hypothesis tests
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", null = 0, 
          alternative = "twosided", method = "theoretical")
#find confidence interval
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0, 
          alternative = "twosided", method = "theoretical")
#switch order
inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", null = 0, 
          alternative = "twosided", method = "theoretical", 
          order = c("smoker","nonsmoker"))
