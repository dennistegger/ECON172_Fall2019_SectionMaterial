
######################
## ECON 172 Section 2
## Introduction to R
######################

## Install packages
#install.packages("haven") ## only run once to install
#install.packages("tidyverse") ## only run once to install
#install.packages("summarytools") ## only run once to install
#install.packages("stargazer") ## only run once to install
#install.packages("broom") ## only run once to install

## Load packages
library(haven) #this library allows you to load datasets in Stata format
library(tidyverse)
library(summarytools)
library(stargazer) ##This package is great for making tables in .html, .tex and many other formats.
library(broom)

## Set the working directory
setwd("ECON172_Spring2019_SectionMaterial/Section_02_IntroToR/")

## Load in data in csv form
colonials <- read.csv("colonials.csv")

## Let's take a look on the dataset.
colonials ## or print first 10 observations

## Let's take a look the variables in this dataset.
names(colonials) ## just print
colonials_variables <- names(colonials) ## store list, assigned "colonials_variables"
colonials_variables ## take a look at this list

## Let's look at some summary statistics.
## Here is the min, 25%-ile, median, mean, 75%-ile, and max for the variable gdppc
summary(colonials$gdppc) ## just print
colonials_sumstats <- summary(colonials$gdppc) ## store summary, "colonials_variables"
colonials_sumstats ## take a look at this summary

## Let's look specifically at mean GDP
mean(colonials$gdppc) ## just print
meangdp <- mean(colonials$gdppc) ## save as a variable, called "meangdp"
meangdp ## take a look at the value stored in of "meangdp"

## Univariate regression of log gdp per capita on property rights index.
lm(logGDP ~ protection, data=colonials) # display regression results
## Multivariate, adding absolute latitude.
lm(logGDP ~ protection + lat_abst, data=colonials) # display regression results
## Storing results
reg1 <- lm(logGDP ~ protection, data=colonials) # display regression results
reg2 <- lm(logGDP ~ protection + lat_abst, data=colonials) # display regression results

## Now access regresion results by:
summary(reg1) # access complete regression results

## Tables
stargazer(reg1, reg2,
          out="Table 1",type="latex",header=FALSE,  table.placement = "!h",
          title="Property Rights and Development",align=TRUE,
          report = "vc*st", omit.stat=c("LL","ser","f","rsq","adj.rsq"),no.space=TRUE)

## A scatterplot with titles
reg2 <- lm(logGDP ~ protection , data=colonials)
plot(colonials$protection,colonials$logGDP,
     xlab="protection against expropriation", ylab="Log (gdp per capita)")
abline(lm(logGDP ~ protection , data=colonials)) # line of best fit

