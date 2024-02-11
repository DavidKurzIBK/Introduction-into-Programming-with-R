#------------------------------------------------Session 10----------------------------------------------------------------------------------

# classes-and-methods-date-and-datetime

(degree <- c("master", "master", "bachelor", "phd", "bachelor", "master"))
degree <- factor(degree)

new_names <- c("BSc", "MSc", "PhD")
(idx <- as.integer(degree))

new_names[idx]
c("BSc", "MSc", "PhD")[degree]


degree  <- factor(c("master", "bachelor", "bachelor"))
degree2 <- factor(c("phd", "bachelor", "bachelor", "phd"))
c(degree, degree2) # Losing information!!


# coercing both factor objects, # combine two char vecs, & create a new factor out of it; 
factor(c(as.character(degree), as.character(degree2)))


# instead we use c() or c.factor() method: 

c.factor <- function(x, y) {
  return(factor(c(as.character(x), as.character(y))))
}
c(degree, degree2)


# Takes '...' (a list of 1, 2, or N objects),
# converts the content to character and creates
# a new combined factor object.
c.factor <- function(...) {
  return(factor(unlist(lapply(list(...), as.character))))
}
c(degree, degree2) # would also work with 3 or more arguments


pm25 <- c(100, 75, 230, 220, 50)   # Vector for testing
attr(pm25, "limit") <- 150         # Adding attribute 'limit'
class(pm25) <- "threshold"         # Adding class attribute
print(pm25)


as.character.threshold <- function(x, ...) {
  res <- ifelse(x > attr(x, "limit"), "+", "-")
  return(res)
}
as.character(pm25)    # Testing



# Class constructor function: 
letter <- function(x) {
  # Sanity checks
  if (!is.character(x)) stop("Input 'x' must be of class character.")
  if (!length(x) == 1L) stop("Input 'x' must be of length 1")
  if (!x %in% letters & !x %in% LETTERS) stop("'x' is no valid letter")
  # Now append class and return the new object
  class(x) <- "letter"
  return(x)
}

# Testing
(x <- letter("A"))

(y <- letter(1L))
(z <- letter("1"))


# Custom print() method:
print.letter <- function(x, ...) {
  cat("This is a letter:", dQuote(x), "\n")
  invisible(x)
}
print(x)

# Summary and structure: 
str(letter("A"))
summary(letter("A"))










