#!/bin/sh

ZIM2INDEX=`readlink -f $1 2> /dev/null`
SCRIPT=`readlink -f $0/../`
SCRIPT_DIR=`dirname "$SCRIPT"`
MWOFFLINER="$SCRIPT_DIR/mwoffliner.js"
MWMATRIXOFFLINER="$SCRIPT_DIR/mwmatrixoffliner.js --verbose --speed=3 --skipHtmlCache --adminEmail=contact@kiwix.org --mwUrl=http://meta.wikimedia.org/ --parsoidUrl=http://rest.wikimedia.org/ --cacheDirectory=/data/project/cac/ --tmpDirectory=/dev/shm/"

# Few checks
if [ $# -lt 1 ]
then
    echo "Not enough argument. This script need as first and only argument the full path of the 'zim2index' directory where the produced ZIM files need to be moved"
    exit 1;
else
    if [ -d "$ZIM2INDEX" ]
    then
	echo "Target directory for ZIM file is '$ZIM2INDEX'"
    else
	echo "Unable to find or to write into directory '$ZIM2INDEX'"
	exit 1;
    fi
fi

# Wikipedia
$MWMATRIXOFFLINER --project=wiki --outputDirectory=$ZIM2INDEX/wikipedia/ --language="(ar|bg|cs|da|et|el|eo|eu|gl|hy|hi|hr|ms|min|nn|uz|kk|ro|simple|sk|sl|sr|sh|fi|tr|vo)"