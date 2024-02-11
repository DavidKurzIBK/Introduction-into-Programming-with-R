#--------------------------------------Excercise 4.1---------------------------------------------------------------

# creating & converting numeric & logical verctors;
# use exlicit coercion:

x <- c(FALSE, 5.5, 10.0)
y <- as.logical(x)
print(x)
print(y)
class(x)
class(y)

# online-approach: 
(y <- as.logical(c(FALSE, 5.5, 10.0)))

#---------------------------------------Exercise 4.2-----------------------------------------------------------------

# understand set.seed() and pseudo-randomization; 

# (1) Set a seed (using seed number 1 here).
set.seed(1)
# (2) Draw 5 random values.
r1 <- rnorm(5)
#(3) Set the very same seed again.
set.seed(1)
# (4) And draw another 5 random values.
r2 = rnorm(5)
# (5) Draw 5 more random values without setting the seed.
r3 = rnorm(5)

print(r1,r2,r3)


#--------------------------------------------Exercise 4.3------------------------------------------------------------

# basic mathematic operations:

#arithmetic mean: 
mean1 <- mean(x)
mean2 <- sum(x)/length(x)

# vergleiche mit: 
all.equal(mean1, mean2)

#stand-deviation & variance:
std1 <- sd(x)
std2 <- sqrt(var(x))

# vergleiche mit: 
all.equal(std1, std2)




