<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">

		<div class="alert alert-info" style="font-size: 20px;text-align: center;">
    		<?php echo $content;?>
    	</div>
    </div>
  </div>

		
