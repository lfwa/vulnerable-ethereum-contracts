#!/bin/bash

RED='\033[0;31m'
ORIG='\033[0m'
GREEN='\033[1;32m'

for i in "0 Tainted" "1 Tainted" "2 Safe" "3 Safe" "4 Tainted" "5 Safe" "6 Tainted" "7 Tainted" "8_1 Safe" "8_2 Safe" "9_1 Safe" "9_2 Safe" "10 Tainted" "11 Safe" "12 Safe" "14 Safe" "15 Safe" "16 Safe" "17 Safe" "18 Safe" "19 Tainted" "20 Safe" "21 Safe" "22 Tainted" "50 Tainted" "51 Safe" "52 Tainted" "53 Safe" "100 Safe" "101 Safe" "102 Tainted" "103 Tainted" "104 Tainted" "105 Tainted" "106 Tainted" "107 Tainted" "108 Safe" "109 Safe" "110 Safe" "111 Tainted" "112 Safe" "113 Safe" "114 Tainted" "115 Tainted" "116 Tainted" "117 Safe" "118 Tainted" "119 Safe" "120 Safe" "121 Tainted" "122 Safe" "123 Tainted" "124 Safe" "125 Tainted" "126 Tainted" "127 Tainted" "128 Safe" "129 Safe"
do
    set -- $i
    rm -r -f test_contracts/$1_out/
    result=$(python analyze.py test_contracts/$1.sol | tail -n 1);
    if [[ "$result" == "$2" ]]; then
	echo -e "${GREEN}contract $1 classified correctly${ORIG}"
    else
	echo -e "${RED}contract $1 classified as ${ORIG}$result ${RED}instead of ${ORIG}$2"
    fi
    rm -r -f test_contracts/$1_out/
done

for j in "0 Tainted" "1 Tainted" "2 Safe" "3 Safe" "4 Tainted" "5 Safe" "6 Tainted" "7 Tainted" "9_1 Safe" "9_2 Safe" "10 Tainted" "11 Safe" "12 Safe" "14 Safe" "15 Safe" "16 Tainted" "17 Safe" "18 Tainted" "19 Tainted" "20 Safe" "21 Safe" "22 Safe" "23 Safe" "24 Safe" "25 Tainted" "26 Tainted" "27 Safe" "28 Safe" "29 Tainted" "30 Safe" "31 Tainted" "32 Safe" "33 Tainted" "34 Tainted" "35 Safe" "36 Tainted" "37 Safe" "38 Safe" "39 Tainted" "40 Tainted" "41 Safe" "42 Tainted"
do
    set -- $j
    rm -r -f test_contracts/$1_out/
    result=$(python analyze.py preliminary_test_contracts/$1.sol | tail -n 1);
    if [[ "$result" == "$2" ]]; then
	echo -e "${GREEN}contract $1 classified correctly${ORIG}"
    else
	echo -e "${RED}contract $1 classified as ${ORIG}$result ${RED}instead of ${ORIG}$2"
    fi
    rm -r -f preliminary_test_contracts/$1_out/
done
