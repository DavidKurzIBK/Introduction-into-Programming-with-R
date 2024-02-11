# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 10: Class and methods 
# Temperature conversion exercise (tinytests)
# -----------------------------------------------

library('tinytest')

# class definition

expect_silent(temperature(0))

# class type and attibutes set 

x <- temperature(0)

expect_equal(class(x), "temperature")
expect_true("units" %in% names(attributes(x)))
expect_equal(attributes(x)$units, "celsius")

# internal unit is always celsius 

x <- temperature(0, "celsius")
expect_equal(attributes(x)$units, "celsius")
x <- temperature(0, "kelvin")
expect_equal(attributes(x)$units, "kelvin")

