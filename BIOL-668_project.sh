#!/bin/bash

#retrieve file(s)

#commands

echo "Welcome! Let's look at your quality scores! We can work with a directory of files or an individual file!"
read -p "What's the file/directory you want to work with?" fn
read -p "Is this a file(f) or a directory(d) (f|d)?" fntype


#finding if it is a specific file or directory of files

if [ $fntype == "f" ]
then
  echo "Finding file..."
  goalpath=$(find ~ -type f -name $fn)
  echo "Found it!"
  echo $goalpath
else
  echo "Finding directory..."
  goalpath=$(FIND ~ -type d -name $fn)
  echo "Found it!"
  echo $goalpath

fi


#making new directory for .fastq files that will be used for this bash script
qdir=~/FASTQ_SCORES
if [ -d "$qdir" ]
then
  echo "Directory $HOME/FASTQ_SCORES exists. "
else
  echo "Making directory.. "
  mkdir $qdir
  

#moving files to new directory










#create table 

