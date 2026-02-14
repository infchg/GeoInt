

magick  4-8-4.png -font Madan  -gravity Northwest -pointsize 18 -annotate +85+70 "🇳🇴"   -gravity Northwest -pointsize 18 -annotate +190+60 "🇸🇪se"   -gravity Northwest -pointsize 18 -annotate +70+220 "🇩🇰✅"   flagged_4-8-4.png #% for CC ISO2 codes only


 curl "https://www.juntadeandalucia.es/medioambiente/mapwms/REDIAM_zonas_inundables_Andalucia?service=WMS&version=1.3.0&request=GetMap&layers=zonas_inundables_andalucia&styles=&bbox=300000,4075000,320000,4095000&width=1024&height=768&crs=EPSG:25830&format=image/png&transparent=true"  -o a.png
 #% example querying GIS API


for a in EH UN MA ML DZ MO PT ES DK SE NO FR CH AT IT DE NE BE GB UK PO CZ SL SK HU HR TU LY MT EI; do echo $a; done

a='EH' && printf -v FL  $(printf '\\U%08X\\U%08X' $((0x1F1E6 + $(printf '%d' "'${a:0:1}") - 65))  $((0x1F1E6 + $(printf '%d' \'${a:1:1}) - 65)) )  && echo $FL
🇪🇭

for a in MR ML DZ EH UN MA PT ES DK SE NO FR CH AT IT DE NE BE GB PL CZ SI SK HU HR TN LY MT IE  TD AL GR BA RS   LU LI SM AD JE GI VA ; do (printf -v FL  $(printf '\\U%08X\\U%08X' $((0x1F1E6 + $(printf '%d' "'${a:0:1}") - 65))  $((0x1F1E6 + $(printf '%d' \'${a:1:1}) - 65)) )  && echo $FL) ; done
  
🇲🇷
🇲🇱
🇩🇿
🇪🇭
🇺🇳
🇲🇦
🇵🇹
🇪🇸
🇩🇰
🇸🇪
🇳🇴
🇫🇷
🇨🇭
🇦🇹
🇮🇹
🇩🇪
🇳🇪
🇧🇪
🇬🇧
🇵🇱
🇨🇿
🇸🇮
🇸🇰
🇭🇺
🇭🇷
🇹🇳
🇱🇾
🇲🇹
🇮🇪
🇹🇩
🇦🇱
🇬🇷
🇧🇦
🇷🇸
🇱🇺
🇱🇮
🇸🇲
🇦🇩
🇯🇪
🇬🇮
🇻🇦

grep EH  2prod/geo-gis/data/iso3*
 2prod/geo-gis/data/iso3166.cc: Western Sahara	EH	ESH	732	ISO 3166-2:EH	No
 2prod/geo-gis/data/iso3iban.tsv:Western Sahara	EH	ESH	732
 
 
 

gimp flagsW.png 
 #/ all flags vertically

magick flagsW.png -crop 40x20  o-%d.png  #/ all flags o-0 to o40 


t=0; for a in MR ML DZ EH UN MA PT ES DK SE NO FR CH AT IT DE NE BE GB PL CZ SI SK HU HR TN LY MT IE TD AL GR BA RS   LU LI SM AD JE GI VA ; do echo mv o-$t.png $a.png && t=$( <<< 1+$t bc) ; done | bash  #/ rename by CC


---

grep -ie eston -e monten -e bosn -e latv ~/Jua/2prod/geo-gis/data/iso3iban.tsv
Bosnia and Herzegovina	BA	BIH	070
Estonia	EE	EST	233
Latvia	LV	LVA	428
Montenegro	ME	MNE	499


for a in  RU NE NL MC BA EE LV ME  ;  do (printf -v FL  $(printf '\\U%08X\\U%08X' $((0x1F1E6 + $(printf '%d' "'${a:0:1}") - 65))  $((0x1F1E6 + $(printf '%d' \'${a:1:1}) - 65)) )  && echo -n " $FL ") ; done; echo
 🇷🇺  🇳🇪  🇳🇱  🇲🇨  🇧🇦  🇪🇪  🇱🇻  🇲🇪 


pango-view  -qt " 🇷🇺  🇳🇪  🇳🇱  🇲🇨  🇧🇦  🇪🇪  🇱🇻  🇲🇪 " -o flags.png



for a in FI IS SK MT  RU NE NL MC BA EE LV ME  ;  do (printf -v FL  $(printf '\\U%08X\\U%08X' $((0x1F1E6 + $(printf '%d' "'${a:0:1}") - 65))  $((0x1F1E6 + $(printf '%d' \'${a:1:1}) - 65)) )  && echo -n " $FL ") ; done; echo
 🇫🇮  🇮🇸  🇸🇰  🇲🇹  🇷🇺  🇳🇪  🇳🇱  🇲🇨  🇧🇦  🇪🇪  🇱🇻  🇲🇪 


pango-view  -qt " 🇫🇮  🇮🇸  🇸🇰  🇲🇹  🇷🇺  🇳🇪  🇳🇱  🇲🇨  🇧🇦  🇪🇪  🇱🇻  🇲🇪 " -o flags.png

