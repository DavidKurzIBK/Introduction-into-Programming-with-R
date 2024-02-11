#-------------------------------------Exercise 7.1-------------------------------------------------------------------------------------------

# single numeric value with 2 different if-statements: 

x <- 10


# version 1: 
if (x < 10){
  print("X is smaller than 10")
}else if (x > 10){
  print("X is bigger than 10")
} else {
  print("X is exactly 10")
}

# version 2: 
if (x < 10){
  print("X is smaller than 10")
}else if (x > 10){
  print("X is bigger than 10")
} else if (x == 10){
  print("X is exactly 10")
}

x <- NA # puts an error refering to the first if statememt where x < 10!!





#-------------------------------------Exercise 7.2--------------------------------------------------------------------------------------------

# peace of chunk code: 
# (1) x is defined as 4
x <- 4

# (2) if-statement set x to 100 if x is smaller than 10, so declared as true, 
if (x < 10) {
  x <- 100
}

# (3) if-else statement prints something because x is now 100; 
if (x > 10) {
  print("x is larger than 10.")
} else {
  print("x is smaller or equal to 10.")
}





#----------------------------------------Exercise 7.3 ---------------------------------------------------------------------------------------


# vector: 
y <- 1:10

# do it with an short ifelse() statement, to make all odd (ungerade) numbs even (gerade) 
ifelse(y%%2 == 0, y, y+1)

# or vice versa:
ifelse(y %% 2 != 0, y+1, y)

# use rand numbers
set.seed(123)
y <- rnorm(10)

# replace all neg. number with "neg" and pos. with "pos" in an ifelse-statement
ifelse(y < 0, "neg", "pos")

# and/or as logical for condition test of 2 matrices: 
"& = and; | = or;
(mat1 <- matrix(c(10, 0, -3, 15), nrow = 2))
(mat2 <- matrix(c(3, -1, -4, 17), nrow = 2))

# return NA if both element in mat1 & mat2 are neg., else return 0
# do this with ifelse
ifelse(mat1 < 0 & mat2 < 0, NA, 0)
