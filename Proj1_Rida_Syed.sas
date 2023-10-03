*SAS Project 1
*Name: Rida Syed
*Date: 02/06/2023;


*Problem 1;
data measurements;
input x1 x2 x3 x4 x5 y ;
datalines; 
 30 66.125 46.75 23.25 40.00 134
 31 65.875 42.00 21.25 36.75 135
 26 62.5 45.5 16.75 29.5 124
 34 62.625 42.5 15.5 38.75 130 
 27 65.25 41.00 18.25 39.00 151 
 21 74.00 43.75 17.75 37.00 280
 24 71.75 43.5 16.5 28.00 175
 32 60.00 43.25 16.25 32.5 120
 40 69.5 44.75 20.00 39.75 190
 38 70.25 37.5 17.00 32.75 195
;
run;

*above^ 
data measurements= establishes the name of the datset
input gives us the name of the var within the dataste
DATALINES is a special file reference that tells SAS there will be instream data
following the conclusion of the DATA Step;

*The statement below will print our measurements data to the output window;
proc print data= measurements; *the proc statements allows SAS to perform a specific processing function;
run;
quit;
*To find the mean values of all variables, we can use the following proc means statement;
proc means data= measurements; *this procedure statement will give us the number of obs, mean, stdev, min and max values of all variables;
run;
quit;

*RESULTS OF PROC MEANS STATEMENT:
*Var Mean
 x1  30.3000000 
 x2  66.7875000 
 x3  43.0500000 
 x4  18.2500000 
 x5  35.4000000 
 y   163.4000000;

*Another way to do this is by using the proc means statement and 
specifying the variable being ivestigated.
This statement gives us the separate mean values of each var
based on the var being specified in the proc statement, 
unlike the statement above that gives us the mean value of all 
variables together;

proc means data= measurements;
var x1;
run;
quit;

*^The mean value for x1 is 30.3000000;

proc means data= measurements;
var x2;
run;
quit;
*^The mean value for x2 is 66.7875000;

proc means data= measurements;
var x3;
run;
quit;
*^The mean value for x3 is 43.0500000;

proc means data= measurements;
var x4;
run;
quit;

*^The mean value for x4 is 18.2500000;

proc means data= measurements;
var x5;
run;
quit;

*^The mean value for x5 is 35.4000000;
proc means data= measurements;
var y;
run;
quit;

*^The mean value for y is 163.4000000;

*Problem 2;

data policedata;
input y x1 x2 x3 x4 x5 x6 x7;
datalines;
165.8 88.7 31.8 28.1 18.7 40.3 38.9 6.7 
169.8 90.0 32.4 29.1 18.3 43.3 42.7 6.4
170.7 87.7 33.6 29.5 20.7 43.7 41.1 7.2
170.9 87.1 31.0 28.2 18.6 43.7 40.6 6.7 
157.5 81.3 32.1 27.3 17.5 38.1 39.6 6.6
165.9 88.2 31.8 29.0 18.6 42.0 40.6 6.5
158.7 86.1 30.6 27.8 18.4 40.0 37.0 5.9
166.0 88.7 30.2 26.9 17.5 41.6 39.0 5.9
158.7 83.7 31.1 27.1 18.1 38.9 37.5 6.1
161.5 81.2 32.3 27.8 19.1 42.8 40.1 6.2
167.3 88.6 34.8 27.3 18.3 43.1 41.8 7.3 
167.4 83.2 34.3 30.1 19.2 43.4 42.2 6.8 
159.2 81.5 31.0 27.3 17.5 39.8 39.6 4.9
170.0 87.9 34.2 30.9 19.4 43.1 43.7 6.3
166.3 88.3 30.6 28.8 18.3 41.8 41.0 5.9 
;
run;

*The statement below will print the policedata to the output window;
proc print data=policedata;
run;
quit;

*To find the mean value of all variables, we can use the following proc means statement
This will give us the mean values of all variables together;
proc means data= policedata;
run;
quit;
*RESULTS OF PROC MEANS STATEMENT:
VAR MEAN
y   165.0466667 
x1  86.1466667 
x2  32.1200000 
x3  28.3466667 
x4  18.5466667 
x5  41.7066667 
x6  40.3600000 
x7  6.3600000 
 ;

*We can also find the individual means by using the proc means statement
and specifying the individual var we want to investigate;

proc means data= policedata;
var y;
run;
quit;

*^The mean value for y is 165.0466667;

proc means data= policedata;
var x1;
run;
quit;
*^The mean value for x1 is 86.1466667;

proc means data= policedata;
var x2;
run;
quit;

*^The mean value for x2 is 32.1200000;


proc means data= policedata;
var x3;
run;
quit;

*^The mean value for x3 is 28.3466667;


proc means data= policedata;
var x4;
run;
quit;

*^The mean value for x4 is 18.54666677;

proc means data= policedata;
var x5;
run;
quit;

*^The mean value for x5 is 41.7066667;

proc means data= policedata;
var x6;
run;
quit;

*^The mean value for x6 is 40.3600000;

proc means data= policedata;
var x7;
run;
*^The mean value for x7 is 6.3600000;


*Problem 3;
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

*PROMPT: Create two subsets of the data one for Treatment and one for not;


*Subset1 w/ var treatment=Y:
*This will create a subset of the dataset where  var TRT=Y;

data glucosetreatment; *This will create a new dataset with the name glucosetreatment 
which is a subset of the original dataset;
set glucose; *This tells SAS to create a subset from our original glucose data;
where TRT="Y"; *This will allow SAS to keep the var treatment= Y;
run;
quit;

*Subset2 w/ var treatment=N;
*This will create a subset of the dataset where var trt=N;

data glucosenotreatment; *This will create a new dataset with the name glucosenotreatment;
set glucose; 
where TRT= "N"; *This tells SAS to keep the var treatment= N;
run;
quit;

*PROMPT: Create two subsets of the data one for Male and one for Female;

*This will create a data set which only includes the sex male;
data glucoseM;*name of the new dataset;
set glucose;
where sex = "M"; *This is a logic statement which specifies which sex type we want in the new dataset;
run;

*This will create a data set which only includes the sex female;
data glucoseF; *name of the new dataset;
set glucose;
where sex = "F"; *This is a logic statement which specifies the sex type we are investigating;
run;

*PROMPT: Find basic summaries of each glucose variable for each of the five datasets;


*Below gives us a basic summary of glucose var from our first dataset=Glucose;

proc univariate data= Glucose;
var Glucose1 Glucose2 Glucose3; *This specifies the var we want a basic summary of;
histogram/normal; *This puts a normal curve over the histogram, also does a test for normality;
run;
quit;

*Basic Summary for Dataset= Glucose:

Glucose 1= Data is normal based on the tests of normality, no unusual 
features, centered at 147.458333, with a standard deviation of 12.60083.

Glucose 2= Data is normal based on the tests of normality, no unusual 
features, centered at 134.3750, with a standard deviation of 19.87748.

Glucose 3= Data is normal based on the tests of normality, no unusual 
features, centered at 129.3333, with a standard deviation of 27.99172.


*Below gives us a basic summary of glucose var from our second datase=Glucosetreatment;

proc univariate data= Glucosetreatment;
var Glucose1 Glucose2 Glucose3; *This specifies the var we want a basic summary of;
histogram/normal; *This puts a normal curve over the histogram, also does a test for normality;
run;
quit;


*Basic Summary for Dataset= Glucosetreatment:

Glucose 1= Data is normal based on the tests of normality, no unusual 
features, centered at 146.333333, with a standard deviation of 13.71352.

Glucose 2= Data is normal based on the tests of normality, no unusual 
features, centered at 118.166667, with a standard deviation of 11.922731.

Glucose 3= Data is normal based on the tests of normality, no unusual 
features, centered at 104.833333, with a standard deviation of 12.4011241.

*Below gives us a basic summary of glucose var from our third dataset=Glucosenotreatment;

proc univariate data= Glucosenotreatment;
var Glucose1 Glucose2 Glucose3; *This specifies the var we want a basic summary of;
histogram/normal; *This puts a normal curve over the histogram, also does a test for normality;
run;
quit;


*Basic Summary for Dataset= Glucosenotreatment:

Glucose 1= Data is normal based on the tests of normality, no unusual 
features, centered at 148.583333, with a standard deviation of 11.8816768.

Glucose 2= Data is normal based on the tests of normality, no unusual 
features, centered at 150.583333, with a standard deviation of 10.5266617.

Glucose 3= Data is normal based on the tests of normality, no unusual 
features, centered at 153.833333, with a standard deviation of 13.2241744;

*Below gives us a basic summary of glucose var from our fourth dataset=GlucoseM;

proc univariate data= GlucoseM;
var Glucose1 Glucose2 Glucose3; *This specifies the var we want a basic summary of;
histogram/normal; *This puts a normal curve over the histogram, also does a test for normality;
run;
quit;


*Basic Summary for Dataset= GlucoseM:

Glucose 1= Data is normal based on the tests of normality, no unusual 
features, centered at 149.4167, with a standard deviation of 14.02892.

Glucose 2= Data is normal based on the tests of normality, no unusual 
features, centered at 135.4167, with a standard deviation of 21.44531.

Glucose 3= Data is normal based on the tests of normality, no unusual 
features, centered at 131.1667, with a standard deviation of 24.50541;


*Below gives us a basic summary of glucose var from our fifth dataset=GlucoseF;

proc univariate data= GlucoseF;
var Glucose1 Glucose2 Glucose3; *This specifies the var we want a basic summary of;
histogram/normal; *This puts a normal curve over the histogram, also does a test for normality;
run;
quit;


*Basic Summary for Dataset= GlucoseF:

Glucose 1= Data is normal based on the tests of normality, no unusual 
features, centered at 145.5, with a standard deviation of 11.26136.

Glucose 2= Data is normal based on the tests of normality, no unusual 
features, centered at 133.333333, with a standard deviation of 19.0756071.

Glucose 3= Data is normal based on the tests of normality, no unusual 
features, centered at 127.5, with a standard deviation of 32.1006938;

