
[admin@MikroTik] > system/device-mode/print 
                 mode: advanced     
     allowed-versions: 7.13+,6.49.8+
              flagged: no           
     flagging-enabled: yes          
            scheduler: yes          
                socks: yes          
                fetch: yes          
                 pptp: yes          
                 l2tp: yes          
       bandwidth-test: yes          
          traffic-gen: no           
              sniffer: yes          
                ipsec: yes          
                romon: yes          
                proxy: yes          
              hotspot: yes          
                  smb: yes          
                email: yes          
             zerotier: yes          
            container: no           
  install-any-version: no           
           partitions: no           
          routerboard: yes          
        attempt-count: 0   




[admin@MikroTik] > system/device-mode/update container=yes 
  update: too many unsuccessful attempts, turn off power or reboot by pressing reset or mode button in 4m55s to reset attempt-count



[admin@MikroTik] > system/device-mode/update mode=home email=yes fetch=yes
[admin@MikroTik] > system/device-mode/print config
   mode: home
  fetch: yes
  email: yes
[admin@MikroTik] > system/device-mode/update mode=advanced sniffer=no
-- reboot --
[admin@MikroTik] > system/device-mode/print config
     mode: advanced
  sniffer: no

https://help.mikrotik.com/docs/spaces/ROS/pages/93749258/Device-mode
