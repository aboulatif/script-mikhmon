user docker : latif225
mot de passe : Mamba@19041986 (bambaaboulatif@gmail.com
https://mikrotik.xyz/mikrotik/mikrotik-hosting-docker/

Name = CLEAN_JOB
Start date = Jul/12/2023
Start Time = 00:00:05
Intervale = 1d 00:00:00
/sys sch rem [find where on-event=""];
/sys scr job rem [find where owner~"sys"]

https://www.tubeguruji.com/tubeguruji-pro
https://www.youtube.com/watch?v=wL534EBuEPg









add mac cookie = 365d ====3heure

:put (",remc,100,3h,,,Disable,"); {:local date [ /system clock get date ];:if ([:pick $date 4 5] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $date 8 10];:local bulan [:pick $date 5 7];:local tahun [:pick $date 0 4];:local bln ($arraybln->$bulan);:set $date ($bln."/".$tgl."/".$tahun);};:local year [ :pick $date 7 11 ];:local month [ :pick $date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find where name="$user"] comment]; :local ucode [:pic $comment 0 2]; :if ($ucode = "vc" or $ucode = "up" or $comment = "") do={ /sys sch add name="$user" disable=no start-date=$date interval="3h"; :delay 2s; :local exp [ /sys sch get [ /sys sch find where name="$user" ] next-run];:if ([:pick $exp 2 3] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $exp 3 5];:local bulan [:pick $exp 0 2];:local bln ($arraybln->$bulan);:local jam [:pick $exp 6 14];:set $exp ($bln."/".$tgl." ".$jam);};:if ([:pick $exp 4 5] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $exp 8 10];:local bulan [:pick $exp 5 7];:local tahun [:pick $exp 0 4];:local bln ($arraybln->$bulan);:local jam [:pick $exp 6 14];:set $exp ($bln."/".$tgl."/".$tahun." ".$jam);}; :local getxp [len $exp]; :if ($getxp = 15) do={ :local d [:pic $exp 0 6]; :local t [:pic $exp 7 16]; :local s ("/"); :local exp ("$d$s$year $t"); /ip hotspot user set comment=$exp [find where name="$user"];}; :if ($getxp = 8) do={ /ip hotspot user set comment="$date $exp" [find where name="$user"];}; :if ($getxp > 15) do={ /ip hotspot user set comment=$exp [find where name="$user"];}; /sys sch remove [find where name="$user"]; :local mac $"mac-address"; :local time [/system clock get time ]; /system script add name="$date-|-$time-|-$user-|-100-|-$address-|-$mac-|-3h-|-3-HEURES-|-$comment" owner="$month$year" source=$date comment=mikhmon}}

2 jours
:put (",remc,300,2d,,,Disable,"); {:local date [ /system clock get date ];:if ([:pick $date 4 5] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $date 8 10];:local bulan [:pick $date 5 7];:local tahun [:pick $date 0 4];:local bln ($arraybln->$bulan);:set $date ($bln."/".$tgl."/".$tahun);};:local year [ :pick $date 7 11 ];:local month [ :pick $date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find where name="$user"] comment]; :local ucode [:pic $comment 0 2]; :if ($ucode = "vc" or $ucode = "up" or $comment = "") do={ /sys sch add name="$user" disable=no start-date=$date interval="2d"; :delay 2s; :local exp [ /sys sch get [ /sys sch find where name="$user" ] next-run];:if ([:pick $exp 2 3] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $exp 3 5];:local bulan [:pick $exp 0 2];:local bln ($arraybln->$bulan);:local jam [:pick $exp 6 14];:set $exp ($bln."/".$tgl." ".$jam);};:if ([:pick $exp 4 5] = "-") do={:local arraybln {"01"="jan";"02"="feb";"03"="mar";"04"="apr";"05"="may";"06"="jun";"07"="jul";"08"="aug";"09"="sep";"10"="oct";"11"="nov";"12"="dec"};:local tgl [:pick $exp 8 10];:local bulan [:pick $exp 5 7];:local tahun [:pick $exp 0 4];:local bln ($arraybln->$bulan);:local jam [:pick $exp 6 14];:set $exp ($bln."/".$tgl."/".$tahun." ".$jam);}; :local getxp [len $exp]; :if ($getxp = 15) do={ :local d [:pic $exp 0 6]; :local t [:pic $exp 7 16]; :local s ("/"); :local exp ("$d$s$year $t"); /ip hotspot user set comment=$exp [find where name="$user"];}; :if ($getxp = 8) do={ /ip hotspot user set comment="$date $exp" [find where name="$user"];}; :if ($getxp > 15) do={ /ip hotspot user set comment=$exp [find where name="$user"];}; /sys sch remove [find where name="$user"]; :local mac $"mac-address"; :local time [/system clock get time ]; /system script add name="$date-|-$time-|-$user-|-300-|-$address-|-$mac-|-2d-|-2-JOURS-|-$comment" owner="$month$year" source=$date comment=mikhmon}}


v7.8-v7.9
:put (",remc,200,1d,200,,Disable,"); {:local date [ /system clock get date ];:local year [ :pick $date 7 11 ];:local month [ :pick $date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find where name="$user"] comment]; :local ucode [:pic $comment 0 2]; :if ($ucode = "vc" or $ucode = "up" or $comment = "") do={ /sys sch add name="$user" disable=no start-date=$date interval="1d"; :delay 2s; :local exp [ /sys sch get [ /sys sch find where name="$user" ] next-run]; :local getxp [len $exp]; :if ($getxp = 15) do={ :local d [:pic $exp 0 6]; :local t [:pic $exp 7 16]; :local s ("/"); :local exp ("$d$s$year $t"); /ip hotspot user set comment=$exp [find where name="$user"];}; :if ($getxp = 8) do={ /ip hotspot user set comment="$date $exp" [find where name="$user"];}; :if ($getxp > 15) do={ /ip hotspot user set comment=$exp [find where name="$user"];}; /sys sch remove [find where name="$user"]; :local mac $"mac-address"; :local time [/system clock get time ]; /system script add name="$date-|-$time-|-$user-|-200-|-$address-|-$mac-|-1d-|-01-JOUR-|-$comment" owner="$month$year" source=$date comment=mikhmon}}
