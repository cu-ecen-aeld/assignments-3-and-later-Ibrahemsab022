#!/bin/bash


#checking that the user provided 2 arguments
if [ $# -ne 2 ]; then
	echo "One of the required parameters is not specified"
	exit 1

fi

#storing the args in local vars
writeToFile=$1
writeString=$2


#checking if the pass exitst or not

#extracting dir name
directory=$(dirname "$writeToFile")

if [ ! -d "$directory" ]; then
	echo "directory not exist. creating it now....."
	mkdir -p "$directory"
	
	if [ $? -ne 0 ]; then
		echo "Error: dir creation failed: $directory"
		exit 1
	fi
fi



#redircting the output of echo to the file 
echo "$writeString" > "$writeToFile"

#checking if file is created or not
if [ $? -ne  0 ]; then
	echo "Error: file creation failed: $writeToFile"
	exit 1
fi

echo "Successfully wrote to $writeToFile"
exit 0
