clear

import delimited "/Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/for_stata_index_creation.csv", varnames(1)


drop v1

rename _10 oct_2023
rename _12 dec_2023
rename _7 jul_2023 
rename _8 aug_2023 
rename _9 sep_2023
rename _1 jan_2024
rename _2 feb_2024
rename _3 mar_2024
rename _5 may_2024


drop if missing(upd_municip)
foreach v of var * { 
	drop if missing(`v') 
}

* Set the graph style to a cleaner and more modern look
set scheme s1mono

reg ln_price_per_sqm ln_size furnished* health_and_fitness security_and_safety home_comforts_and_luxuries building_and_community_features bedrooms* property_type* upd_municip_* jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 may_2024, cluster(region)


scalar index_jul_2023 = 100
scalar index_aug_2023 = exp(_b[aug_2023] - _b[jul_2023]) * 100
scalar index_sep_2023 = exp(_b[sep_2023] - _b[jul_2023]) * 100
scalar index_oct_2023 = exp(_b[oct_2023] - _b[jul_2023]) * 100
scalar index_dec_2023 = exp(_b[dec_2023] - _b[jul_2023]) * 100
scalar index_jan_2024 = exp(_b[jan_2024] - _b[jul_2023]) * 100
scalar index_feb_2024 = exp(_b[feb_2024] - _b[jul_2023]) * 100
scalar index_mar_2024 = exp(_b[mar_2024] - _b[jul_2023]) * 100
scalar index_may_2024 = exp(_b[may_2024] - _b[jul_2023]) * 100

* Generate the date variable and the index variable
clear
set obs 10
gen date = date("2023-07-01", "YMD") in 1
replace date = date("2023-08-01", "YMD") in 2
replace date = date("2023-09-01", "YMD") in 3
replace date = date("2023-10-01", "YMD") in 4
replace date = date("2023-12-01", "YMD") in 5
replace date = date("2024-01-01", "YMD") in 6
replace date = date("2024-02-01", "YMD") in 7
replace date = date("2024-03-01", "YMD") in 8
replace date = date("2024-05-01", "YMD") in 9
replace date = date("2024-06-01", "YMD") in 10
format date %td

* Generate the index values based on the regression coefficients
gen index = .
replace index = index_jul_2023 in 1
replace index = index_aug_2023 in 2
replace index = index_sep_2023 in 3
replace index = index_oct_2023 in 4
replace index = index_dec_2023 in 5
replace index = index_jan_2024 in 6
replace index = index_feb_2024 in 7
replace index = index_mar_2024 in 8
replace index = index_may_2024 in 9

* Generate the string labels for the indices
gen index_label = string(index, "%9.2f")

export excel using "/Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/index_data.xlsx", replace

* Set the date variable as a time series variable
tsset date

twoway (tsline index, lw(medium) lc(blue) name(RentalIndex, replace)) ///
       (scatter index date, mlabel(index_label) mlabposition(3) mlabcolor(black) mlabsize(vsmall) msymbol(none)), /// 
       ylabel(, angle(horizontal) format(%9.2f) labsize(vsmall)) ///
       xlabel(, format(%tdMon_YY) labsize(vsmall)) ///
       ytitle("Qatar Rental Price Index") ///
       xtitle("Time") ///
       legend(off) ///
       graphregion(color(white)) ///
       plotregion(color(white))
	   
* Export the graph to an image file	
graph export "/Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/rental_price_index_improved.png", as(png) replace
