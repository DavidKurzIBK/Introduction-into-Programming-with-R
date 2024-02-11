# ---------------------------------------------
# Name:        task10.R
# Author:      Dominik Scherer
# Date:        2021 - 05 - 18
# Description: Session 10 / Data Classes
# ---------------------------------------------


setwd("C:/Users/david/OneDrive - uibk.ac.at/MA/VU introduction into programming with R/win-library/3.6/Archive/Discdownscrpits")
load("traffic.rda")
# integer vector of length 365 is provided with information about the total 
# amount of traffic at Mittenwald for every day in the year 2017.

# ##########
# SESSION 10 - TRAFFIC

# EXERCISE A

# Turn the vector traffic into a data frame traffic with a single column total.
traffic <- as.data.frame(traffic)
colnames(traffic)[1] <- "total"
names(traffic)
rownames(traffic)

# Add a column date with the corresponding dates in "Date" format.
# Hint: Create a "Date" object for 2017-01-01 and then add the numbers from 0 to 364 to it.
# or
traffic$date <- as.Date("2017-01-01") + 0:364
# or
traffic$date <- seq(from = as.Date("2017-01-01"), to = as.Date("2017-12-31"), by = 1L)
head(traffic)

# Add a column month with the corresponding month in "factor" format.
# Hint: Extract format(..., "%m") and turn it into a factor using appropriate 
# levels from month.abb; or directly use format(..., "%b").
month.abb
factor(c(3, 4, 5, 8), levels = 1:12, labels = month.abb)

# basic factor we need
format(traffic$date, "%m")
as.integer(format(traffic$date, "%m"))

# extract format for factor 
traffic$month <- factor(as.integer(format(traffic$date, "%m")), levels = 1:12, 
                        labels = month.abb)
head(traffic)

# BETTER: use characters (but German):
format(traffic$date, "%b")
# Note: characters of object must fit levels but German vs. English (Dez vs. Dec)
Sys.setlocale("LC_ALL","en_GB")
# set R to English
format(traffic$date, "%b")
traffic$month <- factor(format(traffic$date, "%b"), levels = month.abb)
# levels not even necessary
head(traffic)

# Add a column wday with the corresponding week day in "factor" format.
# Hint: Extract format(..., "%w") and turn it into a factor using appropriate levels.
as.integer(format(traffic$date, "%w"))
# extract format for factor 
factor(c(1, 3, 5), levels = 1:7, 
       labels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))
# basic factor we need
traffic$wday <- factor(as.integer(format(traffic$date, "%d")), levels = 1:7, 
       labels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))

# Problem: because of integers it depends on which weekday is assigend to 0/1 and 
# choose 0:6 vs. 1:7 and wether label start with Sun vs. Mon vs. Tues...
# and we do not know which weekday the first of January was

# better: use characters; "%a" extracts the weekday
format(traffic$date, "%a")
traffic$wday <- factor(format(traffic$date, "%a"))
traffic$wday
head(traffic)

# or even faster: no that's wrong!!!!
# traffic$wday <- weekdays(as.Date(traffic$date))
# traffic
# head(traffic)


# EXERCISE B

# We are interested in the minimum, averge, and maximum of traffic per month (!)

# tapply()
# structure: tapply(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)
#   X: typically a vector (the data we would like to process).
#   INDEX: a factor object used for ‘grouping’. Automatically coerced to factor by as.factor() if needed. Defines the ‘groups’ for which FUN will be applied.
#   FUN: the function to be applied to each group.

min_monthly <- tapply(traffic$total, traffic$month, min)
max_monthly <- tapply(traffic$total, traffic$month, max)
mean_monthly <- tapply(traffic$total, traffic$month, mean)

# graph the results using line plots and/or bar plots.

barplot(min_monthly)
barplot(max_monthly)
barplot(mean_monthly)

# Do the same for the amount of traffic per week day.

min_daily <- tapply(traffic$total, traffic$wday, min)
min_daily
barplot(min_daily)
max_daily <- tapply(traffic$total, traffic$wday, max)
max_daily
barplot(max_daily)
mean_daily <- tapply(traffic$total, traffic$wday, mean)
mean_daily
barplot(mean_daily)


save(traffic, file = "traffic.rda");
load(file = "traffic.rda");
saveRDS(traffic, file = "traffic.rds")
traffic <- readRDS(file = "traffic.rds")


# #########################################
# SESSION 10: TEMPERATURE class and methods

# Write a new S3 class "temperature" that internally stores temperatures in Kelvin 
# but adds an attribute "units" (which can be "celsius", "fahrenheit", or "kelvin") 
# that controls how the temperatures should be displayed.

# Functions: Write a class constructor temperature() along with methods for as.double()
# (aka as.numeric()), print(), summary(), and plot(). Leverage your convert_temperature() 
# function and follow the steps below.

# EXERCISE A

# Clean up your function convert_temperature(x, from = "kelvin", to = "celsius") 
# from Session 05. In particular, in case you checked that x must be a single 
# numeric value, omit that check. The unit conversions can be easily applied to 
# numeric vectors x as well.

# Also, incorporate the match_temperature_units() function above so "c" or "CELSIUS" works
match_temperature_units <- function(x) {
match.arg(tolower(x), c("kelvin", "celsius", "fahrenheit"))
}


convert_temperature <- function(x, from, to) {
  
  # sanity checks (after length check removal)
  if (!is.numeric(x)) {
    warning ("input x is coerced to numeric ")
    x <- as.numeric(x)
  }
  if (!is.character(from) | length(from) != 1) stop("from is no character")
  if (!is.character(to) | length(to) != 1) stop("to is no character")
  
  # set temperature units 
  from <- match_temperature_units(from)
  to <- match_temperature_units(to)
  
  # temperature conversion if needed
  if (from == to) {
    temperature <- x
  } else if (from == "celsius" & to == "fahrenheit") {
    temperature <- x*9/5 + 32
  } else if (from == "celsius" & to == "kelvin") {
    temperature <- x+273.15
  } else if (from == "fahrenheit" & to == "celsius") {
    temperature <- (x-32)*5/9
  } else if (from == "fahrenheit" & to == "kelvin") {
    temperature <- (x-32)*5/9 + 273.15
  } else if (from == "kelvin" & to == "celsius") {
    temperature <- x - 273.15
  } else if (from == "kelvin" & to == "fahrenheit") {
    temperature <- (x-273.15)*9/5 + 32
  }
  
  # return temperature
  return(temperature)
}

# tests:
x <- c(-2.1, 9.3, 4.5, 17.7, 28.3, 19.9)
convert_temperature(x, from = "celsius", to = "kelvin")
convert_temperature(x, "CELSIUS", "kelvin")
convert_temperature(x, from = "C", to = "K")

# tinytest
getwd()
library(tinytest)
run_test_file("10-temperature-tinytest-A.R")
# all okay

# EXERCISE B
# Write a class creator temperature(x, units = "celsius") that converts the input 
# x from the given units (again: matched for convenience) to Kelvin, adds the class 
# "temperature" and an attribute "units". Store the original units on the attribute (for later).

temperature <- function(x, units = "celsius") {
  
  # set temperature units
  units <- match_temperature_units(units)
  
  # convert into kelvin
  res <- convert_temperature(x, from = units, to = "kelvin")
  
  # add class temperature
  class(res) <- "temperature"
  
  # add attribute "units" which stores the original input unit on it
  attr(res, "units") <- units
  
  # return transformed vector
  return(res)
}

# test
temperature(x)
temperature(x, "c")

# tiny test
run_test_file("10-temperature-tinytest-B.R")
# all okay


# EXERCISE C
# Write a method for as.numeric() for the "temperature" class. Note that 
# as.numeric() internally calls as.double() so that you need to provide 
# as.double.temperature(x, units = NULL, ...). If the units are NULL (default), 
# than simply use the "units" attribute from x. Convert the temperature from 
# Kelvin to units and strip off all attributes. The ... arguments are required 
# because the generic has them, but they are not used for anything here.

as.double.temperature <- function(x, units = "units", ...) {
  
  # match units and use units attr from x if units = NULL
  if (is.null(units)) units <- attributes(temperature(x))$units
  
  units <- match_temperature_units(units)
  
  # Convert the temperature from Kelvin to units 
  res <- convert_temperature(x, from = "kelvin", to = units)
  
  # strip of all attributes
  attributes(res) <- NULL
  
  
  # return numeric vector
  return(res)
}

# coerce as double
as.double.temperature <- function(x, units = "units",...){
  
  # make temperature a numeric value
  temperature <- as.numeric(x)
  
  
  # convert temperature from Kelvin to units as a numeric number
  x <- convert_temperatur(x, from = "kelvin", to = "units")
  
  # strip the attributes.
  attr(x) <- NULL 
  
  # return numeric vector
  return(x)
}

# test
as.numeric(x)
as.numeric(x, units = "F")
# PROBLEM: does not convert vector to Fahrenheit

# tinytest
run_test_file("10-temperature-tinytest-C.R")
