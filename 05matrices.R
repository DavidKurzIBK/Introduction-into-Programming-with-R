#-------------------------------------------Exercise 5.1-----------------------------------------------------------

# creating specific matrices: 

#5x5 matrix with 5 as integer everywhere
ma <- matrix(data = 5L, ncol = 5, nrow = 5)
class(ma)
dim(ma)

#testing: 
test_ma <- c("is.matrix" = is.matrix(ma),
             "is.double" = is.double(ma),
             "is.integer" = is.integer(ma),
             "is.numeric" = is.numeric(ma))
test_ma

# same with this: 
ma <- matrix(rep(5L, times = 25), ncol = 5, nrow = 5)
class(ma)
dim(ma)



#10x1 matrix with -100 everywhere
mat <- matrix(data = -100, ncol = 1, nrow = 10)
class(mat)
dim(ma)

#testing: 
test_mat <- c("is.matrix" = is.matrix(mat),
              "is.integer" = is.integer(mat),
              "is.double" = is.double(mat),
              "is.numeric" = is.numeric(mat))
test_mat

#----------------------------------------------Exercise 5.2--------------------------------------------------------------

# creating data_vectors by replicating elements
data_A <- matrix(rep(c(-1, 0, 1), 5))                       # vect A
data_B <- matrix(rep(c(-3, -2, -1, 0, 1, 2, 3), each = 3))  # vect B 
data_C <- matrix(rep(c(1, 0, 0, 0, 0), length.out = 16))    # vect C

data_A
data_B
data_C

# to specify matices with specific dimensions we have to indicate them: 
# matrix A should have 5 rows with -1, 0, 1 in each row; 
A <- matrix(data = data_A, ncol = 5, nrow =3)

# matrix should have 3 cols with it's 7 data entries in each row, but need to specify byrow = TRUE 
# so that data of data_B is printed row-wise instead of normal ascending vlaues throughout the matrix;
B <- matrix(data = data_B, ncol = 3, nrow = 7, byrow = TRUE)

# matrix C should be a 1-diagonal matrix with zeros around: 
C_1 <- matrix(data = data_C, ncol = 4, nrow = 4)
C_2 <- matrix(data = data_C, ncol = 4, nrow = 4 , byrow = TRUE)
C_3 <- matrix(data = data_C, nrow = 4, ncol = 4, byrow = FALSE)
C_4 <- diag(1,4,4)


#-------------------------------------------Exercise 5.3--------------------------------------------------------------

# generate a matrix with random values: 
# first set a random seed; 
# then round values by one digit after comma; 

set.seed(1)   # rand seed; 
mat <- matrix(round(rnorm(100), digits = 1), nrow = 20)
dim(mat)


# give the first 6 (default) or 2 rows of mat; 
head(mat)
head(mat, n = 2)

# give the last 6 (default) or 2 rows of mat;
tail(mat, n = 2)  
tail(mat)

# min, max, arithm mean, standardeviation & sum of entire matrix:
summary(mat)   # gives the numerical summary as for a vect of each column individually of the matrix; 
min(mat);
max(mat);
mean(mat);
sd(mat);
sum(mat);

# if you want you can round it like first example show's 
summary <- c("Min" = round(min(mat),digits = 1), "Max" = max(mat), "Mean" = mean(mat),
            "Std" = sd(mat), "Sum" = sum(mat))


#-------------------------------------------Exercise 5.4: ----------------------------------------------------------

# this matrix contains data about the production of cereals 
# over three years for six countries in metric gigatons
# first values are in a vec; 
# then .Dim puts 6x3 matrix to it's structure: 6 rows, 3 cols´; 
# then we name all 6 rows with countries, 
# then we name the cols with years; 

cereals <- structure(c(431.87, 284.33, 621.44, 95.01, 106.03, 102.45, 475.96,
                       297.85, 616.25, 102.93, 84.13, 117.74, 440.12, 313.61, 617.93,
                       109.33, 117.78, 131.14),
                     .Dim = c(6L, 3L), .Dimnames = list(c("United States",
                                                          "India", "China", "Indonesia",
                                                          "Braziiil Ole Ole", "Russian Federation"),
                                                        c("2015", "2016", "in 2017")))
# check if it's a matrix (it's object): 
c("is.matrix" = is.matrix(cereals))

# extract dim of Matrix
matrix_dim <- dim(cereals)
matrix_dim
mat_col <- ncol(cereals)
mat_row <- nrow(cereals)
c("matrix_cols" = mat_col, "matrix_rows" = mat_row)

# extract row & col names of matrix name it & store it + check if they're character: 
rnames <- rownames(cereals)
cnames <- colnames(cereals)
c("is.charcter" = is.character(rnames), "is.character" = is.character(cnames))

# check if length of these vects are the same as it's dimensions of the original matrix
identical(length(rnames), mat_row)
identical(length(cnames), mat_col)
# or in a different way:
length(rnames) == mat_row
length(cnames) == mat_col


# renaming col & row names: 
colnames(cereals) <- c("2015", "2016", "2017")   # renmame the colneames

# or getting only specific entry (the 3rd of cereals): 
colnames(cereals)[3] <- "2017"

# or just create a kind of loop: 
colnames(cereals) <- 2015:2017


# and look if it's corrected: 
head(cereals, n = 1)
head(colnames(cereals))


# now we rename Brazil in rownames: 
rownames(cereals)[5] <- "Brazil"

# lets controll it: 
tail(rownames(cereals), n = 2)
tail(cereals, n = 2)


#----------------------------------------- Exercise 5.5-------------------------------------------------------


# try col-bind for vecs with diff length; use int vec 1:2 (has length of 2), vec 1:5 (has length of 5) 

vec_a <- 1:4
vec_b <- 1:4
rbind(vec_a,vec_b)
cbind(vec_a,vec_b)

rbind(1:4, 1:4)
cbind(1:4, 1:4)


vec_c <- 1:8
vec_d <- 1:4
rbind(vec_c, vec_d)
cbind(vec_c, vec_d)

vec_f <- 1:8
vec_e <- 1:4
rbind(vec_e, vec_f)
cbind(vec_e, vec_f)

vec_g <- 1:4
vec_h <- 1
rbind(vec_g, vec_h)
cbind(vec_g, vec_h)

# these following bind causing errors cause 5 is not divisible by 3 as well as 9 is not divisible by 10 
# without getting rest;

vec_i <- 1:5
vec_j <- 1:3
rbind(vec_i, vec_j)
cbind(vec_i, vec_j)

vec_k <- 1:9
vec_l <- 1:10
rbind(vec_k, vec_l)
cbind(vec_k, vec_l)


#-----------------------------------------------Exercise 5.6---------------------------------------------------------

# matrix subsetting in a numeric matrix: 
# creating: vec with values and set them to matrix with  rows
mat <- matrix(c(270, 100, 330, 340, 260, 160, 10, 310,
                80, 50, 60, 190, 150, 110, 290, 220, 10, 350, 100, 0),
              nrow = 5)

mat

# elemt values; 
mat[3,2]
mat[2,4]

# putting out 7th and 15th element of matrix by rowwise counting:
mat[7] 
mat[15]


#-------------------------------Exercise 5.7-----------------------------------------------------------------------

# Construct matrix with Countries as rownames, medals as colnames and a vect with values of won medals per land and kind;
countries <- c("United States", "Great Britain", "Canada", "Russia", "Switzerland")
(medals   <- matrix(c(3, 3, 2, 1, 1, 4, 1, 1, 0, 0, 1, 5, 1, 2, 2),
                    ncol = 3, dimnames = list(countries, c("Gold", "Silver", "Bronze"))))


# extract all countries which won more than 1 gold medal; 
# it's been extract from the medals with colname ["Gold"] and then refering to the rowvalues bigger than 1;
medals[medals[,"Gold"] > 1, ]

# in a shortr way we can subset it with "which" statement and get a boolean for winning gold medals
# (idx_logical <- medals[medals[, "Gold"] > 1, ])
(idx_logical <- medals[, "Gold"] > 1)

(idx_integer <- which(medals[, "Gold"] > 1))
idx_integer <- which(idx_logical)

medals > 3


