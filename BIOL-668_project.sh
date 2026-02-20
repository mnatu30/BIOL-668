#!/bin/bash

#retrieve file(s)

echo "Welcome! Let's look at your quality scores! We can work with a directory of files or an individual file (.fastq)!"
read -p "What's the file/directory you want to work with?" fn
read -p "Is this a file(f) or a directory(d) (f|d)?" fntype

qdir=~/FASTQ_SCORES

#finding if it is a specific file or directory of files

if [ $fntype == "f" ]
then 
   echo "Finding file..."
   goalpathfn=$(find ~ -type f -name $fn)

elif [ $fntype == "d" ]
then
   echo "Finding directory..."
   goalpathdir=$(find ~ -type d -name $fn)
else
   echo "Something went wrong. Try again."
fi


#checking if file/directory exists, finding/creating dir QUALITY_SCORES and moving target file(s) into dir#ectory 
if [ -e "$goalpathfn" ]
then
  echo "Found it!"
  if [ -d "$qdir" ]
  then
    echo "Directory $HOME/FASTQ_SCORES exists. "
    cp -v "$goalpathfn" "$qdir"
    echo "New directory made with file added. "
  else
    echo "Making directory.. "
    mkdir $qdir
    cp -v "$goalpathfn" "$qdir"
    echo "New directory made with file added. "
  fi
elif [ -d "$goalpathdir" ]
then
  echo "Found it!"
  if [ -d "$qdir" ]
  then
    echo "Directory $HOME/FASTQ_SCORES exists. "
    cp -v "$goalpathdir"/* "$qdir"
    echo "New directory made with file(s) added. "
  else
    echo "Making directory.. "
    mkdir $qdir
    cp -v "$goalpathdir"/* "$qdir"
    echo "New directory made with file added. "
  fi
else
  echo "Something went wrong. Try again. "
fi







#make summary table file

touch seq_summary.txt

echo "sequence\tlength" > $HOME/FASTQ_SCORES/seq_summary.txt

#iterate over fastq file in directory

for f in $HOME/FASTQ_SCORES/*.fastq
  do
    awk 'NR%4==2 {len += length($0)} END {print FILENAME"\t"len}' $f >> $HOME/FASTQ_SCORES/seq_summary.txt
done

