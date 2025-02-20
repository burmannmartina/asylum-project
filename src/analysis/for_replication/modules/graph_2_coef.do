

xtset $xt_main 
eststo: quietly xtreg 	$dependent_variable ///
						$origin_variables $destination_variables ///
						$interactions_left_m2 $interactions_right_m2 ///
						$fe_var, ///
						fe vce(cluster $se_clus)
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
est sto $left2

eststo: quietly xtreg 	$dependent_variable ///
						$origin_variables $destination_variables ///
						$interactions_left_m2 $interactions_right_m2 ///
						$fe_var, ///
						fe vce(cluster $se_clus)
nlcom 	(bef6: _b[bef6_right] ) ///
		(bef5: _b[bef5_right] ) ///
		(bef4: _b[bef4_right] ) ///
		(bef3: _b[bef3_right] ) ///
		(bef2: _b[bef2_right] ) ///
		(bef1: _b[bef1_right] ) ///
		(election: _b[elec_right] ) ///
		(post1: _b[post1_right] ) ///
		(post2: _b[post2_right] ) ///
		(post3: _b[post3_right] ) ///
		(post4: _b[post4_right] ) ///
		(post5: _b[post5_right] ) ///
		(post6: _b[post6_right] ) ///
		,post
est sto $right2

eststo: quietly xtreg 	$dependent_variable ///
						$origin_variables $destination_variables ///
						$interactions_left_m2 $interactions_right_m2 ///
						$fe_var, ///
						fe vce(cluster $se_clus)
nlcom 	(bef6: _b[bef6_left] - _b[bef6_right] ) ///
		(bef5: _b[bef5_left] - _b[bef5_right] ) ///
		(bef4: _b[bef4_left] - _b[bef4_right] ) ///
		(bef3: _b[bef3_left] - _b[bef3_right] ) ///
		(bef2: _b[bef2_left] - _b[bef2_right] ) ///
		(bef1: _b[bef1_left] - _b[bef1_right] ) ///
		(election: _b[elec_left] -_b[elec_right] ) ///
		(post1: _b[post1_left] - _b[post1_right] ) ///
		(post2:  _b[post2_left] - _b[post2_right] ) ///
		(post3: _b[post3_left] - _b[post3_right] ) ///
		(post4: _b[post4_left] - _b[post4_right] ) ///
		(post5: _b[post5_left] - _b[post5_right] ) ///
		(post6: _b[post6_left] -_b[post6_right] ) ///
		,post
est sto $diff2

