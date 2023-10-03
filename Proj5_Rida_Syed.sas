*SAS Project 5
*Name: Rida Ali Raza Syed
*Vnumber: V00927243
*Date: 03/12/2023;


*Problem 1-
Find the number of crimes using a Firearm for 2019;


data baltcrimed;
set baltcrime;
Year= year(CrimeDate);
run;
quit;

proc sql;
create table crimeyears as
select year
from baltcrimed
where weapon = "FIREARM";
run;
quit;

proc sql;
create table crimeyear2019 as
select year
from crimeyears
where year = 2019;
run;
quit;


proc sql;
create table total as
select year,
count(year) as countyear
from crimeyear2019
group by year;
run;
quit;

*the number of crimes using a firearm in 2019 were 5158.

**************************************************************
*Problem 2:
Find the number of crimes by district for 2019 and 2018 separately;


*FOR 2018;

proc sql;
create table crimedistrict2018 as
select district
from baltcrimed
where year = 2018;
run;
quit;

proc sql;
create table cdistrict2018 as
select district,
count(district) as numberofcrimesin2018
from crimedistrict2018
group by district;
run;
quit;

*in 2018

 district   numberofcrimes
1.central     5791
2.eastern     4251
3.northeas    7030
4.northern    5126
5.northwe     4536
6.southeas    6972
7.southern    5539
8.southwes    5359
9.unknown      22
10.western     3842;




**************
FOR 2019;

proc sql;
create table crimedistrict2019 as
select district
from baltcrimed
where year = 2019;
run;
quit;

proc sql;
create table cdistrict2019 as
select district,
count(district) as numberofcrimesin2019
from crimedistrict2019
group by district;
run;
quit;


*in 2019

 district   numberofcrimes
1.central     5848
2.eastern     4111
3.northeas    6635
4.northern    4649
5.northwe     4696
6.southeas    6391
7.southern    4986
8.southwes    5307
9.unknown      78
10.western     3633

*******************************************
*Problem3:
Find the number of Firearm crimes by Neighborhood by year 
(you may want to use year() function first to extract year from a date variable);


proc sql;
create table firearmyears as
select neighborhood,year
from baltcrimed
where weapon = "FIREARM";
run;
quit;

*****************************
*for year 2014 by neighborhood;

proc sql;
create table n2014 as
select neighborhood
from firearmyears
where year = 2014;
run;
quit;

proc sql;
create table neigh2014 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2014
group by neighborhood;
run;
quit;

*****************************
*for year 2015 by neighborhood;

proc sql;
create table n2015 as
select neighborhood
from firearmyears
where year = 2015;
run;
quit;

proc sql;
create table neigh2015 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2015
group by neighborhood;
run;
quit;



*****************************
*for year 2016 by neighborhood;

proc sql;
create table n2016 as
select neighborhood
from firearmyears
where year = 2016;
run;
quit;

proc sql;
create table neigh2016 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2016
group by neighborhood;
run;
quit;

*****************************
*for year 2017 by neighborhood;

proc sql;
create table n2017 as
select neighborhood
from firearmyears
where year = 2017;
run;
quit;

proc sql;
create table neigh2017 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2017
group by neighborhood;
run;
quit;



*****************************
*for year 2018 by neighborhood;

proc sql;
create table n2018 as
select neighborhood
from firearmyears
where year = 2018;
run;
quit;

proc sql;
create table neigh2018 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2018
group by neighborhood;
run;
quit;

*****************************
*for year 2019 by neighborhood;

proc sql;
create table ne2019 as
select neighborhood
from firearmyears
where year = 2019;
run;
quit;

proc sql;
create table neighb2019 as
select neighborhood,
count(neighborhood) as numberofcrimes
from ne2019
group by neighborhood;
run;
quit;

*****************************
*for year 2020 by neighborhood;

proc sql;
create table n2020 as
select neighborhood
from firearmyears
where year = 2020;
run;
quit;

proc sql;
create table neigh2020 as
select neighborhood,
count(neighborhood) as numberofcrimes
from n2020
group by neighborhood;
run;
quit;

*!!!!!!!!!!!!!or a more efficient way to do this is;

proc sql;
create table neighbyears as
select year, neighborhood,
count(neighborhood) as numberofcrimes
from firearmyears
group by year, neighborhood;
run;
quit;


******************
Problem 4.Find the number of Firearm crimes by year;

proc sql;
create table cfirearm as
select year, weapon
from baltcrimed
where weapon = "FIREARM";
run;
quit;


proc sql;
create table firearmcrimes as
select year,weapon,
count(year) as numberofcrimes
from cfirearm
group by year,weapon;
run;
quit;

*RESULTS:

 YEAR  WEAPON  numberofcrimes
1.2014 FIREARM   3100
2.2015 FIREARM   4515
3.2016 FIREARM   4827
4.2017 FIREARM   5619
5.2018 FIREARM   5386
6.2019 FIREARM   5158
7.2020 FIREARM   2575



******************************************

*Problem 5. Use CrimeCode to find the number of Aggravated Assaults by month;

data baltcrimem;
set baltcrime;
Month= month(CrimeDate);
run;
quit;


proc sql;
create table assault as
select CrimeCode, Month
from baltcrimem
where Description = "AGG. ASSAULT";
run;
quit;

proc sql;
create table assaultcrimes as
select crimecode, month,
count(month) as numberofaggravatedassaults
from assault
group by crimecode, month;
run;
quit;


********************************


Problem 6. Use CrimeCode to find the number of Common Assaults by year;


proc sql;
create table cassault as
select CrimeCode, Year
from baltcrimed
where Description = "COMMON ASSAULT";
run;
quit;


proc sql;
create table assaultyear as
select crimecode,year,
count(year) as numberofcommonassaults
from cassault
group by crimecode, year;
run;
quit;

*RESULT:

 CrimeCode  YEAR   numberofcommonassaults
1.4E        2014    7643
2.4E        2015    6993
3.4E        2016    7499  
4.4E        2017    8751
5.4E        2018    8373
6.4E        2019    8315
7.4E        2020    4360

********************************

*Problem 7.Create a dataset that has year, number of Aggravated Assaults and number of Common Assaults;


proc sql;
create table aggassault as
select Year
from baltcrimed
where Description = "AGG. ASSAULT";
run;
quit;



proc sql;
create table comassault as
select Year
from baltcrimed
where Description = "COMMON ASSAULT";
run;
quit;




proc sql;
create table aggassaultyear as
select year,
count(year) as numberofaggravatedassaults
from aggassault
group by year;

create table comassaultyear as
select year,
count(year) as numberofcommonassaults
from comassault
group by year;

*the above aggregates both information for aggravated and common assaults;

*now we will join the two tables;

create table allassaults AS
select a.year,  /*now we are aliasing*/
a.numberofaggravatedassaults as numberofaggravatedassaults,
b.numberofcommonassaults as numberofcommonassaults
from aggassaultyear  AS a,
comassaultyear AS b
where a.year=b.year; /*this ends the task*/
run;
quit;



*Result:

 YEAR  numberofaggravatedassaults    numberofcommonassaults
1.2014      4265                        7463
2.2015      4763                        6993
3.2016      5149                        7499
4.2017      5844                        8751
5.2018      5610                        8373
6.2019      5695                        8315
7.2020      2997                        4360
