#!/bin/bash
echo "Calculating MD5 comparisons"
if [ -z $2 ]; then
        echo "file + sum file needed"
        echo "usage: 0? "
        exit
fi

export fsum=$(cat $2)
export csum=$(md5sum $1 | awk '{print $1}')

echo "MD5 File CheckSum Value: $fsum"
echo "MD5Sum Calculated Value: $csum"

if [ "$csum" == "$fsum" ]; then
        echo "MD5 Verification Successful!";
else
    	echo "MD5 Verification Failed!"
fi
