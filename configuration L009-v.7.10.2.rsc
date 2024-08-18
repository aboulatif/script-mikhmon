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

