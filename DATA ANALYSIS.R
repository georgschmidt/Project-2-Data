################################################################################
##########             DATA ANALYSIS MERITOCRACY PROJECT              ##########
################################################################################

# if necessary, please install the following packages:
# install.packages("data.table")
# install.packages("ggplot2")
library(data.table); library(ggplot2)

#Set working directory: setwd("C:\\...\\Project 2\\Data\\VCEE lab testing yyyy-mm-dd")
setwd("C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19")
#loading D.RData file created in DATA CLEAN-UP: load(file = "C:\\...\\D.RData")
load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19\\D.RData") 


########****************************************************************########
########                     DESCRIPTIVE STATISTICS                     ########
########****************************************************************########

## Check of our RET (Real-effort task)
#plot TIME#01 - TIME#30 to get a feeling of the production-cost structure.
#add a 10sec rationality benchmark for TIME1ss and TIME2ss to see how much
# sub-optimal 'over-production' occured. (something like abline(1:30, 10))
p1 <- ggplot2::ggplot(data=D[,c(grep("T1", colnames(D)))], aes("Sequence","time")) 
p1 + geom_path()   #NEEDS FIXING

## Check Fatigue effects - *** This DOES NOT show Fatigue. It is mainly a strategically different situation across the rounds. Difference in behavior is more likely due to changed stakes***

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
#  -) Number of solved strings. *** This is only a purposeful measure for within subject comparison since ability dependandt*** 
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

# H2: Subjects over-exert *** I woul just say "exert". The "over-exert" has not being defined*** effort more, when provided with feedback about
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