# -----------------------------------------------
# Exercise A
#
# Create a series of matrices using using `matrix()',
# 'rownames()', and 'colnames()' (if needed).


# Once created check: length, class, dimension, and names.
matA <- matrix(data = NA, nrow = 2, ncol = 2)
(matA <- matrix(nrow = 2, ncol = 2)) # data = NA is default;
matA

# a matrix
matA <- matrix(rep(NA, 4), nrow = 2) # 
matA <- matrix(nrow = 2, ncol = 2)   # data = NA is the default (thus works as well)

# b matrix ----------------------------
# creates matrix from 1 to 15 as entries with 3 rows, sorts the ascending numbers rowwise;
matB <- matrix(1:15, nrow = 3, byrow = TRUE)

# c matrix -----------------------------
# creates a matrix with number from 1 to 3 in 5 row and 3 columns;
# you need each = 5 for printing it rowwise 5 time if byrow=FALSE setted; 
matC <- (z <- matrix(rep(1:3,each = 5),
             nrow=5, ncol=3,
             byrow=FALSE))
# name rows & columns outside;
rownames(z) <- c("row_1", "row_2", "row_3", "row_4", "row_5")
colnames(z) <- LETTERS[1:3]

# 'all in one' instead of each = 5 for printing 1 to 3 in row we define byrow=TRUE;
# with dimnames the list with the paste func (leaves first input charakter and puts running variable
# with specific seperator behind, and capital for letters for the columns names; 
matC <- (z <- matrix(rep(1:3),
             nrow=5, ncol=3,byrow=TRUE,
             dimnames = list(c(paste("row", 1:5, sep = "_")),
                             LETTERS[1:3])))


# -----------------------------------------------
# Exercise B
#
# 

A <- c(TRUE, TRUE, TRUE)
B <- c(FALSE, TRUE, TRUE)
C <- c(FALSE, FALSE, TRUE)

X1 <- c(1.1, 2.2)
X2 <- c(100, 200)
X3 <- c(-500, 500)


# connect the vectors: A,B,C columnswise to a matrix; 
z <- matrix(c(A, B, C), ncol = 3) # c(A, B, C) -> vector -> matrix()
colnames(z) <- LETTERS[1:3]       # Adding column names.
z


cbind(A, B, C)  #column bind 
rbind(A, B, C)  #row bind

t(cbind(A, B, B))  # transpose the columnbind is row bind;


c(A, B, C)              
c(cbind(A, B, C))       

# column bind of the other vectors by renaming the colum-names;
res <- cbind(X = X1, X = X2, X = X3)

colnames(res) <- c("X", "Y", "Z")
res

# Or, a bit smarter - simply rename the columns
# when calling cbind (works for rbind as well)
cbind(X = X1, Y = X2, Z = X2)


# -----------------------------------------------
# Exercise C
#

# create matrix with 3 rows and 2 cols, with 10 in first col, 20 in 2°nd col;
matrix(rep(c(10, 20), each = 3),
       nrow = 3,
       ncol = 2,
       byrow = FALSE,
       dimnames = list(c("Row 1", "Row 2", "Row 3"), c("Column A", "Column B")))
# first input dimnames always row spezific & 2nd col-specific;

matA <-matrix(rep(c(10, 20), each = 3),
       nrow = 3,
       ncol = 2,
       byrow = FALSE,
       dimnames = list(paste("Row", 1:3), paste("Column", LETTERS[1:2])))

t(matA)

matA <- matA*c(rep(0.5, 3),rep(2,3))
# this concats first col of matrix with 0.5 and 2nd col with 2; 
# same operation like multiplicating elemtwise entries of with 0.5 of 1st and with 2 the 2nd col;  

# -----------------------------------------------
# Exercise D
# 
# Create the following matrix: Medals table, Olympic Winter Games 2018.
#
#             Bronze Silver Gold
#     Norway      11     14   14
#     Germany      7     10   14
#     Canada      10      8   11
#     USA          6      8    9
#
# Compute the sum of medals one (each) country using subsetting by name.

medals <- matrix(c(11, 7, 10, 6, 14, 10, 8, 8, 14, 14, 11, 9),
                 nrow = 4)
rownames(medals) <- c("Norway", "Germany", "Canada", "USA")
colnames(medals) <- c("Bronze", "Silver", "Gold")
print(medals)

sum(medals["Norway", ])

c("Sum of Norway" = sum(medals["Norway",]))

# Or we could be 'lazy' and use the apply function.
# apply(medals, 1, sum) applies the function (FUN = sum)
# row-by row (MARGINS = 1) on the object "medals".
res <- apply(medals, MARGIN = 1, sum)
# Update/chagne the names of the vector
names(res) <- paste("Sum of", names(res))
res

# -----------------------------------------------
# Exercise X
#
# A  matrix with various informations about a group of persons is provided in the
# file: "persons.rda" (see exercise description).  To prepare this for the
# exercise please do!!



# * Download the file `persons.rda` and store it in the directory where you keep
#   the files for this course.
# * In RStudio change your directory in the _Files_ tab on the right to that
#   directory and then click _More > Set As Working Directory_. (Of course,
#   alternatively, you can also use the resulting `setwd()` call to programatically
#   change your working directory.)
# * Load (i.e., import) the data file with `load("persons.rda", verbose = TRUE)`.
setwd('/Downloads/')
load('persons.rda',verbose = TRUE)
ls()
objects()

# * When successful a new object `persons` should have appeared
#   in your _Global Environment_ tab on the right. Alternatively, you can see that
#   it became available via `ls()` or `objects()`.
# 
# Based on the object `persons` try to accomplish the following tasks:
# 
# 1. Examine the object. What is its class, type, length, and attributes (if any)?
class(persons)
typeof(persons)
length(persons)
attributes(persons)
dim(persons)
head(persons)
# (Hint: `age` is in years, `height` in cm, and `gender` is coded 0/1 for male/female.)

# 2. How many men and women are in the data?
persons[,'gender']
sum(persons[,'gender']==0) # male
sum(persons[,'gender']==1) # female
table(persons[,'gender'])

# 3. Analyze height separately for men and women: What is the mean height?
#    What is the name of the smallest and tallest person respectively?
persons_m = persons[persons[,'gender']==0, 'height']  # subset male by height
persons_f = persons[persons[,'gender']==1, 'height']  # subset female by height
mean(persons_m)
mean(persons_f)
sort(persons_m)         # vector of class numeric;
class(persons_m)
head(sort(persons_m),n = 1)   # find smallest & tallest men; 
tail(sort(persons_m), n = 1)
head(sort(persons_f),n = 1)   # find smallest & tallest women; 
tail(sort(persons_f), n = 1)

# 4. How many women are taller than the smallest man? What are their names?
min(persons_m)
persons_f > min(persons_m)  # returns a logical vector which females are taller than smallest male; 
persons_f[ persons_f > min(persons_m) ]

# 5. What is the difference in mean height between persons being under 20 years
#    and those being 20 years or older?
head(persons)
persons[persons[, 'age']< 20, 'height']  # return the subset vect pf persons height younger than 20
mean(persons[persons[, 'age']< 20, 'height'])
mean(persons[persons[, 'age']>= 20, 'height'])

# 6. Order the `persons` object lexicographically by name.
# ... your turn :).
sort(rownames(persons))
persons <- persons[sort(rownames(persons)), ]



