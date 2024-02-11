#---------------------Reading & Writing Session 11------------------------------------


#----------------------------putting RDS files together:------------------------------------ 

# Data of person/subject A
personA <- data.frame(name = "Jessica", department = "Botany",
                      semester = 4, age = 22, distance_to_university = 10.3)
# Data of person/subject B
personB <- data.frame(name = "Frank", department = "Organic Chemistry",
                      semester = 7, age = 24, distance_to_university = 1.0)
# Data of person/subject C
personC <- data.frame(name = "Mario", department = "Geology",
                      semester = 6, age = 28, distance_to_university = 3.2)

# Save data
saveRDS(personA, "_survey_results_A.rds")
saveRDS(personB, "_survey_results_B.rds")
saveRDS(personC, "_survey_results_C.rds")


data <- readRDS("_survey_results_A.rds")
data

(files <- paste0("_survey_results_", LETTERS[1:3], ".rds"))


do.call(rbind, data)


#-------------------------------------format version: ---------------------------------------

# Create test matrix
mymat <- matrix(1:9, nrow = 3)
# Testing version2/3
save(mymat, file = "testfile_v2.rda", version = 2)
load("testfile_v2.rda", verbose = TRUE)



#------------------exercise 12.1:-------------------------------------------------------------------------- 
# Import/read data set

# Read file (your path/file name may differ, of course)
clim <- read.csv("homstart-innsbruck.csv")

# (1) Average January temperature: 
clim_jan <- subset(clim, month == "Jan")
dim(clim_jan)

mean(clim_jan$temperature)


# (2) Average temperature in July: 
# Let us do it in one line
mean(subset(clim, month == "Jul")$temperature)


# (3) Calculate mean temperature for all months: 
# Looping over all levels of the factor 'month'
months <- levels(clim$month)

for (m in months) {
  # Calculate average temperature
  avg <- mean(subset(clim, month == m)$temperature)
  
  # Round the average temperature, 1/10th of degrees
  avg <- round(avg, 1)
  cat("Average monthly mean temperature for", m, "is", avg, "\n")
}


clim$month <- factor(clim$month, levels = month.abb, ordered = TRUE)
levels(clim$month)


# Custom function to calculate average temperature
# First input will be the 'level' (month name; x)
# We also provide a 'data' argument with our object 'clim'
calc_avg_temp <- function(x, data) {
  # Take the subset first
  data <- subset(data, month == x)
  # Calculate and return the average temperature
  return(round(mean(data$temperature), 1))
}

# Call the function using sapply()
sapply(levels(clim$month), FUN = calc_avg_temp, data = clim)



# (4) Create climatology boxplot:
boxplot(temperature ~ month, data = clim,
        main = "Temperature Climatology Innsbruck",
        ylab = "mean monthly temperature [C]")


#------------------exercise 12.2:-------------------------------------------------------------------------- 

# Create a data.frame (city, population, flag for 'city has a metro')
(my_df <- data.frame(city        = c("Innsbruck", "Moscow", "Dallas"),
                     population  = c(132493, 12506468, 1197816),
                     has_metro   = c(FALSE, TRUE, FALSE)))


# Create the matrix
(my_matrix <- matrix(1:9, ncol = 3L,
                     dimnames = list(LETTERS[1:3], letters[1:3])))


# Write to csv
write.csv(my_matrix, file = "my_matrix.csv")
write.csv(my_df,     file = "my_df.csv", row.names = FALSE)

(my_df2     <- read.csv("my_df.csv"))
(my_matrix2 <- read.csv("my_matrix.csv", row.names = 1))

identical(my_df, my_df2)
all.equal(my_df, my_df2)


str(my_df)
str(my_df2)

(my_matrix2 <- as.matrix(my_matrix2))
identical(my_matrix, my_matrix2)
all.equal(my_matrix, my_matrix2)




# -------------------------------------------------------------------
# - NAME:        donald.R
# - AUTHOR:      Reto Stauffer
# - DATE:        2019-10-01
# -------------------------------------------------------------------
# - DESCRIPTION: Just a quick example reading unstructured text info.
# -------------------------------------------------------------------
# - EDITORIAL:   2019-10-01, RS: Created file on thinkreto.
# -------------------------------------------------------------------
# - L@ST MODIFIED: 2019-10-02 11:17 on marvin
# -------------------------------------------------------------------


# Some tweets by Donald trump
file <- "donald.txt"
content <- readLines(file)

# Extracting time information
datetime <- regmatches(content, regexpr("[0-9\\-]{10}\\s[0-9\\:]{8}", content))
datetime <- as.POSIXct(strptime(datetime, "%Y-%m-%d %H:%M:%S"))
attr(datetime, "tzone") <- "EST" # Washington time zone

# Count tweets
counts <- aggregate(datetime, by = list(as.POSIXlt(datetime)$hour), length)
names(counts) <- c("hour", "tweets")
# Relative number


barplot(counts$tweets / sum(counts$tweets) * 100,
        names.arg = sprintf("%02d", counts$hour),
        ylab = "relative frequency [%]",
        xlab = "time of the day [local time; EST]",
        main = sprintf("Donalds preferred times to tweet\n%d tweets %s to %s",
                       length(datetime), as.Date(min(datetime)), as.Date(max(datetime))))

# Mentioned "realDonaldTrump" or "Trump" in general (in 1000 tweets)
c(realDonaldTrump = sum(unlist(gregexpr("realDonaldTrump", content, ignore.case = TRUE)) >= 0),
  Trump           = sum(unlist(gregexpr("Trump", content, ignore.case = TRUE)) >= 0))


# Read the website
content <- readLines("https://uibk.ac.at", warn = FALSE)
c(class = class(content), length = length(content))


# Try to find all links (href's)
hrefs <- unlist(regmatches(content, gregexpr("(?<=(href=\")).*?(?=\")", content, perl = TRUE)))
head(hrefs)


# Create a vector to store in a file
names <- c("Reto", "Annika", "Peter", "Lea")
# Write the vector into a file
writeLines(names, "testfile.txt")



