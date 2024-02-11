# -------------------------------------------
# Introduction to Programming with R
# Session 05: Conditional execution
# Exercise: State of water.
# -------------------------------------------

# 1. Write a short function named `state_of_water()`:
#     * Arguments:    One input, temperature (in degrees Celsius).
#     * Instructions: Compute the binary state of water given the temperature
#                     based on the first diagram, using one if-else statement.
#     * Returns:      One character string, either `"solid"` or `"not solid"`.

state_of_water <- function(t){
  stopifnot(is.numeric(temp))
  if(t<0){
    print("solid")
  }else{
    print("not solid")
  }
}


# 2. Solve task 1. again but with a single if statement only (rather than if-else).

state_of_water <- function(t){
  stopifnot(is.numeric(temp))
  ifelse(t<0,"solid","not solid")
}

# or better
state_of_water <- function(t){
  stopifnot(is.numeric(temp))
  if(t<0)
    return("solid")
  return("not solid")
}

# 3. Enhance the function from 1. by implementing the second diagram and returning
#    one of the three character strings "solid", "liquid", and "gas". Use two
#    nested if-else statements.

state_of_water <- function(t){
  stopifnot(is.numeric(temp))
  if(t<0){
    print("solid")
  }else{
    if(t<100){
      print("liquid")
    }else{
      print("gas")
    }
  }
}



# 4. Solve task 2. again but using multiple if-else statements.

state_of_water <- function(t){
  stopifnot(is.numeric(temp))
  if(t<0){
    print("solid")
  }else if (t<100){
      print("liquid")
  }else{
    print("gas")
  }
}



# 5. Download the tinytest test file for this exercise and
#    test your function(s) task 3. and 4. Do you PASS all tests?
   
library("tinytest")
run_test_file("05-state-of-water-tinytest.R")


