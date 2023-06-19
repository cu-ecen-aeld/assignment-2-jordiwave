#!/bin/sh

set -e
set -u

print_help () {
    echo "finder.sh must be executed with two parameters:"
    echo "    The first argument is a path to a directory on the filesystem."
    echo "    The second argument is a text string which will be searched within these files."
    exit 1
}

if [ $# -lt 2 ]
then
    print_help    
    exit 1
fi

if [ ! -d "$1" ]
then
    echo "directory $1 doesn't exist"
    exit 1
fi

FILES=$(ls -1 $1 | wc -l)
LINES=$(grep -r $2 $1/* | wc -l)

echo "The number of files are $FILES and the number of matching lines are $LINES"





