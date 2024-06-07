#!/bin/sh

for DIR in fit1d/*/*/*/1H ; do (
	cd $DIR
	pwd
	./fid.com
	./nmrproc.com
); done
