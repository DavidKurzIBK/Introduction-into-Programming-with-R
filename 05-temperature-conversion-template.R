# -------------------------------------------
# Introduction to Programming with R
# Session 05: Conditional execution
# Exercise: Temperature conversion
# -------------------------------------------

# Preparation -------------------------------

# Re-visit the temperature conversion functions `celsius_to_fahrenheit()` and `fahrenheit_to_celsius()`
# from the "Barbecue grill temperature" exercise from Session 04.
# * `celsius_to_fahrenheit()`: Converts temperatures from degrees Celsius to degrees Fahrenheit.
# * `fahrenheit_to_celsius()`: Converts temperatures from degrees Fahrenheit to degrees Celsius.

# Tasks -------------------------------------

# 1. Write a new and more flexible function convert_temperature():
#    * Arguments:
#      * x: Numeric. Temperatures to be converted (same as before).
#      * from: Character. Original unit ("celsius" or "fahrenheit").
#      * to: Character. New unit ("fahrenheit" or "celsius").
#    * Instructions:
#      - Stop if x is not numeric (or use coercion with a warning).
#      - Stop if from or to are not character, or length not equal to `1L`.
#      - Stop if from and to are not in c("celsius", "fahrenheit"). (Hint: Use %in%.)
#      - If from is equal to to, no conversion is necessary and x can be returned.
#      - Otherwise select the right conversion formula based on the values of from and to.
#    * **Returns:** Numeric. Temperatures in the units specified in to.

convert_temperature <- function(temp,from,to){
  
  # sanity check 
  #stopifnot(is.numeric(temp))
  if(!is.numeric(temp)){
    warning("The input 'temp' is not numeric, attemptic coercion")
    x <- as.numeric(temp)
  }
  units <- c("celsius","fahrenheit","kelvin")
  stopifnot(is.character(from),length(from) == 1L)
  stopifnot(is.character(to),length(to) == 1L)
  stopifnot(from %in% units)
  stopifnot(to %in% units)

  # if no transformation is required: 
  if (from == to) return(temp)
  
  # transformation: 
  #if(from == "fahrenheit" & to == "celsius"){
  #  return((temp * 9 / 5) + 32)
  #} else {
  #  return(((temp - 32) * (5 / 9)))
    
  #}else if (from == "fahrenheit"& to == "kelvin"){
    
  #}else if (from == "celsius" & to == "fahrenheit"){
    
  #}else if (from == "celsius" & to == "kelvin"){
    
  #}else if (from == "kelvin" & to == "fahrenheit"){
    
  #}else (from == "kelvin" & to == "celsius"){
    
  #}
  
  
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


# 3. Download the tinytest test file for this exercise and
#    test your functions from task 2. Do you PASS all tests?


library("tinytest")
run_test_file("05-temperature-conversion-tinytest.R")



