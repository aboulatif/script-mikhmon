						<style>
/* ============================================
   STYLES POUR VOUCHER HOTSPOT WIFI
   Design moderne et professionnel
   ============================================ */

/* Container principal du voucher */
.voucher {
	width: 220px;
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border: 2px solid #2c3e50;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	overflow: hidden;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 10px auto;
}

/* En-tête avec logo/nom du hotspot */
.voucher-header {
	background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
	color: white;
	padding: 12px 10px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	border-bottom: 3px solid #2c3e50;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.voucher-header .hotspot-name {
	flex: 1;
	font-size: 15px;
	letter-spacing: 0.5px;
}

.voucher-header .voucher-num {
	background: rgba(255, 255, 255, 0.2);
	padding: 3px 8px;
	border-radius: 4px;
	font-size: 11px;
	font-weight: normal;
}

/* Corps du voucher */
.voucher-body {
	padding: 15px 10px;
}

/* Container des credentials */
.credentials-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
	margin-bottom: 12px;
}

.credentials-info {
	flex: 1;
}

/* Labels des champs */
.field-label {
	font-size: 10px;
	color: #7f8c8d;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	margin-bottom: 4px;
	font-weight: 600;
}

/* Champs de code/username/password */
.field-value {
	background: white;
	border: 2px solid #3498db;
	border-radius: 6px;
	padding: 8px 10px;
	font-weight: bold;
	font-size: 14px;
	color: #2c3e50;
	text-align: center;
	margin-bottom: 10px;
	word-break: break-all;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
}

/* Style spécial pour le code unique (mode voucher) */
.field-value.code-field {
	font-size: 18px;
	background: linear-gradient(135deg, #fff5e6 0%, #ffffff 100%);
	border-color: #e67e22;
	letter-spacing: 1px;
}

/* Container pour username et password côte à côte */
.credentials-split {
	display: flex;
	gap: 8px;
}

.credentials-split .field-group {
	flex: 1;
}

.credentials-split .field-value {
	font-size: 12px;
	padding: 6px 8px;
}

/* QR Code styling */
.qrcode-container {
	flex-shrink: 0;
	padding: 5px;
	background: white;
	border: 2px solid #3498db;
	border-radius: 6px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.qrcode {
	height: 75px;
	width: 75px;
	display: block;
}

/* Section validité et prix */
.validity-price {
	background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
	color: white;
	padding: 10px;
	border-radius: 6px;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
	margin-bottom: 10px;
	box-shadow: 0 2px 8px rgba(46, 204, 113, 0.3);
}

/* Instructions de connexion */
.connection-info {
	background: #ecf0f1;
	border: 2px dashed #95a5a6;
	border-radius: 6px;
	padding: 8px;
	text-align: center;
	font-size: 11px;
	color: #2c3e50;
}

.connection-info .connect-label {
	font-weight: 600;
	color: #7f8c8d;
	display: block;
	margin-bottom: 4px;
	text-transform: uppercase;
	font-size: 9px;
	letter-spacing: 0.5px;
}

.connection-info .url {
	font-weight: bold;
	color: #3498db;
	font-size: 12px;
	word-break: break-all;
}

/* Hover effects pour impression */
@media print {
	.voucher {
		box-shadow: none;
		border: 2px solid #2c3e50;
		page-break-inside: avoid;
	}
}

/* Responsive pour petits écrans */
@media screen and (max-width: 250px) {
	.voucher {
		width: 100%;
		max-width: 220px;
	}
	
	.credentials-container {
		flex-direction: column;
	}
	
	.qrcode-container {
		margin-top: 10px;
	}
}
</style>

<table class="voucher">
	<tbody>
		<!-- En-tête avec logo/nom du hotspot -->
		<tr>
			<td class="voucher-header">
				<span class="hotspot-name"><?= $hotspotname; ?></span>
				<span class="voucher-num"><?= $num; ?></span>
			</td>
		</tr>

		<!-- Corps du voucher -->
		<tr>
			<td class="voucher-body">
				
				<!-- Mode: Code unique (Voucher Code) -->
				<?php if ($usermode == "vc") { ?>
					
					<div class="credentials-container">
						<div class="credentials-info">
							<div class="field-label">Code d'accès</div>
							<div class="field-value code-field"><?= $username; ?></div>
						</div>
						
						<!-- QR Code (si activé) -->
						<?php if ($qr == "yes") { ?>
							<div class="qrcode-container">
								<?= $qrcode ?>
							</div>
						<?php } ?>
					</div>
					
				<!-- Mode: Username + Password -->
				<?php } elseif ($usermode == "up") { ?>
					
					<!-- Avec QR Code: disposition verticale -->
					<?php if ($qr == "yes") { ?>
						
						<div class="credentials-container">
							<div class="credentials-info">
								<div class="field-label">Utilisateur</div>
								<div class="field-value"><?= $username; ?></div>
								
								<div class="field-label">Mot de passe</div>
								<div class="field-value"><?= $password; ?></div>
							</div>
							
							<div class="qrcode-container">
								<?= $qrcode ?>
							</div>
						</div>
						
					<!-- Sans QR Code: disposition horizontale -->
					<?php } else { ?>
						
						<div class="credentials-split">
							<div class="field-group">
								<div class="field-label">Utilisateur</div>
								<div class="field-value"><?= $username; ?></div>
							</div>
							
							<div class="field-group">
								<div class="field-label">Mot de passe</div>
								<div class="field-value"><?= $password; ?></div>
							</div>
						</div>
						
					<?php } ?>
					
				<?php } ?>
				
				<!-- Validité et prix -->
				<div class="validity-price">
					<?= $validity; ?> • <?= $price; ?>
				</div>
				
				<!-- Instructions de connexion -->
				<div class="connection-info">
					<span class="connect-label">Se connecter</span>
					<span class="url">http://<?= $dnsname; ?></span>
				</div>
				
			</td>
		</tr>
	</tbody>
</table>	        
