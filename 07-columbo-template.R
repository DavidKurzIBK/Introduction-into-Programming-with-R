# -------------------------------------------
# Introduction to Programming with R
# Session 07: Practical session
# Exercise: Columbo
# NOTE: No full template, as we won't have
#       a template next week.
# -------------------------------------------

# Preparation -------------------------------
setwd("~/MA/VU introduction into programming with R/win-library/3.6/Archive/Scripts")
load("~/MA/VU introduction into programming with R/win-library/3.6/Archive/Scripts/columbo.rda")
# Loading the data set ----------------------
# Working directory correct?

# Examine the What is the class, type, and dimension of the object? 
# What are the attributes, variable names, or dimension names?
#Properties:
c(class = class(columbo), type = typeof(columbo), nrow = nrow(columbo), ncol = ncol(columbo))

# attributes: 
names(attributes(columbo))

# How many episodes have been broadcasted in total?
number_of_episodes <- nrow(columbo)
cat("In total, there were", number_of_episodes, "episodes.\n")


# When was the first episode released, when the last one?
year_first <- min(columbo[, "year"])
year_last <- max(columbo[,"year"])
year_first_last <- range(columbo[, "year"])
cat("The first episode was released in", year_first, " and the last one released in", year_last)
cat("The first episode was released in", min(year_first_last), " and the last one released in", max(year_first_last))

# How many episodes have been released in the eighties (the years 1980, 1981, ., 1989)?
number_eighties <- sum(columbo[,"year"] >= 1980 & columbo[, "year"] <= 1989)
cat("There are", number_eighties, "episodes from the eighties.\n")

# How many seasons have been broadcasted?
number_seasons <- length(unique(columbo[, "season"]))
cat("There were", number_seasons, "different seasons.\n")
seasons <- max(columbo[,"season"])
cat("There were", seasons, "different seasons.\n")

# How many episodes were there per season? Which season has the most episodes, which season the least?
# What is the absolute difference of the number of episodes in the first and the last season?
episodes_per_season <- matrix(table(columbo[, "season"]))

epi_per_seas_min <- which.min(episodes_per_season)
epi_per_seas_max <- which.max(episodes_per_season)

cat("Season", epi_per_seas_min, "hast the least, season", epi_per_seas_max, "the most episodes.\n")

absolute_diff <- abs(episodes_per_season[1] - episodes_per_season[10])
cat("The absolute difference of the number of episodes in the first and the last season is", absolute_diff)

# alternatively use a loop;
# Extract all unique season numbrs
all_seasons <- unique(columbo[, "season"])
# We now know which seasons are in the data set and
# create ourself an empty _named_ vector.
result <- vector("integer", length(all_seasons))
names(result) <- all_seasons
print(result)



# How long was the shortest, how long the longest episode?
dur_min <- min(columbo[, "duration"])
dur_max <- max(columbo[, "duration"])

cat("The shortest episode has a duration of", dur_min, ", the longest a duration of", dur_max, "minutes.\n")



# What is the average time of a Columbo episode?
dur_mean <- mean(columbo[, "duration"])
cat("The average duration is", dur_mean, "minutes.\n")



# What is the title of the longest episode?
idx <- which(columbo[, "duration"] == dur_max)
idx
# Use this index to get the title of longest episode
title_longest <- rownames(columbo)[idx]

cat("The name of the longest episode is:", title_longest, ".\n")

# Many solutions possible
columbo[which.max(columbo[, "duration"]), "duration"]
rownames(which.max(columbo[, "duration"]))


# How long was the episode with the title "Death Hits the Jackpot"?
length_jackpot <- columbo["Death Hits the Jackpot", "duration"]

cat("The episode has a length of", length_jackpot, "minutes\n")



# Extract all titles and store them on a new object title.
title <- rownames(columbo)


# try grep("Murder", title) and grepl("Murder", title) and interpret the result returned by these two commands.
# grep() and grepl() are used to match strings. grep*("Murder", title) 
# checks which element of title contains the string "Murder"
# grepl(): (l for logical) returns a logical vector
# grep(): returns an index vector



# How many episode titles contain the word "Murder" in absolute and relative frequencies (in percent)?
g_idx     <- grep("Murder", title)
g_logical <- grepl("Murder", title)

c(class_grep = class(g_idx), class_grepl = class(g_logical))

c(len_grep = length(g_idx),  len_grepl = length(g_logical))

(num_murder_logical <- sum(g_logical))   # Sum up logical vector

(num_murder_index   <- length(g_idx))    # Length of the idex vector

(percent_murder     <- num_murder_logical / nrow(columbo) * 100) # Conver to percent

cat("There are", num_murder_logical, "episodes which have the word \"Murder\" in the title.\n")

cat("In percent, this is about", round(percent_murder, 1), "percent of all episodes.\n")




