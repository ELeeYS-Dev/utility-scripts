#!/bin/bash

# This script is used to convert jpeg and jpg files to webp
# This script requires webp converter is installed. visit https://developers.google.com/speed/webp/docs/precompiled for installation
# usage sh webConverter.sh <source folder path> <destination folder path>
# <source folder path> optional. default: .
# <destination folder path> optional. default: source folder path. if destination folder does not exist returns to default

if [ -z "$1" ];
then root=.;
else root=$1
fi

if [ ! -d "$root" ];
then 
	echo $root folder does not exist, exiting...
	exit
fi

if [ -z "$2" ];
then output=$root;
else output=$2
fi

if [ ! -d "$output" ];
then 
	echo $output folder does not exist, using $root instead;
	output=$root;
fi

for file in ${root}/*.{jpeg,jpg}; 
do
	echo processing $file...
	basefilename=$(basename $file)
	fileparts=(${basefilename//./ })

	newFilePath=(${output}/${fileparts[0]}.webp)

	cwebp $file -o $newFilePath
	
	echo created $newFilePath
	echo
done