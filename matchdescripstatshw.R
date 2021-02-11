#import data
library(readr)
match <- read_csv("match.csv")


#Then load the tidyverse and psych package
library(tidyverse)
library(psych)



match <- match %>%
  mutate(whtls = wlage + wldvrce + wlkids + wllive + wljob + wlfinance +
          wlinterest + wlsexhis + wldatehis)

# frequency tables

match %>%
  count(cheat)

# histograms using ggplots

match %>%
  ggplot(aes(x=whtls)) +
  geom_histogram(binwidth=1)
# This data is right skewed (or positive skewed). Most participants tell very few white lies but a few tell a lot


match %>%
  ggplot(aes(x=ntlove)) +
  geom_histogram(binwidth=1)
# Based on this histogram,


# Create a boxplot of the number of times in love variable


# or you could have use base R

hist(cara$whtls)
hist(cara$ntlove)


# 2. scatterplots

match %>%
ggplot(aes(x=ntlove, y=whtls)) +
  geom_point()


# add jitter (the alpha here means how dark the jitter dots are. 1 = black; closer to 0 is lighter)
match %>%
  ggplot(aes(x=ntlove, y=whtls)) +
  geom_point() +
  geom_jitter(alpha = .6)


#3. Descriptive stats

# using tidyverse and psych
match %>%
  select(ntlove, whtls) %>%
  describe()


#or you could have used base R
mean(match$ntlove)
sd(match$ntlove)
summary(match$ntlove)

mean(match$whtls)
sd(match$whtls)
summary(match$whtls)

#7

match %>%
  pull(whtls) %>%
  describeBy(match$cheat)






