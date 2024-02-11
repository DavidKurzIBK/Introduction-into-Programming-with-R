# Session 09 Persons: 
# Frames & Lists

load("~/MA/VU introduction into programming with R/win-library/3.6/Archive/Discdownscrpits/persons.rda")
load("persons.rda")

# solution without df part: 
name <- rownames(persons)
head(name)

gender <- ifelse(persons[, "gender"] == 0, "male", "female")
df <- data.frame(name = name, height = persons[, "height"], age = persons[, "age"], gender = gender)

# solution with complete df part
df <- as.data.frame(persons)
df$gender <- ifelse(df$gender == 0, "male", "female")
df$name <- rownames(persons)
rownames(df) <- NULL
df <- df[,c("name", "height", "age", "gender")]


head(persons)
class(persons)
typeof(persons)
dim(persons)
str(persons)
names(persons)
colnames(persons)
rownames(persons)



# Exercise B: 
load("persons2.rda")
table(persons2$gender)
table(persons2$employment)
table(persons2$employment)["unemployed"]
table(persons2$employment)[["unemployed"]]
length(table(persons2$employment))



mean(persons2[persons2$employment == "self-employed", "salary"])
subset(persons2, employment == "self-employed", "salary", drop = TRUE)
mean(subset(persons2, employment == "self-employed", "salary", drop = TRUE))


persons2$employment == "student" & persons2$salary == 0
sum(persons2$employment == "student" & persons2$salary == 0)
subset(persons2, employment == "student" & salary == 0)
sum(subset(persons2, employment == "student" & salary == 0))

max(persons2$salary)
which.max(persons2$salary)
persons2[which.max(persons2$salary),]
persons2[which.max(persons2$salary),"name"]
persons2[which.max(persons2$salary),"employment"]

head(persons2[order(persons2$salary, decreasing = TRUE),], n = 1)

head(persons2)
persons2$location == "Innsbruck"
sum(persons2$location == "Innsbruck")
percantage_ibk <- (sum(persons2$location == "Innsbruck") / nrow(persons2))*100
perc_IBK <- mean(persons2$location == "Innsbruck")*100


not_IBK <- sum(persons2$employment == "student") - sum(persons2$location == "Innsbruck" & persons2$employment == "student")
not_IBK2 <- sum(persons2$location != "Innsbruck" & persons2$employment == "student")



# Exercise C: 
tapply(persons2$salary, persons2$employment, mean)
sapply(persons2, function(x) length(unique(x)))


load('contacts.rda')
friends$Matze

friends$Marc$kids <-"Lea"

