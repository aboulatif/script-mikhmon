
																														<?php
if(substr($validity,-1) == "d"){
  $validity = "   <br>Validité : ".substr($validity,0,-1)." Jour(s)";
}else if(substr($validity,-1) == "h"){
  $validity = "Validité : ".substr($validity,0,-1)."Heure(s)";
}
if(substr($timelimit,-1) == "d" & strlen($timelimit) >3){
  $timelimit = "Durée:".((substr($timelimit,0,-1)*7) +  substr($timelimit, 2,1))." Jour(s)";
}else if(substr($timelimit,-1) == "d"){
  $timelimit = "Durée:".substr($timelimit,0,-1)." Jour(s)";
}else if(substr($timelimit,-1) == "h"){
  $timelimit = "Durée:".substr($timelimit,0,-1)."Heure(s)";
}else if(substr($timelimit,-1) == "w"){
  $timelimit = "Durée:".(substr($timelimit,0,-1)*7)." Jour(s)";
}	            	            
if($getprice == "1500"){ $color = "#F9CD6A";} 
elseif($getprice == "200"){ $color = "#FF0000";}
elseif($getprice == "500"){ $color = "#800000";}
elseif($getprice == "700"){ $color = "#FFFF00";}
elseif($getprice == "1000"){ $color = "#808000";}
elseif($getprice == "1500"){ $color = "#0000FF";}
elseif($getprice == "2000"){ $color = "#FF00FF";}
elseif($getprice == "3000"){ $color = "#C0C0C0";}
elseif($getprice == "5000"){ $color = "#AC92EC";}
elseif($getprice == "13000"){ $color = "#2E8B57";}
else{ $color = "#FF69B4";}?>  
<!--mks-mulai-->
<table class="voucher" style="background:#FFF;margin: 1px;border: 1px solid <?php echo $color ?>; border-radius: 5px;">
<tbody>
<tr>
<td style="text-align: center; ">
</tr>
<tr>
<td>
<table style=" text-align: center; width: 100px;">
<tbody>	
<P style=" margin-top:-10px;margin-bottom:5px"></P>
<tr>
<td colspan="2" style="font-weight:bold;">YAHYA WIFI</td>
</tr>
<td>
<table style="width:100%;"> 
<?php if($usermode == "vc"){?>
<tr>
<tr style="color: #444;text-align: center; font-size: 12px; font-weight:bold;">
<p style=" margin-top:-13px;margin-bottom:5px"> 
<td ><?php echo $price;?></td>
<tr style="color: #333;font-weight:bold; font-size: 12px;">
<td style="background:<?php echo $color ?>;width:100%; border: 1px solid <?php echo $color ?>;border-radius: 5px;text-align: center;"><?php echo $username;?></td>
</tr>
<?php }elseif($usermode == "up"){?>
<tr>
<tr style="color: #444;text-align: center; font-size: 12px; font-weight:bold;">
<p style=" margin-top:-13px;margin-bottom:5px"> 
<td ><?php echo $price;?></td>
</tr>
<tr style="color: #333;font-weight:bold; font-size: 9px;">
<td style="background:#FFF;width:100%; border: 1px solid <?php echo $color ?>;border-radius: 5px;text-align: center;">U: <?php echo $username;?><br>
P: <?= $password; ?></td>
</tr> 
<?php }?> 
</tr> 
<td colspan="2" style="border-radius: 5px;text-align: center; font-weight:bold;font-size: 6px; position: relative;">
  <P style="margin-top:-10px;margin-bottom:5px"></P>
	 <?php echo $validity; ?>
	<P style="margin-top:-10px;margin-bottom:5px"></P>
  <span style="position: absolute; top: 0; right: 0; font-size: 10px; color: <?php echo $color; ?>; font-weight: bold;">
        <?= $num; ?>
  </span>
</td>
</table>	
</tr>	
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>		        	        	        	        	        	        	        	        	        	        	        	        	        	        	        	      
