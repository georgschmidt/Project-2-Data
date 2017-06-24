################################################################################
##########             DATA ANALYSIS MERITOCRACY PROJECT              ##########
################################################################################

# if necessary, please install the following packages:
# install.packages("data.table")
# install.packages("ggplot2")
library(data.table); library(ggplot2); library(reshape2)

#Set working directory: setwd("C:\\...\\Project 2\\Data\\VCEE lab testing yyyy-mm-dd")
setwd("C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19")
#loading D.RData file created in DATA CLEAN-UP: load(file = "C:\\...\\D.RData")
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19\\D.RData") 


########****************************************************************########
########                     DESCRIPTIVE STATISTICS                     ########
########****************************************************************########

### Check of RET #### 
t1 <- c(grep("TIME1", colnames(D)))

# old version: ugly matplot:
T1 <- D[, t1, with=F]
matplot(1:ncol(T1), t(T1), type = "l")

# new version: nice ggplot
df <- as.data.frame(t(D[, t1, with=F]))   #apparently data.table not so good
colnames(df) <- paste0("Subject ", 1:ncol(df))
df_long <- melt(df) #here I use reshape2 package to bring data into long format, better for graphing
names(df_long)[1:2] <- c("Subjects", "Time")
df_long$Sequence <- 1:nrow(df)

ggplot(df_long, aes(Sequence, Time, colour = Subjects)) + 
  geom_line() +
  geom_abline(slope = 0, intercept = 10, colour = "red")  #individually optimal switching point


### Development of Subjects ####

## OUTPUT Development
o <- c(grep("OUTPUT", colnames(D)))
o <- o[2:length(o)]
O <- as.data.frame(t(D[, o, with=F]))
colnames(O) <- paste0("Subject ", 1:ncol(O))
O_long <- melt(O)
names(O_long)[1:2] <- c("Subjects", "Output")
O_long$Round <- 1:nrow(O)
ggplot(O_long, aes(Round, Output, color = Subjects)) +
  geom_line()
# ORANK (output from counting and switch)

rank(-DD[,TIME101], ties.method = "min")

## PROD Development
# PRANK (production from counting only)

### More Stuff ####

## Check Fatigue effects
#plot PROD1-PROD8|BasicTech and ...|AdvancedTech

## more yet to come: eg. average PROD, time over sequence length, ...

########****************************************************************########
########                        HYPOTHESES TESTING                      ########
########****************************************************************########

######--------------------------------------------------------------------######
######                 H1: EFFORT HIGHER IN COMPETITION                   ######
######--------------------------------------------------------------------######

# H1: Subjects exert more effort in a competitive setting compared to an 
#     individual setting.

# Issue: How to measure Effort??
#  -) Number of solved strings.
#  -) Time spent solving the last string
#      expected to be longer in competitive stage compared to base rate, where
#      subjects are expected to switch optimally after 10sec or longer.
# z_Last_i ^(Comp)  >  z_Last^(Base)_i

x <- D[, c(grep("TIME1", colnames(D))), with=0]
y <- x[1]
for (i in 1:nrow(x)) {}
tail(x[x!=0], 1)
D[, paste0("OVERTIME", i := ] #Creates columns OVERTIME1,...,OVERTIME8

#you can avg this over t=1,2 and t=3-7 (t=8 is special)
#OVERTIMEAVG <- mean(OVERTIME3-8)
#avg over all participants, groups
#
#INFO - NOINFO einzeln anschauen und die Diffs vergleichen.
#Runden einzeln anschauen
#
#So avg. over A,B,...,E  z_last_i=[3-8] vs. z_last_i=[1,2]
#will yield only very few observations.
#non-parametric test. eg Wilcoxon test.
# Wilcoxon-Mann-Whithney-Test:
wilcox.test()

######--------------------------------------------------------------------######
######                    H2: OVER-EXERTION OF EFFORT                     ######
######--------------------------------------------------------------------######

# H2: Subjects over-exert effort more, when provided with feedback about
#     competitors' performances.
#     i.e. More OVERTIME4-8 in TREAT compared to CONT.

# with INFO higher over exertion starting t=4.
# following path depends then on closeness. See H2A


######--------------------------------------------------------------------######
######         H3: GROUP INEQUALITY ON (over-exertion of) EFFORT          ######
######--------------------------------------------------------------------######

# H3: Subjects put more effort in groups with less inequality.
#     i.e. if race is closer, there is stronger competition

#Test this using only TREAT observations.

#INEQU <- Gini#  ...within group inequality in round # = 4,...,8 over PROD# or OUTPUT#

#   regression: GPROD# = alpha*INEQU# + controls + epsilon
#     controls: 
# Expectations: alpha < 0 (i.e. more Inequality leads to lower overall production)


######--------------------------------------------------------------------######
######              H4: PERCEPTION OF LUCK BY INCOME STATUS               ######
######--------------------------------------------------------------------######

# H4: Perception of luck depends negatively on overall earnings.
#     i.e. Subjects with worse performance consider luck more important in
#          determining overall earnings.

#   regression: LUCK = alpha*PAY + controls + epsilon
#     controls: RANK, RANK8, (most salient in mind), LAST8 INEQU, INEQU8
# Expectations: alpha < 0 (worse performers give Luck more importance)
#               RANK < 0 (-"-, might be additional driver of Luck perception)
#               LAST > 0 (last place holders consider luck even more important)
#               INEQU unclear


######--------------------------------------------------------------------######
###      H5: AVG TIME PER STRING increases when INFO         ###
######--------------------------------------------------------------------######

# avg time needed to solve sequence s, w/ and w/o INFO,
# cf. Eriksson et al.