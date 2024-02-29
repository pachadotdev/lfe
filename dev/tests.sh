#!/bin/bash

rm .R.Rout tests/.RData

cd tests/

# list .R files
ls *.R | while read file; do
  # run each file
  R --vanilla CMD BATCH $file
done

# delete .save files
rm *.Rout.save

# rename .Rout files to .Rout.save
ls *.Rout | while read file; do
  mv $file ${file}.save
done

rm .R.Rout tests/.RData
