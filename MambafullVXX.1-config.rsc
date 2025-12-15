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

/ip firewall nat
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

/ip service
set telnet disabled=yes
set www port=85
set ssh disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Africa/Abidjan
/system identity
set name=HSPT-MIRADOR

/system ntp client
set enabled=yes
/system ntp client servers
add address=196.200.131.160
add address=196.10.52.57

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

