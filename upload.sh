#!/bin/bash

find www -name "*.html" -exec sed -i "s/periodic.winuxdroid.com//g" \{\} \;

for foo in `find www -type f -not -name "*.gz"`; do gzip -c --best $foo > $foo.gz; done

rsync -e ssh \
	--recursive \
	--stats \
	--verbose \
	--times \
	--delete-after \
	--update \
	www/ \
	vps.kle.cz:/home/www/periodic.winuxdroid.com/
