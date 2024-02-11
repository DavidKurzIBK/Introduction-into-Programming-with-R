# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 10: Class and methods 
# Temperature conversion exercise (tinytests)
# Remark: extended and adapted test suite [S05]
# -----------------------------------------------

library('tinytest')

# definition of function
expect_silent(convert_temperature(0, "celsius", "kelvin"))

# error handling
# expect_error(convert_temperature(c(0, 100), "celsius", "kelvin"))  #                      --- acceted in 10
# expect_warning(convert_temperature("0", "celsius", "kelvin"))      #                      --- acceted in 10
expect_warning(convert_temperature("a", "celsius", "kelvin"))
expect_error(convert_temperature(0, "rankine", "kelvin"))

# partial argument names --- new, only in 10
expect_silent(convert_temperature(0, from = "K", to = "C"))
expect_silent(convert_temperature(0, from = "ke", to = "fah"))

# wrong argument names/missing arguments
expect_error(convert_temperature())                                 # missing all arguments
expect_error(convert_temperature(from = "celsius", to = "kelvin"))  # missing x             
# expect_error(convert_temperature(x = 15, from = "celsius"))         # missing to          --- accepted in 10, default argument 
# expect_error(convert_temperature(x = 15, to = "kelvin"))            # missing from        --- accepted in 10, default argument 

# calulations
expect_equal(convert_temperature(0, "celsius", "kelvin"), 273.15)
expect_equal(convert_temperature(convert_temperature(0, "celsius", "kelvin"), "kelvin", "celsius"), 0)

# ... with Kelvin 
expect_equal(convert_temperature(273.15, "kelvin", "celsius"), 0)
expect_equal(convert_temperature(273.15, "kelvin", "fahrenheit"), 32)
expect_equal(round(convert_temperature(100, "fahrenheit", "kelvin"), 1), 310.9)
