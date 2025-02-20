*****************************************************************
** GRAPH 2: graph with 6 before and after the election dummies **
*****************************************************************

eststo clear
xtset $xt_main 
eststo: quietly xtreg 	$dependent_variable ///
						$origin_variables $destination_variables ///
						$interactions_left_m2 $interactions_right_m2 ///
						$fe_var, ///
						fe vce(cluster $se_clus)
local r = _b[cabinet_right]

nlcom 	(bef6: _b[bef6_left]) ///
		(bef5: _b[bef5_left]) ///
		(bef4: _b[bef4_left]) ///
		(bef3: _b[bef3_left]) ///
		(bef2: _b[bef2_left]) ///
		(bef1: _b[bef1_left]) ///
		(election: _b[elec_left]) ///
		(post1: _b[post1_left]) ///
		(post2: _b[post2_left]) ///
		(post3: _b[post3_left]) ///
		(post4: _b[post4_left]) ///
		(post5: _b[post5_left]) ///
		(post6: _b[post6_left]) ///
		,post
est sto left

eststo: quietly xtreg 	$dependent_variable ///
						$origin_variables $destination_variables ///
						$interactions_left_m2 $interactions_right_m2 ///
						$fe_var, ///
						fe vce(cluster $se_clus)
nlcom 	(bef6: _b[bef6_right] + _b[cabinet_right]) ///
		(bef5: _b[bef5_right] + _b[cabinet_right]) ///
		(bef4: _b[bef4_right] + _b[cabinet_right]) ///
		(bef3: _b[bef3_right] + _b[cabinet_right]) ///
		(bef2: _b[bef2_right] + _b[cabinet_right]) ///
		(bef1: _b[bef1_right] + _b[cabinet_right]) ///
		(election: _b[elec_right] + _b[cabinet_right]) ///
		(post1: _b[post1_right] + _b[cabinet_right]) ///
		(post2: _b[post2_right] + _b[cabinet_right]) ///
		(post3: _b[post3_right] + _b[cabinet_right]) ///
		(post4: _b[post4_right] + _b[cabinet_right]) ///
		(post5: _b[post5_right] + _b[cabinet_right]) ///
		(post6: _b[post6_right] + _b[cabinet_right]) ///
		,post
est sto right

coefplot 	(left, keep($time_m2) label(left-wing cabinet) ///
			msymbol(S) mcolor(red) lcolor(red)) ///
			(right, keep($time_m2) label(right-wing cabinet) ///
			msymbol(T) mcolor(navy) lcolor(navy))   ///
			, connect(l) noci nooffset vertical ///
			yline(0, lcolor(black) lwidth(vthin)) ///
			yline(`r', lpattern(dash) lcolor(navy) lwidth(vthin)) ///
			graphregion(color(white)) ///
			legend (rows(1) size(vsmall)) ///
			xscale(range(1 (1) 13)) ///
			xlabel(1 "-6" 2 "-5" 3 "-4" 4 "-3"  5 "-2" 6 "-1" 7 "0" ///
				   8 "1" 9 "2" 10 "3" 11 "4" 12 "5" 13 "6", labsize(small)) ///
			yscale(range($y_scale)) ///
			ylabel ($y_scale , labsize(small)) ///
			ytitle(estimated coefficient, size(small)) ///
			xtitle (quarters around the election, size(small)) ///
			title($graph_title2)
			
graph save $path_graph2_temp, replace



