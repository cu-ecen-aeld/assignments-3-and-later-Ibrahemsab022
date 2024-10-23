#!/bin/bash

#checking that the parameters are passed correctly
if [ $# -ne 2 ]; then
	echo "One of the required parameters is not specfied"
	exit 1

fi

#storing the parameters to local vars to manipulate it
direc="$1"
srchStr="$2"


#check the given dir exists
if [ ! -d "$direc" ]; then
	echo "Error: Directory doesn not exist"
	exit 1
fi


#finding the num of files 
filesNo=$(find "$direc" -type f | wc -l)

#counting the number of matching lines
linesNo=$(grep -r "$srchStr" "$direc" 2>/dev/null | wc -l)



#printing the ouput
#echo "The number of files: $filesNo and the number of lines are $linesNo"
echo "The number of files are $filesNo and the number of matching lines are $linesNo"

