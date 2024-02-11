# -------------------------------------------
# Introduction to Programming with R
# Session 06: Loops
# Exercise: Arithmetics (mean, maximum)
# -------------------------------------------


### Preparation -----------------------------

set.seed(1)
x <- rnorm(100, mean = 10)
head(x)

summary(x)
mean(x)
max(x)


### Tasks -----------------------------------
#
# EQUATIONS/DEFINITION: Read the first part of
# the exercise on OpenOLAT; contains the mathematical
# definition of the arithmetic mean and maximum.
#
# In addition (end of the description) you can find
# some step-by-step hints if needed.


# 1. Write a short function named `my_mean()`:
#     * Arguments: One input, `x`.
#     * Instructions: Use a single `for` loop to compute both the sum of all elements
#       and the number of all elements.
#     * Returns: Numeric vector of length 1.

my_mean <- function(x, na.rm = FALSE){
  # sanity checks: 
  stopifnot(is.numeric(x))
  
  x_sum <- 0
  x_num <- 0
  
  # Calculate: 
    
  for (i in x){
    if(is.na(i)){
      if(na.rm) next # is working with else {} after next too!!
      return(as.numeric(NA))
    }
    x_sum <- x_sum + i
    x_num <- x_num + 1 
  
  }
  return(x_sum/x_num)
}

identical(my_mean(x),mean(x))
all.equal(my_mean(x),mean(x))

# 2. Write a short function named `my_max()`:
#     * Arguments: One input, `x`.
#     * Instructions: Use a single `for` loop to iterate over all elements, storing
#       the current element as the maximum if it is greater than the previous maximum.
#     * Returns: Numeric vector of length 1.

my_max <- function(x, na.rm = FALSE){
  
  # sanity check: 
  stopifnot(is.numeric(x))
  
  max = -Inf ## initialize max
  for (i in x){
    if (i > max)max <- i
    if(is.na(i)){
      if(na.rm) next # is working with else {} after next too!!
      return(as.numeric(NA))
    }
  }
  return(max)
  
}

identical(my_max(x),max(x))
all.equal(my_max(x),max(x))
  

# 3. Enhance both functions to also handle missing values in `x` by adding an `na.rm`
#    argument (with default `FALSE`). Use `next` and/or `break` in the loop to handle
#    iterations where the current element is `NA`. _Note_: return `as.numeric(NA)` if needed
#    (`return(NA)` returns a logical missing value).



# 4. Use the following tinytest test-files to check your functions. Adjust/develop your
#    functions until you are able to PASS all tests.


library("tinytest")
run_test_file('06-arith-tinytest.R')



