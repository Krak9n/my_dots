cd ~/
# sorting my text files with adding date 
for f in *.txt 
do 
   mv -v "$f" ~/not_important/not_important_text_files/"${f%.txt}"$(date +%m%d%y).txt
done
# sorting my docx files with adding date
for m in *.docx 
do 
   mv -v "$m" ~/not_important/not_important_text_files/"${m%.docx}"$(date +%m%d%y).docx
done

# videos, images and other stuff sorting without anything else

for v in *.mkv
do 
   mv -v "$v" ~/not_important/non_important_videos/
done

cd ~
mv *.png *.jpg *.jpeg ~/not_important/not_important_photos/

cd ~/Downloads/telegram_desktop/
mv *.mkv ~/movies_and_series/
