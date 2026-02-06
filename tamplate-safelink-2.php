<!-- 
    Mini Voucher Template (60/A4 Optimized)
    Target: 5 columns x 12 rows = 60 items per page
    Prix standardisés: 200, 500, 700, 1000, 1300, 2000 FCFA
-->
<?php
/**
 * SECTION 1: Attribution de la couleur selon le prix EXACT
 * Utilisation: Détecte le prix et applique la couleur correspondante
 */
$colorClass = "bg-default";
$priceClean = preg_replace('/[^0-9]/', '', $price); // Extrait UNIQUEMENT les chiffres
$priceValue = intval($priceClean);

// Attribution couleur selon le prix exact
switch($priceValue) {
    case 200:
        $colorClass = "bg-200"; // Bleu ciel vif
        break;
    case 500:
        $colorClass = "bg-500"; // Vert émeraude
        break;
    case 700:
        $colorClass = "bg-700"; // Orange mandarine
        break;
    case 1000:
        $colorClass = "bg-1000"; // Violet royal
        break;
    case 1300:
        $colorClass = "bg-1300"; // Rose fuchsia
        break;
    case 2000:
        $colorClass = "bg-2000"; // Rouge cerise
        break;
    default:
        // Gestion des prix non standard
        if ($priceValue > 0 && $priceValue < 200) {
            $colorClass = "bg-100";
        } elseif ($priceValue > 200 && $priceValue < 500) {
            $colorClass = "bg-300";
        } elseif ($priceValue > 500 && $priceValue < 700) {
            $colorClass = "bg-600";
        } elseif ($priceValue > 700 && $priceValue < 1000) {
            $colorClass = "bg-800";
        } elseif ($priceValue > 1000 && $priceValue < 1300) {
            $colorClass = "bg-1100";
        } elseif ($priceValue > 1300 && $priceValue < 2000) {
            $colorClass = "bg-1500";
        } elseif ($priceValue >= 2000) {
            $colorClass = "bg-3000";
        }
}

/**
 * SECTION 2: Formatage de la validité
 */
$validityDisplay = ""; 
if (!empty($validity)) {
    $validityLower = strtolower(trim($validity));
    
    if (preg_match('/^(\d+)d$/', $validityLower, $matches)) {
        $days = intval($matches[1]);
        
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
            case 10:
                $validityDisplay = "10-JOURS";
                break;
            case 14:
                $validityDisplay = "02-SEMAINES";
                break;
            case 30:
                $validityDisplay = "01-MOIS";
                break;
            case 60:
                $validityDisplay = "02-MOIS";
                break;
            case 90:
                $validityDisplay = "03-MOIS";
                break;
            default:
                $validityDisplay = sprintf("%02d-JOURS", $days);
        }
    } else {
        $validityDisplay = strtoupper($validity);
    }
}

/**
 * SECTION 3: Formatage du prix pour affichage
 * ⚠️ CORRECTION: Cette section était problématique
 */
$displayPrice = "";
if (!empty($price)) {
    // Étape 1: Extraire UNIQUEMENT les chiffres
    $numericPrice = preg_replace('/[^0-9]/', '', $price);
    
    // Étape 2: Convertir en nombre entier
    $priceInt = intval($numericPrice);
    
    // Étape 3: Formater avec séparateur d'espace (si > 999)
    if ($priceInt >= 1000) {
        // Pour 2000 → "2 000"
        $displayPrice = number_format($priceInt, 0, '', ' ');
    } else {
        // Pour 500 → "500" (pas de séparateur)
        $displayPrice = strval($priceInt);
    }
}
?>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@500;700;800&display=swap');

    /* ===== PALETTE DE COULEURS ===== */
    .bg-200 { background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%); }
    .bg-500 { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
    .bg-700 { background: linear-gradient(135deg, #f97316 0%, #ea580c 100%); }
    .bg-1000 { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); }
    .bg-1300 { background: linear-gradient(135deg, #ec4899 0%, #db2777 100%); }
    .bg-2000 { background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); }
    
    /* Couleurs intermédiaires */
    .bg-100 { background: linear-gradient(135deg, #64748b 0%, #475569 100%); }
    .bg-300 { background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%); }
    .bg-600 { background: linear-gradient(135deg, #eab308 0%, #ca8a04 100%); }
    .bg-800 { background: linear-gradient(135deg, #d97706 0%, #b45309 100%); }
    .bg-1100 { background: linear-gradient(135deg, #4f46e5 0%, #4338ca 100%); }
    .bg-1500 { background: linear-gradient(135deg, #d946ef 0%, #c026d3 100%); }
    .bg-3000 { background: linear-gradient(135deg, #991b1b 0%, #7f1d1d 100%); }
    .bg-default { background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%); }

    /* ===== CONFIGURATION IMPRESSION ===== */
    @page {
        size: A4;
        margin: 5mm;
    }

    @media print {
        body { margin: 0; padding: 0; }
        .voucher-mini { 
            print-color-adjust: exact;
            -webkit-print-color-adjust: exact;
            page-break-inside: avoid;
        }
    }

    /* ===== STRUCTURE ===== */
    .voucher-mini {
        display: inline-flex;
        flex-direction: column;
        width: 142px;
        height: 82px;
        margin: 2px;
        background: white;
        border: 1px solid #d1d5db;
        border-radius: 6px;
        overflow: hidden;
        box-sizing: border-box;
        font-family: 'Outfit', sans-serif;
        vertical-align: top;
        float: left;
        box-shadow: 0 1px 2px rgba(0,0,0,0.05);
    }

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
        text-overflow: ellipsis;
        line-height: 14px;
        width: 100%;
        text-shadow: 0 1px 2px rgba(0,0,0,0.2);
    }

    .voucher-body {
        padding: 3px 2px 2px 2px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background: white;
    }

    .code-box {
        background: #f8fafc;
        border: 1px dashed #cbd5e0;
        border-radius: 4px;
        padding: 3px 5px;
        margin: 2px 0;
        width: 92%;
        text-align: center;
    }

    .code-text {
        font-size: 17px;
        font-weight: 800;
        color: #1e293b;
        word-break: break-all;
        line-height: 1.2;
        letter-spacing: 0.5px;
    }

    .voucher-label {
        font-size: 6px;
        text-transform: uppercase;
        color: #64748b;
        margin-bottom: 1px;
        font-weight: 600;
        letter-spacing: 0.3px;
    }

    /* ===== MODE UP ===== */
    .up-container {
        width: 100%;
        padding: 0 3px;
    }

    .up-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        padding: 2px 4px;
        box-sizing: border-box;
    }
    
    .up-row:first-child {
        border-bottom: 1px solid #e2e8f0;
        padding-bottom: 3px;
        margin-bottom: 2px;
    }
    
    .up-key {
        color: #64748b;
        font-size: 7px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.3px;
    }
    
    .up-val {
        font-size: 11px;
        font-weight: 800;
        color: #1e293b;
        word-break: break-all;
        max-width: 70%;
        text-align: right;
    }

    /* ===== MÉTADONNÉES ===== */
    .footer-meta {
        display: flex;
        gap: 4px;
        margin-top: 3px;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    
    .meta-badge {
        font-size: 9px;
        background: #f1f5f9;
        padding: 2px 5px;
        border-radius: 3px;
        color: #334155;
        font-weight: 700;
        white-space: nowrap;
        border: 1px solid #e2e8f0;
        letter-spacing: 0.2px;
    }

    .meta-badge.price {
        background: #fef3c7;
        color: #92400e;
        border-color: #fde68a;
    }

    .meta-badge.validity {
        background: #dbeafe;
        color: #1e40af;
        border-color: #bfdbfe;
    }
</style>

<div class="voucher-mini">
    <div class="voucher-header <?= $colorClass; ?>">
        <div class="hotspot-name">
            <?= htmlspecialchars($hotspotname); ?> 
            <span style="font-weight:400; opacity:0.85;">[<?= htmlspecialchars($num); ?>]</span>
        </div>
    </div>
    
    <div class="voucher-body">
        <?php if ($usermode == "vc") { ?>
            <div class="voucher-label">Code Ticket</div>
            <div class="code-box">
                <div class="code-text"><?= htmlspecialchars($username); ?></div>
            </div>
            
        <?php } elseif ($usermode == "up") { ?>
            <div class="voucher-label">Identifiants Membre</div>
            <div class="up-container">
                <div class="up-row">
                    <span class="up-key">User</span>
                    <span class="up-val"><?= htmlspecialchars($username); ?></span>
                </div>
                <div class="up-row">
                    <span class="up-key">Pass</span>
                    <span class="up-val"><?= htmlspecialchars($password); ?></span>
                </div>
            </div>
        <?php } ?>

        <div class="footer-meta">
            <?php if(!empty($validityDisplay)) { ?>
                <span class="meta-badge validity"><?= htmlspecialchars($validityDisplay); ?></span>
            <?php } ?>
            
            <?php if(!empty($displayPrice)) { ?>
                <span class="meta-badge price"><?= htmlspecialchars($displayPrice); ?> F</span>
            <?php } ?>
        </div>
    </div>
</div>
