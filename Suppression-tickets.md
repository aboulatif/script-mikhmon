1.Afficher les utilisateurs qui ont le profile "500" (vérifier avant suppression)

/ip/hotspot/user/print where profile="01-JOUR"


2.Compter combien (optionnel)

/ip/hotspot/user/print count-only where profile="01-JOUR"

3.Supprimer tous les utilisateurs/tickets du profile "01-JOUR"


/ip/hotspot/user/remove [find where profile="01-JOUR"]

