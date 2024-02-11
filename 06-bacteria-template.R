# -------------------------------------------
# Introduction to Programming with R
# Session 06: Loops
# Exercise: Bacteria growth
# -------------------------------------------

# Preparation -------------------------------


# Task 1: How many bacteria after two days?
#
# Starting with 100 million bacteria at the beginning of the experiment (hour 0),
# write a `for` loop that increases the number by 5 percent in every iteration.
# Continue the loop until the end of the experiment after two days (i.e., 48 hours).
# 
# * Store the interim results (the population size) for each
#   hour. To do so, create an empty vector with the correct length
#   before you start with the loop!
# * Check that the final population size is correct:
#       100 * 1.05^48 = 1040.13
# * Visualize the result using `barplot()` or `plot()` 
#   (in combination with with `type = "l"` or `"p"`, `"o"`, `"b"`, `"h"`).

x <- 100
for (t in 1:48){    # loop is equivalent to 1.05^48
  x <- x*1.05
  
}
x 

x <- 100
history <- c()
for (i in 1.48){
  x <- 1.05*x
  history <- c(history,x)

}

plot(history)
plot(history, type = 'o')
plot(seq_along(history), history, type = 'o')

# Task 2: Exceeding a trillion bacteria
#
# Investigate how many hours are needed until the number of bacteria
# exeed a trillion bacteria (i.e., a million million).
# 
# * Again, employ an initial number of 100 million bacteria and an hourly growth rate of 5 percent.
# * Write a `while` (or `repeat`) loop to obtain the number of iterations by
#   breaking from the loop when the result exceed a million million.
# * Compare the result with the exact (decimal) solution:
#        t = log(1000000 / 100) / log(1.05) = 188.77

x <- 100
t <- 0
while (x <= 1e6){
  t <- t + 1
  x <- 1.05*x
  
}
x
t


x <- 100
t <- 0 
repeat{
  t <- t + 1
  x <- 1.05*x
  if (x <= 1e6) break
}
x 
t

