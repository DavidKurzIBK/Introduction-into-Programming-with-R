# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 05: Conditional execution
# State of water exercise (tinytests)
# -----------------------------------------------

library('tinytest')

expect_silent(state_of_water(0))

# expect_equal(state_of_water("a"), "gas")      
# expect_error(state_of_water("a"))

expect_equal(state_of_water(-0.01), "solid")
expect_equal(state_of_water(0), "liquid")
expect_equal(state_of_water(99.99), "liquid")
expect_equal(state_of_water(100), "gas")
