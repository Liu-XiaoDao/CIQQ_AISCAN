<?php include VIEWPATH.'front/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/front/login';</script>");
?>
  	<div class="container" style="padding-top:70px;">
    	<div class="col-sm-12 col-md-10 center-block" style="float: none;">
		<?php echo $content;?>
		</div>
	</div>
<?php include VIEWPATH.'front/__footer.php';?>