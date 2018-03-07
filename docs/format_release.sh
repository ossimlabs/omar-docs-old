#! /bin/bash

#This script takes out unnecessary Confluence tokens from the copied and pasted sprint's Confluence Change log page

if [[ $# -lt 1 ]]; then
	sed -i 's/[0-9]*\ issues*\ \ Refresh//g' index.md
	sed -i 's/Change\ Log//' index.md
	sed -i 's/No\ issues\ found\ \ Refresh//g' index.md



else
	sed -i 's/[0-9]*\ issues*\ \ Refresh//g' ${1}
	sed -i 's/Change\ Log//' ${1}
	sed -i 's/No\ issues\ found\ \ Refresh//g' ${1}
fi



