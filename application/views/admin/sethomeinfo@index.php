<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">


<div class="panel panel-primary">
<div class="panel-heading"><h3 class="panel-title">网站首页配置</h3></div>
<div class="panel-body">
  <form action="/index.php/admin/sethomeinfo/set" method="post" class="form-horizontal" role="form">
	<div class="form-group">
	  <label class="col-sm-2 control-label">跑马灯</label>
	  <div class="col-sm-10"><input type="text" name="marquee" value="<?php echo htmlspecialchars($conf['marquee']); ?>" class="form-control" required/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第一提示</label>
	  <div class="col-sm-10"><input type="text" name="point1" value="<?php echo htmlspecialchars($conf['point1']); ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第二提示</label>
	  <div class="col-sm-10"><input type="text" name="point2" value="<?php echo htmlspecialchars($conf['point2']); ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第三提示</label>
	  <div class="col-sm-10"><input type="text" name="point3" value="<?php echo htmlspecialchars($conf['point3']); ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第四提示</label>
	  <div class="col-sm-10"><input type="text" name="point4" value="<?php echo htmlspecialchars($conf['point4']); ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第五提示</label>
	  <div class="col-sm-10"><input type="text" name="point5" value="<?php echo htmlspecialchars($conf['point5']); ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">第六提示</label>
	  <div class="col-sm-10"><input type="text" name="point6" value="<?php echo htmlspecialchars($conf['point6']); ?>" class="form-control"/></div>
	</div><br/>

	<div class="form-group">
	  <label class="col-sm-2 control-label">下单上面提示</label>
	  <div class="col-sm-10"><input type="text" name="middlepoint" value="<?php echo htmlspecialchars($conf['middlepoint']); ?>" class="form-control"/></div>
	</div><br/>



<!-- 	<div class="form-group">
	  <label class="col-sm-2 control-label">第六提示</label>
	  <div class="col-sm-10"><textarea class="form-control" name="anounce" rows="5"><?php //echo htmlspecialchars($conf['anounce']);?></textarea></div>
	</div><br/>
	<div class="form-group"> -->

	<div class="form-group">
	  <div class="col-sm-offset-2 col-sm-10"><input type="submit" name="submit" value="修改" class="btn btn-primary form-control"/><br/>
	 </div>
	</div>
  </form>
</div>
</div>