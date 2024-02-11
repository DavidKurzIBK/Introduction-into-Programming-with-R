# -----------------------------------------------
# Course: Introduction to Programming with R
# Session 04: Functions
# Pool price exercise (tinytests)
# -----------------------------------------------

# EXTENDED VERSION

# Checking the artibutes of the return object 
expect_true(all(c("volume", "price") %in% names(pool_price(1, 1, 1))))  # Extended version, names in return object
expect_true(length(pool_price(1, 1, 1)) == 2)                           # Extebded version, return lenght 
expect_true(is.numeric(pool_price(1, 1, 1)))                            # Extended version, return type

# Checking the correctness of calculation
expect_equal(pool_price(1, 1, 1, 1.2), c(volume=1, price=1.2))           # Custom price
expect_equal(pool_price(1, 1, 1), c(volume=1, price=1.5912))             # Default price
expect_equal(pool_price(2, 3, 5, 1), c(volume=30, price=30))             # Actual computation, no multiplication neutral elements in volume 
