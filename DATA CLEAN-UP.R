################################################################################
#####                  DATA CLEAN-UP MERITOCRACY PROJECT                   #####
################################################################################

# If you have not already, please install the following packages:
# install.packages("data.table", "ggplot2")
library(data.table)

#Set working directory: setwd("C:\\...\\Project 2\\Data\\VCEE lab testing yyyy-mm-dd")
setwd("C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data")

#Load Data: read.csv("project_2_???? (accessed yyyy-mm-dd).csv", header=TRUE, sep=",")
Data.raw <- read.csv("project_2_treat-accessed-2017-06-25-tech_added.csv", header=TRUE, sep=",")
Data.raw <- as.data.table(Data.raw)
colnames(Data.raw)[9] #just to check 
D <- Data.raw[ participant._current_page_name == "Thank_you"] #to use only complete obs.

#removing irrelevant columns:
rm <- colnames(D)[c(3:6,8:16)]
D[, c(rm):=NULL]
D[, c(grep("player.sharepc", colnames(D))):=NULL] #removes PROD share displayed in %.
D[, c(grep("player.outputinswitch", colnames(D))):=NULL] #removes timeinswitch/10.
#renaming Variables according to our Variables list ("R Variables Documentation.txt")
print(oldnames <- colnames(D)[1:9])
print(newnames <- c("S.ID", "CODE","TREAT","G.ID", "PAY", "LABEL", "LUCK", "EFFORT", "SKILL"))
setnames(D, old=c(oldnames), new=c(newnames))
colnames(D) <- sub("player.avgbelief", "BAVG", colnames(D))
colnames(D) <- sub("player.mostprodBTbelief", "BMAXB", colnames(D))
colnames(D) <- sub("player.mostprodATbelief", "BMAXA", colnames(D))
colnames(D) <- sub("player.output", "PROD", colnames(D))
colnames(D) <- sub("player.share", "SHARE", colnames(D))
colnames(D) <- sub("player.switchtime", "SWITCH", colnames(D))
colnames(D) <- sub("player.timeinswitch", "CHILL", colnames(D))
colnames(D) <- sub("player.additionaltime", "ADDT", colnames(D))
colnames(D) <- sub("player.totaloutput", "OUTPUT", colnames(D))
length(grep("player.t", colnames(D))) #just a check whether 5+8*30 = 245 (don't do this before above renaming)
colnames(D) <- sub("player.t", "TIME", colnames(D))
colnames(D) <- sub("group.groupoutput", "GPROD", colnames(D))
colnames(D) <- sub("group.id_in_subsession", "GROUP", colnames(D))
colnames(D) <- sub("session.code", "SCODE", colnames(D))

#after renaming other switch stuff, delete switch dummy
D[, c(grep("player.switch", colnames(D))):=NULL] 
#more deletions
D[, c(grep("player.rank", colnames(D))):=NULL]
D[, c(grep("player.payoff", colnames(D))):=NULL] #remove oTree auto-payoff, we don't use it
D[, c(grep("session.", colnames(D))):=NULL]

##CARFUL: Updating TREAT column (0 if cont, 1 if treat)
D[, TREAT := rep(1, times=nrow(D))]


#Save, name according to treatment D_cont/treat.RData
D_treat <- D
save(D_treat, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_treat.RData") 

#Load separate files and merge them into one file:
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_cont.RData") 
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_treat.RData") 

D <- rbind(D_cont, D_treat)
save(D, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D.RData") 

#.csv export (e.g. for Excel):
write.csv(D, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D.csv", row.names = F)
