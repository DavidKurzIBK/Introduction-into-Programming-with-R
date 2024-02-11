# -----------------------------------------
# Script from Session 02 (Week two).
# Sorting and Ordering a vector.
# -----------------------------------------

# Exercise A:
# Given the vector `x <- c(2, 1, 5, 0, 10)`
# - try to sort the vector without using `sort()` and store it on `y`
# - compare your result to `sort(x)`
# - try to call `all.equal(y, sort(x))`. Is it the same?
# Exercise B
# Given a new vector `x <- c(2, NA, 5, 0, 10)
# - do the same as in Exercise A


# ----------------------------------------
# Exercise A
x <- c(2, 1, 5, 0, 10)

# Sort x without using sort() and store in on a new object y
y <- x[order(x)]

# Compare
all.equal(y, sort(x))

# ----------------------------------------
# Exercise B
x <- c(2, NA, 5, 0, 10)

y <- x[order(x, na.last = NA)]
all.equal(y, sort(x))

y <- x[order(x)]
all.equal(y, sort(x, na.last = TRUE))

# Can we use sort() to find the minimum and maximum?
min(x, na.rm = TRUE)   # using min()
max(x, na.rm = TRUE)   # using max()

# There are different ways to get minimum and maximum. E.g.,

# To get the minimum
z <- sort(x)
z[1]

# Some alternatives: to get minimum/maximum
sort(x)[1]
sort(x)[4]
sort(x)[length(x)]
sort(x, decreasing = TRUE)[1]
sort(x, na.last = FALSE)[length(x)]

# We also had `sort(x)[5]`
# - this does not work as sort(x) removes the NA, wherefore the result is only
#   a vector of length 4 (there is no 5th element anymore).
# Another attempt was: `sort(x)[length(x)]`
# - great as we don't have a hardcoded index (like in sort(x)[5]). The
#   problem is the same: length(x) is `5` After calling `sort(x)` the 
#   vector returned by `sort(x)` is only of lenght 4, there is no fifth
#   element anymore.

# Using 'head()' and `tail()` to get minimum/maximum
sort(x)
head(sort(x), n = 1)
tail(sort(x), n = 1)
