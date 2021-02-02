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

hist(cara$opquest)
hist(cara$goal)
hist(cara$demo)

# 2. scatterplots

match %>%
ggplot(aes(x=ntlove, y=whtls)) +
  geom_point()
# This is tough to interpret (sorry guys). Part of the reason why is because there is so much
# overlap in the data points (this is called overplotting). Also, it's a small sample size.
# There is a ggplot function called jitter that adds random noise to a plot, which some times can
# make plats easier to read.

# add jitter (the alpha here means how dark the jitter dots are. 1 = black; closer to 0 is lighter)
match %>%
  ggplot(aes(x=ntlove, y=whtls)) +
  geom_point() +
  geom_jitter(alpha = .6)
# still kind of hard to read... I would say that it is a close to zero correlation.


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








# 5.

# The data shows that of the three behaviors that Cara observed, opened ended questions occurred most
# frequently (M =  3.80, SD = 3.22, range = 12). Goals (M = 0.73, SD = 0.78, range = 3) and
# demonstrations (M = 0.83, SD = 1.12, range = 5) were fairly rare (there was more variability in
# demonstrations, compared to goals). The behaviors do not seem related to each other.

