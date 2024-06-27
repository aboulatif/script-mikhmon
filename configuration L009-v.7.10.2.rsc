# 2024-05-29 22:21:07 by RouterOS 7.10.2
# software id = QC0N-EB1Q
#
# model = L009UiGS-2HaxD
# serial number = HFC09FWJ9AS
/disk
set usb1 type=hardware
add parent=usb1 partition-number=1 partition-offset=512 partition-size=\
    "8 053 063 168" type=partition
/interface bridge
add name=DOCKER
add name=HOTSPOT
/interface ethernet
set [ find default-name=ether1 ] name=E1-WAN-FAI
/interface wifiwave2
set [ find default-name=wifi1 ] configuration.mode=ap .ssid=\
    "BAMBA WIFI ZONE1" disabled=no
/interface veth
add address=11.11.11.11/28 gateway=11.11.11.1 name=MIKHMON
/interface list
add name=WAN
add name=LAN
/ip hotspot profile
add dns-name=bamba.wifi hotspot-address=10.10.0.1 install-hotspot-queue=yes \
    login-by=mac,cookie,http-chap,http-pap,mac-cookie mac-auth-mode=\
    mac-as-username-and-password name=wifizone
/ip pool
add name=POOL-HOTSPOT ranges=10.10.0.2-10.10.255.254
/ip dhcp-server
add address-pool=POOL-HOTSPOT interface=HOTSPOT name=dhcp1
/ip hotspot
add address-pool=POOL-HOTSPOT addresses-per-mac=1 disabled=no interface=\
    HOTSPOT name=soumarewifi profile=wifizone
/ip hotspot user profile
set [ find default=yes ] address-pool=POOL-HOTSPOT mac-cookie-timeout=52w1d \
    on-login=":put (\",remc,0,default,0,,Disable,\"); {:local date [ /system c\
    lock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$d\
    ate 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find whe\
    re name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$uc\
    ode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add na\
    me=\"\$user\" disable=no start-date=\$date interval=\"default\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-0\
    -|-\$address-|-\$mac-|-default-|-default-|-\$comment\" owner=\"\$month\$ye\
    ar\" source=\$date comment=mikhmon}}" parent-queue=none rate-limit=\
    200M/260M
add address-pool=POOL-HOTSPOT mac-cookie-timeout=1d name=01-JOUR on-login=":pu\
    t (\",remc,200,1d,200,,Disable,\"); {:local date [ /system clock get date \
    ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ];:loc\
    al comment [ /ip hotspot user get [/ip hotspot user find where name=\"\$us\
    er\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" o\
    r \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add name=\"\$user\" \
    disable=no start-date=\$date interval=\"1d\"; :delay 2s; :local exp [ /sys\
    \_sch get [ /sys sch find where name=\"\$user\" ] next-run]; :local getxp \
    [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6]; :local t [\
    :pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year \$t\"); /ip\
    \_hotspot user set comment=\$exp [find where name=\"\$user\"];}; :if (\$ge\
    txp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [find where na\
    me=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set comment=\$e\
    xp [find where name=\"\$user\"];}; /sys sch remove [find where name=\"\$us\
    er\"]; :local mac \$\"mac-address\"; :local time [/system clock get time ]\
    ; /system script add name=\"\$date-|-\$time-|-\$user-|-200-|-\$address-|-\
    \$mac-|-1d-|-01-JOUR-|-\$comment\" owner=\"\$month\$year\" source=\$date c\
    omment=mikhmon}}" on-logout="#script-start\r\r\
    \n\r\r\
    \n:local limit [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] limit-uptime];\r\r\
    \n:local uptime [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] uptime];\r\r\
    \n:if (\$limit <= \$uptime) do={/ip hotspot user remove \$user;}\r\r\
    \n\r\r\
    \n#script-end\r\r\
    \n" parent-queue=none rate-limit=80M/90M
add address-pool=POOL-HOTSPOT mac-cookie-timeout=5d name=05-JOURS on-login=":p\
    ut (\",remc,500,5d,500,,Disable,\"); {:local date [ /system clock get date\
    \_];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ];:l\
    ocal comment [ /ip hotspot user get [/ip hotspot user find where name=\"\$\
    user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\"\
    \_or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add name=\"\$user\
    \" disable=no start-date=\$date interval=\"5d\"; :delay 2s; :local exp [ /\
    sys sch get [ /sys sch find where name=\"\$user\" ] next-run]; :local getx\
    p [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6]; :local t\
    \_[:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year \$t\"); \
    /ip hotspot user set comment=\$exp [find where name=\"\$user\"];}; :if (\$\
    getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [find where \
    name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set comment=\
    \$exp [find where name=\"\$user\"];}; /sys sch remove [find where name=\"\
    \$user\"]; :local mac \$\"mac-address\"; :local time [/system clock get ti\
    me ]; /system script add name=\"\$date-|-\$time-|-\$user-|-500-|-\$address\
    -|-\$mac-|-5d-|-05-JOURS-|-\$comment\" owner=\"\$month\$year\" source=\$da\
    te comment=mikhmon}}" on-logout="#script-start\r\r\
    \n\r\r\
    \n:local limit [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] limit-uptime];\r\r\
    \n:local uptime [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] uptime];\r\r\
    \n:if (\$limit <= \$uptime) do={/ip hotspot user remove \$user;}\r\r\
    \n\r\r\
    \n#script-end\r\r\
    \n" parent-queue=none rate-limit=200M/260M
add address-pool=POOL-HOTSPOT mac-cookie-timeout=1w name=06-MOIS on-login=":pu\
    t (\",remc,15000,180d,15000,,Disable,\"); {:local date [ /system clock get\
    \_date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3\
    \_];:local comment [ /ip hotspot user get [/ip hotspot user find where nam\
    e=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \
    \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add name=\"\
    \$user\" disable=no start-date=\$date interval=\"180d\"; :delay 2s; :local\
    \_exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]; :l\
    ocal getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6];\
    \_:local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year\
    \_\$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$user\"];\
    }; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [f\
    ind where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set\
    \_comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find wher\
    e name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system clo\
    ck get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-15000-\
    |-\$address-|-\$mac-|-180d-|-06-MOIS-|-\$comment\" owner=\"\$month\$year\"\
    \_source=\$date comment=mikhmon}}" on-logout="#script-start\r\r\
    \n\r\r\
    \n:local limit [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] limit-uptime];\r\r\
    \n:local uptime [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] uptime];\r\r\
    \n:if (\$limit <= \$uptime) do={/ip hotspot user remove \$user;}\r\r\
    \n\r\r\
    \n#script-end\r\r\
    \n" parent-queue=none rate-limit=200M/300M transparent-proxy=yes
add address-pool=POOL-HOTSPOT mac-cookie-timeout=2w name=02-SEMAINES \
    on-login=":put (\",remc,1000,14d,1000,,Disable,\"); {:local date [ /system\
    \_clock get date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \
    \$date 0 3 ];:local comment [ /ip hotspot user get [/ip hotspot user find \
    where name=\"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\
    \$ucode = \"vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch ad\
    d name=\"\$user\" disable=no start-date=\$date interval=\"14d\"; :delay 2s\
    ; :local exp [ /sys sch get [ /sys sch find where name=\"\$user\" ] next-r\
    un]; :local getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$ex\
    p 0 6]; :local t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\
    \$year \$t\"); /ip hotspot user set comment=\$exp [find where name=\"\$use\
    r\"];}; :if (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\
    \" [find where name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot use\
    r set comment=\$exp [find where name=\"\$user\"];}; /sys sch remove [find \
    where name=\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system\
    \_clock get time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-1\
    000-|-\$address-|-\$mac-|-14d-|-02-SEMAINES-|-\$comment\" owner=\"\$month\
    \$year\" source=\$date comment=mikhmon}}" on-logout="#script-start\r\r\
    \n\r\r\
    \n:local limit [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] limit-uptime];\r\r\
    \n:local uptime [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] uptime];\r\r\
    \n:if (\$limit <= \$uptime) do={/ip hotspot user remove \$user;}\r\r\
    \n\r\r\
    \n#script-end\r\r\
    \n" parent-queue=none rate-limit=200M/260M
add address-pool=POOL-HOTSPOT mac-cookie-timeout=4w2d name=01-MOIS on-login=":\
    put (\",remc,2000,30d,2000,,Disable,\"); {:local date [ /system clock get \
    date ];:local year [ :pick \$date 7 11 ];:local month [ :pick \$date 0 3 ]\
    ;:local comment [ /ip hotspot user get [/ip hotspot user find where name=\
    \"\$user\"] comment]; :local ucode [:pic \$comment 0 2]; :if (\$ucode = \"\
    vc\" or \$ucode = \"up\" or \$comment = \"\") do={ /sys sch add name=\"\$u\
    ser\" disable=no start-date=\$date interval=\"30d\"; :delay 2s; :local exp\
    \_[ /sys sch get [ /sys sch find where name=\"\$user\" ] next-run]; :local\
    \_getxp [len \$exp]; :if (\$getxp = 15) do={ :local d [:pic \$exp 0 6]; :l\
    ocal t [:pic \$exp 7 16]; :local s (\"/\"); :local exp (\"\$d\$s\$year \$t\
    \"); /ip hotspot user set comment=\$exp [find where name=\"\$user\"];}; :i\
    f (\$getxp = 8) do={ /ip hotspot user set comment=\"\$date \$exp\" [find w\
    here name=\"\$user\"];}; :if (\$getxp > 15) do={ /ip hotspot user set comm\
    ent=\$exp [find where name=\"\$user\"];}; /sys sch remove [find where name\
    =\"\$user\"]; :local mac \$\"mac-address\"; :local time [/system clock get\
    \_time ]; /system script add name=\"\$date-|-\$time-|-\$user-|-2000-|-\$ad\
    dress-|-\$mac-|-30d-|-01-MOIS-|-\$comment\" owner=\"\$month\$year\" source\
    =\$date comment=mikhmon}}" on-logout="#script-start\r\r\
    \n\r\r\
    \n:local limit [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] limit-uptime];\r\r\
    \n:local uptime [/ip hotspot user get [/ip hotspot user find where name=\"\
    \$user\"] uptime];\r\r\
    \n:if (\$limit <= \$uptime) do={/ip hotspot user remove \$user;}\r\r\
    \n\r\r\
    \n#script-end\r\r\
    \n" parent-queue=none rate-limit=200M/260M
/port
set 0 name=serial0
/zerotier
set zt1 comment="ZeroTier Central controller - https://my.zerotier.com/" \
    name=zt1 port=9993
/zerotier interface
add allow-default=no allow-global=no allow-managed=yes disabled=no instance=\
    zt1 name=zerotier1 network=363c67c55ae6df6f
/container
add interface=MIKHMON root-dir=usb1-part1/mikhmonv3 start-on-boot=yes \
    workdir=/src
/container config
set registry-url=https://registry-1.docker.io tmpdir=usb1-part1/pull
/interface bridge port
add bridge=HOTSPOT interface=ether2
add bridge=HOTSPOT interface=ether3
add bridge=HOTSPOT interface=ether4
add bridge=HOTSPOT interface=ether5
add bridge=HOTSPOT interface=ether6
add bridge=HOTSPOT interface=ether7
add bridge=HOTSPOT interface=ether8
add bridge=HOTSPOT interface=wifi1
add bridge=DOCKER interface=MIKHMON
/interface list member
add interface=E1-WAN-FAI list=WAN
add interface=HOTSPOT list=LAN
/ip address
add address=10.10.0.1/16 interface=HOTSPOT network=10.10.0.0
add address=11.11.11.1/28 interface=DOCKER network=11.11.11.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add interface=E1-WAN-FAI
/ip dhcp-server network
add address=10.10.0.0/16 gateway=10.10.0.1
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
    src-address=10.10.0.0/16
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="Docker NAT" src-address=\
    11.11.11.0/28
add action=dst-nat chain=dstnat comment="ACCES DISTANT" dst-port=8088 \
    protocol=tcp to-addresses=11.11.11.11 to-ports=80
add action=dst-nat chain=dstnat comment="Docker NAT" dst-address=10.10.0.1 \
    dst-port=8087 protocol=tcp to-addresses=11.11.11.11 to-ports=80
add action=dst-nat chain=dstnat comment=Proxy-ip dst-address=192.168.193.210 \
    dst-port=8087 protocol=tcp to-addresses=11.11.11.11 to-ports=80
/ip firewall raw
add action=accept chain=prerouting dst-port=8291 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=prerouting dst-port=8728 in-interface-list=WAN \
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
add action=accept chain=prerouting dst-port=8080 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=prerouting dst-port=8728 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=prerouting dst-port=8729 in-interface-list=WAN \
    protocol=tcp
add action=accept chain=prerouting dst-port=8087 in-interface-list=WAN \
    protocol=tcp
add action=drop chain=prerouting dst-port=53 in-interface-list=WAN protocol=\
    udp
add action=drop chain=prerouting dst-port=162 in-interface-list=WAN protocol=\
    udp
add action=drop chain=prerouting dst-port=161 in-interface-list=WAN protocol=\
    udp
/ip hotspot user
add comment=vc- name=soumare@@ server=soumarewifi
add comment=vc- name=bamba@@ server=soumarewifi
add comment=vc- name=toumba2021 server=soumarewifi
add name=0708871266 server=soumarewifi
add comment=vc-466-10.02.23- name=1mgm3c profile=01-MOIS server=soumarewifi
add name=5jvjfz profile=05-JOURS server=soumarewifi
add comment=vc-892-11.24.23- name=5jra97 profile=05-JOURS server=soumarewifi
add comment=vc-927-11.24.23- name=5jchwj profile=05-JOURS server=soumarewifi
add comment=vc-798-11.24.23- name=2srs73 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-211-11.24.23- name=2svxcc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-914-01.18.24- name=5jcb59 profile=05-JOURS server=soumarewifi
add comment=vc-914-01.18.24- name=5jkg46 profile=05-JOURS server=soumarewifi
add comment=vc-246-01.18.24- name=5jkv5f profile=05-JOURS server=soumarewifi
add comment=vc-246-01.18.24- name=5j68t9 profile=05-JOURS server=soumarewifi
add comment=vc-246-01.18.24- name=5jjpim profile=05-JOURS server=soumarewifi
add comment=vc-246-01.18.24- name=5jh48g profile=05-JOURS server=soumarewifi
add comment=vc-295-01.18.24- name=2sna82 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-295-01.18.24- name=2stm23 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/24/2024 19:14:41" name=1miykh profile=01-MOIS server=\
    soumarewifi
add comment="jun/19/2024 18:32:46" name=1mdips profile=01-MOIS server=\
    soumarewifi
add comment="jun/21/2024 20:14:51" name=1m7frr profile=01-MOIS server=\
    soumarewifi
add comment="jun/17/2024 21:04:41" name=1mhbny profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1mt24m profile=01-MOIS server=soumarewifi
add comment="jun/12/2024 20:49:41" name=1mzjmi profile=01-MOIS server=\
    soumarewifi
add comment="jun/21/2024 23:06:12" name=1mgyf3 profile=01-MOIS server=\
    soumarewifi
add comment="jun/14/2024 19:54:21" name=1met76 profile=01-MOIS server=\
    soumarewifi
add comment="jun/02/2024 15:54:23" name=1m9ven profile=01-MOIS server=\
    soumarewifi
add comment="jun/08/2024 13:22:04" name=1md23w profile=01-MOIS server=\
    soumarewifi
add comment="jun/11/2024 22:18:50" name=1m254u profile=01-MOIS server=\
    soumarewifi
add comment="jun/22/2024 22:32:37" name=1mecyw profile=01-MOIS server=\
    soumarewifi
add comment="jun/25/2024 00:18:43" name=1mn76d profile=01-MOIS server=\
    soumarewifi
add comment="jun/10/2024 21:53:48" name=1m4ihm profile=01-MOIS server=\
    soumarewifi
add comment="jun/10/2024 21:41:16" name=1mnbzg profile=01-MOIS server=\
    soumarewifi
add comment="jun/09/2024 22:46:07" name=1mc3gr profile=01-MOIS server=\
    soumarewifi
add comment="jun/19/2024 15:10:48" name=1mz8u7 profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1mrrf6 profile=01-MOIS server=soumarewifi
add comment="jun/10/2024 18:35:47" name=1m28a3 profile=01-MOIS server=\
    soumarewifi
add comment="jun/07/2024 21:18:06" name=1mdvie profile=01-MOIS server=\
    soumarewifi
add comment="jun/09/2024 12:40:17" name=1mjbew profile=01-MOIS server=\
    soumarewifi
add comment="jun/10/2024 17:43:04" name=1mre4c profile=01-MOIS server=\
    soumarewifi
add comment="may/27/2024 20:15:44" name=1mzxxy profile=01-MOIS server=\
    soumarewifi
add comment="jun/01/2024 20:33:05" name=1mbb9x profile=01-MOIS server=\
    soumarewifi
add comment="may/30/2024 20:21:25" name=1mnzdg profile=01-MOIS server=\
    soumarewifi
add comment="may/29/2024 21:38:22" name=1m4zm9 profile=01-MOIS server=\
    soumarewifi
add comment="jun/08/2024 16:15:45" name=1mdx7t profile=01-MOIS server=\
    soumarewifi
add comment="jun/03/2024 17:59:33" name=1mr6dt profile=01-MOIS server=\
    soumarewifi
add comment="jun/05/2024 21:46:57" name=1m9say profile=01-MOIS server=\
    soumarewifi
add comment="jun/02/2024 10:59:06" name=1m5vic profile=01-MOIS server=\
    soumarewifi
add comment="jun/01/2024 20:39:54" name=1maerk profile=01-MOIS server=\
    soumarewifi
add comment="jun/06/2024 21:16:15" name=1mvhc9 profile=01-MOIS server=\
    soumarewifi
add comment="jun/04/2024 13:49:16" name=1me6by profile=01-MOIS server=\
    soumarewifi
add comment="jun/03/2024 19:05:36" name=1mens8 profile=01-MOIS server=\
    soumarewifi
add comment="jun/05/2024 23:33:27" name=1m54r6 profile=01-MOIS server=\
    soumarewifi
add comment="may/27/2024 19:15:26" name=1msir8 profile=01-MOIS server=\
    soumarewifi
add comment="may/28/2024 09:29:27" name=1m624x profile=01-MOIS server=\
    soumarewifi
add comment="may/30/2024 19:00:52" name=1mku8t profile=01-MOIS server=\
    soumarewifi
add comment="may/27/2024 21:39:05" name=1msvz7 profile=01-MOIS server=\
    soumarewifi
add comment="jun/07/2024 13:29:26" name=1m8c64 profile=01-MOIS server=\
    soumarewifi
add comment="may/29/2024 20:03:49" name=1m8uta profile=01-MOIS server=\
    soumarewifi
add comment="may/27/2024 20:27:01" name=1mbpwj profile=01-MOIS server=\
    soumarewifi
add comment="jun/05/2024 22:35:19" name=1mttr5 profile=01-MOIS server=\
    soumarewifi
add comment="jun/06/2024 21:58:17" name=1mc4if profile=01-MOIS server=\
    soumarewifi
add comment="jun/06/2024 20:51:54" name=1mt9xx profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1m9yd4 profile=01-MOIS server=soumarewifi
add comment="jun/06/2024 20:51:04" name=1mcbmm profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1m3f8i profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mubky profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1myg6g profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mxhgy profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mr944 profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mk5ye profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1m736c profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1me9rz profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mn73c profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mdhj9 profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1m9wx7 profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1midye profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mymfg profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mh99h profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mtiuz profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mkn4x profile=01-MOIS server=soumarewifi
add comment=vc-624-01.18.24- name=1mj2vm profile=01-MOIS server=soumarewifi
add comment="jun/21/2024 19:46:39" name=1m78pe profile=01-MOIS server=\
    soumarewifi
add comment="jun/21/2024 19:09:34" name=1m467f profile=01-MOIS server=\
    soumarewifi
add comment="jun/14/2024 20:54:27" name=1mvz9h profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1mf5xm profile=01-MOIS server=soumarewifi
add comment="jun/22/2024 19:26:48" name=1mzar7 profile=01-MOIS server=\
    soumarewifi
add comment="jun/24/2024 15:44:30" name=1mruzz profile=01-MOIS server=\
    soumarewifi
add comment=vc-624-01.18.24- name=1mx2w3 profile=01-MOIS server=soumarewifi
add comment="jun/23/2024 22:50:28" name=1mfah3 profile=01-MOIS server=\
    soumarewifi
add comment="jun/22/2024 20:26:26" name=1mhft3 profile=01-MOIS server=\
    soumarewifi
add comment="jun/23/2024 21:24:42" name=1mmde3 profile=01-MOIS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jp6bt profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jae9t profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jjbhw profile=05-JOURS server=soumarewifi
add comment="may/31/2024 20:18:17" name=5jke77 profile=05-JOURS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jngii profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jspr2 profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jrjpg profile=05-JOURS server=soumarewifi
add comment="may/30/2024 22:46:34" name=5j7pja profile=05-JOURS server=\
    soumarewifi
add comment="may/30/2024 18:05:14" name=5j3ecu profile=05-JOURS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jd799 profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jvi6e profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5j39yw profile=05-JOURS server=soumarewifi
add comment="may/27/2024 18:51:43" name=5jfu2f profile=05-JOURS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jsm8m profile=05-JOURS server=soumarewifi
add comment="may/31/2024 19:27:39" name=5jzwj9 profile=05-JOURS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jz2rw profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5jmysj profile=05-JOURS server=soumarewifi
add comment="may/29/2024 10:30:16" name=5jpvss profile=05-JOURS server=\
    soumarewifi
add comment=vc-977-03.23.24- name=5jsmfp profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5j2yuu profile=05-JOURS server=soumarewifi
add comment=vc-977-03.23.24- name=5j77jz profile=05-JOURS server=soumarewifi
add comment="may/30/2024 19:09:06" name=5jafjw profile=05-JOURS server=\
    soumarewifi
add name=cissoko@ profile=02-SEMAINES server=soumarewifi
add comment="jun/05/2024 18:53:11" name=2024@@ profile=01-MOIS server=\
    soumarewifi
add comment="jun/05/2024 19:05:30" name=2024@@@ profile=01-MOIS server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3w5i profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s5v9i profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sii7x profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sg5ei profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srfrm profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sveg9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sm3yc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4xg4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sv9r7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2seayy profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sdfat profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sknwa profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2spide profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2szpvx profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swyck profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sakwb profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shkxi profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2suyhd profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2siufx profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scxrh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2simmv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s784j profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shct3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4ym2 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2wrm profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sbuws profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3pp9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2spxw7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8ng4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sgy67 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sf7ds profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sf4r7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sc65f profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swx55 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sx23t profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skmdc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srnxz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2svx3s profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srh2n profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sew6u profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sie5y profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sk97f profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6uhj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s549y profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4mym profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sc4tb profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sdast profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2szfxy profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjkp8 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sds5r profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sp43j profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s99f3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sajkz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sxhev profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2schk5 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6p3i profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sftv7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9hwz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skups profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sy4zk profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scht3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sj5uc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sn9ip profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swnhj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7ymv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8hh7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2su2e7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9pvm profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8dmu profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scx5t profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scejg profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9db4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr329 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9nye profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sfp9u profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6z46 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sy83c profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8z98 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sc4pg profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7tf3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s66yd profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2se49j profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scu6p profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sm2n5 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2si33j profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s698m profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sp8wp profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srxyh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sd7h8 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2snrdp profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2smf7s profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srsji profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2syumi profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7r2z profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2set86 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2svttf profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sg8ns profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2szjdt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9ha4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2se8uf profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8ku7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scfnb profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sfvkt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjcyu profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2se8e3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sfm8v profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s83gk profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2snefu profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2scbmj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjd7m profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sud5n profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swmgp profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s87r3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2syxvw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sh4sb profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sibdn profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sa2zp profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swhiw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sidps profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sunc2 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2su4ns profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjedw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6j6a profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2szxnz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4nyh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sbvp6 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skvd4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sbdjt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sbz77 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sb6sv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6hmg profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3abs profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srbi3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sufrc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2t6m profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2seu53 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skvac profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s54yu profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shx8v profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2spcaz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8wpb profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sf9mi profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2st72d profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s5z2t profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sspz8 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s29zr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7uwg profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 18:54:22" name=2sx5kr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sigfa profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s5acn profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/09/2024 20:35:26" name=2sw3zc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sdw9z profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sshbt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2kwk profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s77ma profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssk9w profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sp2tz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sxhwt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sce3i profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/09/2024 19:01:46" name=2sahvn profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ska75 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s48mg profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjzhc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7uaj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srhre profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2stybv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s588y profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srusu profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sb2p5 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sa28a profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sabfk profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8rmp profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skzai profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/10/2024 18:01:40" name=2stmjx profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s9hgj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2suv3e profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sursw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sj3m3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sc3h4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sueba profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2safee profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sviny profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr9te profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sgknh profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/10/2024 17:48:02" name=2s8efc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sxbwu profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/09/2024 22:29:03" name=2sramt profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2scc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2suv5y profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2mky profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjg9g profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr4m3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sf3ri profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2setzi profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sgzvr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2suvrv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s88f9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2saydw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr6ss profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sjax3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shnje profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sygy9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sj77v profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8ngv profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sgjca profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2smizu profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 21:36:13" name=2s9bda profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/09/2024 19:19:45" name=2s28ki profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2se923 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skdsw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sztk9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s87ic profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2siwvz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4agr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4x4z profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3ujh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6t4d profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2schei profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssx5u profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2stfya profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sg7yf profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2smatk profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sa2wx profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2savu4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2suitz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sx5w3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s5jzz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skp8x profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sa8es profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sb25b profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3k3p profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 18:20:01" name=2sk2ae profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 23:03:58" name=2ssegr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sh44w profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s6tpa profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sj49v profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2she98 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2stg4z profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2skf7z profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr6cg profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sshzf profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sehcx profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srss3 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sdgvh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2stvyn profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sme6w profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssznr profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr928 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2svtd5 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sner7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sxe6a profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2t4v profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8ih4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sttbz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shagy profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sibap profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4bks profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sat7m profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sptwz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2si4vy profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2spewg profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 22:40:58" name=2scnkc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2su9mm profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8d5w profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sd3ne profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s8msc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4wz6 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2svdas profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sah6u profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7zyw profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssz6t profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2srdju profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sszjz profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2shye9 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3ret profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s3k9b profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2szt85 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sesem profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sae2e profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4ckf profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 22:49:00" name=2sma7w profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 22:18:37" name=2s4uui profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 20:24:32" name=2ssc6e profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 20:56:22" name=2sdj8h profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 18:50:18" name=2sba8t profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 17:00:52" name=2stjx3 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 22:19:08" name=2s5yzp profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 19:13:41" name=2stibg profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/05/2024 19:25:20" name=2syz2h profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/08/2024 14:40:29" name=2sm4wn profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 18:48:23" name=2svsju profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 22:22:46" name=2s4fr3 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 11:12:47" name=2sc8fw profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 19:16:33" name=2sg7ci profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 21:32:52" name=2sfpxa profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 21:17:08" name=2sp6t7 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 15:26:15" name=2sk3hw profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 23:01:19" name=2s5yba profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/04/2024 18:51:28" name=2se2m4 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/31/2024 20:55:58" name=2s94an profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 22:10:55" name=2s92mz profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 20:14:53" name=2sw8j2 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 21:34:07" name=2s996k profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 18:51:17" name=2sn9y4 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 09:46:20" name=2spm5x profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 15:08:23" name=2sabvk profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 00:24:23" name=2syxn7 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/04/2024 21:10:55" name=2s43sf profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 18:40:57" name=2s5i43 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 15:12:52" name=2sumr2 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 21:25:43" name=2snc5p profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 21:35:03" name=2smt3s profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 22:19:03" name=2stcej profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 07:45:32" name=2sispe profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 15:40:45" name=2s3cru profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 19:20:42" name=2sgnaa profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 20:53:42" name=2sds8g profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 13:50:24" name=2sweni profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 19:49:53" name=2s3aed profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 18:53:59" name=2swd3v profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 19:29:18" name=2sv4cz profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 22:48:07" name=2syiac profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 12:28:04" name=2s69kr profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 12:18:10" name=2shk3d profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 15:54:48" name=2szet4 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 18:48:24" name=2se6dh profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 20:41:39" name=2shg76 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 21:33:04" name=2s9ag2 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 15:24:04" name=2s8h7i profile=02-SEMAINES server=\
    soumarewifi
add comment="may/31/2024 22:50:01" name=2s8b2d profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 21:26:56" name=2s878s profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 20:37:48" name=2sxeid profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 19:14:50" name=2su88j profile=02-SEMAINES server=\
    soumarewifi
add comment="may/31/2024 20:32:41" name=2sg2dn profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 17:59:11" name=2str7a profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 12:17:06" name=2sc29e profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/04/2024 18:51:06" name=2sffpu profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 21:09:15" name=2sjuh9 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 21:11:43" name=2sigsm profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 20:04:36" name=2srdvd profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 18:46:01" name=2schwk profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 22:37:27" name=2snm65 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/30/2024 20:49:53" name=2sbpmh profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssk35 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sbu4c profile=02-SEMAINES server=\
    soumarewifi
add comment="may/29/2024 17:35:50" name=2sfgmy profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 20:09:11" name=2scbt4 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/05/2024 21:50:13" name=2szzek profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/04/2024 19:35:33" name=2sfh3d profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 19:18:46" name=2s59ff profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s4dkc profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7y8c profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 17:58:56" name=2sdbsn profile=02-SEMAINES server=\
    soumarewifi
add comment="may/31/2024 22:33:40" name=2sy8us profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 20:50:28" name=2su7bh profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 20:22:55" name=2sppsj profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s7k38 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sr27w profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 20:16:54" name=2spi9i profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 22:28:03" name=2st9j8 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 20:28:45" name=2s3nd2 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 22:36:02" name=2s53fn profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssw5x profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sun3f profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 19:28:11" name=2s8kc6 profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 21:59:45" name=2sbc6r profile=02-SEMAINES server=\
    soumarewifi
add comment="may/31/2024 10:07:26" name=2ssuas profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 20:22:24" name=2saw6i profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2set2f profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sfssi profile=02-SEMAINES server=\
    soumarewifi
add comment="may/28/2024 19:10:23" name=2si745 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 22:40:51" name=2s2cvw profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 21:35:03" name=2snhdx profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/09/2024 10:21:51" name=2sapf5 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2se7wb profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/01/2024 21:10:21" name=2sg5id profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/03/2024 22:09:20" name=2srpfu profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/05/2024 22:06:08" name=2stjez profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sxb5m profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s5gcf profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 22:42:39" name=2shtm6 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/07/2024 21:42:03" name=2sp3u4 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2swnki profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sdm3s profile=02-SEMAINES server=\
    soumarewifi
add comment="may/27/2024 20:47:27" name=2su8ug profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 18:56:38" name=2sc4d6 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2snp45 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2s2yv6 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/06/2024 21:14:40" name=2scxx8 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/04/2024 19:35:51" name=2sk2d7 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2sb638 profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-391-05.08.24- name=2ssk76 profile=02-SEMAINES server=\
    soumarewifi
add comment="jun/02/2024 13:54:55" name=2srkkn profile=02-SEMAINES server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jwxi2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9hwd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j45tt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jistm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jr56k profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxm3w profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxwzn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9vv5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jc29t profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jystv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j7hbb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx447 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3w5x profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jk6cj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j582y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvrs3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3zy7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j54y8 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz9bw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jaz43 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkh2v profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jssv4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2vhc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jf7dc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jysk6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jshbe profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhbtj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkhu9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdzxd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdgjf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnvfu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz8pz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4e9r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv2wf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsrrc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwkat profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcbtg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgbhm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j27ve profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhvsy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfwuw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfkpb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrg58 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6afp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjfm7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j28np profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4vs3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j25ia profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz8em profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgbp2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jejz7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdjby profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzffh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j373j profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jww5u profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgy2y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jseyz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz5yk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jt2c9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjgxi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmb8d profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjamb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je9xp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwd9y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtefx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzzez profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxu6e profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrx9g profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhzyv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jiggw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmy9m profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbd7b profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzaxg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfz49 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsyfm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvzar profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjhny profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyshb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn2u2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfzdk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jc3yc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbf7z profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyn3c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvwcm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv5rj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9e9u profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz883 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4itb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js84a profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jk9ee profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2xib profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jd5zw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9k8p profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jm6x3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jb2af profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzx7m profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkge3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jke4y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3srm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j57ks profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j46wm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jr95d profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jje46 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j46hi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxuyp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbx9j profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j48ma profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4478 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jetuf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjnrt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juem8 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jd8u3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrar6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrsva profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j39aa profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9ura profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j7iy4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4fvb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2zvm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx656 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzupg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwyy4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzvmk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmf9x profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jedaj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcjfx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j86ue profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnxdu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrgxm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jshhz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jw4pa profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9vr6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6bvw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jc2gk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcxhh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmik5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx7cm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcdiz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtxhb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j468z profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbcm3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2uze profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgaxy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juzt2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jk2zg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnk34 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmb2n profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6ame profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzgm4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfzya profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ji92r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9ayg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrxv6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn72a profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfb9d profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je92f profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5pvy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkgea profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jktvv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jve4i profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcyxp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je5fi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9x7f profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jw3e3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpzbm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfbcc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmyfc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jre78 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je383 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwdcx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jz5vu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkpr9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsey7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2hrh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkpp7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jt99g profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jy9ra profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3yrd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrw9j profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ji823 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jawuk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jb2ks profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jj2pc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3wbb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzigc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyxjy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeacn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnjbf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jagxu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbwx5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhyeu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjebs profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgxf9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jk7wk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4964 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2rif profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js79w profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j34pj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jegvp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jatat profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeek2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxunc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpupv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkss2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpytu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhnz5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jajzw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9z8e profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juz2k profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jztx7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbzyz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jenx8 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4uik profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnips profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4avf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jd26m profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrnk3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js5m5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwryf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfd4z profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyth8 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jitxh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwjfb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsx2f profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4efb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9tu6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je4m9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnx7c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbupn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6djb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jngsi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdnvv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwahf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgtga profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx23e profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5caa profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5z5y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgbr9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeyt5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j79pv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j88se profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je6kg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jej7w profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtkcv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je9r4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhjc9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j53i2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8ngg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jya98 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3v7t profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jup3r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jppcz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6jj4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ja8ec profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtrza profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgx9n profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8eyw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jew97 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9emx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtmcr profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jd2mw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js6yj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfz7w profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx2yf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwmwd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhasp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmrxf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5eb3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3ixj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jygyv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3v4u profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmzmu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4y2r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbzsa profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzmxb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn29z profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j86f4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv5f9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmbp5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jitbt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpddx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ju49y profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jb6nh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfh5h profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juw6f profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jh5er profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8d2s profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnfyd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juwyy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4g7r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jk944 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfuzm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxp4n profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvfua profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jr24r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2xii profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jehsu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j39jk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvxay profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmyuc profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgk9p profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx5py profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j89v3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jj95a profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jf8ti profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrcfj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4868 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3ymm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhkmk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jr63r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn4dr profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcenm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyz25 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5ttm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ja4st profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpuei profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2n8c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8hwj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5hjr profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcf6j profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxwgh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9jkt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfj4r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjh62 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzv3x profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jg87i profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhih4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjam5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdv6s profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4pw2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjm52 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jm2v4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5je64c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeayj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv66s profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2z49 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbx3v profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jm7md profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnbwm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyeis profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbhbk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4p7p profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8cit profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnigy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jp56t profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx2vt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrjcj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgm73 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpztp profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgfwx profile=05-JOURS server=soumarewifi
add comment="jun/01/2024 17:50:29" name=5jh6m7 profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jjxva profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjdgj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx7ic profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsejw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8ptw profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jiign profile=05-JOURS server=soumarewifi
add comment="may/30/2024 19:52:43" name=5jjh39 profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jsifx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn687 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwr28 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmppy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsvgi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6kdd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv7eg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdypn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2iyz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jy9ip profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn7tn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j3ibn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsw5i profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jccxe profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmxh4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxrt7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j857e profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jh7ut profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyrtz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8reg profile=05-JOURS server=soumarewifi
add comment="may/31/2024 01:02:47" name=5jphgv profile=05-JOURS server=\
    soumarewifi
add comment="may/31/2024 19:02:18" name=5jryg3 profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jwsvj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j7udt profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeb66 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9x4g profile=05-JOURS server=soumarewifi
add comment="may/31/2024 10:29:04" name=5jncz6 profile=05-JOURS server=\
    soumarewifi
add comment="jun/01/2024 12:45:24" name=5j4ayd profile=05-JOURS server=\
    soumarewifi
add comment="may/30/2024 22:18:22" name=5jkrii profile=05-JOURS server=\
    soumarewifi
add comment="may/30/2024 18:22:42" name=5jcdyb profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jkpfx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6bfh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ji3ua profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8ibs profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jw4e6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn6zd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgibj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j7ne5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtr84 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv4xa profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnf9p profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jezhm profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jix3z profile=05-JOURS server=soumarewifi
add comment="may/30/2024 18:06:39" name=5jzdhg profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jcyux profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8tuj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfv84 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ja9x7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsddh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5juan5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpuxn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2ygn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6y3n profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgs9j profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jj4fy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jerd6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtx8m profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfft7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbu28 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jsvwx profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyj2p profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jyjk7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6dwn profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jajb9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ju4s5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbewv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdybj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j85tb profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpsn5 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jn8xe profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8ti8 profile=05-JOURS server=soumarewifi
add comment="may/30/2024 19:15:58" name=5juspe profile=05-JOURS server=\
    soumarewifi
add comment="may/30/2024 19:06:31" name=5juu2x profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jd9y4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jx6ut profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jer7s profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jfi3v profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkr98 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jraek profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5ain profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js624 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jmxzy profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxfjv profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbn2c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5x7x profile=05-JOURS server=soumarewifi
add comment="may/31/2024 09:57:30" name=5jr4hk profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jrvhu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j66v2 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jp4rk profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6f2d profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jeuhs profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jxycz profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtwzd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j59sj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j8jux profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvdng profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jkk7g profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jvtzf profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jdbpi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j9k5r profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jegi6 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jpay7 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j6cdu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbxx2 profile=05-JOURS server=soumarewifi
add comment="may/31/2024 15:52:05" name=5jgrbn profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jtzx3 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jtw45 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jbjdj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2mt9 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jg76c profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5ji85k profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jgunn profile=05-JOURS server=soumarewifi
add comment="may/30/2024 19:09:07" name=5jbe77 profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jy3ua profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jnipj profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j4w4h profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjdsr profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jhwa5 profile=05-JOURS server=soumarewifi
add comment="may/31/2024 19:32:01" name=5je748 profile=05-JOURS server=\
    soumarewifi
add comment=vc-560-05.08.24- name=5jd3vd profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5rt4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jcxr4 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j2biu profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jjjai profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5j5rgi profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jrfeg profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5js9an profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jzmi8 profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jwm4b profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jynjh profile=05-JOURS server=soumarewifi
add comment=vc-560-05.08.24- name=5jv7jy profile=05-JOURS server=soumarewifi
add comment=vc-609-05.08.24- name=1mjxn4 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mnwnw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mvgfg profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mdpyw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mjn5a profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m55vy profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9dhn profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m5vxy profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mx3vb profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m826c profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m5izb profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mmb52 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mva6d profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m7vtd profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mn75m profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6crc profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mkm7r profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mcwza profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8j5v profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1my645 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mgc9n profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mvb3a profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1myxba profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mb2en profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mnpje profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3f7n profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6iv6 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1me8x8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfwf7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6hmn profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3n4n profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1miywy profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m384a profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mdrpi profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mxh86 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mxhk9 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mrxrx profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mzekh profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mzcgt profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mv599 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1ms8nd profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1masjv profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mif5v profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mj259 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mde5w profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mg2wu profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mt2fk profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1magfg profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mupcp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mtgtm profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m2cma profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1marg8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mdck3 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mhdhk profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfm26 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mt3gp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9m58 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mwxcx profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mc8sf profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m4nn6 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mps7f profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6ehv profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mx97e profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mevcv profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m22zy profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mj49m profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mg2gb profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mzur4 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mdnv3 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1me7uj profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9uxd profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m4v32 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m5wyy profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mvzgv profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mgusw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mz8ky profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1me2kw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8pgs profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfca4 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mw4m6 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mj925 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mrj3h profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mckn8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3tct profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mtvgx profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mnwhe profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfv8h profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1msj28 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mc37i profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8wzn profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m2c68 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9kxm profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mh6e8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mnuui profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mbcsm profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1ms8aa profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mgcf7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mayaa profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mi39y profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mimce profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1miwgp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1magi5 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m2swg profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mu5da profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1my4s2 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mypwc profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mxrxf profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mwwk7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1my6ke profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mhvj7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mj7k3 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mz9ba profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1msb84 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m77vw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6d7k profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mddrw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mpuub profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mayyp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1myjxc profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9j49 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1myzrd profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3d6w profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8z3h profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mx3nk profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1ms26g profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mpspp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m7xud profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mk5r7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mf6cv profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mgbtd profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m5kh6 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mjyg9 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8mju profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mnas7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m99c4 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3w74 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mbs3k profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mhxtc profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mv6jg profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mb45w profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mzs4e profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9i75 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m7ifi profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mkvhx profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mhvvi profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6a5s profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mgn8i profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6fkg profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m4cp8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfgxh profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1myt5p profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m94ns profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m3esp profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mddum profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mw6fb profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m42x3 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mjdd8 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m872d profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mj2ek profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mzhnj profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mxfs3 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m76uz profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m7kat profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m5t4k profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mdw7g profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mjjgr profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m28a7 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mt6hc profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m6yvn profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mkn8u profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mb3p2 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m9t54 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mhw4x profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mipai profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mbdsh profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mrz74 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mrx3g profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mkwx5 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mafry profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mg2zj profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m2c3k profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m4ieu profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mfhuj profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mr4rt profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mmcbh profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m8uyw profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1m4tck profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1msgn2 profile=01-MOIS server=soumarewifi
add comment=vc-609-05.08.24- name=1mv95g profile=01-MOIS server=soumarewifi
add name=latif server=soumarewifi
add name=latif
/ip hotspot walled-garden
add comment="place hotspot rules here" disabled=yes
/ip hotspot walled-garden ip
add action=accept disabled=no !dst-address !dst-address-list dst-host=\
    laksa19.github.io !dst-port !protocol server=soumarewifi !src-address \
    !src-address-list
/ip service
set telnet disabled=yes
set www port=85
set ssh disabled=yes
/system clock
set time-zone-name=Africa/Abidjan
/system identity
set name=HOTSPOT-SERVER
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
set enter-setup-on=delete-key
/system scheduler
add comment="Monitor Profile 01-JOUR" interval=2m39s name=01-JOUR on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"01-JOUR\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=03:32:54
add comment="Monitor Profile 05-JOURS" interval=2m58s name=05-JOURS on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ]; :local time [ /system clock get time ]\
    ; :local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"05-JOURS\" ] do={ \
    :local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hots\
    pot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=02:10:43
add comment="Monitor Profile 01-SEMAINE-" interval=2m41s name=01-SEMAINE- \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"01-SEM\
    AINE-\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :local \
    name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12 2\
    0]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:l\
    ocal expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; \
    :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today and \$\
    expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip\
    \_hotspot user remove \$i ]; [ /ip hotspot active remove [find where user=\
    \$name] ];}}}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=04:38:13
add comment="Monitor Profile 02-SEMAINES-" interval=2m30s name=02-SEMAINES- \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"02-SEM\
    AINES-\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :local\
    \_name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12\
    \_20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do=\
    {:local expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime]\
    \_; :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today an\
    d \$expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [\
    \_/ip hotspot user remove \$i ]; [ /ip hotspot active remove [find where u\
    ser=\$name] ];}}}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=02:46:18
add comment="Monitor Profile 01-MOIS" interval=2m26s name=01-MOIS on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"01-MOIS\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=04:17:17
add comment="Monitor Profile Illimit\C3\A9" interval=2m40s name=\
    "Illimit\C3\A9" on-event=":local dateint do={:local montharray ( \"jan\",\
    \"feb\",\"mar\",\"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"\
    nov\",\"dec\" );:local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3\
    \_];:local year [ :pick \$d 7 11 ];:local monthint ([ :find \$montharray \
    \$month]);:local month (\$monthint + 1);:if ( [len \$month] = 1) do={:loca\
    l zero (\"0\");:return [:tonum (\"\$year\$zero\$month\$days\")];} else={:r\
    eturn [:tonum (\"\$year\$month\$days\")];}}; :local timeint do={ :local ho\
    urs [ :pick \$t 0 2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours \
    * 60 + \$minutes) ; }; :local date [ /system clock get date ]; :local time\
    \_[ /system clock get time ]; :local today [\$dateint d=\$date] ; :local c\
    urtime [\$timeint t=\$time] ; :foreach i in [ /ip hotspot user find where \
    profile=\"Illimit\C3\A9\" ] do={ :local comment [ /ip hotspot user get \$i\
    \_comment]; :local name [ /ip hotspot user get \$i name]; :local gettime [\
    :pic \$comment 12 20]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment\
    \_6] = \"/\") do={:local expd [\$dateint d=\$comment] ; :local expt [\$tim\
    eint t=\$gettime] ; :if ((\$expd < \$today and \$expt < \$curtime) or (\$e\
    xpd < \$today and \$expt > \$curtime) or (\$expd = \$today and \$expt < \$\
    curtime)) do={ [ /ip hotspot user remove \$i ]; [ /ip hotspot active remov\
    e [find where user=\$name] ];}}}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=05:23:54
add comment="Monitor Profile 05-JOUR" interval=2m26s name=05-JOUR on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"05-JOUR\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=02:16:26
add comment="Monitor Profile 06-MOIS" interval=2m56s name=06-MOIS on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"06-MOIS\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=01:58:39
add comment="Monitor Profile 02-SEMAINES" interval=2m48s name=02-SEMAINES \
    on-event=":local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\
    \"apr\",\"may\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );\
    :local days [ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [\
    \_:pick \$d 7 11 ];:local monthint ([ :find \$montharray \$month]);:local \
    month (\$monthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:r\
    eturn [:tonum (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\
    \$year\$month\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0\
    \_2 ]; :local minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes\
    ) ; }; :local date [ /system clock get date ]; :local time [ /system clock\
    \_get time ]; :local today [\$dateint d=\$date] ; :local curtime [\$timein\
    t t=\$time] ; :foreach i in [ /ip hotspot user find where profile=\"02-SEM\
    AINES\" ] do={ :local comment [ /ip hotspot user get \$i comment]; :local \
    name [ /ip hotspot user get \$i name]; :local gettime [:pic \$comment 12 2\
    0]; :if ([:pic \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:l\
    ocal expd [\$dateint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; \
    :if ((\$expd < \$today and \$expt < \$curtime) or (\$expd < \$today and \$\
    expt > \$curtime) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip\
    \_hotspot user remove \$i ]; [ /ip hotspot active remove [find where user=\
    \$name] ];}}}" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2021-12-08 start-time=04:24:33
add comment="Monitor Profile default" interval=2m42s name=default on-event=":l\
    ocal dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"may\
    \",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days [\
    \_:pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d 7\
    \_11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$mon\
    thint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:tonu\
    m (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mont\
    h\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :local\
    \_minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loca\
    l date [ /system clock get date ]; :local time [ /system clock get time ];\
    \_:local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"default\" ] do={ :\
    local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hotsp\
    ot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2022-12-30 start-time=04:10:15
add interval=4w2d name=1m8ji2 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2023-11-26 start-time=23:43:13
add interval=2w name=2stw23 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2023-11-26 start-time=23:51:05
/system script
add comment=mikhmon dont-require-permissions=no name="1970-01-02-|-01:30:10-|-\
    1jwnwg-|-200-|-10.10.255.251-|-6E:21:2E:7C:1F:66-|-1d-|-01-JOUR-|-vc-751-0\
    1.02.70-" owner=197-02 policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=\
    1970-01-02
