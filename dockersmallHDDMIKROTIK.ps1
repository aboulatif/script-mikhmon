
creer une ram virtuelle pour les mikrotik hap ax2

/disk add type=tmpfs tmpfs-max-size=450M slot=disk1


https://forum.mikrotik.com/viewtopic.php?t=203375
https://www.xiaocaicai.com/2023/12/mikrotik%E4%BD%BF%E7%94%A8container%E9%83%A8%E7%BD%B2%E5%9F%BA%E4%BA%8Ealpine%E7%9A%84smartdns%E6%8F%90%E4%BE%9B%E6%99%BA%E8%83%BDdns%E6%9C%8D%E5%8A%A1/

Une fois mikhmon installé si vous redemarrer limage sera perdu alors utiliser ce script


nom du script = restore_mikhmon
<CONTAINER_COMMENT> = renommer par mikhmon le commentaire du container dans mikrotik

:local contComment "mikhmon"
:local logPrefix "Container update: "


:local abortWithMessage do={
  :log error "$($logPrefix)Error - $1"
  :error $1
}

/container

:local contId [find where comment=$contComment]
:if ($contId = "") do={ $abortWithMessage ("container $contComment not found, aborting") logPrefix=$logPrefix }

:local contStatus ([get $contId]->"status")
:if ($contStatus = "extracting") do={ $abortWithMessage ("container $contComment is extracting, aborting") logPrefix=$logPrefix }

:log info "$($logPrefix)Container $contComment update started"
:local contStarted true

:if ($contStatus != "stopped") do={
  :if ($contStatus = "running") do={
    :log warn "$($logPrefix)Container $contComment is running, stopping container"
    :set contStarted true
    stop $contId
  }

  :local stopTimeoutSec 120
  :local sec 0

  :while (([get $contId]->"status") != "stopped" && $sec <= $stopTimeoutSec) do={
    :delay 1
    :set sec ($sec + 1)
  }

  :if ($sec > $stopTimeoutSec) do={ $abortWithMessage ("container $contComment stop timed out, aborting") logPrefix=$logPrefix }
  :log info "$($logPrefix)Container $contComment stopped"
}

:local cont [get $contId]
remove $contId
:delay 5


# after ROS upgrade check below if something has changed
# ------------------------------------------------------
# validAddArgs - array of container add command argument names which are named exact as config property names
:local validAddArgs ( "cmd", "comment", "dns", "domain-name", "entrypoint", "envlist", "hostname", "interface", "logging", "mounts", "root-dir", "start-on-boot", "workdir" )
# replaceArgs - key-value array for mapping container add command argument name from different config property name, where key is config property name and value is argument name
:local replaceArgs { "tag"="remote-image" }
# addCmd - ROS CLI container add command
:local addCmd "/container add"
# -----------------------------------------------------


:local escapeStr do={
  :local strLen [:len $1]
  :local escStr ""

  :for i from=0 to=($strLen - 1) do={
    :local chr [:pick $1 $i ($i + 1)]

    :if ($chr = "\$") do={ :set escStr "$escStr\\\$" } else={
      :if ($chr = "\\") do={ :set escStr "$escStr\\\\" } else={
        :if ($chr = "\"") do={ :set escStr "$escStr\\\"" } else={
          :set escStr "$escStr$chr"
        }
      }
    }
  }

  :return "\"$escStr\""
}

:local arrayToStr do={
  :local arrLen [:len $1]
  :local strArr "("

  :for i from=0 to=($arrLen - 1) do={
    :local item [:pick $1 $i]

    :if ([:len $strArr] > 1) do={ :set $strArr "$strArr," }
    :if ([:typeof $item] = "str") do={
      :set $strArr "$strArr$([$escapeStr $item])"
    } else={
      :set $strArr "$strArr$item"
    }
  }

  :return "$strArr)"
}

:local escapeValue do={
  :if ([:typeof $1] = "str") do={ :return [$escapeStr $1] }
  :if ([:typeof $1] = "array") do={ :return [$arrayToStr $1 escapeStr=$escapeStr] }
  :if ([:typeof $1] = "bool") do={:if ($1) do={ :return "yes" } else={ :return "no" }}
  :return $1
}

:foreach k,v in=$cont do={
  :if ([:len $v] != 0) do={
    :if ([:find $validAddArgs $k] >= 0) do={
      :set addCmd "$addCmd $k=$([$escapeValue $v escapeStr=$escapeStr arrayToStr=$arrayToStr])"
    } else={
      :local rk ($replaceArgs->"$k")
      :if ([:typeof $rk] != "nothing") do={ :set addCmd "$addCmd $rk=$([$escapeValue $v escapeStr=$escapeStr arrayToStr=$arrayToStr])" }
    }
  }
}

:execute "$addCmd" as-string
:set contId [find where comment=$contComment]
:if ($contId = "") do={ $abortWithMessage ("unable to add container $contComment, check add command: $addCmd") logPrefix=$logPrefix }

# rise if not enough (30min) on slow network or device
:local extrTimeoutSec 1800
:local sec 0

:while (([get $contId]->"status") = "extracting" && $sec <= $extrTimeoutSec) do={
  :delay 1
  :set sec ($sec + 1)
}

:if ($sec > $extrTimeoutSec) do={ $abortWithMessage ("container $contComment extract wait timed out, something is failed or slower than expected") logPrefix=$logPrefix }
:if ($contStarted) do={ start $contId }
:log info "$($logPrefix)Container $contComment update finished"


creation du scheduler :
 name : container
 starttime : startup

 On event :
 :delay 10s
/system script run restore_mikhmon


 Changer le serveur dns dans nnetwork en 10.0.0.2

 desactiver tous dans services :
 sauf le port de winbox 8291 adress exemple : 192.168.88.0/24