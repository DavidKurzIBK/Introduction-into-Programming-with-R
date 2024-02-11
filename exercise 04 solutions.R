# ----------------------------------
# Introduction to Programming with R
# Session 04: Functions
# Practical exercises
# ----------------------------------

# ----------------------------------
# Exercise A
# Function square:
# - 1 argument x (mandatory, no default)
# - The instructions are x^2
# - The explicit return is return(res)
square <- function(x) {
    result <- x^2
    return(result)
}
# Alternative version: directly include
# the instructions in the return function
# which works for such simple functions.
square <- function(x) {
    return(x^2)
}

help("Arithmetic")
help("function")

# Second function
# - 2 mandatory inputs, x and y
# - Instructions are x^y (no longer x^2)
# - Explicit return(x^y)
powfun<- function(x, y){
    return(x^y)
}

# Manual tests
identical(square(3), powfun(3, 2))
all.equal(square(3), powfun(3, 2))

# Using tinytest
library("tinytest")
expect_equal(square(3), 9)
expect_equal(square(3), powfun(3, 2))

# Automated testing using 04-practical-exercises-tinytest.R
# NOTE: think about the working directory! If R (here
# the function run_test_file()) cannot find the file
# in the current working directory you will get an error
# "File not found".
run_test_file("exercise 04 tinytest1.R")

# ----------------------------------
# Exercise B (correct solution)
# All we have to change is that we call
# "powfun(x, 2)" in the instructions of the
# function rather than calculating x^2.
square <- function(x) {
    res <- powfun(x, 2)
    return(res)
}
run_test_file("exercise 04 tinytest1.R")

# Manual tests
powfun(x = 5, y = 2)
powfun(x = c(1, 2, 3, 4), y = 2)
square(2)
powfun(2, 2)
identical(square(2), powfun(2, 2))
all.equal(square(2), powfun(2, 2))

# .... all SEEMS to work fine. But this is a special
# case as 2^2 is x^2 is x^x in this example. However,
# the tests should be able to identify the problem
# if written properly (testing other cases than this
# very special case 2^2).
run_test_file("exercise 04 tinytest1.R")

# ... et voila, problem identified.


