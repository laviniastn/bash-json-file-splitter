# bash-json-file-splitter
RUN CMD

./script.sh input.json output-2-3.json

DESCRIPTION

Takes the input json file which contains a json array and splits it into 2 (or more depending of output json file name) and returns a new json file which contains
the third split iteration (or other depending of output json file name).

$1 param is input.json
$2 param is output-2-3.json (2 indicates the  nr of rows in the iteration, 3 indicates the iteration which will be saved in the file) 
