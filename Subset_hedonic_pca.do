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

drop if missing(upd_municip)

foreach v of var * { 
	drop if missing(`v')
	
}


keep if region == "west bay area" | region == "the pearl" | region == "lusail city"
gen lusail = region == "lusail city"
gen westbay = region == "west bay area"
gen pearl = region == "the pearl"

pca furnished* property_type* health_and_fitness building_and_community_features, components(4)
predict pc1 pc2 pc3 pc4, score

reg ln_price_per_sqm ln_size furnished* health_and_fitness security_and_safety home_comforts_and_luxuries building_and_community_features bedrooms* property_type* jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if lusail == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, replace tex

scalar start = 100

* For other months, calculate the index based on the change from July 2023
scalar lusail_hedonic_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar lusail_hedonic_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar lusail_hedonic_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar lusail_hedonic_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar lusail_hedonic_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar lusail_hedonic_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar lusail_hedonic_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])

reg ln_price_per_sqm ln_size bedrooms*  pc1 pc2 pc3 pc4 jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if lusail == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, append tex

* For other months, calculate the index based on the change from July 2023
scalar lusail_pca_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar lusail_pca_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar lusail_pca_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar lusail_pca_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar lusail_pca_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar lusail_pca_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar lusail_pca_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])

reg ln_price_per_sqm ln_size furnished* health_and_fitness security_and_safety home_comforts_and_luxuries building_and_community_features bedrooms* property_type* jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if westbay == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, append tex

* For other months, calculate the index based on the change from July 2023
scalar westbay_hedonic_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar westbay_hedonic_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar westbay_hedonic_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar westbay_hedonic_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar westbay_hedonic_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar westbay_hedonic_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar westbay_hedonic_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])

reg ln_price_per_sqm ln_size bedrooms*  pc1 pc2 pc3 pc4 jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if westbay == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, append tex

* For other months, calculate the index based on the change from July 2023
scalar westbay_pca_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar westbay_pca_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar westbay_pca_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar westbay_pca_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar westbay_pca_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar westbay_pca_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar westbay_pca_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])

reg ln_price_per_sqm ln_size furnished* health_and_fitness security_and_safety home_comforts_and_luxuries building_and_community_features bedrooms* property_type* jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if pearl == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, append tex

* For other months, calculate the index based on the change from July 2023
scalar pearl_hedonic_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar pearl_hedonic_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar pearl_hedonic_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar pearl_hedonic_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar pearl_hedonic_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar pearl_hedonic_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar pearl_hedonic_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])

reg ln_price_per_sqm ln_size bedrooms*  pc1 pc2 pc3 pc4 jul_2023 aug_2023 sep_2023 oct_2023 dec_2023 jan_2024 feb_2024 mar_2024 if pearl == 1, robust 
outreg2 using /Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_model_combined.tex, append tex

clear

set obs 8
gen date = date("2023-07-01", "YMD") in 1
replace date = date("2023-08-01", "YMD") in 2
replace date = date("2023-09-01", "YMD") in 3
replace date = date("2023-10-01", "YMD") in 4
replace date = date("2023-12-01", "YMD") in 5
replace date = date("2024-01-01", "YMD") in 6
replace date = date("2024-02-01", "YMD") in 7
replace date = date("2024-03-01", "YMD") in 8
format date %td

* For other months, calculate the index based on the change from July 2023
scalar pearl_pca_index_aug_2023 = start * exp(_b[aug_2023] - _b[jul_2023])
scalar pearl_pca_index_sep_2023 = start * exp(_b[sep_2023] - _b[jul_2023])
scalar pearl_pca_index_oct_2023 = start * exp(_b[oct_2023] - _b[jul_2023])
scalar pearl_pca_index_dec_2023 = start * exp(_b[dec_2023] - _b[jul_2023])
scalar pearl_pca_index_jan_2024 = start * exp(_b[jan_2024] - _b[jul_2023])
scalar pearl_pca_index_feb_2024 = start * exp(_b[feb_2024] - _b[jul_2023])
scalar pearl_pca_index_mar_2024 = start * exp(_b[mar_2024] - _b[jul_2023])


gen model_lusail_hedonic = .
replace model_lusail_hedonic = start in 1
replace model_lusail_hedonic = lusail_hedonic_index_aug_2023 in 2
replace model_lusail_hedonic = lusail_hedonic_index_sep_2023 in 3
replace model_lusail_hedonic = lusail_hedonic_index_oct_2023 in 4
replace model_lusail_hedonic = lusail_hedonic_index_dec_2023 in 5
replace model_lusail_hedonic = lusail_hedonic_index_jan_2024 in 6
replace model_lusail_hedonic = lusail_hedonic_index_feb_2024 in 7
replace model_lusail_hedonic = lusail_hedonic_index_mar_2024 in 8

* Generate models for West Bay Area
gen model_westbay_hedonic = .
replace model_westbay_hedonic = start in 1
replace model_westbay_hedonic = westbay_hedonic_index_aug_2023 in 2
replace model_westbay_hedonic = westbay_hedonic_index_sep_2023 in 3
replace model_westbay_hedonic = westbay_hedonic_index_oct_2023 in 4
replace model_westbay_hedonic = westbay_hedonic_index_dec_2023 in 5
replace model_westbay_hedonic = westbay_hedonic_index_jan_2024 in 6
replace model_westbay_hedonic = westbay_hedonic_index_feb_2024 in 7
replace model_westbay_hedonic = westbay_hedonic_index_mar_2024 in 8

* Generate models for The Pearl
gen model_pearl_hedonic = .
replace model_pearl_hedonic = start in 1
replace model_pearl_hedonic = pearl_hedonic_index_aug_2023 in 2
replace model_pearl_hedonic = pearl_hedonic_index_sep_2023 in 3
replace model_pearl_hedonic = pearl_hedonic_index_oct_2023 in 4
replace model_pearl_hedonic = pearl_hedonic_index_dec_2023 in 5
replace model_pearl_hedonic = pearl_hedonic_index_jan_2024 in 6
replace model_pearl_hedonic = pearl_hedonic_index_feb_2024 in 7
replace model_pearl_hedonic = pearl_hedonic_index_mar_2024 in 8

gen model_lusail_pca = .
replace model_lusail_pca = start in 1
replace model_lusail_pca = lusail_pca_index_aug_2023 in 2
replace model_lusail_pca = lusail_pca_index_sep_2023 in 3
replace model_lusail_pca = lusail_pca_index_oct_2023 in 4
replace model_lusail_pca = lusail_pca_index_dec_2023 in 5
replace model_lusail_pca = lusail_pca_index_jan_2024 in 6
replace model_lusail_pca = lusail_pca_index_feb_2024 in 7
replace model_lusail_pca = lusail_pca_index_mar_2024 in 8

* Generate models for West Bay Area using PCA
gen model_westbay_pca = .
replace model_westbay_pca = start in 1
replace model_westbay_pca = westbay_pca_index_aug_2023 in 2
replace model_westbay_pca = westbay_pca_index_sep_2023 in 3
replace model_westbay_pca = westbay_pca_index_oct_2023 in 4
replace model_westbay_pca = westbay_pca_index_dec_2023 in 5
replace model_westbay_pca = westbay_pca_index_jan_2024 in 6
replace model_westbay_pca = westbay_pca_index_feb_2024 in 7
replace model_westbay_pca = westbay_pca_index_mar_2024 in 8

* Generate models for The Pearl using PCA
gen model_pearl_pca = .
replace model_pearl_pca = start in 1
replace model_pearl_pca = pearl_pca_index_aug_2023 in 2
replace model_pearl_pca = pearl_pca_index_sep_2023 in 3
replace model_pearl_pca = pearl_pca_index_oct_2023 in 4
replace model_pearl_pca = pearl_pca_index_dec_2023 in 5
replace model_pearl_pca = pearl_pca_index_jan_2024 in 6
replace model_pearl_pca = pearl_pca_index_feb_2024 in 7
replace model_pearl_pca = pearl_pca_index_mar_2024 in 8


* Step 6: Plot all three index lines on the same graph
tsset date
gen model_lusail_hedonic_label = string(model_lusail_hedonic, "%9.2f")
gen model_westbay_hedonic_label = string(model_westbay_hedonic, "%9.2f")
gen model_pearl_hedonic_label = string(model_pearl_hedonic, "%9.2f")
gen model_lusail_pca_label = string(model_lusail_pca, "%9.2f")
gen model_westbay_pca_label = string(model_westbay_pca, "%9.2f")
gen model_pearl_pca_label = string(model_pearl_pca, "%9.2f")

* Plotting the models with labels
twoway (tsline model_lusail_hedonic, lw(medium) lc(purple)) ///
       (tsline model_westbay_hedonic, lw(medium) lc(blue)) ///
       (tsline model_pearl_hedonic, lw(medium) lc(red)) ///
       (tsline model_lusail_pca, lw(medium) lc(green)) ///
       (scatter model_pearl_hedonic date, mlabel(model_pearl_hedonic_label) mlabposition(3) ///
        mlabcolor(red) mlabsize(vsmall) msymbol(none) ) ///
       (tsline model_westbay_pca, lw(medium) lc(black)) ///
       (tsline model_pearl_pca, lw(medium) lc(gray)), ///
       legend(order(1 "Lusail Hedonic" 2 "WestBay Hedonic" 3 "Pearl Hedonic" 4 "Lusail PCA" ///
       6 "WestBay PCA" 7 "Pearl PCA") position(6)) ///
       ylabel(, angle(horizontal) format(%9.2f) labsize(vsmall)) ///
       xlabel(, format(%tdMon_YY) labsize(vsmall)) ///
       ytitle("Subset Rental Price Index") ///
       xtitle("Time") ///
       graphregion(color(white)) plotregion(color(white))



* Export the combined graph
graph export "/Users/shaaaanya/Documents/Research/Qatar_Rents/qatar_residential_data/property_finder/qatar_residential_data/Analysis/report/subset_models_overview.png", as(png) replace
