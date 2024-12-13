
<?php
$langid = "fr"; // ID de la langue
$langname = "Français"; // Nom de la langue
$language = "Langue"; // Langue

// Textes traduits
$_about = "À propos";
$_action = "Action";
$_add = "Ajouter";
$_add_router = "Ajouter un routeur";
$_add_user = "Ajouter un utilisateur";
$_add_user_profile = "Ajouter un profil";
$_admin = "Administrateur";
$_admin_settings = "Paramètres administrateur";
$_all = "Tout";
$_auto_reload = "Chargement automatique";
$_bluetooth_ac = "Imprimer le code d'accès BT";
$_board_name = "Nom de la carte";
$_by_comment = "Par commentaire";
$_cancel = "Annuler";
$_character = "Caractère";
$_close = "Fermer";
$_comment = "Commentaire";
$_confirm = "Confirmer";
$_connecting = "Connexion";
$_cpu_load = "Charge du CPU";
$_currency = "Devise";
$_dashboard = "Tableau de bord";
$_data_limit = "Limite de données";
$_date = "Date";
$_days = "jours";
$_delete_data = "Supprimer les données";
$_delete = "Supprimer";
$_dhcp_leases = "Baux DHCP";
$_dns_name = "Nom DNS";
$_edit = "Modifier";
$_edit_user = "Modifier l'utilisateur";
$_end = "Fin";
$_expired = "Expiré";
$_expired_mode = "Mode expiré";
$_extend_expired_date = "Prolonger la date d'expiration";
$_format_file_name = "Format du nom de fichier";
$_free_hdd = "Espace HDD libre";
$_free_memory = "Mémoire libre";
$_generate_code = "Générer un code";
$_generate = "Générer";
$_generate_user = "Générer un utilisateur";
$_grace_period = "Période de grâce";
$_help = "Aide";
$_hosts = "Hôtes";
$_hotspot_active = "Hotspot actif";
$_hotspot_cookies = "Cookies";
$_hotspot_log = "Journal du hotspot";
$_hotspot_name = "Nom du hotspot";
$_hotspot_users = "Utilisateur du hotspot";
$_hours = "heures";
$_idle_timeout = "Délai d'inactivité";
$_income = "Revenus";
$_interface = "Interface";
$_ip_bindings = "Liaisons IP";
$_last_generate = "Dernière génération";
$_list_logo = "Logo de la liste";
$_live_report = "Rapport en direct";
$_loading = "Chargement";
$_loading_interface = "Chargement de l'interface";
$_loading_theme = "Chargement du thème";
$_lock_user = "Verrouiller l'utilisateur";
$_log = "Journal";
$_logout = "Déconnexion";
$_messages = "Messages";
$_min = "min";
$_minutes = "minutes";
$_model = "Modèle";
$_name = "Nom";
$_no = "Non";
$_open = "Ouvrir";
$_package = "Forfait";
$_password = "Mot de passe";
$_please_login = "Veuillez vous connecter";
$_ppp_active = "PPP actif";
$_ppp_profiles = "Profils PPP";
$_ppp_secrets = "Secrets PPP";
$_prefix = "Préfixe";
$_price = "Prix";
$_print_default = "Par défaut";
$_print = "Imprimer";
$_print_qr = "QR";
$_print_small = "Petit";
$_processing = "Traitement en cours...";
$_profile = "Profil";
$_qty = "Quantité";
$_quick_print = "Impression rapide";
$_random = "Aléatoire";
$_readme = "Lire-moi";
$_reboot = "Êtes-vous sûr de redémarrer ?";
$_reduce_expired_date = "Réduire la date d'expiration";
$_remove = "Supprimer";
$_report = "Rapport";
$_reset_start_date = "Réinitialiser la date de début";
$_resume = "Reprendre";
$_router_list = "Liste des routeurs";
$_save = "Enregistrer";
$_search = "Rechercher";
$_sec = "sec";
$_seconds = "secondes";
$_selected = "Sélectionné";
$_select_interface = "Sélectionner une interface";
$_selling_price = "Prix de vente";
$_selling_report = "Rapport de vente";
$_send_to_WA = "Envoyer à WhatsApp";
$_session_name = "Nom de session";
$_session = "Session";
$_session_settings = "Paramètres de session";
$_settings = "Paramètres";
$_share = "Partager";
$_show_all = "Afficher tout";
$_shutdown = "Êtes-vous sûr de vouloir éteindre ?";
$_start = "Démarrer";
$_system_date_time = "Date et heure système";
$_system_off = "Éteindre";
$_system_reboot = "Redémarrer";
$_system_scheduler = "Planificateur";
$_system = "Système";
$_template_editor = "Éditeur de modèles";
$_theme = "Thème";
$_this_month = "Ce mois";
$_time_limit = "Limite de temps";
$_time = "Temps";
$_today = "Aujourd'hui";
$_total = "Total";
$_traffic_interface = "Interface de trafic";
$_traffic_monitor = "Moniteur de trafic";
$_traffic = "Trafic";
$_upload = "Télécharger";
$_upload_logo = "Télécharger le logo";
$_uptime = "Temps de fonctionnement";
$_uptime_user = "Temps utilisateur";
$_user_length = "Longueur du nom";
$_user_list = "Liste des utilisateurs";
$_user_log = "Journal des utilisateurs";
$_user_mode = "Mode utilisateur";
$_user_name = "Nom d'utilisateur";
$_user_pass = "Nom d'utilisateur & mot de passe";
$_user_profile_list = "Liste des profils";
$_user_profile = "Profil utilisateur";
$_users = "Utilisateurs";
$_user_user = "Nom d'utilisateur = Mot de passe";
$_validity = "Validité";
$_voucher_code = "Code de bon";
$_vouchers = "Bons";
$_yes = "Oui";

// Détails
$_format_time_limit = "
    Format $_time_limit.<br>
    [wdhm] Exemple : 30d = 30$_days, 12h = 12$_hours, 4w3d = 31$_days.
";
$_details_add_user = "
    $_add_user avec $_time_limit.<br>
    $_time_limit doit être < $_validity.
";
$_details_user_profile = "
Le mode $_expired_mode contrôle les utilisateurs du hotspot.<br>
Options : Supprimer, Notifier, Supprimer & Enregistrer, Notifier & Enregistrer.
<ul>
<li><strong>Supprimer</strong> : L\'utilisateur sera supprimé après expiration.</li>
<li><strong>Notifier</strong> : L\'utilisateur ne sera pas supprimé, mais recevra une notification après expiration.</li>
<li><strong>Enregistrer</strong> : Enregistre le prix de chaque connexion utilisateur pour calculer les ventes totales.</li>
</ul>

<p><strong>$_lock_user</strong> : Le nom d\'utilisateur ne peut être utilisé que sur un seul appareil.</p>
";

$_format_validity = "
Format de $_validity<br>
[wdhm] Exemple : 30d = 30$_days, 12h = 12$_hours, 30m = 30$_minutes<br>
5$_hours 30$_minutes = 5h30m.
";

$_format_ip_binding = "
Format de limite de téléchargement/téléversement<br>
[k / M] Exemple : 512k, 1500k, 1M<br><br>
Format de $_validity<br>
[d] Exemple : 30d = 30$_days.
";


$_help_report = '
<ul>
<li>Cliquez sur CSV pour télécharger.</li>
<li>Pour les filtres par mois, sélectionnez le jour et le mois, puis cliquez sur Filtrer.<br>
	<img width="70%" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAATUAAAAsCAYAAAAEsS/jAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAOlSURBVHhe7d09TtxAGMbxnCYSKOJDCggtqZIqHCRVpFwDiYJj0MARIq2i5QQUW6RH0CJST/x6bM/YM7Z38cfi1//iJ2F7PCvGfp+ZYQs+nH+7MACgBaEGQBVCDYAqhBoAVQg1AKoQagBUaQy1xdfv0fMA8F7VhtrBycLsH382Hz8dYgf2jxh74C2ioXZ4ujB7SVEdn33BjuQPKHYNmJtt6iEINdlyygrt+Ow8aIzxEGqA0ynUBMW0e4Qa4BBqChBqgEOoKUCoAQ6hpgChBjiEmgKEGuAQagoQaoBDqClAqAHOiKF2bZZP/8zLa+jhNtYem+oUardr8/J0by5j14AJGj3UggC7ujePBFsnhBrg7D7UhBTW69rc5MdZ0LnV3LNZXtlrN+vkeH3n3W/7fVxde+em7ffyj/e7W3Iu1lb0GmoNY2+vrc1y9eyue/deyvlSQN6Zh6SNe+bhat09N2nr9f3016yD51rtD3MwZD0MF2rpy5oVT7ByywohL5ZoAHrHCvz4+St4iHIu1lb0FmptY58HXjGp2JDJg6c51LK+vAkpbV+Epm0bXPf7Y1U5S0PWw4Ch1nSt+nKXZ+v0WmnlpoM/OzXNSqK3UIsojX0aat7KLeGvnIMQqjyrQKm/SNvK58lnaVqRY3ND1cPIoZbN3DmvWPyXW36uLZoJ82enpllJ9B9qNWPfU6il9xT9N4Ra6b2Qn8ufjfkYqh7G2X56BVW7rSkKUdrq2nr6ZEZqm5VEf6HWMvYdQ60Is2h/5ba5tE/pX9qW+sbcDFEP43xREFk5xIslKYZV0lbh1jMnM1LbrCS2eYhFSOTn/PFuG/tOoZY9M3+ltUGo2Tb2CwS2nvM2RD0ME2rpS+ud9wOuOPZm90w+60dDcma2eYjV8fVDqXXsW0LNtnfX05ArnlE1tOxx8/ZT2Pem9C0s0GD0UEuLpCR8WYttipCCqhRLqlqAM7ZVqCWC8W265o99W6hV7n9c3ZUnsjwkU9KPDTK7AqsLtdgKEKg3Yqj1TArE30bN2LahNjUSamw9sanJhpqsCGKz+hzpDjVZ4YereaDO9EIt+xscqzRHbahl21VWadjG9EINAbWhBrwBoaYAoQY4hJoChBrgEGoKEGqA0ynU3D8zjt+AcRBqgNMp1MTBycLsHfFf2neJUAOczqEmDk8X6Yot7wzj2k8mldh5AM1qQ03IVjR2HgDeq8ZQA4CpIdQAqEKoAVCFUAOgCqEGQBVCDYAiF+Y/bd3pxgv3MhEAAAAASUVORK5CYII=">
	</li>
	<li>FFiltrer en fonction de '.$_prefix.', remplissez '.$_prefix.' dans le champ de recherche, puis cliquez sur Filtrer.</li>
	<li>Filtrer en fonction de $_comment, saisissez !!$_comment dans la colonne, puis cliquez sur Filtrer. Ou cliquez sur l\'un des commentaires. (Mikhmon Online).</li>
	<li>Il est recommandé de supprimer le rapport de ventes après avoir téléchargé le rapport CSV.</li>
	</ul>
';

$_delete_report = '
<ul>
		        <li>La suppression du rapport de ventes supprimera également le journal des utilisateurs.</li>
		        <li>Il est recommandé de télécharger d\'abord $_user_log. </li>
		      </ul>
';
