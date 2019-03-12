#!/bin/bash

rm -rf reference db
git clone https://github.com/file/file-tests.git
cp -a file-tests/db .
rm -rf file-tests

mkdir reference
cd db
for d in * ; do
	mkdir ../reference/$d
	for f in $d/* ; do
		if [[ ${f: -11} != ".source.txt" ]]; then
			file $1 $f | sed -n -e "s:$f\: ::p" | sed 's/,//g' > ../reference/$f.ref
		fi
	done
done

cd ..
rm -rf db