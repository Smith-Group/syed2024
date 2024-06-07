#!/bin/sh

for DIR in fit1d/*/*/*/1H ; do (
	cd $DIR
	pwd
	../../../../../scripts/refit_peaks.R
); done
