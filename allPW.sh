#!/usr/bin/env bash
source setvars.sh
ADIR=$1

#Loop over pairwise results and run fiedler and mds
for FILE in ${ADIR}/pairwise/*
do
	echo Pairwise $FILE
	if [ -f $FILE ]
	then
		OUTDIRBASE=${ADIR}/pairwise/layouts/$(basename $FILE)
		OUTDIR=${OUTDIRBASE}/fiedler
		mkdir -p $OUTDIR
		
		./runpw.sh $FILE $OUTDIR 2
		RMEMPTY $OUTDIR

		OUTDIR=${OUTDIRBASE}/mds
		mkdir -p $OUTDIR

		./runMDS.sh $FILE $OUTDIR 2
		RMEMPTY $OUTDIR
		RMEMPTY $OUTDIRBASE

	fi
done