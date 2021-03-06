===============================================================================
R.Data Variables Documentation
===============================================================================
This is an extensive documentation about all the Variables of our Data set.
For a condensed version see our Share Latex Document or Variables.docx in the
joint document folder on Moodle.

Organizational
-------------------------------------------------------------------------------
S.ID                Session ID
GROUP               Group ID in Session (need to figure out what exactly is)
G.ID                Group ID, takes values 1,...,5
LABEL               Takes values A,B,C,D or E, character form om G.ID
CODE                Unique identification code
SCODE               Session Code
TREAT               Treatment Status (cont or treat)
TECH#                Dummy, 1 if advanced


Performance Individual
-------------------------------------------------------------------------------
PAY                 Payout upon leaving the lab measured in €.
PROD#               Number of sequences solved in round # = 0,...,8. w/o# gives
                    total production excluding Trial (PROD1+...+PROD8)
SHARE#              Share of Group PROD in round # = 3,...,8
SWITCH#             Time of switching in round # = 1,...,8 measured in sec.
CHILL#              Time spent in switch mode in round # = 1,...,8
ADDT#               Additional Time measures how long subject takes to switch
                    after solving last sequence in round # = 1,...,8
OUTPUT#             Output from PROD + CHILL in round # = 1,...,8 measured in
                    Tk. w/o # is total output from rounds 1 to 8
TIME#ss             Time spent solving sequence ss in round # = 0,...,8

Performance Group
-------------------------------------------------------------------------------
GPROD#              Number of sequences solved by group in round # = 3,...,8

Beliefs
-------------------------------------------------------------------------------
BAVG#               Belief about average number of sequences solved in player's
                    group. # = 3,...,8
BMAXB#              Belief about number of sequences solved by most productive
                    member of player's group using Basic tech. # = 3,...,8
BMAXA#              Belief about number of sequences solved by most productive
                    member of player's group using Advanced tech. # = 4,...,8

Questionnaire
-------------------------------------------------------------------------------
LUCK                Belief about how important luck was in achieving high
                    overall earnings. 0 = not at all, 10 = exclusively
EFFORT              Belief about how important effort was in achieving high
                    overall earnings. 0 = not at all, 10 = exclusively
SKILL               Belief about how important skill was in achieving high
                    overall earnings. 0 = not at all, 10 = exclusively


Descriptives
```````````````````````````````````````````````````````````````````````````````


Hypothesis 1
°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
OVERTIME#           Difference b/w time solving last sequence in round # = 3,..
                    .,8 and time solving last sequence in baserate with same te
                    chnology. (i.e. TIME#last - TIME1last)

Hypothesis 2
°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

Hypothesis 3
°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
INEQU#              Within group inequality in round # = 4,...,8 measured by
                    Gini coefficient of PROD# over all five group members.
                    alternatively OUTPUT# instead of PROD#

Hypothesis 4
°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
ORANK#              Rank of subject in round # = 0,...,8 according to OUTPUT#
                    w/o # is overall Rank according to OUTPUT
PRANK#              Rank of subject in round # = 0,...,8 according to PROD#
                    w/o # is overall Rank according to PROD
LAST#               Dummy, 1 if Rank# = 5, 0 o/w.
