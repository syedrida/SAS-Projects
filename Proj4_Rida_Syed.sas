*SAS Project 4
*Name: Rida Ali Raza Syed
*Vnumber: V00927243
*Date: 02/06/2023;


*Problem1-
Convert the data format from wide to long;

*create a new library;
Libname Sasdata 'C:\Users\Rida\Documents';

*To move data into this documents library, create a new data set;
data Sasdata.Rxdata;
set Rxdata; *I have already read in the patient data
so I am creating this data set using the set patient
which has already been read in;
run;


data Rxdata1;
set sasdata.Rxdata; *we are pulling from the dataset we put in the sas.data library;
Treatment= Session1;
Time=1;
drop Session1 Session2 Session3;
run;
quit;

data Rxdata2;
set sasdata.Rxdata; *we are pulling from the dataset we put in the sas.data library;
Treatment= Session2;
Time=2;
drop Session1 Session2 Session3;
run;
quit;

data Rxdata3;
set sasdata.Rxdata; *we are pulling from the dataset we put in the sas.data library;
Treatment= Session3;
Time=3;
drop Session1 Session2 Session3;
run;
quit;

data sasdata.data;
set Rxdata1 Rxdata2 Rxdata3;
run;
quit; *converted a wide file into a long file by stacking the files on top of each other;

***************************************************************************************************

*2-Conduct an ANOVA test to determine if differences in mean time differs across treatment levels for only Session 1.
Be sure to state your hypothesis, significance level, decision rule and conclusion in the comments. 


*Hypothesis:
H0: mu1=mu2=mu3=mu4
HA: mui=/=muj for some i=/=j
alpha= 0.01
ANOVA FOR READING1;

proc glm data= rxdata;
class Dose;*This gives the groupings;
model Session1= Dose; *(session1- y var);
run;
quit;

*Analysis of results=

P value for F statistic is 0.5309 which is greater than alpha, therefore the decision is to fail to reject H0 and conclude
there are no differences in session1 across doses;
***************************************************************************************************

*3-Conduct an ANOVA test to determine if differences in mean time differs across treatment levels for only Session 2. 
Be sure to state your hypothesis, significance level, decision rule and conclusion in the comments;

*Hypothesis:
H0: mu1=mu2=mu3=mu4
HA: mui=/=muj for some i=/=j
alpha= 0.01
ANOVA FOR READING1;

proc glm data= rxdata;
class Dose;*This gives the groupings;
model Session2= Dose; 
run;
quit;

*Analysis of results=

P value for F statistic is <0.0001 which is less than alpha, therefore the decision is to  reject H0 and conclude that
there are differences in session2 across doses;



*************************************************************************

4- Conduct an ANOVA test to determine if differences in mean time differs across treatment levels for only Session 3.  
Be sure to state your hypothesis, significance level, decision rule and conclusion in the comments;



*Hypothesis:
H0: mu1=mu2=mu3=mu4
HA: mui=/=muj for some i=/=j
alpha= 0.01
ANOVA FOR READING1;

proc glm data= rxdata;
class Dose;*This gives the groupings;
model Session3= Dose; 
run;
quit;

*Analysis of results=

P value for F statistic is <0.0001 which is less than alpha, therefore the decision is to reject H0 and conclude that
there are differences in session3 across doses;

***********************************************************************************
Conduct a post hoc test to determine where the differences exist 
in the data using Tukey's HSD procedure for only Session 1;

proc glm data= rxdata;
class dose;
model Session1= dose;
LSMEANS dose/adjust = Tukey;
run;
quit;


*Notice the p-values in the matrix, and notice the numbering for the individual groups;
*1= Control
2= High
3= Low
4=Medium

Control and high are not different with a pvalue= 0.6017
Control and low are not different with a pvalue=0.9974
Control and medium are not different with a pvalue=0.9997
High and low are not different with a p value= 0.6623
High and medium not different with a pvalue= 0.5991
Low and medium not different with a pvalue=0.9996



*These results agree with the ANOVA test conducted above where we concluded that there is no difference between the doses across session1;


*2.1-
1.Use the datalines procedure to input the data from problem 3.7 on page 105 in the book. Note. 
The data lines statement must be input in the exact manner as the data appears in the book;

data infarction1;
input Vehicle CompoundX CompoundY ;
datalines; 
120.07 114.48 50.54
87.43 100.19 26.74
194.72 104.61 66.58
101.88 121.73 25.68 
74.64 85.03 63.81 
52.14 110.31 5.64 
42.19 151.75 7.33
42.89 75.63 37.69 
112.29 162.72 1.79 
131.27 32.03 53.94
;
run;

proc print data= infarction;
run;
quit;

*2.2- Conduct an ANOVA test to determine if differences in the effects of infarction volume using the vehicle,
Compound X and Compound Y.  Be sure to state your hypothesis, significance level, decision rule and
conclusion in the comments. Note: In order to do the ANOVA, you will need to modify the data using techniques 
we have covered in class. Likewise, when making this modification, Vehicle is the Control, Compound X is Treatment A 
and Compound Y is Treatment B;

data infarction11;
set infarction1; *we are pulling from the dataset we put in the sas.data library;
Volume= Vehicle;
Type= "Control";
drop Vehicle CompoundX CompoundY;
run;
quit;


data infarction12;
set infarction1; *we are pulling from the dataset we put in the sas.data library;
Volume= CompoundX;
Type= "TrtA";
drop Vehicle CompoundX CompoundY;
run;
quit;

data infarction13;
set infarction1; *we are pulling from the dataset we put in the sas.data library;
Volume= CompoundY;
Type= "TrtB";
drop Vehicle CompoundX CompoundY;
run;
quit;

data Infarctionall;
set Infarction11 Infarction12 Infarction13;
run;
quit;

*This creates a wide data set with the following column headers given in the question;


*Hypothesis:
H0: mu1=mu2=mu3=mu4
HA: mui=/=muj for some i=/=j
alpha= 0.01
ANOVA FOR READING1;


*Volume vs Treatment Type-;

proc glm data= infarctionall;
class Type;*This gives the groupings;
model Volume=Type; 
run;
quit;

*Analysis of results=

P value for F statistic is 0.0004 which is less than alpha, therefore the decision is to reject H0 and 
conclude that there are differences in infarction volume across the different treatment types;

*******************************************************************************************************
3-Conduct a post hoc test to determine where the differences exist in the data using Tukey's HSD procedure;

proc glm data= infarctionall;
class Type;
model Volume=Type;
LSMEANS Type/adjust = Tukey;
run;
quit;


*Notice the p-values in the matrix, and notice the numbering for the individual groups;
*1= Control
2=TRtA
3= TRtB

Control and trtA are not different with a pvalue= 0.8261
Control and trtB are  different with a pvalue=0.0027
trtA and trtB are different with a pvalue=0.0006

