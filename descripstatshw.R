#import data
library(readr)
cara <- read_csv("cara.csv")


#Then load the tidyverse and psych package
library(tidyverse)
library(psych)



# 1. histograms

# using ggplots
ggplot(cara, aes(x=opquest)) +
  geom_histogram(binwidth=1)
# This data looks slightly right skewed (or positive skewed). Most mothers asked a few open ended
# questions. But a few mothers asked a lot of open ended questions.


ggplot(cara, aes(x=goal)) +
  geom_histogram(binwidth=1)
# Based on this histogram, mentioning goals seems very rare. This variable
# also looks a little right skewed.

ggplot(cara, aes(x=demo)) +
  geom_histogram(binwidth=1)
# This data also looks slightly right skewed (or positive skewed).
# Most mothers used few demonstrations. But a few mothers asked a
# lot of open ended questions.


# or you could have use base R

hist(cara$opquest)
hist(cara$goal)
hist(cara$demo)

# 2. scatterplots

ggplot(cara, aes(x=opquest, y=goal)) +
  geom_point()
# This is tough to interpret (sorry guys). Part of the reason why is because there is so much
# overlap in the data points (this is called overplotting). Also, it's a small sample size.
# There is a ggplot function called jitter that adds random noise to a plot, which some times can
# make plats easier to read.

# add jitter (the alpha here means how dark the jitter dots are. 1 = black; closer to 0 is lighter)
ggplot(cara, aes(x=opquest, y=goal)) +
  geom_point() +
  geom_jitter(alpha = .6)
# still kind of hard to read... I would say that it is a close to zero correlation.

ggplot(cara, aes(x=opquest, y=demo)) +
  geom_point() +
  geom_jitter(alpha = .6)
# again - it looks to me like a zero correlation


ggplot(cara, aes(x=goal, y=demo)) +
  geom_point() +
  geom_jitter(alpha = .6)
# zero association - goals and demo are not related.

#3. Descriptive stats

# using tidyverse and psych
cara %>%
  describe()
# Number of open questions: M =  3.80, SD = 3.22, range = 12
# Goals: M = 0.73, SD = 0.78, range = 3
# Demonstrations: M = 0.83, SD = 1.12, range = 5

#or you could have used base R
mean(hw1$opquest)
sd(hw1$opquest)
summary(hw1$opquest)

mean(hw1$goal)
sd(hw1$goal)
summary(hw1$goal)

mean(hw1$demo)
sd(hw1$demo)
summary(hw1$demo)


#4. frequency tables

cara %>%
  count(opquest)

cara %>%
  count(goal)

cara %>%
  count(demo)

# 5.

# The data shows that of the three behaviors that Cara observed, opened ended questions occurred most
# frequently (M =  3.80, SD = 3.22, range = 12). Goals (M = 0.73, SD = 0.78, range = 3) and
# demonstrations (M = 0.83, SD = 1.12, range = 5) were fairly rare (there was more variability in
# demonstrations, compared to goals). The behaviors do not seem related to each other.

