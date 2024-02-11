
file <- read.csv("mittenwald-1617.csv",row.names = 1, colClasses = list(date = "Date"))

traffic <- read.table(file, nrows = 3, comment.char = "")
meta <- meta[[3]]
# or to extract the 3rd column;
meta <- meta[,3]

data$weekday <- factor(format(data$date, "%w"),
                       levels = as.character(c(1:6, 0)), # So it starts with Monday
                       labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                       ordered = TRUE)

# wday.abb -< c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")



traffic <- function(x, md){
  # Sanity checks:
  stopifnot(is.data.frame(x))
  stopifnot(is.character(md))
  stopifnot(lenght(md) == 3L)
  stopifnot(inherits(x, "Date"))
  
  #setting other date variables: 
  x$year <- as.integer(format(x$date, "%Y"))
  x$month <- factor(format(x$date, "%b"), levels = month.abb, ordered = TRUE)
  x$wday <- factor(format(x$date, "%a"), levels = wday.abb, ordered = TRUE)
  
  
  # create the object:
  class(x) <- c("traffic", "data.frame")
  attr(x, "location") <- md[1]
  attr(x, "highway")  <- md[2]
  attr(x, "id")       <- md[3]
  
  # Return: 
  return(x)
}


read_traffic <- function(file){
  # sanity checks
  stopifnot(is.character(file))
  stopifnot(length(metadata) == 1L)

  # read data:
  data <- read.csv(file, comment.char = "#", colCLasses = list(date = "Date"))  
  
  sapply(data, class)
  read.table(file, comment.char = "", nrow = 3)
  
  # read metadata:
  metadata <- read.table(file, comment.char = "", nrow = 3)[, 3]
  
  # create traffic object: 
  return(traffic(data, metadata))
  
    
}

# create traffic: 
as.data.frame.traffic <- function(x,...){
  class(x) <- "data.frame"
  attr(x, "Location") <- NULL
  attr(x, "highway") <- NULL
  attr(x, "id") <- NULL
  return(x)
  
}


# ... means ellipses and 
print.traffic <- function(x, n = 6, ...){
  writeLines("Traffic counts")
  writeLines(paste("Location:", attribute(x, "location")))  
  writeLines(paste("Location:", attribute(x, "highway")))
  writeLines(paste("Location:", attribute(x, "id")))
  writeLines(paste("Time period:", min(x$date), "to", max(x$date)))
  print(head(as.data.frame(x), n = n), ...)
}
                        
                          
                          
# testing in console 
read.csv("mittenwald-1617.csv")

# set the levels explicitly including the leading zeros
data$month <- factor(formaLt(data$date, "%m"),
                     levels = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"),
                     labels = month.abb,
                     ordered = TRUE)

# Rather than coercing the levels to character, coerce the main argument to numeric
data$month <- factor(as.numeric(format(data$date, "%m")),
                     levels = 1:12,
                     labels = month.abb,
                     ordered = TRUE)




# 1) Summary function
summary.traffic <- function(object, by = "year", ...){
  stopifnot(by %in% c("year", "month", "weekday"))
  if(by == "year"){
    res <- aggregate(cbind(pkw, lkw, mot, various, total) ~ year, data = object, FUN = mean)
  } else if (by == "month"){
    res <- aggregate(cbind(pkw, lkw, mot, various, total) ~ month, data = object, FUN = mean)
  } else if (by == "weekday"){
    res <- aggregate(cbind(pkw, lkw, mot, various, total) ~ weekday, data = object, FUN = mean)
  }
  return(res)
}

### or Summary function

summary.traffic <- function (object, by = "year", ...){
  #argument matching - already checks that by has a particular format
  by <- match.arg(tolower(by), c("year", "month", "wday"))
  #calculate mean by "by" - with default interface
  #na.rm given to the mean function, no na.action of aggregate with default interface
  res <- aggregate(object[, c("pkw", "lkw", "mot", "various", "total"), drop = FALSE], 
                   object[, by, drop = FALSE], FUN = mean, na.rm = TRUE)
  return(res)
}
summary(traffic_mittenwald_1617, by = "weekday")


# 2) Plotting
plot.traffic <- function(object, by = "year", what = "total", ...){
  res <- summary(object, by = by)[, what]
  barplot(res, main = "Traffic count", xlab = "Time frame", ylab = "Number of vehicles", col = "darkslategray4")
}

### or Plot function 

plot.traffic <- function(object, by = "year", what = "total", ...){
  res <- summary(object, by = by)
  col <- res[, what]
  #getting the names out of the summary and adding it to res
  col <- setNames(col, res[, 1])
  barplot(col, main = paste(what, "traffic count by", by), xlab = "Time frame", ylab = paste("Number of", what, "vehicles"), col = "darkslategray4")
}

plot(traffic_mittenwald_1617, by = "month", what = "mot")






# creating class "traffic" inheriting from "data.frame"

traffic <- function(x, location, highway, id){
  class(x) <- c("traffic", "data.frame")
  x$weekday <- factor(format(data$date, "%w"),
                      levels = as.character(c(1:6, 0)), # So it starts with Monday
                      labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
                      ordered = TRUE)
  
  x$month <- factor(format(data$date, "%m"),
                    levels = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"),
                    labels = month.abb,
                    ordered = TRUE)
  x$year <- factor(as.numeric(format(data$date, "%m")),
                   levels = 1:12,
                   labels = month.abb,
                   ordered = TRUE)
  
  attr(x, "location") <- location
  attr(x, "highway") <- highway
  attr(x, "id") <- id
  return(x)
}

# creating read.* function

read_traffic <- function(file){
  UseMethod("read.csv")
  class(x) <- "traffic"
  attr(x, "location") <- as.character(read.table(file, nrows = 1, comment.char = ""))[3]
  attr(x, "highway") <- as.character(read.table(file, nrows = 2, comment.char = "", skip = 1))[3]
  attr(x, "id") <- as.character(read.table(file, nrows = 3, comment.char = "", skip = 2))[3]
  return(x)
}




read_traffic <- function(file) {
  x <- read.csv(file, comment.char = "#", colClasses = list(date = "Date"))
  
  loc <- as.character(read.table(file, nrows = 1, comment.char = ""))[3]
  high <- as.character(read.table(file, nrows = 2, comment.char = "", skip = 1))[3]
  id <- as.character(read.table(file, nrows = 3, comment.char = "", skip = 2))[3]
  
  return(traffic(x, loc, high, id))
}



## Adding the attributes
add_attr <- readLines(con = string, n = 3)
add_attr <- strsplit(add_attr, split = " ")
attr(tdata, "location") <- add_attr[[c(1,3)]]
attr(tdata, "highway")  <- add_attr[[c(2,3)]]
attr(tdata, "id")      <- add_attr[[c(3,3)]]







res <- aggregate(cbind(pkw, lkw, mot, various, total) ~ eval(by),
                 data = object, FUN = mean)



summary.traffic <- function(object, by = "year", ...){
  
  # values for by should be "year", "month", or "weekday"
  
  by <- match.arg(tolower(by), c("year", "month", "weekday"))
  stopifnot(by %in% c("year", "month", "weekday"))
  
  # create additional variable "by" which can be used in aggregate()
  # reason: only using ~ by as explenatory would result in ~ "year" (quotes)
  
  object$by <- object[, by]
  
  # reports the mean traffic by a certain variable 
  res <- aggregate(cbind(pkw, lkw, mot, various, total) ~ by, 
                   data = as.data.frame(object), FUN = mean, na.rm = TRUE)
  
  return(res)
}




