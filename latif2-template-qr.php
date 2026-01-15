
<!-- 
    QR Code Voucher Template (Miniature)
    Features: Split Layout with QR Code
-->
<?php
// Price-based Color Logic
$colorClass = "bg-default";
$p = strtolower($price);
if (strpos($p, '100') !== false) { $colorClass = "bg-100"; }
elseif (strpos($p, '200') !== false) { $colorClass = "bg-200"; }
elseif (strpos($p, '3000') !== false) { $colorClass = "bg-3000"; }
elseif (strpos($p, '300') !== false) { $colorClass = "bg-300"; }
elseif (strpos($p, '500') !== false) { $colorClass = "bg-500"; }
elseif (strpos($p, '1000') !== false) { $colorClass = "bg-1000"; }

// QR ID Generation
$qrId = "qr_" . uniqid();
$qrData = $username; // Default to username/code
if($usermode == 'up') $qrData = "u:".trim($username).",p:".trim($password); // Simple custom format for UP
?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@500;700&display=swap');

    /* Color definitions */
    .bg-default { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
    .bg-100 { background: linear-gradient(135deg, #10b981 0%, #059669 100%); }
    .bg-200 { background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%); }
    .bg-300 { background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%); }
    .bg-500 { background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%); }
    .bg-1000 { background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); }
    .bg-3000 { background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%); }

    /* Print Setup */
    @page { size: A4; margin: 5mm; }

    .voucher-mini {
        display: inline-flex;
        width: 142px;
        height: 82px;
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

    /* Left Side: QR */
    .qr-section {
        width: 62px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        border-right: 1px dashed #e2e8f0;
        padding: 2px;
    }

    .qr-code {
        width: 54px;
        height: 54px;
    }
    
    .qr-code img {
        display: block; /* Remove gap */
        width: 100%; /* Ensure it fits container */
        height: auto;
    }

    /* Right Side: Details */
    .details-section {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }

    .voucher-header {
        color: white;
        padding: 2px 4px;
        text-align: center;
        height: 14px;
        line-height: 14px;
    }

    .hotspot-name {
        font-size: 7px;
        font-weight: 700;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .details-body {
        padding: 2px 4px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
    }

    .code-text-qr {
        font-size: 13px; /* Slightly smaller than non-QR to fit */
        font-weight: 700;
        color: #2d3748;
        word-break: break-all;
        line-height: 1.1;
        margin: 2px 0;
    }

    .label-qr {
        font-size: 6px;
        color: #718096;
        text-transform: uppercase;
    }

</style>

<div class="voucher-mini">
    <div class="qr-section">
        <div id="<?= $qrId; ?>" class="qr-code"></div>
    </div>
    <div class="details-section">
        <div class="voucher-header <?= $colorClass; ?>">
             <div class="hotspot-name"><?= $hotspotname; ?></div>
        </div>
        <div class="details-body">
            
            <?php if ($usermode == "vc") { ?>
                <div class="label-qr">Code</div>
                <div class="code-text-qr"><?= $username; ?></div>
            <?php } elseif ($usermode == "up") { ?>
                <div class="label-qr">User</div>
                <div class="code-text-qr"><?= $username; ?></div>
                <div style="font-size:9px; font-weight:700; color:#718096;"><?= $password; ?></div>
            <?php } ?>

            <div style="margin-top:2px;">
                <?php if(!empty($price)) { ?>
                    <span style="font-size:8px; font-weight:700; color:#4a5568; background:#edf2f7; padding:1px 3px; border-radius:2px;"><?= $price; ?></span>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    new QRCode(document.getElementById("<?= $qrId; ?>"), {
        text: "<?= $qrData; ?>",
        width: 54,
        height: 54,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.L
    });
</script>
