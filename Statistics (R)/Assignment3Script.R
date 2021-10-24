load("L:/Jess/School/kobe.RData")
head(kobe) 
#list sequence of hits and misses
kobe$basket[1: 9]
#calculate the lengths of all shooting streaks and then look at the distribution.
kobe_streak <- calc_streak(kobe$basket)
barplot(table(kobe_streak))
#use other visualizations and summaries of kobe streak for Q2
boxplot(kobe_streak)
#simulate flipping a fair coin 
outcomes <- c("heads", "tails")
sample(outcomes, size = 1, replace = TRUE)
sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
table(sim_fair_coin)
sim_unfair_coin <- sample(outcomes, size = 100, replace = TRUE, prob = c(0.2, 0.8))
table(sim_unfair_coin)
outcomes <- c("H", "M")
sim_basket <- sample(outcomes, size = 1, replace = TRUE)
table(sim_basket)
#adjust function for 45% percentage and 133 sample size
sim_basket <-sample(outcomes, size = 133, replace = TRUE, prob = c(0.45, 0.55))
table(sim_basket)
#look at Kobe's data alongside our simulated data
kobe$basket
sim_basket
sim_streak <- calc_streak(sim_basket)
barplot(table(sim_streak))
boxplot(sim_streak)
