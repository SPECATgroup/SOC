#!/usr/bin/bash

for i in *X*
do
	cd $i/AE
	rm -r *10*
	for j in *
	do
		cd $j
		rm *out *cp2k *spec
		vi run.sh
		vi AE.inp
		vi AE_aug.inp
		sbatch run.sh
		cd ../
	done
	cd ../PP/
	rm -r *10*
	for j in *
	do
		cd $j
		rm *out *cp2k *spec
		vi run.sh
		vi PP.inp
		vi PP_quad.inp
		sbatch run.sh
		cd ../
	done
	cd ../../
done
