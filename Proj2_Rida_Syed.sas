*SAS Project 2
*Name: Rida Ali Raza Syed
*Vnumber: V00927243
*Date: 02/14/2023;

*Problem 1;

data glucose;
input ID $ Sex $ Age TRT $ Glucose1 Glucose2 Glucose3;
datalines;
BHK104N M 19 N 160 162 174
DGK110P M 18 N 154 151 158
BEL114N M 18 N 150 147 157
CFK118Q M 19 N 143 157 140
CHL126N M 21 N 166 157 142 
BEL129P M 21 N 155 154 138
BHI134N M 24 Y 162 119 116
BFL139Q M 24 Y 127 101 98
CGI145N M 24 Y 151 112 99
AGJ150Q M 18 Y 121 114 128
AFL153Q M 21 Y 142 121 108
DHK154N M 19 Y 162 130 116 
BEK158Q F 22 N 138 139 142
BFK161N F 21 N 141 171 143
AFK164Q F 19 N 153 140 154
DGL168Q F 18 N 124 144 177
AEL169Q F 24 N 160 134 157
DEJ175P F 24 N 139 151 164
CEI179P F 18 Y 161 133 108
CEK181Q F 23 Y 158 97 82
AEJ185N F 18 Y 150 123 109
CHL188P F 20 Y 135 123 107
CFK194Q F 21 Y 141 110 92
BFK196Q F 22 Y 146 135 95
;
run;
proc print data= glucose;
run;
quit;

*Problem 1=
Use PROC TTEST to determine if the treatment causes statistically
different mean responses for blood glucose;

*Conducting two sample t-tests;

*For Glucose1-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.035;


proc ttest data= glucose;
class TRT;
var Glucose1;
run;
quit;

*T= 0.43, p-value(pooled)= 0.6717
*(Side note= since our folded F=0.6426 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is greater than alpha=0.035. Therefore, our decision is to fail to reject H0.

Hence, there is inufficient evidence to conclude the mean of with treatment for glucose1 readings
is diffferent from the mean of without treatment for glucose1 readings ;


*For Glucose2-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.035;


proc ttest data= glucose;
class TRT;
var Glucose2;
run;
quit;

*T= 7.06, p-value(pooled)= <0.0001
*(Side note= since our folded F=0.6868 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is less than alpha= 0.035. Therefore, our decision is to reject H0.

Hence, there is sufficient evidence to conclude the mean of with treatment for glucose2 readings
is diffferent from the mean of without treatment for glucose2 readings;


*For Glucose3-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.035;


proc ttest data= glucose;
class TRT;
var Glucose3;
run;
quit;

*T= 9.36, p-value(pooled)= <0.0001
*(Side note= since our folded F=0.8350 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is less than alpha= 0.035. Therefore, our decision is to reject H0.

Hence, there is sufficient evidence to conclude the mean of with treatment for glucose3 reading
is diffferent from the mean of without treatment for glucose3 reading;


*Problem 2:
Use PROC TTEST to determine if gender influences the mean response 
for each glucose measurement;

*For Glucose1-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.045;


proc ttest data= glucose;
class Sex;
var Glucose1;
run;
quit;

*T= -0.75, p-value(pooled)= 0.4587
*(Side note= since our folded F=0.4479 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is greater than alpha=0.035. Therefore, our decision is to fail to reject H0.

Hence, there is inufficient evidence to conclude that the mean for male's glucose1 reading is diffferent 
from the mean for female's glucose1 reading;


*For Glucose2-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.045;


proc ttest data= glucose;
class sex;
var Glucose2;
run;
quit;

*T= -0.25, p-value(pooled)= 0.8038
*(Side note= since our folded F=0.7045 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is greater than alpha= 0.035. Therefore, our decision is to failt to reject H0.

Hence, there is inufficient evidence to conclude that the mean for male's glucose2 reading is diffferent 
from the mean for female's glucose2 reading;


*For Glucose3-->
*H0:mu1= mu2
 Ha:mu1=/=mu2  (this says mu1 is not equal to mu2)

Where alpha=0.045;


proc ttest data= glucose;
class Sex;
var Glucose3;
run;
quit;

*T= -0.31, p-value(pooled)= 0.7561
*(Side note= since our folded F=0.3842 which is > alpha, we can conclude that our
variances are equal and we can use the pooled tvalue)

Our p-value is greater than alpha= 0.045. Therefore, our decision is to fail to reject H0.

Hence, there is inufficient evidence to conclude mean for male's glucose3 reading is diffferent 
from the mean for female's glucose3 reading;


*Problem3:
Does it appear the assumptions for the tests are met?  
Test the assumptions and put the results in the comments.


*For class = TRT
var = glucose1, glucose2, glucose3

*The assumption is that the treatment and no treatment is normally distributed for all glucose readings;


*Glucose1-->

*Now I want to obtain a QQ plot as a visual for normality
We broke this down by treatment where glucose1 is a quantitative variable;

proc univariate data=glucose;
class TRT;
var glucose1;
histogram glucose1 /normal;
ppplot glucose1/normal; *This ppplot provides us the qqplot;
run;
quit;

*Results= 
For the glucose1 reading, the test for normality concludes that patients with treatment
are  normally distributed with p-values greater than 0.1.

For the glucose1 reading, the test for normality concludes that patients without treatment are normally distributed,
with pvalues greater than 0.1.


Glucose 2-->;


proc univariate data=glucose;
class TRT;
var glucose2;
histogram glucose2 /normal;
ppplot glucose2/normal; *This ppplot provides us the qqplot;
run;
quit;



*Results= 
For the glucose2 reading, the test for normality concludes that patients with treatment
are normally distributed with p-values greater than 0.1.

For the glucose2 reading, the test for normality concludes that patients without treatment 
are normally distributed, with pvalues greater than 0.1.


Glucose 3-->;


proc univariate data=glucose;
class TRT;
var glucose3;
histogram glucose3 /normal;
ppplot glucose3/normal; *This ppplot provides us the qqplot;
run;
quit;



*Results= 
For the glucose3 reading, the test for normality concludes that patients with treatment
are normally distributed with p-values greater than 0.1.

For the glucose3 reading, the test for normality concludes that patients without treatment 
are normally distributed, with pvalues greater than 0.1.

Therefore, the results support the assumption that patients with treatment and wihout treatment are normally distributed 
for all glucose readings;


******************************************************************************************
*For class=sex
var= glucose1, glucose2, glucose3
The assumption is that gender M and F is normally distributed for all glucose readings ;

*For glucose 1 reading;

proc univariate data=glucose;
class sex;
var glucose1;
histogram glucose1 /normal;
ppplot glucose1/normal; *This ppplot provides us the qqplot;
run;
quit;

*Results= 
For the glucose1 reading, the test for normality concludes that the gender male is 
normally distributed with p-values greater than 0.1.

For the glucose1 reading, the test for normality concludes that the gender female is 
normally distributed with p-values greater than 0.1.


*For glucose 2 reading;


proc univariate data=glucose;
class sex;
var glucose2;
histogram glucose2 /normal;
ppplot glucose2/normal; *This ppplot provides us the qqplot;
run;
quit;
*Results= 
For the glucose2 reading, the test for normality concludes that the gender male is 
normally distributed with p-values greater than 0.1.

For the glucose2 reading, the test for normality concludes that the gender female is 
normally distributed with p-values greater than 0.1.


*For glucose 3 reading;

proc univariate data=glucose;
class sex;
var glucose3;
histogram glucose3 /normal;
ppplot glucose3/normal; *This ppplot provides us the qqplot;
run;
quit;

*Results= 
For the glucose3 reading, the test for normality concludes that the gender male is 
normally distributed with p-values greater than 0.1.

For the glucose3 reading, the test for normality concludes that the gender female is 
normally distributed with p-values greater than 0.1.

Therefore, the results support the assumption that  gender M and F is normally distributed 
for all glucose readings;
