2022.10.22	13:43	slurm-6671649
	debug finished(missing SS2j /q/k, and R_M function for Jpsi is adjusted delta(x1+x2-x)).
	calculate Jpsi, parameters: bL=2.39 for gluon, 0.01 for charm.
	Result: 
	1.SS(2j) cutoff 2.7 make a sharp decrease, leading to unreasonale result.
	2.And a bug in TT and TS, making NaN, but no bug in Win10 . I guess it is associated with
 	  Bessel function. I will test after good results appearing.
2022.10.22	20.54	slurm-6672011
	debug SS(2j) for Jpsi: fs(8/5)s(8/5) are not used.
	Result:
	1.SS(1) is too small to fit the spectra in the large p_T region.
2022.10.23	14.30	slurm-6672457
	change gluon bL 2.39 -> 1.5, so do not change TS to change SS.
 	And test NaN by the way.
	Result:
	1.SS is still small.
2022.10.29	13:20	slurm-6679888
	debug Bessel I0 K1 NaN issue. Use MBSL3 and MBSL4 to replace 3 sub.f90.
	Result:
	1.NaN issue has been solved.
2022.10.29	15:04	slurm-6680116
	Restart test, parameters: delta function in R_M is changed back.
				bL=2.39,v_T=0.11,gamc=0.6,T=0.19, q:2-30
	Result:
	1.Parameters should be modified.
2022.10.29	17.07	slurm-6680296
	Add cutoff for S_ij -> Sij=S_ij*(1-dexp(-(p/pc)**2)),pc=0.5
		       D    -> D*(1-dexp(-p**2))
	Result:
	1.SS is small, and I will modify bL next.
	2.TS is large.
	3.SS(2j) is wrong owing to use Fiq instead of F1iq
	4.integration limits 2-30 are not sure. SS(2j) has a decrease at low limit 2.
2022.10.29	23:25	slurm-6680899
	Modify gluon bL 2.39 -> 1.0 to raise SS(1).
	T is not modified first.
	Result:
	1. bad

2022.10.30	19:43	slurm-6681794
	debug S_j plowlim=2.0
	Parameters:SS2j integrate from 2.0 to 15.0.
	Last: SS(1) in high p is small, SS(2) is too large for 10.(-2)
	Result:
	1.SS(2) needs to be adjusted.
2022.10.30	20:39	slurm-6681957
	Parameters:SS2j integrate from 3.0 to 15.0.
	Result:
	Perfect!
2022.11.14	23:04	slurm-6701428
	New fik:FONLL fit















