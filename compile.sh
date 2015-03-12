printf "\n\n*Last updated `date +"%b %Y"`*" >> index.txt
rst2html --stylesheet=pwilton.css --initial-header-level=2 --link-stylesheet index.txt > index.html
#rst2html --stylesheet=pwilton_left.css --initial-header-level=2 --link-stylesheet index.txt > index.html
for it in `cat italicized_words.txt`
do
	sed -i "s/${it}/\<em\>${it}\<\/em\>/g" index.html
done

sed -i'.bu' '/\*Last updated/d' index.txt
sed -i'.bu' -e :a -e '/^\n*$/{$d;N;};/\n$/ba' index.txt
