# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 04: Functions
# Barbecue grill temperature exercise (tinytests)
# -----------------------------------------------

library('tinytest')

# Tests for celsius_to_fahrenheit()

expect_error(celsius_to_fahrenheit("37"))                          # wrong type of argument 
expect_true(is.numeric(celsius_to_fahrenheit(37.3)))               # type of return 
expect_true(length(celsius_to_fahrenheit(37.3)) == 1)              # lenght of return 
expect_equal(celsius_to_fahrenheit(0), 32)                         # example calculation 
expect_equal(celsius_to_fahrenheit(100), 212)                      # example calculation 

# Tests for fahrenheit_to_celsius()

expect_error(faranheit_to_celsius("37"))                           # wrong type of argument 
expect_true(is.numeric(fahrenheit_to_celsius(100)))                # type of return 
expect_true(length(fahrenheit_to_celsius(100)) == 1)               # lenght of return 
expect_equal(fahrenheit_to_celsius(32), 0)                         # example calculation 
expect_equal(round(fahrenheit_to_celsius(100), 5), 37.77778)       # example calculation

# Integration test

expect_equal(fahrenheit_to_celsius(celsius_to_fahrenheit(15)), 15) # consistency test
