# -----------------------------------------
# Script from Session 02 (Week two).
# Sorting and Ordering a vector.
# -----------------------------------------
# ----------------------------------------------------
# solution practical session A-C (rest is open to you)
# History of the live session.
# ----------------------------------------------------

# Exercise A
x <- -5:5
names(x)
class(x) # is integer;

# subsetting by index
x[6]              # extract 6th element
x[5:7]            # extract elements 5 to 7
x[c(5, 6, 7)]     # get all positive indices;
x[5:7]            # get all positive indices;
x[-(1:6)]         # get all positive indices using negative indices;
x[-1:6]           # get all positive indices using negative indices;
x[-c(1:6)]        # get all positive indices using negative indices; 
x[7:length(x)]    # get all positive indices;
x[-6:-1]          # get all positive indices using negative indices; 

# Exercise B
y1 <- seq(from = 7, to = 11, by = 0.5) # seq. from 7 to 11; 
y1
y2 <- seq(11,7, -0.5)   # this is reversed y1
all.equal(y1, rev(y2))                    # make rev() and equal is true;
y2 <- sort(y1, decreasing = TRUE)  # sort y1 seq decreasing;
y2
identical(y1, rev(y2))  # identical yes; 
all.equal(1.0, 1L)      # is all equal
identical(1.0, 1L)      # but is not excatly identical; 

# Exercise C

# should look like TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
rep(c(TRUE, FALSE, TRUE, FALSE), times = c(3, 3, 1, 3))
# should look like TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
z <- rep(c(TRUE, FALSE, TRUE, FALSE), times = c(3, 3, 1, 3))
is.logical(z)
is.numeric(z)
class(z)
type(z)
typeof(z)
length(z)
str(z)
sum(z)
mean(z)
sd(z)
all.equal(sd(z), sqrt(var(z)))
sd(z)
sqrt(var(z))
c("Apple", 1.0)
as.integer(z)
as.numeric(z)
as.double(z)
identical(as.numeric(z), as.double(z))
identical(as.numeric(z), as.integer(z))
as.character(z)

# Exercise D
x <- seq(-5,5,0.1)
plot(x, type = "l")
plot(x^2, type = "l")
plot(x^2, type = "l")
plot(abs(x), type = "l")


# Exercise E: 
y <- seq(from=100, to=150, length=17)
class(y)
sum(y)
mean(y)
sd(y)

# Exercise F: 
x <- c(family_name = "Muster",given_name = "max")
y <- c(red=T,green=T,blue=F)
z <- c(age = "27", height = "158", weight = "73", gender = "female")
class(x)
class(y)
class(z)
lenght(x)
max(z)
min(z)


# Exercise G: 
score <- c("Anna" = 190, "John" = 170, "Marie" = 90, "Paul" = 100)
r <- names(score)
class(r)
score["John"]
score[["John"]]
score[c("Anna","Marie")]
relative_score <- (score / 2)
relative_score <- c("Anna" = 190/200*100, "John" = 170/200*100, "Marie" = 90/200*100, "Paul" = 100/200*100)
relative_score <- score * 100/200

barplot(relative_score,
        xlab = "Participant",
        ylab = "Relative score (in percent)",
        main = "Latest test results")

# Exercise X: 
load("name+height.rda", verbose = TRUE)
ls()
# Task 1: both integers
class(height)
typeof(height)
length(height)
names(height) # unnamed vector -> NULL;

class(name)
typeof(name)
length(name)
names(name) # unnamed vector -> Null;

# Task 2: Max values: 
max(height)
height[which.max(height)]
height == max(height)         # apply bool @height
which(height == max(height))  # check the position of the max valu
which.max(height)             # shortcut
name[16]                      # get name of max height @position 16
name[which.max(height)]

# Task 3: subset the name with logicals;
name[height == max(height)]
names(height)  # -> Null
names(height) <- name
print(height)

height["Anthony"] # subset by name; so heght is named know; 
height[which.max(height)]

sort(height)
sort(height, decreasing = TRUE)
head(sort(height, decreasing = TRUE))
head(sort(height, decreasing = TRUE), n = 1)

# Task 4 : find person with median height
median(height)
any(height == median(height))
height[height == median(height)]  # subsetting with logical to find person @ median height

# Task 5: Lexicographic sorting; 
sort(name)
height[c("Andrew", "Anthony")]
height[sort(name)]





