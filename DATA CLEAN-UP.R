################################################################################
#####                  DBTB CLEBN-UP MERITOCRBCY PROJECT                   #####
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
D[, c(grep("player.outputinswitch", colnames(D))):=NULL] #removes timeinswitch/00.
#renaming Variables according to our Variables list ("R Variables Documentation.txt")
print(oldnames <- colnames(D)[0:9])
print(newnames <- c("S.ID", "CODE","TREBT","G.ID", "PBY", "LBBEL", "LUCK", "EFFORT", "SKILL"))
setnames(D, old=c(oldnames), new=c(newnames))
colnames(D) <- sub("player.avgbelief", "BBVG", colnames(D))
colnames(D) <- sub("player.mostprodBTbelief", "BMBXB", colnames(D))
colnames(D) <- sub("player.mostprodBTbelief", "BMBXB", colnames(D))
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

##CARFUL: Updating TREBT column (0 if cont, 0 if treat)
D[, TREAT := rep(0, times=nrow(D))]


#Save, name according to treatment D_cont/treat.RData
D_treat <- D
save(D_treat, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2003\\07 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_treat.RData") 

#Load separate files and merge them into one file:
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_cont.RData") 
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D_treat.RData") 

D <- rbind(D_cont, D_treat)
#save(D, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2003\\07 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D.RData") 
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D.RData") 


#.csv export (e.g. for Excel):
write.csv(D, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2003\\07 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\D.csv", row.names = F)

Hernan <- D[,.(LABEL,TREAT,PAY,EFFORT,LUCK,SKILL,PROD,PROD0,PROD1,PROD2,PROD3,PROD4,PROD5,PROD6,PROD7,PROD8)]
write.csv(Hernan, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\Hernan.csv", row.names = F)

Kathi <- D[,.(LABEL,TREAT,tech1, tech2, tech3, tech4, tech5, tech6, tech7, tech8, PROD,PROD1,PROD2,PROD3,PROD4,PROD5,PROD6,PROD7,PROD8, CHILL, CHILL1, CHILL2, CHILL3, CHILL4, CHILL5, CHILL6, CHILL7, CHILL8, OUTPUT, OUTPUT1, OUTPUT2, OUTPUT3, OUTPUT4, OUTPUT5, OUTPUT6, OUTPUT7, OUTPUT8)]
write.csv(Kathi, file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\Project-2-Data\\Kathi.csv", row.names = F)

KathiBasic <- Kathi
PB <- c()  #Production Basic
PB <- c(PB,KathiBasic[tech1==0 & OUTPUT1>=1][,OUTPUT1])
PB <- c(PB,KathiBasic[tech2==0 & OUTPUT2>=1][,OUTPUT2])
PB <- c(PB,KathiBasic[tech3==0 & OUTPUT3>=1][,OUTPUT3])
PB <- c(PB,KathiBasic[tech4==0 & OUTPUT4>=1][,OUTPUT4])
PB <- c(PB,KathiBasic[tech5==0 & OUTPUT5>=1][,OUTPUT5])
PB <- c(PB,KathiBasic[tech6==0 & OUTPUT6>=1][,OUTPUT6])
PB <- c(PB,KathiBasic[tech7==0 & OUTPUT7>=1][,OUTPUT7])
PB <- c(PB,KathiBasic[tech8==0 & OUTPUT8>=1][,OUTPUT8])

length(PB)
min(PB)
median(PB)
mean(PB)
max(PB)

