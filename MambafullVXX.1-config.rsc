# 2025-07-23 18:04:38 by RouterOS 7.18.1
# software id = 8F6M-MUZK
#
# model = RB3011UiAS
# serial number = B88D0A6EDF25
/interface bridge
add name=DOCKERS
add name=HOTSPOT
/interface ethernet
set [ find default-name=ether1 ] name=E1-WAN-FAI
/interface veth
add address=11.11.11.11/28 gateway=11.11.11.1 gateway6="" name=MIKHMON
/interface list
add name=WAN
add name=LAN
/ip hotspot profile
add hotspot-address=10.0.0.1 html-directory-override=hotspot \
    install-hotspot-queue=yes name=MIRADOR-WIFI
/ip pool
add name=POOL-HOTSPOT ranges=10.0.0.2-10.255.255.254
/ip dhcp-server
add address-pool=POOL-HOTSPOT interface=HOTSPOT name=dhcp1
/ip hotspot
add address-pool=POOL-HOTSPOT addresses-per-mac=1 disabled=no interface=\
    HOTSPOT name=hotspot1 profile=MIRADOR-WIFI
/ip hotspot user profile
add address-pool=POOL-HOTSPOT name=01-JOUR on-login=":put (\",remc,200,1d,200,\
    ,Disable,\"); {:local datamitha;:local date [ /system clock get date ];:if\
    \_([:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\
    \"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"\
    =\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\
    \"=\"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$date 5 7]\
    ;:local tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:set \$d\
    ate (\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date 7 11 ];\
    :local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user get [/\
    ip hotspot user find where name=\"\$user\"] comment]; :local ucode [:pic \
    \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \
    \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$date inter\
    val=\"1d\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where nam\
    e=\"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:local arra\
    ybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\
    \"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"\
    =\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:loc\
    al bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bln (\$ar\
    raybln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\"/\".\$\
    tgl.\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"-\") do=\
    {:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"ap\
    r\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"s\
    ep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp\
    \_3 5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bulan);:lo\
    cal jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$jam);};:i\
    f ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\
    \"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"\
    =\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\
    \"=\"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp 5 7];:\
    local tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:local jam \
    [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \".\$jam\
    );};};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$e\
    xp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$\
    s\$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$us\
    er\"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) do={ /ip \
    hotspot user set comment=\"\$date \$exp\" [find where name=\"\$user\"];:se\
    t datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspot user s\
    et comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$exp\";};:\
    local waktu [/system clock get time ];:local macmitha \$\"mac-address\";:l\
    ocal profilemitha [ /ip hotspot user get [/ip hotspot user find where name\
    =\"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]; :local\
    \_mac \$\"mac-address\"; :local time [/system clock get time ]; /system sc\
    ript add name=\"\$date-|-\$time-|-\$user-|-200-|-\$address-|-\$mac-|-1d-|-\
    01-JOUR-|-\$comment\" owner=\"\$month\$year\" source=\$date comment=mikhmo\
    n}}\r\
    \n" parent-queue=none
add address-pool=POOL-HOTSPOT name=05-JOURS on-login=":put (\",remc,500,5d,500\
    ,,Disable,\"); {:local datamitha;:local date [ /system clock get date ];:i\
    f ([:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\
    \"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"\
    =\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\
    \"=\"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$date 5 7]\
    ;:local tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:set \$d\
    ate (\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date 7 11 ];\
    :local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user get [/\
    ip hotspot user find where name=\"\$user\"] comment]; :local ucode [:pic \
    \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \
    \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$date inter\
    val=\"5d\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where nam\
    e=\"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:local arra\
    ybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\
    \"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"\
    =\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:loc\
    al bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bln (\$ar\
    raybln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\"/\".\$\
    tgl.\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"-\") do=\
    {:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"ap\
    r\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"s\
    ep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp\
    \_3 5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bulan);:lo\
    cal jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$jam);};:i\
    f ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\
    \"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"\
    =\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\
    \"=\"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp 5 7];:\
    local tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:local jam \
    [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \".\$jam\
    );};};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$e\
    xp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$\
    s\$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$us\
    er\"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) do={ /ip \
    hotspot user set comment=\"\$date \$exp\" [find where name=\"\$user\"];:se\
    t datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspot user s\
    et comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$exp\";};:\
    local waktu [/system clock get time ];:local macmitha \$\"mac-address\";:l\
    ocal profilemitha [ /ip hotspot user get [/ip hotspot user find where name\
    =\"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]; :local\
    \_mac \$\"mac-address\"; :local time [/system clock get time ]; /system sc\
    ript add name=\"\$date-|-\$time-|-\$user-|-500-|-\$address-|-\$mac-|-5d-|-\
    05-JOURS-|-\$comment\" owner=\"\$month\$year\" source=\$date comment=mikhm\
    on}}\r\
    \n" parent-queue=none
add address-pool=POOL-HOTSPOT name=01-SEMAINE on-login=":put (\",remc,700,7d,7\
    00,,Disable,\"); {:local datamitha;:local date [ /system clock get date ];\
    :if ([:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\
    \"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"0\
    7\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"\
    12\"=\"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$date 5 \
    7];:local tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:set \
    \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date 7 11\
    \_];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user ge\
    t [/ip hotspot user find where name=\"\$user\"] comment]; :local ucode [:p\
    ic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment \
    = \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$date int\
    erval=\"7d\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where n\
    ame=\"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:local ar\
    raybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"\
    =\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\
    \"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:l\
    ocal bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bln (\$\
    arraybln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\"/\".\
    \$tgl.\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"-\") d\
    o={:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"\
    apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\
    \"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$\
    exp 3 5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bulan);:\
    local jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$jam);};\
    :if ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"\
    =\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\
    \"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"1\
    2\"=\"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp 5 7];\
    :local tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:local jam\
    \_[:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \".\$j\
    am);};};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \
    \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$\
    d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\
    \$user\"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) do={ \
    /ip hotspot user set comment=\"\$date \$exp\" [find where name=\"\$user\"]\
    ;:set datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspot us\
    er set comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$exp\"\
    ;};:local waktu [/system clock get time ];:local macmitha \$\"mac-address\
    \";:local profilemitha [ /ip hotspot user get [/ip hotspot user find where\
    \_name=\"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]; \
    :local mac \$\"mac-address\"; :local time [/system clock get time ]; /syst\
    em script add name=\"\$date-|-\$time-|-\$user-|-700-|-\$address-|-\$mac-|-\
    7d-|-01-SEMAINE-|-\$comment\" owner=\"\$month\$year\" source=\$date commen\
    t=mikhmon}}\r\
    \n" parent-queue=none
add address-pool=POOL-HOTSPOT name=02-SEMAINES on-login=":put (\",remc,1000,14\
    d,1000,,Disable,\"); {:local datamitha;:local date [ /system clock get dat\
    e ];:if ([:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\
    \"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\"\
    ;\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\
    \";\"12\"=\"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$da\
    te 5 7];:local tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:\
    set \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date \
    7 11 ];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user\
    \_get [/ip hotspot user find where name=\"\$user\"] comment]; :local ucode\
    \_[:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$com\
    ment = \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$dat\
    e interval=\"14d\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find w\
    here name=\"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:lo\
    cal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\
    \"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\"\
    ;\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 1\
    0];:local bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bl\
    n (\$arraybln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\
    \"/\".\$tgl.\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"\
    -\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"0\
    4\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"\
    09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pi\
    ck \$exp 3 5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bul\
    an);:local jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$ja\
    m);};:if ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\
    \"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\"\
    ;\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\
    \";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp\
    \_5 7];:local tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:lo\
    cal jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \
    \".\$jam);};};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [\
    :pic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp \
    (\"\$d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [find where nam\
    e=\"\$user\"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) d\
    o={ /ip hotspot user set comment=\"\$date \$exp\" [find where name=\"\$use\
    r\"];:set datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspo\
    t user set comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$e\
    xp\";};:local waktu [/system clock get time ];:local macmitha \$\"mac-addr\
    ess\";:local profilemitha [ /ip hotspot user get [/ip hotspot user find wh\
    ere name=\"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]\
    ; :local mac \$\"mac-address\"; :local time [/system clock get time ]; /sy\
    stem script add name=\"\$date-|-\$time-|-\$user-|-1000-|-\$address-|-\$mac\
    -|-14d-|-02-SEMAINES-|-\$comment\" owner=\"\$month\$year\" source=\$date c\
    omment=mikhmon}}\r\
    \n" parent-queue=none
add address-pool=POOL-HOTSPOT name=01-MOIS on-login=":put (\",remc,2000,30d,20\
    00,,Disable,\"); {:local datamitha;:local date [ /system clock get date ];\
    :if ([:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\
    \"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"0\
    7\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"\
    12\"=\"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$date 5 \
    7];:local tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:set \
    \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date 7 11\
    \_];:local month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user ge\
    t [/ip hotspot user find where name=\"\$user\"] comment]; :local ucode [:p\
    ic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment \
    = \"\") do={ /sys sch add name=\"\$user\" disable=no start-date=\$date int\
    erval=\"30d\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where \
    name=\"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:local a\
    rraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\
    \"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"1\
    0\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:\
    local bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bln (\
    \$arraybln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\"/\
    \".\$tgl.\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"-\"\
    ) do={:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"\
    =\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\
    \"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick\
    \_\$exp 3 5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bula\
    n);:local jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$jam\
    );};:if ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"\
    02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\
    \"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\"\
    ;\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp 5\
    \_7];:local tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:loca\
    l jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \"\
    .\$jam);};};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:p\
    ic \$exp 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\
    \"\$d\$s\$year \$t\"); /ip hotspot user set comment=\$exp [find where name\
    =\"\$user\"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) do\
    ={ /ip hotspot user set comment=\"\$date \$exp\" [find where name=\"\$user\
    \"];:set datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspot\
    \_user set comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$e\
    xp\";};:local waktu [/system clock get time ];:local macmitha \$\"mac-addr\
    ess\";:local profilemitha [ /ip hotspot user get [/ip hotspot user find wh\
    ere name=\"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]\
    ; :local mac \$\"mac-address\"; :local time [/system clock get time ]; /sy\
    stem script add name=\"\$date-|-\$time-|-\$user-|-2000-|-\$address-|-\$mac\
    -|-30d-|-01-MOIS-|-\$comment\" owner=\"\$month\$year\" source=\$date comme\
    nt=mikhmon}}\r\
    \n" parent-queue=none
add address-pool=POOL-HOTSPOT name=05-MINS on-login=":put (\",remc,10,5m,10,,D\
    isable,\"); {:local datamitha;:local date [ /system clock get date ];:if (\
    [:pick \$date 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\"f\
    eb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"\
    jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\
    \"dec\"};:local tgl [:pick \$date 8 10];:local bulan [:pick \$date 5 7];:l\
    ocal tahun [:pick \$date 0 4];:local bln (\$arraybln->\$bulan);:set \$date\
    \_(\$bln.\"/\".\$tgl.\"/\".\$tahun);};:local year [ :pick \$date 7 11 ];:l\
    ocal month [ :pick \$date 0 3 ];:local comment [ /ip hotspot user get [/ip\
    \_hotspot user find where name=\"\$user\"] comment]; :local ucode [:pic \$\
    comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\
    \") do={ /sys sch add name=\"\$user\" disable=no start-date=\$date interva\
    l=\"5m\"; :delay 5s; :local exp [ /sys sch get [ /sys sch find where name=\
    \"\$user\" ] next-run];:if ([:pick \$exp 10 11] = \" \") do={:local arrayb\
    ln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"m\
    ay\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"\
    oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 8 10];:local \
    bulan [:pick \$exp 5 7];:local tahun [:pick \$exp 0 4];:local bln (\$array\
    bln->\$bulan);:local jam [:pick \$exp 11 19];:set \$exp (\$bln.\"/\".\$tgl\
    .\"/\".\$tahun.\" \".\$jam);} else={:if ([:pick \$exp 2 3] = \"-\") do={:l\
    ocal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\"\
    ;\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\
    \";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$exp 3\
    \_5];:local bulan [:pick \$exp 0 2];:local bln (\$arraybln->\$bulan);:loca\
    l jam [:pick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\" \".\$jam);};:if \
    ([:pick \$exp 4 5] = \"-\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\"f\
    eb\";\"03\"=\"mar\";\"04\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"\
    jul\";\"08\"=\"aug\";\"09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\
    \"dec\"};:local tgl [:pick \$exp 8 10];:local bulan [:pick \$exp 5 7];:loc\
    al tahun [:pick \$exp 0 4];:local bln (\$arraybln->\$bulan);:local jam [:p\
    ick \$exp 6 14];:set \$exp (\$bln.\"/\".\$tgl.\"/\".\$tahun.\" \".\$jam);}\
    ;};:local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp \
    0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$\
    year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\
    \"];:set datamitha (\"\$d\$s\$year \$t\");}; :if (\$getxp = 8) do={ /ip ho\
    tspot user set comment=\"\$date \$exp\" [find where name=\"\$user\"];:set \
    datamitha \"\$date \$exp\";}; :if (\$getxp > 15) do={ /ip hotspot user set\
    \_comment=\$exp [find where name=\"\$user\"];:set datamitha \"\$exp\";};:l\
    ocal waktu [/system clock get time ];:local macmitha \$\"mac-address\";:lo\
    cal profilemitha [ /ip hotspot user get [/ip hotspot user find where name=\
    \"\$user\"] profile];/sys sch remove [find where name=\"\$user\"]; :local \
    mac \$\"mac-address\"; :local time [/system clock get time ]; /system scri\
    pt add name=\"\$date-|-\$time-|-\$user-|-10-|-\$address-|-\$mac-|-5m-|-05-\
    MINS-|-\$comment\" owner=\"\$month\$year\" source=\$date comment=mikhmon}}\
    \r\
    \n" parent-queue=none
/port
set 0 name=serial0
/container
add interface=MIKHMON root-dir=usb1/mikhmonv3 start-on-boot=yes workdir=/src
/container config
set registry-url=https://registry-1.docker.io tmpdir=usb1/pull
/interface bridge port
add bridge=HOTSPOT interface=ether2
add bridge=HOTSPOT interface=ether3
add bridge=HOTSPOT interface=ether4
add bridge=HOTSPOT interface=ether5
add bridge=HOTSPOT interface=ether6
add bridge=HOTSPOT interface=ether7
add bridge=HOTSPOT interface=ether8
add bridge=HOTSPOT interface=ether9
add bridge=HOTSPOT interface=ether10
add bridge=DOCKERS interface=MIKHMON
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface list member
add interface=E1-WAN-FAI list=WAN
add interface=HOTSPOT list=LAN
/ip address
add address=10.0.0.1/8 interface=HOTSPOT network=10.0.0.0
add address=11.11.11.1/28 interface=DOCKERS network=11.11.11.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add interface=E1-WAN-FAI
/ip dhcp-server network
add address=10.0.0.0/8 dns-server=10.0.0.1,1.1.1.1 gateway=10.0.0.1 netmask=8
/ip dns
set allow-remote-requests=yes servers=208.67.222.222,8.8.8.8
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=accept chain=output comment="Section Break" disabled=yes
add action=drop chain=input comment="Drop Invalid Connections" \
    connection-state=invalid
add action=drop chain=forward comment="Drop Invalid Connections" \
    connection-state=invalid
add action=accept chain=output comment="Section Break" disabled=yes
add action=accept chain=output comment="Section Break" disabled=yes
add action=drop chain=forward disabled=yes dst-port=\
    !0-1024,8291,5900,5800,3389,14147,5222,59905 protocol=tcp \
    src-address-list=Torrent-Conn
add action=drop chain=forward disabled=yes dst-port=\
    !0-1024,8291,5900,5800,3389,14147,5222,59905 protocol=udp \
    src-address-list=Torrent-Conn
add action=drop chain=forward disabled=yes src-address-list=Torrent-Conn-site
add action=accept chain=output comment="Section Break" disabled=yes
add action=jump chain=forward connection-state=new jump-target=block-ddos
add action=drop chain=forward connection-state=new dst-address-list=ddosed \
    src-address-list=ddoser
add action=return chain=block-ddos dst-limit=50,50,src-and-dst-addresses/10s
add action=add-dst-to-address-list address-list=ddosed address-list-timeout=\
    1d chain=block-ddos
add action=add-src-to-address-list address-list=ddoser address-list-timeout=\
    1d chain=block-ddos
add action=accept chain=output comment="Section Break" disabled=yes
add action=drop chain=input comment="BLOCK DNS REQUEST ON WAN INTERFACE" \
    dst-port=53 in-interface=E1-WAN-FAI protocol=tcp
add action=drop chain=input comment="BLOCK DNS REQUEST ON WAN INTERFACE" \
    dst-port=53 in-interface=E1-WAN-FAI protocol=udp
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="Port scanners to list " \
    protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="NMAP FIN Stealth scan" \
    protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="SYN/FIN scan" protocol=tcp \
    tcp-flags=fin,syn
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="SYN/RST scan" protocol=tcp \
    tcp-flags=syn,rst
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="FIN/PSH/URG scan" protocol=\
    tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=30m chain=input comment="ALL/ALL scan" protocol=tcp \
    tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list="port scanners" \
    address-list-timeout=2m chain=input comment="NMAP NULL scan" protocol=tcp \
    tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment="ping port scanners" disabled=yes \
    src-address-list="port scanners"
add action=accept chain=output comment="Section Break" disabled=yes
add action=add-src-to-address-list address-list=SSH_BlackList_1 \
    address-list-timeout=1m chain=input comment=\
    "Drop SSH&TELNET Brute Forcers" connection-state=new dst-port=22-23 \
    protocol=tcp
add action=add-src-to-address-list address-list=SSH_BlackList_2 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22-23 \
    protocol=tcp src-address-list=SSH_BlackList_1
add action=add-src-to-address-list address-list=SSH_BlackList_3 \
    address-list-timeout=1m chain=input connection-state=new dst-port=22-23 \
    protocol=tcp src-address-list=SSH_BlackList_2
add action=add-src-to-address-list address-list=IP_BlackList \
    address-list-timeout=1d chain=input connection-state=new dst-port=22-23 \
    protocol=tcp src-address-list=SSH_BlackList_3
add action=drop chain=input dst-port=22-23 protocol=tcp src-address-list=\
    IP_BlackList
add action=accept chain=output comment="Section Break" disabled=yes
add action=accept chain=output comment="Section Break" disabled=yes
add action=drop chain=input comment=drop_inconnu_mikhmon dst-address-list=\
    !IP2Location_CI dst-port=8088 in-interface-list=WAN protocol=tcp
/ip firewall mangle
add action=change-ttl chain=postrouting new-ttl=set:1 out-interface=HOTSPOT \
    passthrough=no
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=E1-WAN-FAI
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.0.0.0/8
add action=masquerade chain=srcnat comment="Docker NAT" src-address=\
    11.11.11.0/28
add action=dst-nat chain=dstnat comment="ACCES DISTANT" dst-port=8088 \
    protocol=tcp to-addresses=11.11.11.11 to-ports=80
add action=dst-nat chain=dstnat comment="Docker NAT" dst-address=10.0.0.1 \
    dst-port=8087 protocol=tcp to-addresses=11.11.11.11 to-ports=80
/ip firewall raw
add action=accept chain=prerouting dst-port=8291 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=8728 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=22 in-interface-list=WAN protocol=\
    tcp
add action=drop chain=prerouting dst-port=21 in-interface-list=WAN protocol=\
    tcp
add action=drop chain=prerouting dst-port=23 in-interface-list=WAN protocol=\
    tcp
add action=drop chain=prerouting dst-port=80 in-interface-list=WAN protocol=\
    tcp
add action=drop chain=prerouting dst-port=443 in-interface-list=WAN protocol=\
    tcp
add action=drop chain=prerouting dst-port=8080 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=8728 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=8729 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=8087 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=53 in-interface-list=WAN protocol=\
    udp
add action=drop chain=prerouting dst-port=162 in-interface-list=WAN protocol=\
    udp
add action=drop chain=prerouting dst-port=161 in-interface-list=WAN protocol=\
    udp
/ip hotspot user
add name=admin
add comment=vc-265-07.23.25- name=1jnkbj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrjdf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtfx2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1ja7pg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnfwv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfeb9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjih7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfr8v profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9agm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jufrs profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8sxi profile=01-JOUR
add comment=vc-265-07.23.25- name=1jys3p profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8xsh profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3cua profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvbh3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jki55 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8gtk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkjcm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwt2z profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3gjg profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2hn4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jatky profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5e7m profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvkuh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpkg7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjrw6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jifjm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jaynk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jan2g profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjgm7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jp9zx profile=01-JOUR
add comment=vc-265-07.23.25- name=1j97mm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz5fc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jaibr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdy7p profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnh8i profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsir7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5788 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jb2hn profile=01-JOUR
add comment=vc-265-07.23.25- name=1j32pw profile=01-JOUR
add comment=vc-265-07.23.25- name=1jybmr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtj65 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8sd7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j26xh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwacs profile=01-JOUR
add comment=vc-265-07.23.25- name=1jibg2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j7hk8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw8e4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jevta profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgdfr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jykic profile=01-JOUR
add comment=vc-265-07.23.25- name=1jru7r profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzpwd profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjhxr profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2hat profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2jv6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jivv7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j45sr profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3neu profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6nea profile=01-JOUR
add comment=vc-265-07.23.25- name=1j52nt profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvsuc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmnrv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbgm6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzhei profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxffu profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpyth profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnvna profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrtu2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1juzi7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzbkt profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfty4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdz4j profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3r55 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jww2r profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm7kf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjge5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz8za profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxksy profile=01-JOUR
add comment=vc-265-07.23.25- name=1j78nj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmsax profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxuvj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhtjr profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3y4e profile=01-JOUR
add comment=vc-265-07.23.25- name=1jeiy4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3gtf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzcj9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzsvn profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6kjg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrjpf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmmij profile=01-JOUR
add comment=vc-265-07.23.25- name=1j53ix profile=01-JOUR
add comment=vc-265-07.23.25- name=1juiac profile=01-JOUR
add comment=vc-265-07.23.25- name=1j439t profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgwek profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6hjs profile=01-JOUR
add comment=vc-265-07.23.25- name=1j49bw profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjc92 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9wem profile=01-JOUR
add comment=vc-265-07.23.25- name=1jseux profile=01-JOUR
add comment=vc-265-07.23.25- name=1ju4n4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm8gb profile=01-JOUR
add comment=vc-265-07.23.25- name=1jn6wr profile=01-JOUR
add comment=vc-265-07.23.25- name=1juntc profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4ybv profile=01-JOUR
add comment=vc-265-07.23.25- name=1j94pe profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9rv7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j38iu profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmyx3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpkcm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jes6d profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgpu3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsift profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjpsd profile=01-JOUR
add comment=vc-265-07.23.25- name=1ju2tw profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrgb7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw3ms profile=01-JOUR
add comment=vc-265-07.23.25- name=1jp95y profile=01-JOUR
add comment=vc-265-07.23.25- name=1j332x profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrg55 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpi4g profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9bp6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmmmb profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm3pa profile=01-JOUR
add comment=vc-265-07.23.25- name=1jifbv profile=01-JOUR
add comment=vc-265-07.23.25- name=1ja8rg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jj2vr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhyce profile=01-JOUR
add comment=vc-265-07.23.25- name=1j27pt profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9eae profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxa83 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8h7s profile=01-JOUR
add comment=vc-265-07.23.25- name=1js8c9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtw5z profile=01-JOUR
add comment=vc-265-07.23.25- name=1j79dj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzxa2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jti5d profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4w9u profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrzzg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jyrr3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw7c7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwfed profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdy6s profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2v3g profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdnx3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9gcb profile=01-JOUR
add comment=vc-265-07.23.25- name=1jivz4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jriy3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jna96 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdnzs profile=01-JOUR
add comment=vc-265-07.23.25- name=1ji7y4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhdey profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdut2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9p3t profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdd7j profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdwu9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbeth profile=01-JOUR
add comment=vc-265-07.23.25- name=1jaex5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxmdu profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfdxk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjdd7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j46vn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtsig profile=01-JOUR
add comment=vc-265-07.23.25- name=1jabkw profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbpgs profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr66f profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhf4t profile=01-JOUR
add comment=vc-265-07.23.25- name=1jn6m9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8kuh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgdv9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6j8b profile=01-JOUR
add comment=vc-265-07.23.25- name=1j7m32 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6wch profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm2kz profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjybb profile=01-JOUR
add comment=vc-265-07.23.25- name=1j27id profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfar4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5g89 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkfba profile=01-JOUR
add comment=vc-265-07.23.25- name=1jen8a profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5rxh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsydm profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5xk7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jd3xp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxb52 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbdpn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxcsf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jj4bk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrmv2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jueat profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcsn4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jt3u6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jceje profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnhbw profile=01-JOUR
add comment=vc-265-07.23.25- name=1j744j profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxd8b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jznvx profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9cvf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrvbf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzaj7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpdkf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgs9m profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbpau profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbw2u profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsvu7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpbcp profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3fcu profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrvk7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcxh4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4wkd profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhdh3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jx2jd profile=01-JOUR
add comment=vc-265-07.23.25- name=1jj2v2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhkgf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jaf2y profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsur4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5d3g profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4d8k profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcmu3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jc2aj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jazp8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jd8m2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnghp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jn622 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jb6sy profile=01-JOUR
add comment=vc-265-07.23.25- name=1j7g45 profile=01-JOUR
add comment=vc-265-07.23.25- name=1js43y profile=01-JOUR
add comment=vc-265-07.23.25- name=1jciti profile=01-JOUR
add comment=vc-265-07.23.25- name=1je7f7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwpc3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6sr5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwbiv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jv3xm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzvw8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jedgt profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmcjf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsds6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvwwz profile=01-JOUR
add comment=vc-265-07.23.25- name=1jk9j2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9s3e profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2z3m profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfwjk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxch6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw2ga profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8y8u profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjt74 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxyy8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1ji84n profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9knv profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4k5v profile=01-JOUR
add comment=vc-265-07.23.25- name=1jj3fv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhryd profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhvpn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jswgb profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3kcm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmuuj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jet67 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jektc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwgrn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jarin profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbptr profile=01-JOUR
add comment=vc-265-07.23.25- name=1ju4dp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjk6k profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhg3z profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkgg8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jpi44 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jppsg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrnn2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfrf2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5ds6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhdhj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkkfy profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdaia profile=01-JOUR
add comment=vc-265-07.23.25- name=1jna6b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jabmj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jveh3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz3j3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgxgg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzj45 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jn2d8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1juhdf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkmvp profile=01-JOUR
add comment=vc-265-07.23.25- name=1j33ga profile=01-JOUR
add comment=vc-265-07.23.25- name=1jt45h profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz7du profile=01-JOUR
add comment=vc-265-07.23.25- name=1jumhy profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr3ev profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr9sr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrw2b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw3t5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzrke profile=01-JOUR
add comment=vc-265-07.23.25- name=1jczkc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jib56 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jc3ck profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvsux profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkrzy profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhmvh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jujft profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhrhn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxnr7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbk46 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j586s profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3kbk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jyvii profile=01-JOUR
add comment=vc-265-07.23.25- name=1j35hz profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwxwp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz3gm profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8yxb profile=01-JOUR
add comment=vc-265-07.23.25- name=1jii3a profile=01-JOUR
add comment=vc-265-07.23.25- name=1j82sr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwg8y profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjgai profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfa7b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsi8u profile=01-JOUR
add comment=vc-265-07.23.25- name=1jspvr profile=01-JOUR
add comment=vc-265-07.23.25- name=1j84zx profile=01-JOUR
add comment=vc-265-07.23.25- name=1jk35a profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdj4k profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9sau profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr3wr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdx3n profile=01-JOUR
add comment=vc-265-07.23.25- name=1jt2d5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhp3v profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxjz5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfb7x profile=01-JOUR
add comment=vc-265-07.23.25- name=1jz7tu profile=01-JOUR
add comment=vc-265-07.23.25- name=1je8ia profile=01-JOUR
add comment=vc-265-07.23.25- name=1jv2gr profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6rr3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgh2f profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdjg3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jskci profile=01-JOUR
add comment=vc-265-07.23.25- name=1jre3y profile=01-JOUR
add comment=vc-265-07.23.25- name=1jycga profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2vei profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxrab profile=01-JOUR
add comment=vc-265-07.23.25- name=1jppsx profile=01-JOUR
add comment=vc-265-07.23.25- name=1jncz6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmi25 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmm5v profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwv72 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfppk profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3pdx profile=01-JOUR
add comment=vc-265-07.23.25- name=1ja867 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jusuz profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhzt8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxbyf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrurr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jb3i4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jyg23 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr2i4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5rnn profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8t7j profile=01-JOUR
add comment=vc-265-07.23.25- name=1jr49i profile=01-JOUR
add comment=vc-265-07.23.25- name=1j38ig profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdmi6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jug4x profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6m75 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jeka5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrtn5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwmdm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxxgw profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgsuv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jry6e profile=01-JOUR
add comment=vc-265-07.23.25- name=1jc5ax profile=01-JOUR
add comment=vc-265-07.23.25- name=1jv6i5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j7jmt profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmubx profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6gpr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbghv profile=01-JOUR
add comment=vc-265-07.23.25- name=1jyjah profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsdyk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jctb9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvnbf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfmy3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvzf2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtwug profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjprf profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6tkp profile=01-JOUR
add comment=vc-265-07.23.25- name=1ja9eh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmwt7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrdip profile=01-JOUR
add comment=vc-265-07.23.25- name=1j685b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jephx profile=01-JOUR
add comment=vc-265-07.23.25- name=1jie5b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcr8m profile=01-JOUR
add comment=vc-265-07.23.25- name=1jymt9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j49b9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jnzzn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jserc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzwis profile=01-JOUR
add comment=vc-265-07.23.25- name=1jeb7b profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9pgm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgcgp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkt2r profile=01-JOUR
add comment=vc-265-07.23.25- name=1ju6bj profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2dh8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfkib profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmkm5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jgv22 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmhe4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jakbg profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzjj8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jksrt profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9ast profile=01-JOUR
add comment=vc-265-07.23.25- name=1jza9e profile=01-JOUR
add comment=vc-265-07.23.25- name=1js77t profile=01-JOUR
add comment=vc-265-07.23.25- name=1jc4aa profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3b35 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jv3k7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcpun profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfpsy profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkksu profile=01-JOUR
add comment=vc-265-07.23.25- name=1j76y2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jjc3v profile=01-JOUR
add comment=vc-265-07.23.25- name=1jaayk profile=01-JOUR
add comment=vc-265-07.23.25- name=1j5jz3 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxev8 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8433 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jktmi profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbr4g profile=01-JOUR
add comment=vc-265-07.23.25- name=1jict2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwvdy profile=01-JOUR
add comment=vc-265-07.23.25- name=1j226d profile=01-JOUR
add comment=vc-265-07.23.25- name=1jg9ua profile=01-JOUR
add comment=vc-265-07.23.25- name=1jffs4 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j942u profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4k3h profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmtmg profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4r3e profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2s93 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3m6g profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2tjn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jc3vk profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4sw2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm77y profile=01-JOUR
add comment=vc-265-07.23.25- name=1jv933 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j4waf profile=01-JOUR
add comment=vc-265-07.23.25- name=1jybug profile=01-JOUR
add comment=vc-265-07.23.25- name=1jy2xj profile=01-JOUR
add comment=vc-265-07.23.25- name=1juk3a profile=01-JOUR
add comment=vc-265-07.23.25- name=1jt3gi profile=01-JOUR
add comment=vc-265-07.23.25- name=1jm585 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9nc9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdtan profile=01-JOUR
add comment=vc-265-07.23.25- name=1j39td profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9hk7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jifbe profile=01-JOUR
add comment=vc-265-07.23.25- name=1j9f5g profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbskg profile=01-JOUR
add comment=vc-265-07.23.25- name=1j3gmc profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6bi2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsvrc profile=01-JOUR
add comment=vc-265-07.23.25- name=1jvujm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jbnsb profile=01-JOUR
add comment=vc-265-07.23.25- name=1jycyp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtahw profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8495 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jadya profile=01-JOUR
add comment=vc-265-07.23.25- name=1jhrf9 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6je2 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jrmyh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jkhjj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jw33v profile=01-JOUR
add comment=vc-265-07.23.25- name=1jghwn profile=01-JOUR
add comment=vc-265-07.23.25- name=1j2npr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsgdh profile=01-JOUR
add comment=vc-265-07.23.25- name=1ju8ey profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxppm profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwe9b profile=01-JOUR
add comment=vc-265-07.23.25- name=1jcyp7 profile=01-JOUR
add comment=vc-265-07.23.25- name=1ja56j profile=01-JOUR
add comment=vc-265-07.23.25- name=1jxvzr profile=01-JOUR
add comment=vc-265-07.23.25- name=1jwzbd profile=01-JOUR
add comment=vc-265-07.23.25- name=1jegyj profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtagp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jp2b5 profile=01-JOUR
add comment=vc-265-07.23.25- name=1juhdm profile=01-JOUR
add comment=vc-265-07.23.25- name=1j6e9h profile=01-JOUR
add comment=vc-265-07.23.25- name=1jtin6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzxh6 profile=01-JOUR
add comment=vc-265-07.23.25- name=1j7hxs profile=01-JOUR
add comment=vc-265-07.23.25- name=1jafbk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jyvte profile=01-JOUR
add comment=vc-265-07.23.25- name=1jfv4c profile=01-JOUR
add comment=vc-265-07.23.25- name=1jep7r profile=01-JOUR
add comment=vc-265-07.23.25- name=1j8t47 profile=01-JOUR
add comment=vc-265-07.23.25- name=1jdnew profile=01-JOUR
add comment=vc-265-07.23.25- name=1jft6d profile=01-JOUR
add comment=vc-265-07.23.25- name=1jb5jn profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzwnk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jb94d profile=01-JOUR
add comment=vc-265-07.23.25- name=1jd9wp profile=01-JOUR
add comment=vc-265-07.23.25- name=1jt66m profile=01-JOUR
add comment=vc-265-07.23.25- name=1jsmva profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzzwh profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzkgk profile=01-JOUR
add comment=vc-265-07.23.25- name=1jmp9r profile=01-JOUR
add comment=vc-265-07.23.25- name=1jj9pi profile=01-JOUR
add comment=vc-265-07.23.25- name=1jzacz profile=01-JOUR
/ip service
set telnet disabled=yes
set www port=85
set ssh disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Africa/Abidjan
/system identity
set name=HSPT-MIRADOR
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system note
set show-at-login=no
/system ntp client
set enabled=yes
/system ntp client servers
add address=196.200.131.160
add address=196.10.52.57
/system routerboard settings
# Firmware upgraded successfully, please reboot for changes to take effect!
set auto-upgrade=yes enter-setup-on=delete-key
/system scheduler
add interval=1d name=CLEAN_JOB on-event="/sys sch rem [find where on-event=\"\
    \"];\r\
    \n/sys scr job rem [find where owner~\"sys\"]" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2023-07-12 start-time=00:00:05
add comment="Monitor Profile 01-JOUR" interval=2m24s name=01-JOUR on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ];:if ([:pick \$date 4 5] = \"-\") do={:lo\
    cal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\
    \"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\"\
    ;\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$date 8 \
    10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date 0 4];:local\
    \_bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);\
    }; :local time [ /system clock get time ]; :local today [\$dateint d=\$dat\
    e] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip hotspot use\
    r find where profile=\"01-JOUR\" ] do={ :local comment [ /ip hotspot user \
    get \$i comment]; :local name [ /ip hotspot user get \$i name]; :local get\
    time [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$c\
    omment 6] = \"/\") do={:local expd [\$dateint d=\$comment] ; :local expt [\
    \$timeint t=\$gettime] ; :if ((\$expd < \$today and \$expt < \$curtime) or\
    \_(\$expd < \$today and \$expt > \$curtime) or (\$expd = \$today and \$exp\
    t < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /ip hotspot active\
    \_remove [find where user=\$name] ];}}}\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=01:59:13
add comment="Monitor Profile 05-JOURS" interval=2m27s name=05-JOURS on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ];:if ([:pick \$date 4 5] = \"-\") do={:l\
    ocal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\"\
    ;\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\
    \";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$date \
    8 10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date 0 4];:loc\
    al bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun)\
    ;}; :local time [ /system clock get time ]; :local today [\$dateint d=\$da\
    te] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip hotspot us\
    er find where profile=\"05-JOURS\" ] do={ :local comment [ /ip hotspot use\
    r get \$i comment]; :local name [ /ip hotspot user get \$i name]; :local g\
    ettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\" and [:pic \
    \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment] ; :local exp\
    t [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$expt < \$curtime)\
    \_or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \$today and \$\
    expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /ip hotspot act\
    ive remove [find where user=\$name] ];}}}\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=02:15:25
add comment="Monitor Profile 01-SEMAINE" interval=2m20s name=01-SEMAINE \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ];:if ([:pick \$date 4 5] = \"\
    -\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"0\
    4\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"\
    09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pi\
    ck \$date 8 10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date\
    \_0 4];:local bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\
    \".\$tahun);}; :local time [ /system clock get time ]; :local today [\$dat\
    eint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip\
    \_hotspot user find where profile=\"01-SEMAINE\" ] do={ :local comment [ /\
    ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$i n\
    ame]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\
    \" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment]\
    \_; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$exp\
    t < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \
    \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /\
    ip hotspot active remove [find where user=\$name] ];}}}\r\
    \n\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=05:27:31
add comment="Monitor Profile 02-SEMAINES" interval=2m39s name=02-SEMAINES \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ];:if ([:pick \$date 4 5] = \"\
    -\") do={:local arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"0\
    4\"=\"apr\";\"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"\
    09\"=\"sep\";\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pi\
    ck \$date 8 10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date\
    \_0 4];:local bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\
    \".\$tahun);}; :local time [ /system clock get time ]; :local today [\$dat\
    eint d=\$date] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip\
    \_hotspot user find where profile=\"02-SEMAINES\" ] do={ :local comment [ \
    /ip hotspot user get \$i comment]; :local name [ /ip hotspot user get \$i \
    name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"\
    /\" and [:pic \$comment 6] = \"/\") do={:local expd [\$dateint d=\$comment\
    ] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \$today and \$exp\
    t < \$curtime) or (\$expd < \$today and \$expt > \$curtime) or (\$expd = \
    \$today and \$expt < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /\
    ip hotspot active remove [find where user=\$name] ];}}}\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=01:18:49
add comment="Monitor Profile 01-MOIS" interval=2m21s name=01-MOIS on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ];:if ([:pick \$date 4 5] = \"-\") do={:lo\
    cal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\
    \"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\"\
    ;\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$date 8 \
    10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date 0 4];:local\
    \_bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);\
    }; :local time [ /system clock get time ]; :local today [\$dateint d=\$dat\
    e] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip hotspot use\
    r find where profile=\"01-MOIS\" ] do={ :local comment [ /ip hotspot user \
    get \$i comment]; :local name [ /ip hotspot user get \$i name]; :local get\
    time [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$c\
    omment 6] = \"/\") do={:local expd [\$dateint d=\$comment] ; :local expt [\
    \$timeint t=\$gettime] ; :if ((\$expd < \$today and \$expt < \$curtime) or\
    \_(\$expd < \$today and \$expt > \$curtime) or (\$expd = \$today and \$exp\
    t < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /ip hotspot active\
    \_remove [find where user=\$name] ];}}}\r\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=05:17:37
add comment="Monitor Profile 05-MINS" interval=2m44s name=05-MINS on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ];:if ([:pick \$date 4 5] = \"-\") do={:lo\
    cal arraybln {\"01\"=\"jan\";\"02\"=\"feb\";\"03\"=\"mar\";\"04\"=\"apr\";\
    \"05\"=\"may\";\"06\"=\"jun\";\"07\"=\"jul\";\"08\"=\"aug\";\"09\"=\"sep\"\
    ;\"10\"=\"oct\";\"11\"=\"nov\";\"12\"=\"dec\"};:local tgl [:pick \$date 8 \
    10];:local bulan [:pick \$date 5 7];:local tahun [:pick \$date 0 4];:local\
    \_bln (\$arraybln->\$bulan);:set \$date (\$bln.\"/\".\$tgl.\"/\".\$tahun);\
    }; :local time [ /system clock get time ]; :local today [\$dateint d=\$dat\
    e] ; :local curtime [\$timeint t=\$time] ; :foreach i in [ /ip hotspot use\
    r find where profile=\"05-MINS\" ] do={ :local comment [ /ip hotspot user \
    get \$i comment]; :local name [ /ip hotspot user get \$i name]; :local get\
    time [:pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$c\
    omment 6] = \"/\") do={:local expd [\$dateint d=\$comment] ; :local expt [\
    \$timeint t=\$gettime] ; :if ((\$expd < \$today and \$expt < \$curtime) or\
    \_(\$expd < \$today and \$expt > \$curtime) or (\$expd = \$today and \$exp\
    t < \$curtime)) do={ [ /ip hotspot user remove \$i ]; [ /ip hotspot active\
    \_remove [find where user=\$name] ];}}}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2025-07-23 start-time=05:57:13
/system script
add comment=mikhmon dont-require-permissions=no name="2025-07-23-|-16:11:58-|-\
    5mew2n-|-10-|-10.255.255.252-|-D0:C0:BF:29:48:73-|-5m-|-05-MINS-|-vc-302-0\
    7.23.25-" owner=202-23 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    2025-07-23
add comment=mikhmon dont-require-permissions=no name="jul/23/2025-|-16:34:31-|\
    -5m-|-10-|-10.10.3.253-|-D0:C0:BF:29:48:73-|-5m-|-05-MINS-|-" owner=\
    jul2025 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2025
add comment=mikhmon dont-require-permissions=no name="jul/23/2025-|-17:11:58-|\
    -c7n-|-10-|-10.10.3.253-|-D0:C0:BF:29:48:73-|-5m-|-05-MINS-|-vc-269-07.23.\
    25-" owner=jul2025 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    jul/23/2025
