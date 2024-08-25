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
/ip firewall address-list
add address=38.199.128.0/17 comment="IP_list_CI" list=IP2Location_CI
add address=41.66.0.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.67.64.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.67.88.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.67.96.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.73.16.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.74.96.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.75.16.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.75.32.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.76.136.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.76.160.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.76.232.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.77.160.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.77.216.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.77.248.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.12.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.44.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.68.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.92.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.104.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.132.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.144.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.152.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.160.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.176.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.78.236.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.0.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.12.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.84.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.100.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.112.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.79.140.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.84.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.87.32.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.139.64.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.189.32.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.189.96.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.189.128.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.190.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.190.192.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.190.240.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.190.252.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.0.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.68.32/28 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.68.56/29 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.68.64/26 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.68.128/25 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.69.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.70.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.92.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.108.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.112.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.191.208.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.202.64.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.205.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.206.64.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.206.224.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.207.0.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.207.192.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.207.224.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.209.128.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.211.192.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.215.192.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.215.224.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.216.0.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=41.216.240.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.217.196.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.217.208.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.217.248.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.219.192.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=41.221.112.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.222.80.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=41.223.0.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.223.12.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.223.68.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.223.188.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.223.208.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.242.132.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=41.242.176.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=41.245.0.0/17 comment="IP_list_CI" list=IP2Location_CI
add address=45.221.27.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=62.12.34.80/29 comment="IP_list_CI" list=IP2Location_CI
add address=62.193.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=63.165.209.38/32 comment="IP_list_CI" list=IP2Location_CI
add address=77.70.134.192/29 comment="IP_list_CI" list=IP2Location_CI
add address=77.70.156.104/29 comment="IP_list_CI" list=IP2Location_CI
add address=80.15.244.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=81.22.64.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=82.206.187.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=83.229.108.32/28 comment="IP_list_CI" list=IP2Location_CI
add address=83.229.108.56/29 comment="IP_list_CI" list=IP2Location_CI
add address=83.229.108.112/28 comment="IP_list_CI" list=IP2Location_CI
add address=83.229.108.208/29 comment="IP_list_CI" list=IP2Location_CI
add address=84.254.161.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=85.118.36.136/29 comment="IP_list_CI" list=IP2Location_CI
add address=85.237.118.1/32 comment="IP_list_CI" list=IP2Location_CI
add address=85.237.118.9/32 comment="IP_list_CI" list=IP2Location_CI
add address=85.255.21.192/28 comment="IP_list_CI" list=IP2Location_CI
add address=88.202.14.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=88.202.97.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=95.210.128.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.22.100.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.67.192.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=102.130.224.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=102.135.184.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.135.191.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.136.0.0/14 comment="IP_list_CI" list=IP2Location_CI
add address=102.177.123.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.210.208.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.212.188.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.213.112.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.213.172.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.215.252.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.216.100.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.216.204.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.220.17.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.221.152.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.222.82.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=102.223.28.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.223.160.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=102.223.249.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=102.223.252.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.9.28/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.9.30/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.34.66/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.34.68/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.61.85/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.61.86/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.87.18/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.87.20/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.88.34/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.88.36/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.96.60/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.96.62/32 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.207.44/30 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.207.48/31 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.239.44/30 comment="IP_list_CI" list=IP2Location_CI
add address=104.28.239.48/31 comment="IP_list_CI" list=IP2Location_CI
add address=105.235.0.0/17 comment="IP_list_CI" list=IP2Location_CI
add address=136.23.0.249/32 comment="IP_list_CI" list=IP2Location_CI
add address=136.23.5.175/32 comment="IP_list_CI" list=IP2Location_CI
add address=140.248.40.16/30 comment="IP_list_CI" list=IP2Location_CI
add address=146.75.168.18/31 comment="IP_list_CI" list=IP2Location_CI
add address=146.75.168.20/31 comment="IP_list_CI" list=IP2Location_CI
add address=146.75.174.4/30 comment="IP_list_CI" list=IP2Location_CI
add address=149.18.25.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.24.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.28.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.29.32/27 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.29.64/26 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.29.192/26 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.30.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=154.0.144.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=154.14.173.232/29 comment="IP_list_CI" list=IP2Location_CI
add address=154.14.174.172/30 comment="IP_list_CI" list=IP2Location_CI
add address=154.65.56.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.66.96.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.66.116.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.66.212.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.68.0.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=154.71.32.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=154.71.64.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=154.72.0.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.72.112.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=154.73.100.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=154.119.128.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=154.232.0.0/14 comment="IP_list_CI" list=IP2Location_CI
add address=156.0.204.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=157.167.101.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.20.213.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.20.217.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.20.221.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.20.226.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=160.120.0.0/16 comment="IP_list_CI" list=IP2Location_CI
add address=160.154.0.0/15 comment="IP_list_CI" list=IP2Location_CI
add address=160.226.178.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.238.11.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.238.50.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.238.57.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=160.238.101.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=163.116.162.197/32 comment="IP_list_CI" list=IP2Location_CI
add address=163.116.162.199/32 comment="IP_list_CI" list=IP2Location_CI
add address=163.116.190.47/32 comment="IP_list_CI" list=IP2Location_CI
add address=163.116.190.51/32 comment="IP_list_CI" list=IP2Location_CI
add address=164.160.32.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=164.160.40.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=164.160.100.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=167.167.192.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=169.239.64.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=169.255.16.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=169.255.84.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=169.255.156.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=172.225.120.0/27 comment="IP_list_CI" list=IP2Location_CI
add address=172.225.144.64/27 comment="IP_list_CI" list=IP2Location_CI
add address=172.225.160.80/28 comment="IP_list_CI" list=IP2Location_CI
add address=192.12.110.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.47.36.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.51.240.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.70.201.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.75.236.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.91.200.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=192.145.176.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=192.145.230.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=193.17.215.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=193.221.218.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=193.251.240.64/32 comment="IP_list_CI" list=IP2Location_CI
add address=193.251.240.66/32 comment="IP_list_CI" list=IP2Location_CI
add address=193.251.245.143/32 comment="IP_list_CI" list=IP2Location_CI
add address=193.251.245.144/32 comment="IP_list_CI" list=IP2Location_CI
add address=193.251.245.189/32 comment="IP_list_CI" list=IP2Location_CI
add address=195.166.224.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=196.1.119.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.3.180.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.6.0.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.6.200.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.6.218.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=196.10.0.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.10.122.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=196.10.137.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.10.251.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.13.191.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.22.8.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.29.208.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.32.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=196.32.228.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=196.40.128.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.41.75.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.43.217.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.43.227.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.43.233.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.43.245.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.44.48.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.45.0.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.45.64.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=196.45.240.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.46.17.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.46.24.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.46.116.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.47.128.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=196.49.0.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.180.0.0/14 comment="IP_list_CI" list=IP2Location_CI
add address=196.192.120.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.192.125.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.192.126.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=196.192.128.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=196.192.136.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.200.208.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=196.201.0.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.201.12.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.201.64.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=196.201.160.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=196.201.248.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.171.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.184.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.204.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.214.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.226.0/23 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.244.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.216.254.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.223.4.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.223.11.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.223.26.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.223.46.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=196.250.72.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=196.250.80.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=197.148.192.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=197.149.132.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.149.140.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.149.152.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.149.164.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.149.172.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.155.208.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=197.155.240.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=197.157.236.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.157.248.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.159.192.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=197.214.120.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=197.215.224.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=197.220.32.0/19 comment="IP_list_CI" list=IP2Location_CI
add address=197.231.212.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.231.224.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.231.240.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.234.228.0/22 comment="IP_list_CI" list=IP2Location_CI
add address=197.234.248.0/21 comment="IP_list_CI" list=IP2Location_CI
add address=197.239.192.0/18 comment="IP_list_CI" list=IP2Location_CI
add address=197.242.208.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=197.242.224.0/20 comment="IP_list_CI" list=IP2Location_CI
add address=212.96.27.0/24 comment="IP_list_CI" list=IP2Location_CI
add address=212.115.188.76/30 comment="IP_list_CI" list=IP2Location_CI
add address=212.115.189.216/30 comment="IP_list_CI" list=IP2Location_CI
add address=212.115.189.224/29 comment="IP_list_CI" list=IP2Location_CI
add address=212.222.184.176/29 comment="IP_list_CI" list=IP2Location_CI
add address=213.136.96.0/19 comment="IP_list_CI" list=IP2Location_CI
