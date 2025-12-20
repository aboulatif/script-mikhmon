						<style>
	.qrcode{
		height:80px;
		width:80px;
	}
</style>

<table class="voucher" style="width: 200px; background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%); border: 2px solid #2c7be5; border-radius: 8px;">
  <tbody>
    <!-- En-tête avec logo et nom -->
    <tr>
      <td style="text-align: left; font-size: 14px; font-weight:bold; border-bottom: 2px solid #2c7be5; background: linear-gradient(45deg, #2c7be5, #1a56a7); color: white; padding: 8px 5px; border-radius: 6px 6px 0 0;">
        <table style="width: 100%;">
          <tr>
            <td style="text-align: left; vertical-align: middle;">
              <img src="<?= $logo; ?>" alt="logo" style="height:30px;border:0; filter: brightness(0) invert(1);">  
            </td>
            <td style="text-align: right; vertical-align: middle;">
              <span style="font-size: 16px;"><?= $hotspotname; ?></span>
              <span id="num" style="background: rgba(255,255,255,0.2); padding: 2px 6px; border-radius: 12px; margin-left: 5px;"><?= " [$num]"; ?></span>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    
    <tr>
      <td style="padding: 8px;">
        <table style="text-align: center; width: 100%; font-size: 12px;">
          <tbody>
            <!-- Zone credentials et QR code -->
            <tr>
              <td>
                <table style="width:100%;">
                  <?php if ($usermode == "vc") { ?>
                    <!-- Mode Voucher -->
                    <tr>
                      <td style="color: #6b7280; font-size: 11px; padding-bottom: 4px;">CODE D'ACCÈS</td>
                    </tr>
                    <tr>
                      <td style="width:100%; border: 2px solid #10b981; background: #ecfdf5; font-weight:bold; font-size:16px; padding: 8px; border-radius: 6px; color: #047857;">
                        <?= $username; ?>
                      </td>
                    </tr>
                  <?php } elseif ($usermode == "up") { ?>
                    <?php if ($qr == "yes") { ?>
                      <!-- Avec QR code - disposition verticale -->
                      <tr>
                        <td style="color: #6b7280; font-size: 11px; padding-bottom: 2px;">USER</td>
                      </tr>
                      <tr>
                        <td style="border: 1px solid #e5e7eb; background: #f9fafb; font-weight:bold; padding: 6px; border-radius: 4px; margin-bottom: 4px;"><?= $username; ?></td>
                      </tr>
                      <tr>
                        <td style="color: #6b7280; font-size: 11px; padding: 4px 0 2px 0;">PASSWORD</td>
                      </tr>
                      <tr>
                        <td style="border: 1px solid #e5e7eb; background: #f9fafb; font-weight:bold; padding: 6px; border-radius: 4px;"><?= $password; ?></td>
                      </tr>
                    <?php } else { ?>
                      <!-- Sans QR code - disposition horizontale -->
                      <tr>
                        <td style="width: 50%; color: #6b7280; font-size: 11px; padding-bottom: 4px;">USER</td>
                        <td style="color: #6b7280; font-size: 11px; padding-bottom: 4px;">PASSWORD</td>
                      </tr>
                      <tr style="font-size: 14px;">
                        <td style="border: 1px solid #e5e7eb; background: #f9fafb; font-weight:bold; padding: 6px; border-radius: 4px; margin-right: 4px;"><?= $username; ?></td>
                        <td style="border: 1px solid #e5e7eb; background: #f9fafb; font-weight:bold; padding: 6px; border-radius: 4px; margin-left: 4px;"><?= $password; ?></td>
                      </tr>
                    <?php } ?>
                  <?php } ?>
                </table>
              </td>
              
              <!-- QR Code -->
              <?php if ($qr == "yes") { ?>
              <td style="vertical-align: top; padding-left: 8px;">
                <div style="border: 2px solid #2c7be5; border-radius: 6px; padding: 4px; background: white;">
                  <?= $qrcode ?>
                </div>
              </td>
              <?php } ?>
            </tr>
            
            <!-- Informations de validité -->
            <tr>
              <td colspan="2" style="border-top: 2px dashed #2c7be5; font-weight:bold; font-size:14px; padding: 8px 0; color: #1e40af; background: #eff6ff; border-radius: 4px; margin-top: 4px;">
                ⏱️ <?= $validity; ?> <?= $timelimit; ?> <?= $datalimit; ?> 
                <span style="color: #dc2626; font-size: 12px;"><?= $price; ?></span>
              </td>
            </tr>
            
            <!-- Instructions de connexion -->
            <tr>
              <td colspan="2" style="font-weight:bold; font-size:11px; padding: 6px 0; color: #374151; background: #f3f4f6; border-radius: 4px;">
                🌐 <strong>Connexion:</strong> http://<?= $dnsname; ?>
              </td>
            </tr>
            
            <!-- Message additionnel -->
            
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>	        	        	        	        	        	        	        	        	        	        	        	        	        	        	        	        	        	        
