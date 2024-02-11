# -------------------------Data management Exercises 13.1.------------------------------------------



set.seed(100)
(x <- sample(LETTERS[1:4], 20, replace = TRUE))

(res_unique <- sort(unique(x))) #Unique: Straight forward, we directly sort
# the resulting vector lexicographically for later on. This, obviously, should result in a vector c("A", "B", "C", "D").

sum(!duplicated(x)) # Must be four of them: A, B, C, D

(res_duplicated <- x[!duplicated(x)]) # with !duplicated(x) we select elem from x where duplicated() == FALSE;


identical(res_unique, sort(res_duplicated)) # has to be true;
x[!duplicated(x, fromLast = FALSE)] # lets try to sort in fromLAST; 
x[!duplicated(x, fromLast = TRUE)]

#his can change the order of the values. But: unique() has the same argument. Thus:
identical(unique(x, fromLast = TRUE), x[!duplicated(x, fromLast = TRUE)])
identical(unique(x, fromLast = FALSE), x[!duplicated(x, fromLast = FALSE)])

#hat x[!duplicated(x)] does the same as unique() and is about as fast, but we should 
# use unique() when looking for unique values and duplicated() if we are interested in duplicates.



# Exercises 13.1.------------------------------------------

# Start with this object (called mci2 now)
(mci2 <- data.frame(
  team    = rep(c("Liverpool", "Chelsea", "Tottenham"), each = 2),
  type    = rep(c("home", "away"), 3),
  goals   = c(2, 0, 6, 0, 1, 1),
  against = c(1, 0, 0, 2, 0, 0)
))

# adding two new cols: 
mci2$diff   <- mci2$goals - mci2$against
mci2$points <- ifelse(mci2$goals < 0, 0, ifelse(mci2$goals == mci2$against, 1, 3))
head(mci2, n = 2)

# adding dummy & points: 
mci2$dummy  <- LETTERS[1:6]
mci2$points <- mci2$points * 100
head(mci2, n = 2)

# removing dummy & points: 
mci2$dummy  <- NULL
mci2$points <- mci2$points / 100

# Print final result
print(mci2)




#---------- Exercise 13.3 
#tapply() versus aggregate(): Just for practicing, use tapply() instead of aggregate() 
# to get the same information. We have seen the following command above,

#------------------Exercise 13.4
# number of observations/variables, class of all variables; 

n_obs  <- nrow(cod)
n_vars <- ncol(cod)
cat("We have", n_obs, "observations and", n_vars, "variables.\n")

# get the class of each of the variables we could make use of sapply() 
cod_classes <- sapply(cod, class)
table(cod_classes)

# extract names of variables containing NA. 
n_missing <- sapply(cod, function(x) sum(is.na(x)))
n_missing

# a relational operator to find the elements where we have at least one missing value (we could also use != 0 instead of > 0) 
# and use this logical vector to get the names we need.
names(n_missing)[n_missing > 0]

# Get the maximum of weight
max_weight <- max(cod$weight, na.rm = TRUE)
cat("Maximum weight is", max_weight, ".\n")

# lets plot a histogramm; 
hist(cod$weight)

# check unique values of sex: 
table(cod$sex)

# plot Hist() tha var. age()
n_zero <- sum(cod$age == 0, na.rm = TRUE)
hist(cod$age, main = paste("Age of fish,", n_zero, "of age 0"))
















