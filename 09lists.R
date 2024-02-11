
demo <- list(
  "Petra" = list(location = "Birmingham", kids = NULL, job = "Programmer"),
  "Frank" = list(location = "Kufstein",   kids = c("Peter", "Paul")), 
  "Pete" = list(c(1:3))
)
str(demo)

# to get Franks location
demo$Frank$location
#alternative by sublist indexing: 
demo[["Frank"]][["location"]]

# not working is a mixture
demo["Frank"]$location#
# but with double braceltes it works because this derectly calls the subsec of list
demo[["Frank"]]$location
# how many kids frank have: 
length(demo[["Frank"]][["kids"]])
# or
length(demo$Frank$kids)


# replacement practicals: 
# petra moves to Vienna: 
demo$Petra$location <- "Vienna"
# Frank got newborn kid milena
demo$Frank$kids <- c("Peter", "Paul", "Malena")
# or 
# but remove Milena firts: 
demo$Frank$kids[[3]] <- 0;
demo$Frank$kids[[4]] <- 0;
demo$Frank$kids <- c(demo$Frank$kids, "Malena")


# Add a third person called 'Regina', located in 'Sidney'. She has one child called 'Lea' and works a 'Teacher'.
demo$Regina <- list(location = "Sidney", kids = "Lea", job = "Teacher")




givenname <- vector("character", length = 1)             # creating new vector for storing given names

for (i in seq_along(friends)) {
  
  givenname <- names(friends[i])
  friends[[i]][6] <- givenname                           # adding givenname as variable to list
  familyname <- friends[[i]][1]
  result <- c(givenname, familyname)
  print(paste(result))
}



for (name in names(friends)) {
  friends[[name]]$givenname <- name
  cat(name, friends[[name]]$familyname, "\n")
}





