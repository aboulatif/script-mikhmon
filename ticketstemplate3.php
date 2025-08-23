
						<?php
// --- Conversion Validité / Durée ---
if(substr($validity,-1) == "d"){
  $validity = "<b>Validité :</b> ".substr($validity,0,-1)." Jour(s)";
}else if(substr($validity,-1) == "h"){
  $validity = "<b>Validité :</b> ".substr($validity,0,-1)." Heure(s)";
}

if(substr($timelimit,-1) == "d" && strlen($timelimit) > 3){
  $timelimit = "<b>Durée :</b> ".((substr($timelimit,0,-1)*7) + substr($timelimit,2,1))." Jour(s)";
}else if(substr($timelimit,-1) == "d"){
  $timelimit = "<b>Durée :</b> ".substr($timelimit,0,-1)." Jour(s)";
}else if(substr($timelimit,-1) == "h"){
  $timelimit = "<b>Durée :</b> ".substr($timelimit,0,-1)." Heure(s)";
}else if(substr($timelimit,-1) == "w"){
  $timelimit = "<b>Durée :</b> ".(substr($timelimit,0,-1)*7)." Jour(s)";
}

// --- Couleur en fonction du prix ---
if($getprice == "1500"){ $color = "#F9CD6A";}
elseif($getprice == "100"){ $color = "#AAB2BD";}
elseif($getprice == "200"){ $color = "#37BC9B";}
elseif($getprice == "500"){ $color = "#DA4453";}
elseif($getprice == "700"){ $color = "#4165D5";}
elseif($getprice == "1000"){ $color = "#4165D5";}
elseif($getprice == "1500"){ $color = "#F9CD6A";}
elseif($getprice == "2000"){ $color = "#F0C300";}
elseif($getprice == "5000"){ $color = "#AC92EC";}
elseif($getprice == "13000"){ $color = "#2E8B57";}
else{ $color = "#FF69B4";}
?>

<!-- Nouveau template réduit -->
<table class="voucher" style="background:#f7f7f7; margin:3px; border:1px solid <?php echo $color ?>; border-radius:8px; box-shadow:0 1px 3px rgba(0,0,0,0.12); width:160px;">
  <tbody>
    <tr>
      <td style="text-align:center; padding:4px;">
        <h4 style="margin:3px 0; color:#333; font-size:12px;">⚡ MAMBA WIFI ⚡</h4>
        <hr style="border:0.5px dashed <?php echo $color ?>; width:70%; margin:3px auto;">
      </td>
    </tr>

    <tr>
      <td style="text-align:center; font-size:11px; font-weight:bold; color:<?php echo $color; ?>;">
        Prix : <?php echo $price; ?>
      </td>
    </tr>

    <?php if($usermode == "vc"){ ?>
      <!-- Mode voucher simple -->
      <tr>
        <td style="text-align:center; padding:4px;">
          <div style="background:<?php echo $color ?>; color:#fff; font-size:11px; font-weight:bold; border-radius:5px; padding:4px;">
            <?php echo $username; ?>
          </div>
        </td>
      </tr>
    <?php } elseif($usermode == "up"){ ?>
      <!-- Mode username/password -->
      <tr>
        <td style="text-align:center; padding:4px;">
          <div style="background:#fff; border:1px solid <?php echo $color ?>; border-radius:5px; padding:4px; font-size:10px;">
            <b>U:</b> <?php echo $username; ?><br>
            <b>P:</b> <?php echo $password; ?>
          </div>
        </td>
      </tr>
    <?php } ?>

    <tr>
      <td style="text-align:center; font-size:9px; padding:3px; color:#444;">
        <?php echo $validity; ?><br>
        <?php echo $timelimit; ?>
      </td>
    </tr>

    <tr>
      <td style="text-align:right; font-size:8px; font-weight:bold; color:<?php echo $color; ?>; padding:2px 5px;">
        #<?= $num; ?>
      </td>
    </tr>
  </tbody>
</table>
	        
