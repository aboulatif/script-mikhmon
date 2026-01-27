												
												<!-- 
    Mini Voucher Template (60/A4 Optimized)
    Target: 5 columns x 12 rows = 60 items per page
-->
<?php
// Function to verify price and assign color
$colorClass = "bg-default"; // Default gradient
$p = strtolower($price); // Normalize comparison

if (strpos($p, '100') !== false) {
    $colorClass = "bg-100";
} elseif (strpos($p, '200') !== false) {
    $colorClass = "bg-200";
} elseif (strpos($p, '500') !== false) {
    $colorClass = "bg-500";
} elseif (strpos($p, '700') !== false) {
    $colorClass = "bg-700";
} elseif (strpos($p, '1000') !== false) {
    $colorClass = "bg-1000";
} elseif (strpos($p, '1500') !== false) {
    $colorClass = "bg-1500";
} elseif (strpos($p, '2000') !== false) {
    $colorClass = "bg-2000";
} elseif (strpos($p, '3000') !== false) {
    $colorClass = "bg-3000";
} elseif (strpos($p, '300') !== false) {
    $colorClass = "bg-300";
} 

// Format validity display
if (!empty($validity)) {
    // Check if validity ends in 'd' (days)
    if (preg_match('/^(\d+)d$/', strtolower($validity), $matches)) {
        $days = intval($matches[1]);
        if ($days == 1) {
            $validity = "01-JOUR";
        } elseif ($days == 7) {
            $validity = "01-SEMAINE";
        } elseif ($days == 14) {
             $validity = "02-SEMAINES";
        } elseif ($days == 30) {
            $validity = "01-MOIS";
        } else {
            $validity = sprintf("%02d-JOURS", $days);
        }
    }
}
?>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@500;700&display=swap');

    /* Color definitions */
    .bg-default { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
    .bg-100 { background: linear-gradient(135deg, #10b981 0%, #059669 100%); /* Green */ }
    .bg-200 { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); /* Blue */ }
    .bg-300 { background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%); /* Cyan */ }
    .bg-500 { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); /* Purple */ }
    .bg-700 { background: linear-gradient(135deg, #14b8a6 0%, #0d9488 100%); /* Teal */ }
    .bg-1000 { background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); /* Orange */ }
    .bg-1500 { background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%); /* Indigo */ }
    .bg-2000 { background: linear-gradient(135deg, #ec4899 0%, #db2777 100%); /* Pink */ }
    .bg-3000 { background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); /* Red */ }

    /* Print settings to ensure A4 fit */
    @page {
        size: A4;
        margin: 5mm;
    }

    .voucher-mini {
        display: inline-flex;
        flex-direction: column;
        width: 142px; /* Approx 37.5mm */
        height: 82px; /* Approx 21.5mm */
        margin: 2px;
        background: white;
        border: 1px solid #ddd;
        border-radius: 6px;
        overflow: hidden;
        box-sizing: border-box;
        page-break-inside: avoid;
        font-family: 'Outfit', sans-serif;
        vertical-align: top;
        float: left;
    }

    .voucher-header {
        /* background is set via inline style or class */
        color: white;
        padding: 2px 4px;
        text-align: center;
        height: 14px;
    }

    .hotspot-name {
        font-size: 8px;
        font-weight: 700;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        line-height: 14px;
    }

    .voucher-body {
        padding: 2px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

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
        font-size: 18px; /* Increased from 14px */
        font-weight: 800;
        color: #2d3748;
        word-break: break-all;
        line-height: 1.1;
    }

    .voucher-label {
        font-size: 6px;
        text-transform: uppercase;
        color: #718096;
        margin-bottom: 1px;
    }

    /* UP Mode Specifics */
    .up-row {
        display: flex;
        justify-content: space-between;
        width: 100%;
        font-size: 9px; /* Increased from 8px */
        padding: 1px 4px;
        box-sizing: border-box;
    }
    .up-key {
        color: #718096;
        font-size: 7px;
        align-self: center;
    }
    .up-val {
        font-size: 11px; /* Explicitly larger for values */
        font-weight: 800;
        color: #2d3748;
    }

    .footer-meta {
        display: flex;
        gap: 3px;
        margin-top: 1px;
    }
    
    .meta-badge {
        font-size: 6px;
        background: #edf2f7;
        padding: 0 3px;
        border-radius: 2px;
        color: #4a5568;
        font-weight: 700;
    }

</style>

<div class="voucher-mini">
    <div class="voucher-header <?= $colorClass; ?>">
        <div class="hotspot-name"><?= $hotspotname; ?> <span style="font-weight:300; opacity:0.8">[<?= $num; ?>]</span></div>
    </div>
    
    <div class="voucher-body">
        <?php if ($usermode == "vc") { ?>
            <div class="voucher-label">Ticket</div>
            <div class="code-box">
                <div class="code-text"><?= $username; ?></div>
            </div>
        <?php } elseif ($usermode == "up") { ?>
            <div class="voucher-label">Member Login</div>
            <div style="width:100%; padding: 0 2px;">
                <div class="up-row" style="border-bottom:1px solid #eee;">
                    <span class="up-key">User</span>
                    <span class="up-val"><?= $username; ?></span>
                </div>
                <div class="up-row">
                    <span class="up-key">Pass</span>
                    <span class="up-val"><?= $password; ?></span>
                </div>
            </div>
        <?php } ?>

        <div class="footer-meta">
            <?php if(!empty($validity)) { ?><span class="meta-badge"><?= $validity; ?></span><?php } ?>
            <?php if(!empty($price)) { 
                $displayPrice = trim(str_ireplace(['fcfa', 'FCFA'], '', $price));
                $displayPrice = str_replace('.00', '', $displayPrice);
                ?><span class="meta-badge"><?= $displayPrice . ' fcfa'; ?></span><?php 
            } ?>
        </div>
    </div>
</div>
