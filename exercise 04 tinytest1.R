library("tinytest")

# Test cases for square()

expect_equal(square(-2), 4, info = "testing a negative number")
expect_equal(square(-1), 1, info = "testing the negation of identity element")
expect_equal(square( 0), 0, info = "testing zero")
expect_equal(square( 1), 1, info = "testing identity element")
expect_equal(square( 2), 4, info = "testing a positive number")

# Test cases for powfun()

expect_equal(powfun(-25,  0.5), NaN,  info = "testing a negative base for fraction exponent")
expect_equal(powfun( 25, -1),   0.04, info = "testing a negative exponent")
expect_equal(powfun( 25,  0),   1,    info = "testing a zero exponent")
expect_equal(powfun( 25,  0.5), 5,    info = "testing a fraction exponent")
expect_equal(powfun( 25,  1),   25,   info = "testing a neutral element")
expect_equal(powfun( 25,  2),  625,   info = "testing a whole number positive base")


# Test cases for equvalence of square(_) and powfun(_, 2)

expect_equal(square(5), powfun(5, 2), info = "testing example case of equivalence")

x <- rnorm(1, mean = 10, sd = 20)
expect_equal(square(x), powfun(x, 2), info = "testing a random case of equivalence")

# Test cases to see if function works for vectors, results are not checked 

expect_silent(powfun(c(1, 2, 3, 4),    2),              info = "testing base as vector")
expect_silent(powfun(2,                c(1, 2, 3, 4)),  info = "testing exponent as vector")
expect_silent(powfun(c(1, 2, 3, 4),    c(2, 1)),        info = "testing base and exponent as vectors")
