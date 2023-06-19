#!/bin/sh

set -e
set -u

print_help () {
    echo "writer.sh must be executed with two parameters:"
    echo "    The first argument is a full path to a file (including filename) on the filesystem."
    echo "    The second argument is a text string which will be written within this file."
    exit 1
}

if [ $# -lt 2 ]
then
    print_help
    exit 1
fi

FILEPATH="$1"

FILE="`basename "${FILEPATH}"`"
DIR="`dirname "${FILEPATH}"`"

mkdir -p "${DIR}" && touch "${DIR}/${FILE}"

if [ ! -f "$FILEPATH" ]; then
    echo "$FILEPATH cannot be created"
    exit 1
fi

echo "$2" > $FILEPATH

