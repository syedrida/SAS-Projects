*SAS Project 3
*Name: Rida Syed
*Date: 02/22/2023;


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

proc print data= measurements; *the proc statements allows SAS to perform a specific processing function;
run;
quit;

*1. Create a scatterplot of y and x2 using PROC PLOT and appropriately comment on the relationship 
and appropriately comment on the relationship.  (10 points);


proc plot data= measurements;
plot y*x2; *the y var goes first;
run;
quit;


*can also do this as; 

title1 "Weight(y) vs Height (x2) for Measurements";
*change the axis labels;
axis1 label= ("Weight(y) in lbs");
axis2 label= ("Height (x2) in cm");
symbol color= red value= dot interpol= spline;

proc gplot data= measurements;
plot y*x2/ vaxis= axis1 haxis= axis2; *the y var goes first;
run;
quit;

*
Analysis of results:
The scatterplot shows that as the height (x2) increases, the weight (y) increases.
Using proc gplot we can see that the plot is shaped as a polynomial curve with 
an eventual increase in weight (y) as height (x2) increases;

**************************************************************************
*2.Use PROC REG to fit an overall regression line for x2 and y.
Report and appropriately interpret the coefficients. (10 points);

proc reg data= measurements;
model y=x2; *y var goes first;
run;
quit;

*
Analysis of results:
Here the p-value is 0.0008 which is less than alpha= 0.1, indicating statistical significance between the variances
of y and x2. 
The R^2 value = 0.7714 indicates that approximately 77% of the weight variable can be explained by the height variable.  
Intercept= -479.81619 indicates that when height=0, the weight would be -479.81619 lbs.
The slope parameter= 9.63079 indicating a positive slope.
The p value for parameter estimates is also statistically significant.
p value for intercept= 0.0048 and p value for x2=0.0008, which is less than alpha=0.1, indicating that as 
height increases, the weight will also increase. 

************************************************************************************************
Problem 2:

1. Create an overall scatterplot using PROC PLOT and appropriately comment on the relationship.  
(Do not pay attention to region and use temperature on the x-axis).  (10 pts);


proc plot data= flu;
plot Incidence*Temp; *the y var goes first;
run;
quit;

*
Analysis of results:
The scatterplot shows that as the temperature increases, the influenza incidence increases.

*********************************************************************************************

*2. Create an overall scatterplot using PROC GPLOT and appropriately comment on the relationship.   
(Do not pay attention to region and use temperature on the x-axis).  (10 pts);

title1 "Influenza Incidence vs Temperature for Flu Data";
*change the axis labels;
axis1 label= ("Influenza Incidence");
axis2 label= ("Temperature in degrees");
symbol color= blue value= dot interpol= spline;

proc gplot data= flu;
plot incidence*temp/ vaxis= axis1 haxis= axis2; *the y var goes first;
run;
quit;

*
Analysis of results:
Using proc gplot we can see that the plot has an upward trend indicating that as the temperature increases, 
the influenza incidence within the region increases;

************************************************************************************************************

3.Create an overall scatterplot using PROC SGPLOT and appropriately comment on the relationship.   
(Do not pay attention to region and use temperature on the x-axis). (10 pts);

proc sgplot data= flu;
scatter X= temp y= incidence;
run;
quit;

*
Analysis of results:
Using proc sgplot we get a clearer plot. The plot has a positive exponentially shaped curve 
indicating that as the temperature increases, the influenza incidence within the population greatly increases;

*************************************************************************************************************

4. Create a grouped scatterplot using PROC SGPLOT with different colors for each region.  
You may want to look at this websiteLinks to an external site. for how to modify your code.  (10 pts);


proc sgplot data=flu;
scatter x=temp y=incidence / group=region;
run;

*
Analysis of results:
Using proc sgplot and including the group feature, we get a more representative plot of our data.
The plot has a positive exponentially shaped curve, with the southwest region having the most influenze incidences when
the temperature is moderate to high (20-35 degrees), and the northwest region having the most influenza incidences when the temperature 
is low to moderate (0-20 degrees). Furthermore, at temp of 40 degrees, the influenza incidence within the 
southwest region is 3.31. We also see a general trend, as seen in the previous plots, where
as the temperature increases, the influenza incidence within the regions increases;

*************************************************************************************************************

5. Use PROC REG to fit an overall regression line. Report and appropriately interpret the coefficients.  (20 pts);

proc reg data= flu;
model incidence=temp;
run;
quit;

*
Analysis of results:
Here the p-value is <0.0001 which is less than alpha= 0.1, indicating statistical significance between the variances
of influenza incidence and temperature. 
The R^2 value = 0.7994 indicates that approximately 80% of influenza incidence variable can be explained by the temperature
variable. 
Intercept= -0.71212 indicates that when temp=0 the influenze incidence would be -0.71212.
The slope parameter= 0.06239 indicating a positive slope.
The p value for parameter estimates is also statistically significant.
p value for intercept= <0.0001 and p value for x2= <0.0001, which is less than alpha=0.1, indicating that as the
temp increases, the influenza incidence will also increase. 


************************************************************************************************************

6.Use PROC REG to fit a regression for each region. 
Report and appropriately interpret the R2 value for each model.  (20 pts);

*creating subsets for each region;

data fluNW; *name of the new dataset;
set flu;
where region = "Northwest"; 
run;

proc reg data= fluNW;
model incidence=temp;
run;
quit;
*
Analysis of results:
The R^2 value = 0.8801 indicates that in the Northwest region approximately 88% of influenza incidence variable can be explained by the temperature
variable. 

**********;
data fluNE; *name of the new dataset;
set flu;
where region = "Northeast"; 
run;

proc reg data= fluNE;
model incidence=temp;
run;
quit;
*
Analysis of results:
The R^2 value = 0.9163 indicates that in the Northeast region approximately 91% of influenza incidence variable can be explained by the temperature
variable. 


************;

data fluSW; *name of the new dataset;
set flu;
where region = "Southwest"; 
run;

proc reg data= fluSW;
model incidence=temp;
run;
quit;
*
Analysis of results:
The R^2 value = 0.8521 indicates that in the Southwest region approximately 85% of influenza incidence variable can be explained by the temperature
variable. 

************;

data fluUM; *name of the new dataset;
set flu;
where region = "UpperMidWest"; 
run;

proc reg data= fluUM;
model incidence=temp;
run;
quit;
*
Analysis of results:
The R^2 value = 0.8079 indicates that in the UpperMidWest region approximately 80% of influenza incidence variable can be explained by the temperature
variable. 


***********;

data fluLM; *name of the new dataset;
set flu;
where region = "LowerMidWest"; 
run;

proc reg data= fluLM;
model incidence=temp;
run;
quit;
*
Analysis of results:
The R^2 value = 0.8241 indicates that in the LowerMidWest region approximately 82% of influenza incidence variable can be explained by the temperature
variable. 



