#!/bin/sh

echo $#
if [ $# != 5 ]; then
    echo "Please check your input.\n ./demo.sh <theme> <themes_file> <seed_file> <search_term_file> <results_file_directory>\n"
    exit
fi
echo "CWD: $(pwd)"
KEYWORD_PHP="$(dirname $0)/keywords.php"
ADSTEROIDS_R="$(dirname $0)/adsteroids_v2.R"
echo "php $KEYWORD_PHP $2 $3 $1 $5"
keywords_file=`php $KEYWORD_PHP "$2" "$3" "$1" "$5"`
echo $keywords_file
echo "Rscript $ADSTEROIDS_R $4 $keywords_file $1 $5"
Rscript $ADSTEROIDS_R $4 $keywords_file $1 $5
echo '\n\r\c'
