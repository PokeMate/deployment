#!/bin/bash
awk '{ print $0","sprintf("%.02f", rand())","sprintf("%.02f", rand())","sprintf("%.02f", rand())",,,," }' pokeDex.csv >> pokeDex2.csv
mv pokeDex2.csv pokeDex.csv

(awk -F',' '{ print $1 }' pokeDex.csv | awk '{ print "https://www.kaggle.com/kvpratama/pokemon-images-dataset#" $0 ".png" }') >> pokeDexUrls.csv

paste -d "" pokeDex.csv pokeDexUrls.csv >> pokeDex.csv
