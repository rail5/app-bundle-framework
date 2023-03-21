#!/bin/bash

read_dom () {
	local IFS=\>
	read -d \( ENTITY CONTENT
}

packfile () {
	libs=`ldd "$2"`
	echo $libs > libs

	mkdir -p $1.app/bin
	mkdir $1.app/libs
	mkdir $1.app/resources

	while read_dom; do
		cp $CONTENT $1.app/libs/
	done < libs

	cp $2 $1.app/bin/
	
	interpreter=`readelf -l $1.app/bin/$2 | grep interpreter | grep -oP ": (.*?)]" | head -c -2 | tail -c +3`
	
	interpreter_basename=$(basename $interpreter)
	
	cp $interpreter $1.app/libs/
	
	patchelf --set-interpreter ./libs/$interpreter_basename --set-rpath ./libs/ $1.app/bin/$2

}

more_deps () {

	package="$1"

	further=0

	while true; do
		read -p "Are there any more EXECUTABLE dependencies? (y/n) " yn
		case $yn in
			[Yy]* ) further=1; break;;
			[Nn]* ) exit 0; break;;
			* ) echo "Answer yes or no";;
		esac
	done
	
	if [[ further -eq 1 ]]; then
		while true; do
			read -p "Please specify the full path of the executable dependency: " depbinary
			case $depbinary in
				* ) break;;
			esac
		done
		
		packfile $package $depbinary
	fi
	
	more_deps $1
}

packfile $1 $1

echo "<app>" > $1.app/appinfo
echo "	<name>$1</name>" >> $1.app/appinfo
echo "	<main>bin/$1</main>" >> $1.app/appinfo
echo "</app>" >> $1.app/appinfo

more_deps $1
