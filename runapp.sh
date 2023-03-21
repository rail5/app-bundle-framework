#!/bin/bash

read_dom () {
	local IFS=\>
	read -d \< ENTITY CONTENT
}

appname=""
appmain=""
appicon=""

while read_dom; do
	if [[ $ENTITY = "name" ]]; then
		appname=$CONTENT
	fi

	if [[ $ENTITY = "main" ]]; then
		appmain=$CONTENT
	fi
	
	if [[ $ENTITY = "icon" ]]; then
		appicon=$CONTENT
	fi
done < $1/appinfo

echo "Name: $appname"
echo "Binary: $appmain"
echo "Icon: $appicon"

echo ""
echo "Setting CWD"
cd $1
echo ""
echo "Marking as executable"
chmod +x ./bin/*
chmod +x ./libs/*
echo ""
echo "Running"
PATH=$(pwd)/bin:$PATH LD_LIBRARY_PATH="$(pwd)/libs:$LD_LIBRARY_PATH" $appmain
