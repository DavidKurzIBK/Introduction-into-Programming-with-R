# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 04: Functions
# Pool price exercise (tinytests)
# -----------------------------------------------

length = 11.5
width = 6.0 
depth = 1.8


pool_price <- function(length,width,depth,price_per_cubic = 1.5912){
  # Sanity: 
  stopifnot(is.numeric(length))
  stopifnot(is.numeric(width))
  stopifnot(is.numeric(depth))
  stopifnot(is.numeric(price_per_cubic))
  # estimation of volume
  volume <- length*width*depth
  #estimation of price 
  price <- volume*price_per_cubic
  # specific output sections: 
  res = c(volume = volume, price = price)
  return(res)
}


# BASIC VERSION

# Checking the artibutes of the return object 
expect_true(is.numeric(pool_price(1, 1, 1, 1)))    # Return type
expect_true(length(pool_price(1, 1, 1, 1)) == 1)   # Return lenght

# Checking NA values for different attributes ---  more in file for both 
expect_true(is.na(pool_price(1, 1, 1, NA)))        # NA as the price 

# Checking the correctness of calculation
expect_equal(pool_price(1, 1, 1, 1.2), 1.2)        # Custom price
expect_equal(pool_price(1, 1, 1), 1.5912)          # Default price
expect_equal(pool_price(2, 3, 5, 1), 30)           # Actual computation, no multiplication neutral elements in volume 

expect_equal(pool_price(-1, -1, -1, 1), -1)        # Negative values, after condintional execution it can be excluded

