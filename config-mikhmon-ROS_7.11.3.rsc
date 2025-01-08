# jul/03/2023 14:34:29 by RouterOS 7.9.2
# software id = DCGA-XVDV
#
# model = RBD53iG-5HacD2HnD
# serial number = HCR087NQ21B
/interface bridge
add name=DOCKER
add name=HOTSPOT
/interface ethernet
set [ find default-name=ether1 ] comment="Port internet" name=E1-WAN-FAI
set [ find default-name=ether2 ] name="Port 2"
set [ find default-name=ether3 ] name="Port 3"
set [ find default-name=ether4 ] name="Port 4"
set [ find default-name=ether5 ] name="Port 5"
/interface veth
add address=11.11.11.11/28 gateway=11.11.11.1 name=MIKHMON
/interface list
add name=WAN
add name=LAN
/ip hotspot profile
add dns-name=monwifi.ci hotspot-address=10.10.10.1 html-directory=\
    "hotspot" login-by=http-chap,http-pap,mac-cookie \
    mac-auth-password=1234 name=wifizone
/ip pool
add name=dhcp_pool0 ranges=10.10.10.2-10.10.11.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=HOTSPOT lease-time=10m name=dhcp1
/ip hotspot
add address-pool=dhcp_pool0 disabled=no interface=HOTSPOT name=hotspot1 \
    profile=wifizone
/interface bridge port
add bridge=HOTSPOT interface="Port 2"
add bridge=HOTSPOT interface="Port 3"
add bridge=HOTSPOT interface="Port 4"
add bridge=HOTSPOT interface="Port 5"
add bridge=DOCKER interface=MIKHMON
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface list member
add interface=E1-WAN-FAI list=WAN
add interface=HOTSPOT list=LAN
/ip address
add address=10.10.10.1/23 interface=HOTSPOT network=10.10.10.0
add address=11.11.11.1/28 interface=DOCKER network=11.11.11.0
/ip dhcp-client
add comment=Internet interface=E1-WAN-FAI
/ip dhcp-server network
add address=10.10.10.0/23 dns-server=10.10.10.1,1.1.1.1 gateway=10.10.10.1
/ip dns
set allow-remote-requests=yes servers=208.67.222.222,8.8.8.8
/ip firewall filter
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
add action=drop chain=input comment="ping port scanners" src-address-list=\
    "port scanners" disabled=yes
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
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="Docker NAT" src-address=\
    11.11.11.0/28
add action=dst-nat chain=dstnat comment="ACCES DISTANT" dst-port=8088 protocol=tcp to-addresses=11.11.11.11 to-ports=80
add action=dst-nat chain=dstnat comment="Docker NAT" dst-address=10.10.10.1 \
    dst-port=8087 protocol=tcp to-addresses=11.11.11.11 to-ports=80
add action=masquerade chain=srcnat out-interface=E1-WAN-FAI
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=10.10.10.0/23
/ip hotspot user
add name=admin password=123
/ip service
set telnet disabled=yes
set www port=85
set ssh disabled=yes
/system identity
set name="HOTSPOT SERVER"
/system scheduler
add interval=1d name="CLEAN_JOB" on-event="/sys sch rem [find where on-event=\"\"];\r\
    \n/sys scr job rem [find where owner~\"sys\"]" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=jul/12/2023 start-time=00:00:05
/system logging
add action=disk prefix="=>>" topics=hotspot,info,account,debug
add action=disk prefix=-> topics=hotspot,info,debug

/system ntp client
set enabled=yes
/system ntp client servers
add address=196.200.131.160
add address=196.10.52.57
/tool romon
set enabled=yes
/container config
set registry-url=https://registry-1.docker.io tmpdir=usb1-part1/pull
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
/user 
add name=mindtech password=Mindtech@2022 group=full
add name=mikhmon password=mikspot@2023 group=full
add name=@dm1n password=P@ssw0rd group=full
set admin password=admin123 group=read

