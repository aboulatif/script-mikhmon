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

