depression=dataf[,c("FID", "f.20446.0.0","f.20441.0.0","f.20536.0.0","f.20532.0.0","f.20533.0.0","f.20534.0.0","f.20535.0.0","f.20449.0.0","f.20450.0.0","f.20435.0.0","f.20437.0.0","f.20510.0.0","f.20514.0.0","f.20511.0.0","f.20517.0.0","f.20518.0.0","f.20519.0.0","f.20507.0.0","f.20508.0.0","f.20513.0.0", "f.20440.0.0", "f.20442.0.0", "f.20448.0.0")]
# > table(depression$f.20446.0.0) "Have you ever had a time in your life when you felt sad, blue, or depressed for two weeks or more in a row?" 
 # -818     0     1 
 #  284 50085 59974 
depression$A1 = NA 
depression$A1[which(depression$f.20446.0.0==1)] = 1
depression$A1[which(depression$f.20446.0.0==0)] = 0
​
# table(depression$f.20441.0.0) "Have you ever had a time in your life lasting two weeks or more when you lost interest in most things like hobbies, work, or activities that usually give you pleasure?"
 # -818     0     1 
 #  318 66940 43085 
depression$A2 = NA 
depression$A2[which(depression$f.20441.0.0==1)] = 1
depression$A2[which(depression$f.20441.0.0==0)] = 0
​
depression$base = rowSums(depression[,c("A1", "A2")], na.rm=TRUE)
depression$base[which(is.na(depression$A1 )&is.na(depression$A2))]=NA
# table(depression$f.20536.0.0)"Did you gain or lose weight without trying, or did you stay about the same weight?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
# -818	Prefer not to answer
# -121	Do not know
# 0	Stayed about the same or was on a diet
# 1	Gained weight
# 2	Lost weight
# 3	Both gained and lost some weight during the episode
 # -818  -121     0     1     2     3 
 #   48  9309 21449  8965 18980  3302 
depression$A3 = NA 
depression$A3[which(depression$f.20536.0.0>=1)] = 1
depression$A3[which(depression$f.20536.0.0==0)] = 0
​
depression$A3a = NA # only the people who gained weight
depression$A3a[which(depression$f.20536.0.0==1)] = 1
depression$A3a[which(depression$f.20536.0.0==0)] = 0
​
depression$A3b = NA # only the people who lost weight
depression$A3b[which(depression$f.20536.0.0==2)] = 1
depression$A3b[which(depression$f.20536.0.0==0)] = 0
​
depression$A3c = NA # only the people who both gained and lost weight
depression$A3c[which(depression$f.20536.0.0==3)] = 1
depression$A3c[which(depression$f.20536.0.0==0)] = 0
​
​
# table(depression$f.20532.0.0)  "Did your sleep change?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
# > table(depression$f.20532.0.0)
​
#  -818  -121     0     1 
#    44  8818 10753 42438
depression$A4 = NA 
depression$A4[which(depression$f.20532.0.0==1)] = 1
depression$A4[which(depression$f.20532.0.0==0)] = 0
​
# table(depression$f.20533.0.0) "Was that: [re sleep change] Trouble falling asleep"
# Question was asked when Field 20532 was Yes.
#     0     1 
# 10306 32132
​
# table(depression$f.20534.0.0) "Was that: [re sleep change] Sleeping too much"
# Question was asked when Field 20532 was Yes.
#     0     1 
# 33831  8607 
​
# table(depression$f.20535.0.0) "Was that: [re sleep change] Waking too early"
# Question was asked when Field 20532 was Yes.
#     0     1 
# 10274 32164 
​
depression$sleep = depression$f.20534.0.0 + depression$f.20534.0.0 + depression$f.20535.0.0 
​
depression$A4a = NA ## trouble falling asleep
depression$A4a[which(depression$f.20533.0.0==1)] = 1
depression$A4a[which(depression$f.20533.0.0==0)] = 0
​
depression$A4b = NA ## sleeping too much 
depression$A4b[which(depression$f.20534.0.0==1)] = 1
depression$A4b[which(depression$f.20534.0.0==0)] = 0
​
depression$A4c = NA ## waking too early 
depression$A4c[which(depression$f.20535.0.0==1)] = 1
depression$A4c[which(depression$f.20535.0.0==0)] = 0
​
​
# table(depression$sleep)
  #   0     1     2     3 
  # 147 14241 25488  2562 
​
# table(depression$f.20449.0.0)"Did you feel more tired out or low on energy than is usual for you?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
#  -818  -121     0     1 
#    61  6355 10123 45514 
depression$A6 = NA 
depression$A6[which(depression$f.20449.0.0==1)] = 1
depression$A6[which(depression$f.20449.0.0==0)] = 0
​
# table(depression$f.20450.0.0)"People sometimes feel down on themselves, no good, worthless. Did you feel this way?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
#  -818  -121     0     1 
#   120  4060 28586 29287
depression$A7 = NA 
depression$A7[which(depression$f.20450.0.0==1)] = 1
depression$A7[which(depression$f.20450.0.0==0)] = 0
​
# table(depression$f.20435.0.0)"Did you have a lot more trouble concentrating than usual?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
#  -818  -121     0     1 
#    53  7295 11632 43073 
depression$A8 = NA 
depression$A8[which(depression$f.20435.0.0==1)] = 1
depression$A8[which(depression$f.20435.0.0==0)] = 0
​
# table(depression$f.20437.0.0)"Did you think a lot about death - either your own, someone else's or death in general?"
# Question was asked when Field 20446 was Yes or Field 20441 was Yes.
#  -818  -121     0     1 
#   294  3422 28025 30312 
depression$A9 = NA 
depression$A9[which(depression$f.20437.0.0==1)] = 1
depression$A9[which(depression$f.20437.0.0==0)] = 0
​
depression$additional = rowSums(depression[,c("A3", "A4", "A6", "A7" ,"A8", "A9")], na.rm=TRUE)
depression$additional[which(is.na(depression$A3 )&is.na(depression$A4)&is.na(depression$A6)&is.na(depression$A7)&is.na(depression$A8)&is.na(depression$A9))]=NA
# > table(depression$additional )
#     0     1     2     3     4     5     6 
#  2330  5194  8593 11791 13914 12546  7622 
​
table(depression$base, depression$additional)
  #       0     1     2     3     4     5     6
  # 0     0     0     0     0     0     0     0
  # 1  1867  3576  4580  4732  3760  1988   508
  # 2   463  1618  4013  7059 10154 10558  7114
​
​
depression$mdd = NA 
depression$mdd[which(depression$base ==0 | depression$additional < 4)]=0
depression$mdd[which(depression$base ==1 & depression$additional >=4)]=1
depression$mdd[which(depression$base ==2 & depression$additional >=3)]=1
​
depression$impairment=NA
depression$impairment[which(depression$f.20440.0.0>=2)] = 1
depression$impairment[which(depression$f.20440.0.0<2)] = 0
depression$impairment[which(depression$f.20440.0.0<0)] = NA
​
depression$impairmentsev=NA
depression$impairmentsev[which(depression$f.20440.0.0>=3)] = 1
depression$impairmentsev[which(depression$f.20440.0.0<3)] = 0
depression$impairmentsev[which(depression$f.20440.0.0<0)] = NA
​
​
# table(depression$mdd,depression$additional)
​
# depression$basecomplete = rowSums(depression[,c("A1", "A2")], na.rm=FALSE)
# depression$additionalcomplete = rowSums(depression[,c("A3", "A4", "A6", "A7" ,"A8", "A9")], na.rm=FALSE)
​
# depression$mddcomplete = NA 
# depression$mddcomplete[which(depression$basecomplete ==1 & depression$additionalcomplete >=4)]=1
# depression$mddcomplete[which(depression$basecomplete ==2 & depression$additionalcomplete >=3)]=1
# depression$mddcomplete[which(depression$basecomplete ==0)]=0
​
​
# mdd$allmdd[which(mdd$recent.MDD==1&mdd$lifetime.MDD==0)]=1
# mdd$allmdd[which(mdd$recent.MDD==1&is.na(mdd$lifetime.MDD))]=1
​
​
# $LFUseful->{"f.20446.0.0"} = "A1";
# $LFUseful->{"f.20441.0.0"} = "A2";
# $LFUseful->{"f.20536.0.0"} = "A3";
# $LFUseful->{"f.20532.0.0"} = "A4";
# $LFUseful->{"f.20533.0.0"} = "A4";
# $LFUseful->{"f.20534.0.0"} = "A4";
# $LFUseful->{"f.20535.0.0"} = "A4";
# $LFUseful->{"f.20449.0.0"} = "A6";
# $LFUseful->{"f.20450.0.0"} = "A7";
# $LFUseful->{"f.20435.0.0"} = "A8";
# $LFUseful->{"f.20437.0.0"} = "A9";
​
​
# table(depression$f.20510.0.0)"Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Feeling down, depressed, or hopeless"
#  -818     1     2     3     4 
#   384 85635 20666  2164  1494 
# -818	Prefer not to answer
# 1	Not at all
# 2	Several days
# 3	More than half the days
# 4	Nearly every day
depression$recA1 = NA 
depression$recA1[which(depression$f.20510.0.0==4)] = 1
depression$recA1[which(depression$f.20510.0.0<4)] = 0
​
# table(depression$f.20514.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Little interest or pleasure in doing things"
 # -818     1     2     3     4 
 #  292 89370 16534  2429  1718 
depression$recA2 = NA 
depression$recA2[which(depression$f.20514.0.0==4)] = 1
depression$recA2[which(depression$f.20514.0.0<4)] = 0
​
depression$recbase = rowSums(depression[,c("recA1", "recA2")], na.rm=TRUE)
depression$recbase[which(is.na(depression$recA1 )&is.na(depression$recA2))]=NA
​
​
# table(depression$f.20511.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Poor appetite or overeating"
 # -818     1     2     3     4 
 #  142 90271 14225  3015  2690 
depression$recA3 = NA 
depression$recA3[which(depression$f.20511.0.0==4)] = 1
depression$recA3[which(depression$f.20511.0.0<4)] = 0
​
# table(depression$f.20517.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Trouble falling or staying asleep, or sleeping too much"
#  -818     1     2     3     4 
#   231 55833 37706  7834  8739
depression$recA4 = NA 
depression$recA4[which(depression$f.20517.0.0==4)] = 1
depression$recA4[which(depression$f.20517.0.0<4)] = 0
​
# table(depression$f.20518.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Moving or speaking so slowly that other people could have noticed? Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual"
#   -818      1      2      3      4 
#    190 103982   4625    873    673
depression$recA5 = NA 
depression$recA5[which(depression$f.20518.0.0==4)] = 1
depression$recA5[which(depression$f.20518.0.0<4)] = 0
​
# table(depression$f.20519.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Feeling tired or having little energy"
#  -818     1     2     3     4 
#   215 54847 43165  6045  6071 
depression$recA6 = NA 
depression$recA6[which(depression$f.20519.0.0==4)] = 1
depression$recA6[which(depression$f.20519.0.0<4)] = 0
​
# table(depression$f.20507.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Feeling bad about yourself or that you are a failure or have let yourself or your family down"
 # -818     1     2     3     4 
 #  521 88632 16643  2326  2221
depression$recA7 = NA 
depression$recA7[which(depression$f.20507.0.0==4)] = 1
depression$recA7[which(depression$f.20507.0.0<4)] = 0
​
# table(depression$f.20508.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Trouble concentrating on things, such as reading the newspaper or watching television"
#  -818     1     2     3     4 
#   157 90367 15752  2242  1825
depression$recA8 = NA 
depression$recA8[which(depression$f.20508.0.0==4)] = 1
depression$recA8[which(depression$f.20508.0.0<4)] = 0
​
# table(depression$f.20513.0.0) "Over the last 2 weeks, how often have you been bothered by any of the following problems? [depressive symptoms] Thoughts that you would be better off dead or of hurting yourself in some way"
#   -818      1      2      3      4 
#    841 104959   3704    469    370 
depression$recA9 = NA 
depression$recA9[which(depression$f.20513.0.0==4)] = 1
depression$recA9[which(depression$f.20513.0.0<4)] = 0
​
depression$recadditional = rowSums(depression[,c("recA3", "recA4", "recA5", "recA6", "recA7", "recA8", "recA9")], na.rm=TRUE)
depression$recadditional[which(is.na(depression$recA1 )&is.na(depression$recA2))]=NA
​
depression$recmdd = NA 
depression$recmdd[which(depression$recbase ==0 | depression$recadditional < 4)]=0
depression$recmdd[which(depression$recbase ==1 & depression$recadditional >=4)]=1
depression$recmdd[which(depression$recbase ==2 & depression$recadditional >=3)]=1
​
depression$allmdd = depression$mdd 
depression$allmdd[which(depression$recmdd == 1)]=1 
​
depression$MDD1 = depression$allmdd
depression$MDD1[which(depression$impairment==0)]=NA
​
depression$MDD2 = depression$allmdd
depression$MDD2[which(depression$impairmentsev==0)]=NA
​
depression$episodes=depression$f.20442.0.0
depression$episodes[which(depression$f.20442.0.0==-818)]=NA
depression$episodes[which(depression$f.20442.0.0==-999)]=10
depression$episodes[which(depression$f.20442.0.0>9)]=10
depression$episodes[which(depression$f.20442.0.0>9)]=10
​
depression$mddrecur=depression$mdd ## Lifetime recurrent MDD
depression$mddrecur[which(depression$episodes<2)]=NA
​
depression$allmddrecur=depression$allmdd ## Lifetime + current recurrent MDD
depression$allmddrecur[which(depression$episodes<2)]=NA
​
depression$MDD1recur=depression$MDD1 ## Lifetime + current recurrent MDD + mild impairment
depression$MDD1recur[which(depression$episodes<2)]=NA
​
depression$MDD2recur=depression$MDD2 ## Lifetime + current recurrent MDD + severe impairment
depression$MDD2recur[which(depression$episodes<2)]=NA