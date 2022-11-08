#!/bin/bash
fileName="$1";
outputFile="$2";
countLine=0;
touch "$outputFile"
splitNr="$(cut -d'-' -f2 <<<"$outputFile")"
iterationNr="$(cut -d'.' -f1 <<<"$(cut -d'-' -f3 <<<"$outputFile")")"
endLine=$(($iterationNr * $splitNr))
startLine=$((endLine - $splitNr))
echo "Split rows: $splitNr"
echo "Iteration: $iterationNr"
echo "Start lines index grater than $startLine"
echo "End lines index smaller or equal with $endLine"
while IFS= read -r line; do
    if [ "$countLine" != 0 ]; then
     echo "Text read from file: $line"
     if [ $(($countLine)) -eq $(($startLine)) ]; then
            cat >> "$outputFile" <<< "["
        fi 
     if [ $(($countLine)) -gt $(($startLine)) ]; then
        if [ $(($endLine+1)) -gt $(($countLine)) ]; then
            if [ $(($endLine)) -eq $(($countLine)) ]; then
              cat >> "$outputFile" <<< "${line//,/}"
            else
              cat >> "$outputFile" <<< "$line"
            fi 
        fi 
     fi
      if [ $(($countLine)) -eq $(($endLine )) ]; then
            cat >> "$outputFile" <<< "]"
        fi 
    fi
    countLine=$(($countLine + 1))
    echo $countLine
done < "$fileName"