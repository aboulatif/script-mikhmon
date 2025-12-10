


Hello guys share ko lang script kung paano iblock ang torrent download, eto po ang ginagamit na script sa mga starlink users..


1. GOTO TO WINBOX.. CLICK NEW TERMINAL

2. NOW COPY THE SCRIPT AND PASTE TO NEW TERMINAL STEP BY STEP.

STEP 1

/ip firewall layer7-protocol
add comment="P2P WWW web base content Matching / umar" name=p2p_www regexp=\
"^.*(get|GET).+(torrent|thepiratebay|isohunt|entertane|demonoid|btjunkie|mininova|flixflux|vertor|h33t|zoozle|bitnova|bitsoup|meganova|fulldls|btbot|fenopy|gpirate|commonbits).*\$"
add comment="P2P DNS Matching / umar" name=p2p_dns regexp=\
"^.+(torrent|thepiratebay|isohunt|entertane|demonoid|btjunkie|mininova|flixflux|vertor|h33t|zoozle|bitnova|bitsoup|meganova|fulldls|btbot|fenopy|gpirate|commonbits).*\$"


step2

/ip firewall mangle
add action=mark-packet chain=postrouting comment="p2p download" disabled=no layer7-protocol=p2p_www new-packet-mark="p2p download" passthrough=no
add action=mark-packet chain=postrouting disabled=no layer7-protocol=p2p_dns new-packet-mark="p2p download" passthrough=no

step 3 

/ip firewall filter
add action=drop chain=forward comment="Block P2p_www Packets / umar" disabled=no layer7-protocol=p2p_www
add action=drop chain=forward comment="Block P2p_dns Packets / umar" disabled=no layer7-protocol=p2p_dns
add action=drop chain=forward comment="Block General P2P Connections , default mikrotik p2p colelction / umar" disabled=no p2p=all-p2p
#Another approach to block P2P, taken from the mikrotik forum, Not personally checked yet. Someone please check and update /

Step 4 :

/ip firewall filter
add action=drop chain=forward comment="TORRENT No 1: Classic non security torrent" disabled=no p2p=all-p2p
add action=drop chain=forward comment="TORRENT No 2: block outgoing DHT" content=d1:ad2:id20: disabled=no dst-port=1025-65535 packet-size=95-190 protocol=udp
add action=drop chain=forward comment="TORRENT No 3: block outgoing TCP announce" content="info_hash=" disabled=no dst-port=2710,80 protocol=tcp
add action=drop chain=forward comment="TORRENT No 4: prohibits download .torrent files. " content="\r\nContent-Type: application/x-bittorrent" disabled=no protocol=tcp src-port=80
add action=drop chain=forward comment="TORRENT No 5: 6771 block Local Broadcast" content="\r\nInfohash:" disabled=no dst-port=6771 protocol=udp


DONE!

NOW TRY TO CONNECT YOUR MIKROTIK AND DOWNLOAD VIA TORRENT..