# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 06: Loops 
# Basic arithmetics ‘by hand’ (tinytests)
# -----------------------------------------------

library('tinytest')

x         <- c(5, 10, 15)
x_rand    <- rnorm(300, mean = 50)
x_NA      <- as.numeric(NA)
x_with_NA <- c(x_NA, x)

# MY MEAN

expect_silent(my_mean(0)) 

expect_identical(my_mean(x),                       mean(x))
expect_identical(my_mean(x),                       mean(x))
expect_identical(my_mean(x),                       mean(x, na.rm = TRUE))
expect_identical(my_mean(x, na.rm = TRUE),         mean(x, na.rm = TRUE))
expect_identical(my_mean(x, na.rm = TRUE),         mean(x))

expect_equal(my_mean(x_rand),                      mean(x_rand))
expect_equal(my_mean(x_rand),                      mean(x_rand, na.rm = TRUE))
expect_equal(my_mean(x_rand, na.rm = TRUE),        mean(x_rand, na.rm = TRUE))
expect_equal(my_mean(x_rand, na.rm = TRUE),        mean(x_rand))

# Dealing with NAs

expect_identical(my_mean(x_NA),                    mean(NA))
expect_identical(my_mean(c(x_NA)),                 mean(c(NA)))

expect_identical(my_mean(x_with_NA),               mean(x_with_NA))
expect_identical(my_mean(x_with_NA, na.rm = TRUE), mean(x_with_NA, na.rm = TRUE))

# Prevention of type 

expect_identical(typeof(my_mean(x_rand)),          typeof(x_rand))            
expect_identical(typeof(my_mean(x_with_NA)),       typeof(x_with_NA))            

# MY MAX

expect_silent(my_max(0))

expect_identical(my_max(x_rand),                   max(x_rand))
expect_identical(my_max(x_rand),                   max(x_rand, na.rm = TRUE))
expect_identical(my_max(x_rand, na.rm = TRUE),     max(x_rand, na.rm = TRUE))
expect_identical(my_max(x_rand, na.rm = TRUE),     max(x_rand))

# Dealing with NAs


# expect_error(my_max(x_NA))
# expect_error(my_max(c(x_NA)))

expect_identical(my_max(x_NA),                     max(as.numeric(NA)))
expect_identical(my_max(c(x_NA)),                  max(as.numeric(c(NA))))

expect_identical(my_max(x_with_NA),                max(x_with_NA))

expect_identical(my_max(x_with_NA, na.rm = TRUE),  max(x_with_NA, na.rm = TRUE))

# Prevention of type 

expect_identical(typeof(my_max(x_rand)),           typeof(x_rand))            
expect_identical(typeof(my_max(x_with_NA)),        typeof(x_with_NA))
