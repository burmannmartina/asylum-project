***************************************************
*** Combine all data and prepare final data set ***
***************************************************
clear
set more off, permanently


* use asylum data
use ./out/data/temp/combined-asylum-data-02-16-q.dta, clear

* match data on different measures of past asylum applications		
merge 1:1 destination origin year quarter using ///
		./out/data/temp/lag_dyadic_first-time-applications.dta, nogen
 
 merge m:1 destination year quarter using ///
		./out/data/temp/lag_total_first-time-applications.dta, nogen
 
 merge m:1 destination year using ///
		./out/data/temp/lag_total_applications.dta, nogen

 merge m:1 destination year quarter using ///
		./out/data/temp/lag_total_decisions.dta, nogen	
		
*Note data for Switzerland not included in total decision data because Switzerland 
* has no decision data before 2008 and is thus not included in the analysis

* match destination country data
merge m:1 destination year quarter using ///
		./out/data/temp/destination_data.dta, nogen
		
* match bilateral data
merge m:1 origin destination using ///
		./out/data/temp/bilateral_data.dta, nogen

* match origin country data		
merge m:1 origin year quarter using ///
		./out/data/temp/origin_data.dta, nogen

		
drop if destination == "Switzerland"
drop if year > 2014
		
save ./out/data/temp/combined_data.dta, replace
		






		

