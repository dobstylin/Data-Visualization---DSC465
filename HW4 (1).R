
chi <- chicagopublicschoolsDataset

library(plyr)

head(chi)

names(chi)

count(chi, 'ZIP.Code')

count(chi, 'Wards')

count(chi, 'CPS.Performance.Policy.Level')

count(chi, 'CPS.Performance.Policy.Status')

count(chi, 'Safe')

count(chi, 'Effective.Leaders')

chiTable <- matrix(chi=c())

mosaicplot(chi, main = 'Safe Schools Vs Policy Level',
           color = TRUE)
mosaicplot(~Safe + CPS.Performance.Policy.Level, data = chi,
           color = TRUE)

chi1 <- chi[!(chi$Safe=='NOT ENOUGH DATA'),]

count(chi1, 'Safe')

chi1 <- chi1[!(chi1$CPS.Performance.Policy.Level=='NOT ENOUGH DATA'),]

chi1 <- chi1[!(chi1$Effective.Leaders=='NOT ENOUGH DATA'),]

chi1 <- chi1[!(chi1$School.Community=='NOT ENOUGH DATA'),]


head(chi1)

count(chi1, 'CPS.Performance.Policy.Level')

chi1$Safe <- as.character(chi1$Safe)
chi1$Safe[chi1$Safe == 'VERY STRONG'] <- 'VS'

chi1$Safe <- as.character(chi1$Safe)
chi1$Safe[chi1$Safe == 'VERY WEAK'] <- 'VW'

chi1$Effective.Leaders <- as.character(chi1$Effective.Leaders)
chi1$Effective.Leaders[chi1$Effective.Leaders == 'VERY STRONG'] <- 'VS'

chi1$Effective.Leaders <- as.character(chi1$Effective.Leaders)
chi1$Effective.Leaders[chi1$Effective.Leaders == 'VERY WEAK'] <- 'VW'

count(chi1, 'Safe')

mosaicplot(chi1, main = 'Safe Schools Vs Policy Level',
           color = TRUE)
mosaicplot(~Safe +CPS.Performance.Policy.Level, data = chi1,
           main = 'Safety and Performance Level',
           xlab = "Safety",
           ylab = "Performance Level",
           color = TRUE)

library(ggplot2)install.packages("devtools")
devtools::install_github("haleyjeppson/ggmosaic")

library(ggmosaic)
mosaic_examp <- ggplot(data = chi1) +
  geom_mosaic(aes(x = product(Safe), fill = Effective.Leaders)) +   
  labs(y="Safety", x="Effective Leaders", title = "Safety of Schools and Effective Leadership") 

mosaic_examp





