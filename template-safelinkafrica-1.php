<!-- 
    Mini Voucher Template (60/A4 Optimized)
    Target: 5 columns x 12 rows = 60 items per page
-->
<?php
/**
 * SECTION 1: Attribution de la couleur selon le prix
 * Utilisation: Cette fonction attribue automatiquement une classe CSS 
 * basée sur le montant détecté dans $price
 */
$colorClass = "bg-default"; // Couleur par défaut si aucun prix reconnu
$p = strtolower(trim($price)); // Normalisation: minuscule + suppression espaces

// Détection du prix dans l'ordre décroissant (important!)
if (strpos($p, '3000') !== false) {
    $colorClass = "bg-3000"; // Rouge - Prix le plus élevé en premier
} elseif (strpos($p, '2000') !== false) {
    $colorClass = "bg-2000"; // Rose
} elseif (strpos($p, '1500') !== false) {
    $colorClass = "bg-1500"; // Indigo
} elseif (strpos($p, '1000') !== false) {
    $colorClass = "bg-1000"; // Orange
} elseif (strpos($p, '700') !== false) {
    $colorClass = "bg-700"; // Teal
} elseif (strpos($p, '500') !== false) {
    $colorClass = "bg-500"; // Violet
} elseif (strpos($p, '300') !== false) {
    $colorClass = "bg-300"; // Cyan
} elseif (strpos($p, '200') !== false) {
    $colorClass = "bg-200"; // Vert
} elseif (strpos($p, '100') !== false) {
    $colorClass = "bg-100"; // Bleu
}
// ⚠️ CORRECTION: J'ai inversé l'ordre (du plus grand au plus petit)
// Sinon "1000" sera détecté comme "100" en premier

/**
 * SECTION 2: Formatage de la validité
 * Utilisation: Convertit "7d" en "01-SEMAINE", "30d" en "01-MOIS", etc.
 */
$validityDisplay = ""; // Variable distincte pour l'affichage
if (!empty($validity)) {
    $validityLower = strtolower(trim($validity));
    
    // Détection du format "Xd" (X = nombre, d = jours)
    if (preg_match('/^(\d+)d$/', $validityLower, $matches)) {
        $days = intval($matches[1]);
        
        // Mapping des durées courantes
        switch($days) {
            case 1:
                $validityDisplay = "01-JOUR";
                break;
            case 5:
                $validityDisplay = "05-JOURS";
                break;
            case 7:
                $validityDisplay = "01-SEMAINE";
                break;
            case 14:
                $validityDisplay = "02-SEMAINES";
                break;
            case 30:
                $validityDisplay = "01-MOIS";
                break;
            default:
                // Pour toute autre durée, format XX-JOURS
                $validityDisplay = sprintf("%02d-JOURS", $days);
        }
    } else {
        // Si le format n'est pas "Xd", afficher tel quel
        $validityDisplay = strtoupper($validity);
    }
}
// ⚠️ CORRECTION: Utilisation de $validityDisplay au lieu d'écraser $validity
?>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@500;700;800&display=swap');

    /* ===== PALETTE DE COULEURS ===== */
    /* Utilisation: Classes appliquées selon le prix détecté */
    .bg-default { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
    .bg-100 { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); }
    .bg-200 { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
    .bg-300 { background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%); }
    .bg-500 { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); }
    .bg-700 { background: linear-gradient(135deg, #14b8a6 0%, #0d9488 100%); }
    .bg-1000 { background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); }
    .bg-1500 { background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%); }
    .bg-2000 { background: linear-gradient(135deg, #ec4899 0%, #db2777 100%); }
    .bg-3000 { background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); }

    /* ===== CONFIGURATION D'IMPRESSION ===== */
    @page {
        size: A4; /* Format papier */
        margin: 5mm; /* Marges réduites pour maximiser l'espace */
    }

    /* ===== STRUCTURE DU VOUCHER ===== */
    /* Utilisation: Conteneur principal de chaque ticket */
    .voucher-mini {
        display: inline-flex;
        flex-direction: column;
        width: 142px;  /* ~37.5mm - permet 5 colonnes sur A4 */
        height: 82px;  /* ~21.5mm - permet 12 lignes sur A4 */
        margin: 2px;   /* Espacement entre tickets */
        background: white;
        border: 1px solid #ddd;
        border-radius: 6px;
        overflow: hidden;
        box-sizing: border-box;
        page-break-inside: avoid; /* Évite la coupure lors de l'impression */
        font-family: 'Outfit', sans-serif;
        vertical-align: top;
        float: left; /* Alignement en grille */
    }

    /* ===== EN-TÊTE COLORÉ ===== */
    /* Utilisation: Bandeau supérieur avec nom du hotspot */
    .voucher-header {
        color: white;
        padding: 2px 4px;
        text-align: center;
        height: 14px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .hotspot-name {
        font-size: 8px;
        font-weight: 700;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis; /* Ajoute "..." si le texte est trop long */
        line-height: 14px;
        width: 100%;
    }

    /* ===== CORPS DU VOUCHER ===== */
    /* Utilisation: Zone centrale contenant les identifiants */
    .voucher-body {
        padding: 2px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    /* ===== BOÎTE DE CODE ===== */
    /* Utilisation: Conteneur pour username/password */
    .code-box {
        background: #f7fafc;
        border: 1px dashed #cbd5e0;
        border-radius: 4px;
        padding: 2px 5px;
        margin: 2px 0;
        width: 90%;
        text-align: center;
    }

    .code-text {
        font-size: 18px;
        font-weight: 800;
        color: #2d3748;
        word-break: break-all; /* Coupe les mots trop longs */
        line-height: 1.1;
    }

    .voucher-label {
        font-size: 6px;
        text-transform: uppercase;
        color: #718096;
        margin-bottom: 1px;
        font-weight: 500;
    }

    /* ===== MODE "UP" (Username + Password) ===== */
    /* Utilisation: Affichage en deux lignes distinctes */
    .up-row {
        display: flex;
        justify-content: space-between;
        width: 100%;
        font-size: 9px;
        padding: 1px 4px;
        box-sizing: border-box;
    }
    
    .up-key {
        color: #718096;
        font-size: 7px;
        align-self: center;
        font-weight: 500;
    }
    
    .up-val {
        font-size: 11px;
        font-weight: 800;
        color: #2d3748;
        word-break: break-all;
    }

    /* ===== MÉTADONNÉES (Prix + Validité) ===== */
    .footer-meta {
        display: flex;
        gap: 3px;
        margin-top: 2px;
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .meta-badge {
        font-size: 9px;
        background: #edf2f7;
        padding: 1px 4px;
        border-radius: 3px;
        color: #4a5568;
        font-weight: 700;
        white-space: nowrap;
    }

    /* ===== UTILITAIRE D'IMPRESSION ===== */
    @media print {
        body { margin: 0; }
        .voucher-mini { 
            print-color-adjust: exact;
            -webkit-print-color-adjust: exact;
        }
    }
</style>

<div class="voucher-mini">
    <!-- EN-TÊTE avec couleur dynamique -->
    <div class="voucher-header <?= $colorClass; ?>">
        <div class="hotspot-name">
            <?= htmlspecialchars($hotspotname); ?> 
            <span style="font-weight:300; opacity:0.8;">[<?= htmlspecialchars($num); ?>]</span>
        </div>
    </div>
    
    <div class="voucher-body">
        <?php if ($usermode == "vc") { ?>
            <!-- MODE "VC" : Voucher Code (username = password) -->
            <div class="voucher-label">Code Ticket</div>
            <div class="code-box">
                <div class="code-text"><?= htmlspecialchars($username); ?></div>
            </div>
            
        <?php } elseif ($usermode == "up") { ?>
            <!-- MODE "UP" : Username + Password séparés -->
            <div class="voucher-label">Identifiants</div>
            <div style="width:100%; padding: 0 2px;">
                <div class="up-row" style="border-bottom:1px solid #eee;">
                    <span class="up-key">User</span>
                    <span class="up-val"><?= htmlspecialchars($username); ?></span>
                </div>
                <div class="up-row">
                    <span class="up-key">Pass</span>
                    <span class="up-val"><?= htmlspecialchars($password); ?></span>
                </div>
            </div>
        <?php } ?>

        <!-- MÉTADONNÉES : Validité + Prix -->
        <div class="footer-meta">
            <?php if(!empty($validityDisplay)) { ?>
                <span class="meta-badge"><?= htmlspecialchars($validityDisplay); ?></span>
            <?php } ?>
            
            <?php if(!empty($price)) { 
                // Nettoyage du prix : suppression de "fcfa" et ".00"
                $displayPrice = trim(str_ireplace(['fcfa', 'FCFA', 'Fcfa'], '', $price));
                $displayPrice = str_replace('.00', '', $displayPrice);
                $displayPrice = preg_replace('/\s+/', '', $displayPrice); // Supprime tous les espaces
            ?>
                <span class="meta-badge"><?= htmlspecialchars($displayPrice); ?> FCFA</span>
            <?php } ?>
        </div>
    </div>
</div>
