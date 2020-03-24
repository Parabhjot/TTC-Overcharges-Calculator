
/* To use this code, 
	1) Have your data in a csv file format 
	2) Split out date into Month and Day. Please note that this code analyses 1 year of data at a time

Created by Parabhjot					*/ 

PROC IMPORT OUT=transit_data DATAFILE="Path to data file"
DBMS=excel2000 REPLACE; SHEET= "Sheet Name"; GETNAMES=YES; RUN;

proc sql; create table cost_per_day as 
select 	Month,
		Day,
		transit_agency, 
		sum(cost) as total_cost
from transit_data
group by month, day, transit_agency
order by total_cost asc
;quit; 
 
proc sql; create table overcharges as 
select * 
from cost_per_day
where transit_agency = 'Agency Name' and total_cost > /* Sum of costs per day */
;quit; 
