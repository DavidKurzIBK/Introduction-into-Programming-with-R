#------------------------exercise 10-A------------------------------------------



traffic <- data.frame(traffic)
names(traffic)[names(traffic) == "traffic"] <- "total"
d <- as.Date("2017-01-01")
d <- d + 0:364
date <- d
month <- factor(format(d,"%b"))
wday <- factor(format(d,"%a"))
traffic$date <- date
traffic$month <- month
traffic$wday <- wday


val <- seq_len(nlevels(traffic$month))
min <- tapply(X = traffic$total, INDEX = traffic$month, FUN = min)
avg <- tapply(X = traffic$total, INDEX = traffic$month, FUN = mean)
max <- tapply(X = traffic$total, INDEX = traffic$month, FUN = max)
  

plot(val, avg, type = 'l', ylim = range(traffic$total), xlab = 'month', xaxt = 'n', las = 1, ylab = '', main = 'Traffic')
lines(val,min,lty = 2)
lines(val,max,lty = 2)
axis(1, val, labels = month.abb)


# ---------------------------- exercise 10-B--------------------------------

# math a character 'x' to known units 
match_temperature_units <- function(x) {
  match.arg(tolower(x), c("kelvin", "celsius", "fahrenheit"))
}


convert_temperature <- function(temp,from,to){
  
  # sanity check 
  #stopifnot(is.numeric(temp))
  if(!is.numeric(temp)){
    warning("The input 'temp' is not numeric, attemptic coercion")
    x <- as.numeric(temp)
  }
  units <- c("celsius","fahrenheit","kelvin")
  from <- match_temperature_units(from)
  to <- match_temperature_units(to)
  stopifnot(is.character(from),length(from) == 1L)
  stopifnot(is.character(to),length(to) == 1L)
  stopifnot(from %in% units)
  stopifnot(to %in% units)
  
  # if no transformation is required: 
  if (from == to) return(temp)
  

  # Transformation 1: Define temperature in Celsius: 
  if (from == "fahrenheit"){
    celsius <- (temp - 32) * 5 / 9
  }else if (from == "kelvin"){
    celsius <- temp - 273.15
  }else {
    celsius <- temp
  }
  
  # Transformation 2: Define output from Celsius: 
  if (to == "fahrenheit"){
    return((celsius * 9 / 5 ) + 32)
  }else if (to == "kelvin"){
    return(celsius + 273.15)
  }else {
    return(celsius)
  }
}


x <- c(-2.1, 9.3, 4.5, 17.7, 28.3, 19.9)
convert_temperature(x, from = "celsius", to = "kelvin")


temperature <- function(x, units = "celsius"){
  stopifnot(is.numeric(x))
  units <- match_temperature_units(units)
  
  #define class attributes
  class(x) <- "temperature"
  attr(x, "units") <- units
  
  return(x)
  
}


x <- temperature(x)
x


convert_temperature(x, from = "celsius", to = "kelvin")

library("tinytest")
run_test_file("10-temperature-tinytest-A.R")
run_test_file("10-temperature-tinytest-B.R")
run_test_file("10-temperature-tinytest-C.R")




# coerce as double
as.numeric.temperature <- function(x, units = "units"){
  temperature <- as.numeric(x)
  as.numeric.temperatur(x, from = "kelvin", to = "units")
  attr(x) <- NULL 
  return(x)
}







