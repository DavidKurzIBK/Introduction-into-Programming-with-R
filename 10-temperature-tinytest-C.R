# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 10: Class and methods 
# Temperature conversion exercise (tinytests)
# -----------------------------------------------

library('tinytest')

x <- temperature(0)                                    # in Celsius by default 

expect_equal(as.numeric(x), 0)                         # in original unit by default, here Celsius
expect_equal(as.numeric(x, units = "C"), 0)            

expect_equal(as.numeric(x, units = "Kelvin"), 273.15)
expect_equal(as.numeric(x, units = "K"),      273.15)
