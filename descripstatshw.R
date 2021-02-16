#import data
library(readr)
match <- read_csv("match.csv")

match2 <- match

match <- match1_1

#Then load the tidyverse and psych package
library(tidyverse)
library(psych)



# 1. create white lies variable

match <- match %>%
mutate(whtlies = wlage +
       wldvrce +
       wlkids +
       wllive +
       wljob +
       wlfinance +
       wlinterest +
       wlsexhis +
       wldatehis)


#2 Create a frequency distribution of the cheat variable.

match %>%
  count(cheat)

install.packages("descr")
library(descr)

freq(x = match$cheat)

# 3.	Create a histogram for the total white-lies score variable

match %>%
  ggplot(aes(x=whtlies)) +
  geom_histogram(binwidth=1)

#or

hist(match$whtlies)

# 4	Create a boxplot of the number of times in love variable.


match %>%
  ggplot(aes(x = "", y = ntlove)) +
  geom_boxplot() +
  geom_violin(alpha = .5)

# 5 Create a scatterplot of the association between the number of
# white lies and the number of times in love variables.

match %>%
  ggplot(aes(x = whtlies, y = ntlove)) +
  geom_point()

# 6

match %>%
  select(whtlies, ntlove) %>%
  describe()



# 7
match %>%
  pull(whtlies) %>%
  describeBy(match$cheat)


# Extra:
match %>%
  drop_na(cheat) %>%
  ggplot(aes(x = cheat, y = whtlies)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = .3)







