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
  fnpath=$(find ~ -type f -name $fn)
  echo "Found it!"
  qdir=~/FASTQ_SCORES
  if [ -d "$qdir" ]
  then
    echo "Directory $HOME/FASTQ_SCORES exists. "
  else
    echo "Directory does not exist."
    echo Creating Directory...
    mkdir ~/FASTQ_SCORES
    echo "Created FASTQ_SCORES in $HOME directory with added file(s)."
  fi
else
  echo "Finding directory..."
  dirpath=$(FIND ~ -type d -name $fn)
  echo "Found it!"
  if [ -d "$qdir" ]
  then
    echo "Directory $HOME/FASTQ_SCORES exists. "
  else
    echo "Directory does not exist."
    echo Creating Directory...
    mkdir ~/FASTQ_SCORES
    cp $dirpath ~/FASTQ_SCORES
    echo "Created FASTQ_SCORES in $HOME directory with added file(s)."
  fi

fi


#making new directory for raw and edited .fastq files
qdir=~/FASTQ_SCORES



cp -v fnpath qdir



#create table 
