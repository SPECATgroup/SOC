#!/usr/bin/bash

for i in *X*
do
	cd $i/AE
	rm -r *10*
	for j in *
	do
		cd $j
		pwd
		rm *cp2k *spec
		cp_spec < inp
		cd ../
	done
	cd ../PP/
	rm -r *10*
	for j in *
	do
		cd $j
		pwd
		rm *cp2k *spec
		cp_spec < inp
		cd ../
	done
	cd ../orca/
	rm -r *10*
	for j in *
	do
		cd $j
		pwd
	        rm *osc *spec	
		orca_spec < inp
		cd ../
	done	
	cd ../../
done
