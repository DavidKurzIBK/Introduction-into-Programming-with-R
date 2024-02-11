# ------------------------------------------------Exercis 6.1 -------------------------------------------------------------------------------------

# Define the three vectors (random numbers)
set.seed(3) # Pseudo-randomization
x1 <- rnorm(1000, 0, 1.0)
x2 <- rnorm(1000, 0, 1.5)
x3 <- rnorm(1000, 0, 5.0)


# Calculate standard deviation once for all three vectors above manually and then by default function: 
sd1 <- sqrt(sum((x1 - mean(x1))^2) / (length(x1) - 1))
sd2 <- sqrt(sum((x2 - mean(x2))^2) / (length(x2) - 1))
sd3 <- sqrt(sum((x3 - mean(x3))^2) / (length(x3) - 1))

c("sd1" = sd1, "sd2" = sd2,"sd3" = sd3)

# User defined STANDARD deviation function: 
sdfun <- function(x) {
  res <- sqrt(sum((x - mean(x))^2) / (length(x) - 1))
  return(res)
}


# other quicker methods to calc sdt
sd1 <- sdfun(x1)
sd2 <- sdfun(x2)
sd3 <- sdfun(x3)

c("sd1" = sd1, "sd2" = sd2, "sd3" = sd3)

#--------------------------------------------------Exercise 6.2 ---------------------------------------------------------------------------------
# non-character input
# say_hello function: 

# declare funtion: say_hello
say_hello <- function(x) {
  cat("Good morning", x, "\n")
}

# call function: 
say_hello("Jochen")

# now call it with integer as input: 
say_hello(12345L)

# now call it with logical value as input
say_hello(TRUE)

# now call it with a character vector
x <- c("Francisca", "Max", "Sundhine")
say_hello(x)

