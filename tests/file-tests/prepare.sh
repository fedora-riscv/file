#!/bin/bash

rm -rf runtest.sh db tmp
git clone https://github.com/file/file-tests.git
cp -a file-tests/db .
rm -rf file-tests

blacklist=`python -c 'from readfile import *; print " ".join(main())'`

printf "#!/bin/bash

mkdir tmp
cd db
for d in * ; do
	mkdir ../tmp/\$d
	for f in \$d/* ; do
		if [[ \${f: -11} != \".source.txt\" ]]; then
			file \$1 \$f | sed -n -e \"s:\$f\: ::p\" | sed 's/,//g' > ../tmp/\$f.my
		fi
	done
done

cd ..

. /usr/bin/rhts-environment.sh 
. /usr/share/beakerlib/beakerlib.sh 

PACKAGE=\"file\"

rlJournalStart

	rlPhaseStartSetup
        rlAssertRpm \$PACKAGE
    rlPhaseEnd\n\n" > runtest.sh

cd db

for d in * ; do
	printf "    rlPhaseStartTest \"$d\"\n" >> ../runtest.sh
	for f in $d/* ; do
		if [[ ${f: -11} != ".source.txt" && "${blacklist[*]}" != *"$f"* ]]; then
			printf "        rlAssertNotDiffer \"reference/$f.ref\" \"tmp/$f.my\"\n" >> ../runtest.sh
		fi
	done
	printf "    rlPhaseEnd\n\n" >> ../runtest.sh
done

cd ..

printf "    rlJournalPrintText
rlJournalEnd
rm -rf tmp" >> runtest.sh

chmod +x runtest.sh
