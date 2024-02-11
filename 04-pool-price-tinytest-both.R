# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 04: Functions
# Pool price exercise (tinytests)
# -----------------------------------------------

# BOTH VERSIONS 

# Checking NA values for different attributes 
expect_true(all(is.na(pool_price(1, 1, NA))))      # NA as the depth 
expect_true(all(is.na(pool_price(1, NA, 1))))      # NA as the width
expect_true(all(is.na(pool_price(NA, 1, 1))))      # NA as the lenght

# Checking wrong usage, missing or wrong type of arguments 
expect_error(pool_price("1", "1", "1"))            # Wrong argument type
expect_error(pool_price())                         # Missing all arguments
expect_error(pool_price(1))                        # Missing w/d
expect_error(pool_price(1, 1))                     # Missing d
# expect_error(pool_price(1, 1, price = 1.5))        # Missing d --- TODO update to the names you have in your function
# expect_error(pool_price(z = 1, w = 1, d = 1))      # Missing l --- TODO as above 

