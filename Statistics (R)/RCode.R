setwd("~/1STThomas/In-ClassPractice/NumericalData")

dat <- read.csv('Data.csv', header=T)

### Question 1 ###
t.test(x=dat$Qtr1, alternative = 'greater', mu=8.6)

### Question 2 ###
t.test(x=dat$Qtr2, y=dat$Qtr3, alternative = 'two.sided', mu=0, paired=TRUE)

### Question 3 ###
grp1 <- dat[dat$Year <= 1966,]
grp2 <- dat[dat$Year > 1966,]
t.test(grp1$Total, grp2$Total, alternative = 'two.sided', mu=0, paired=FALSE)

t.test(dat[dat$Year<=1966,]$Total, dat[dat$Year>1966,]$Total, alternative='two.sided', mu=0, paired=FALSE)


### Question 4 ###
library(reshape)
long <- melt(dat, id=c('Year', 'Total', 'ind'))
colnames(long) <- c('Year', 'Total', 'ind', 'Quarter', 'Revenue')

summary(aov(long$Revenue ~ long$Quarter))
boxplot(long$Revenue ~ long$Quarter)

pairwise.t.test(x=long$Revenue, g=long$Quarter, p.adjust.method = 'bonferroni')
