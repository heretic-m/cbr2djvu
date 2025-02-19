#!/bin/sh

if [ "$#" -ne 1 ]
then
	echo "Usage: sh $0 name.cbr"
	exit
fi

tmpdir=$(mktemp -d)

unrar e "$(dirname "$0")"/"$1" "$tmpdir"
for x in "$tmpdir"/*.jpg; do c44 -dpi 300 -slice 72+11+10+10 -bpp 0.25,0.5,1 $x ; done
djvm -c "$(dirname "$0")"/"$1".djvu "$tmpdir"/*.djvu

rm -r "$tmpdir"
