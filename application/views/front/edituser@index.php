<?php include VIEWPATH.'front/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/front/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">


<div class="panel panel-primary">
<div class="panel-heading"><h3 class="panel-title">个人信息设置</h3></div>
<div class="panel-body">
  <form action="/index.php/front/edituser/set" method="post" class="form-horizontal" role="form">
	<div class="form-group">
	  <label class="col-sm-2 control-label">用户名</label>
	  <div class="col-sm-10"><input type="text" name="username" value="<?php echo $user['username']; ?>" class="form-control" disabled/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">昵称</label>
	  <div class="col-sm-10"><input type="text" name="nick" value="<?php echo $user['nick']; ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">年龄</label>
	  <div class="col-sm-10"><input type="text" name="age" value="<?php echo $user['age']; ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">电话</label>
	  <div class="col-sm-10"><input type="text" name="phone" value="<?php echo $user['phone']; ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">邮箱</label>
	  <div class="col-sm-10"><input type="text" name="mail" value="<?php echo $user['mail']; ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <label class="col-sm-2 control-label">QQ</label>
	  <div class="col-sm-10"><input type="text" name="qq" value="<?php echo $user['qq']; ?>" class="form-control"/></div>
	</div><br/>
	<div class="form-group">
	  <div class="col-sm-offset-2 col-sm-10"><input type="submit" name="submit" value="修改" class="btn btn-primary form-control"/><br/>
	 </div>
	</div>
  </form>
</div>
</div>