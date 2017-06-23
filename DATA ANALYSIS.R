################################################################################
##########             DATA ANALYSIS MERITOCRACY PROJECT              ##########
################################################################################

# if necessary, please install the following packages:
# install.packages("data.table")
# install.packages("ggplot2")

#Set working directory: setwd("C:\\...\\Project 2\\Data\\VCEE lab testing yyyy-mm-dd")
setwd("C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19")

load(file = "C:\\Users\\Georg\\OneDrive\\Studium\\VWL-Master curr 2013\\17 S\\Designing and Implementing an Economic Experiment\\Moodle\\Project 2\\Data\\VCEE lab testing 2017-06-19\\D.RData") 


########****************************************************************########
########                     DESCRIPTIVE STATISTICS                     ########
########****************************************************************########


########****************************************************************########
########                        HYPOTHESES TESTING                      ########
########****************************************************************########

######--------------------------------------------------------------------######
######                 H1: EFFORT HIGHER IN COMPETITION                   ######
######--------------------------------------------------------------------######

# H1: More effort is exerted in a competitive setting compared to an individual
#     to an individual setting.

#Effort measured by number of solved strings.
#Time spent to solve the last string is longer in competitive
#stage compared to base rate, where subjects are expected to
#switch optimally after 10sec or longer.
# z_Last_i ^(Comp)  >  z_Last^(Base)_i
#
#you can avg this over t=1,2 and t=3-7 (t=8 is special)
#
#avg over all participants, groups
#
#INFO - NOINFO einzeln anschauen und die Diffs vergleichen.
#Runden einzeln anschauen
#
#So avg. over A,B,...,E  z_last_i=[3-8] vs. z_last_i=[1,2]
#will yield only very few observations.
#non-parametric test. eg Wilcoxon test.


###----------------------------------------------------------###
###                         H2: ASDF                         ###
###----------------------------------------------------------###
# compare path of INFO and NOINFO.
# with INFO higher over exertion starting t=4.
# following path depends then on closeness. See H2A


###..........................................................###
###H2A: WITHIN GROUP CLOSENESS ON (over exertion of) EFFORT OR PRODUCTION###
###..........................................................###

# compare b/w groups wether groups with higher inequality
# measured eg. by Gini) exhibit less production and less over
# exertion of effort
#
# we could also compare individual production in t=4 vs. t=6 (if
# within group inequality changed.)  BUTBUTBUT keep in mind, that
# over time interdependend obs. AND mind fatigue effects (muss
# herausrechnen)


###----------------------------------------------------------###
###      H3: AVG TIME PER STRING increases when INFO         ###
###----------------------------------------------------------###

# avg time needed to solve sequence s, w/ and w/o INFO,
# cf. Eriksson et al.


###----------------------------------------------------------###
###  H4: Subjects with worse performance consider luck more  ###
###      important to achieve higher overall earnings.       ###
###----------------------------------------------------------###

###  Luck = alpha*PROD + epsilon
###  controls: rank in Round 08. (most salient in mind)
###  Within group inequality (Round 08 or avg. over comp Stage)