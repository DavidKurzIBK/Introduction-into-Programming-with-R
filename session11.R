
save(traffic, file = "traffic.rda");
load(file = "traffic.rda");

class(traffic)
sapply(traffic,class)
head(traffic)


saveRDS(traffic, file = "traffic.rds")
traffic2 <- readRDS(file = "traffic.rds")

identical(traffic, traffic2)


write.csv(traffic, file = "traffic.csv")
traffic3 <- read.csv("traffic.csv")

trafficA <- read.csv("traffic.csv", row.names = 1)
class(trafficA$date)
traffic3 <- read.csv("traffic.csv", row.names = 1, colClasses = list(date = "Date"))
class(traffic3$date)

identical(traffic, traffic3)
identical(trafficA, traffic3)
identical(traffic2, traffic3)


traffic3$month <- factor(traffic3$month, levels = month.abb)
traffic3$wday <- factor(traffic3$wday, levels = levels(traffic$wday))
# traffic3 = traffic3[,-1];

# all look the same but aren't identical;
identical(traffic, traffic3)
identical(trafficA, traffic3)
identical(traffic2, traffic3)



library("openxlsx")

write.xlsx(traffic, file = "traffic_excel.xlsx")

write.xlsx(traffic, file = "traffic_excelA.xlsx", append = FALSE, quote = TRUE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

traffic_xlsx <- read.xlsx("traffic_excel.xlsx", detectDates = TRUE)
traffic_xlsxA <- read.xlsx("traffic_excelA.xlsx", detectDates = TRUE)
traffic_xlsxA = traffic_xlsxA[,-1]; # remove first col;


traffic_xlsx$month <- factor(traffic_xlsx$month, levels = month.abb)
traffic_xlsx$date <- as.Date(traffic_xlsx$date)
traffic_xlsx$wday <- as.character(traffic_xlsx$wday)


all.equal(traffic, traffic_xlsx)
identical(traffic, traffic_xlsx) 
all.equal(trafficA, traffic_xlsx)
identical(trafficA, traffic_xlsx) 
all.equal(traffic2, traffic_xlsx)
identical(traffic2, traffic_xlsx) 
all.equal(traffic3, traffic_xlsx)
identical(traffic3, traffic_xlsx) 

traffic_xlsx$month <- factor(traffic_xlsx$month, levels = month.abb)
traffic_xlsx$wday <- as.character(traffic_xlsx$wday, levels = unique(traffic_xlsx$wday)[c(2, 3, 4, 5, 6, 7, 1)])
traffic_xlsx$total <- as.integer(traffic_xlsx$total)
traffic_xlsx$date <- as.Date(traffic_xlsx$date)
str(traffic)
str(traffic_xlsx)


all.equal(traffic, traffic_xlsx)
identical(traffic, traffic_xlsx) 
all.equal(trafficA, traffic_xlsx)
identical(trafficA, traffic_xlsx)
all.equal(traffic2, traffic_xlsx)
identical(traffic2, traffic_xlsx)
all.equal(traffic3, traffic_xlsx)
identical(traffic3, traffic_xlsx)





######## ---------------- traffic I/O 
#global CO2 Emissions

#Read the data set using an appropriate read.*() function, specify all necessary arguments.
emissions<-read.csv("CDIAC_worldwide.csv", comment.char = "#", sep="", header=TRUE)
dim(emissions)
head(emissions, n=5)

#Investigate the object. Your object should have 264 observations and 8 variables. #TRUE
attributes(emissions) #264 observations & 8 variables

#All variables should be numeric or integer (is.numeric()). If not, correct the object.
isnot<-sapply(emissions, function(x)sum(!is.numeric(emissions) & !is.character(emissions))) #in each line 1 is not character or numeric
as.numeric(isnot) #coercing the line above to numeric 
# would be sufficient if 
sapply(emissions, is.numeric)


#How many missing values do we have per variable? Create a new object and store this information (number of missing values only).
na.columns<-sapply(emissions, function(x)sum(is.na(x))) #counts NA's columnwise, all lead to same result except last
na.rows<-sum(rowSums(is.na(emissions))) #counts NA's rowwise
sum(is.na(emissions)) #199 NA


#The variable names are not very handy. Adjust the names of all variables (except year) using the names shown below.
colnames(emissions)<- c("year", "total", "gas_fuel", "liquid_fuel", "solid_fuel", "cement_production", "gas_flairing", "per_capita_tons")
head(emissions)

