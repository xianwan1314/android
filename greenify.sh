#!/bin/bash

rm /sdcard/Download/ext/temp/g 2>/dev/null
rm /sdcard/Download/ext/temp/g1 2>/dev/null
rm /sdcard/Download/ext/temp/g2 2>/dev/null
rm /sdcard/Download/ext/temp/g3 2>/dev/null
rm /sdcard/Download/ext/temp/g4 2>/dev/null
rm /sdcard/Download/ext/temp/g5 2>/dev/null
rm /sdcard/Download/ext/temp/g6 2>/dev/null
rm -rf /sdcard/Download/ext/temp/META-INF 2>/dev/null
rm -rf /sdcard/Download/ext/temp/system 2>/dev/null

wget -O - https://dl-android.com/p/index.php?id=greenify-apk > /sdcard/Download/ext/temp/g
grep "Download Free Greenify" /sdcard/Download/ext/temp/g > /sdcard/Download/ext/temp/g1
perl -pe '($_)=/([0-9]+([.][0-9]+)+)/' /sdcard/Download/ext/temp/g1 > /sdcard/Download/ext/temp/g2
a=`cat /sdcard/Download/ext/temp/g2`

aapt dump badging /system/priv-app/Greenify/*.apk > /sdcard/Download/ext/temp/g3
grep "versionName" /sdcard/Download/ext/temp/g3 > /sdcard/Download/ext/temp/g4
perl -pe '($_)=/([0-9]+([.][0-9]+)+)/' /sdcard/Download/ext/temp/g4 > /sdcard/Download/ext/temp/g5
b=`cat /sdcard/Download/ext/temp/g5`

function version {
echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'
}

if [ $(version $a) -gt $(version $b) ]
then
	grep "dl-android.com" /sdcard/Download/ext/temp/g > /sdcard/Download/ext/temp/g6
	sed -i 's+apk.*+apk+g; s+^.*http+http+g' /sdcard/Download/ext/temp/g6
	d=`cat /sdcard/Download/ext/temp/g6`
	wget  -P /sdcard/Download "$d"
	unzip -qq -o /sdcard/tweak-havoc-capricorn-q-part1.zip -d /sdcard/Download/ext/temp
	mv -f /sdcard/Download/Greenify*.apk /sdcard/Download/ext/temp/system/priv-app/Greenify
	cd /sdcard/Download/ext/temp
	zip -r "tweak-havoc-capricorn-q-part1.zip" META-INF system
	rm -rf /sdcard/Download/ext/temp/META-INF
	rm -rf /sdcard/Download/ext/temp/system
	rm /sdcard/tweak-havoc-capricorn-q-part1.zip
	mv -f /sdcard/Download/ext/temp/tweak-havoc-capricorn-q-part1.zip /sdcard
	echo "•Greenify-v$b --> Greenify-v$a" >> /sdcard/Download/ext/temp/log
else
	echo "•Greenify: Không có cập nhật mới." >> /sdcard/Download/ext/temp/log
fi

rm /sdcard/Download/ext/temp/g 2>/dev/null
rm /sdcard/Download/ext/temp/g1 2>/dev/null
rm /sdcard/Download/ext/temp/g2 2>/dev/null
rm /sdcard/Download/ext/temp/g3 2>/dev/null
rm /sdcard/Download/ext/temp/g4 2>/dev/null
rm /sdcard/Download/ext/temp/g5 2>/dev/null
rm /sdcard/Download/ext/temp/g6 2>/dev/null
rm -rf /sdcard/Download/ext/temp/META-INF 2>/dev/null
rm -rf /sdcard/Download/ext/temp/system 2>/dev/null