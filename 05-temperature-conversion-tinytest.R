# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 05: Conditional execution
# Temperature conversion exercise (tinytests)
# -----------------------------------------------

celsius_to_fahrenheit <- function(temp_c){
  
  #sanity chechks: 
  stopifnot(is.numeric(temp_c))
  
  # calculation:
  temp_fahrenheit <- temp_c * 9 / 5 + 32
  return(as.numeric(temp_fahrenheit))
  }


fahrenheit_to_celsius <- function(temp_f){
  
  temp_celsius <- (temp_f - 32) * 5 / 9
  return(as.numeric(temp_celsius))
}

temp_c <- 180L


library('tinytest')

# definition of function
expect_silent(convert_temperature(0, "celsius", "kelvin"))

# error handling
expect_error(convert_temperature(c(0, 100), "celsius", "kelvin"))
expect_warning(convert_temperature("a", "celsius", "kelvin"))
expect_warning(convert_temperature("0", "celsius", "kelvin"))
expect_error(convert_temperature(0, "rankine", "kelvin"))

# wrong argument names/missing arguments
expect_error(convert_temperature())                                 # missing all arguments
expect_error(convert_temperature(from = "celsius", to = "kelvin"))  # missing x
expect_error(convert_temperature(x = 15, from = "celsius"))         # missing to
expect_error(convert_temperature(x = 15, to = "kelvin"))            # missing from

# calulations
expect_equal(convert_temperature(0, "celsius", "kelvin"), 273.15)
expect_equal(convert_temperature(convert_temperature(0, "celsius", "kelvin"), "kelvin", "celsius"), 0)

# ... with Kelvin 
expect_equal(convert_temperature(273.15, "kelvin", "celsius"), 0)
expect_equal(convert_temperature(273.15, "kelvin", "fahrenheit"), 32)
expect_equal(round(convert_temperature(100, "fahrenheit", "kelvin"), 1), 310.9)

