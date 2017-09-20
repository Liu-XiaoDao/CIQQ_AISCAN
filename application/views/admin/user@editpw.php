<?php include VIEWPATH.'admin/__header.php';?>
<?php


if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">



<div class="panel panel-primary">
	<div class="panel-heading"><h3 class="panel-title">修改用户密码</h3></div>
	<div class="panel-body">
		<form action="/index.php/admin/user/editpw/<?php echo $id;?>" method="POST">
			<div class="form-group">
				<label>请输入新密码:</label><br>
				<input type="text" class="form-control" name="newpw" value="" required>
			</div>
			<input type="submit" class="btn btn-primary btn-block" value="确定修改">
		</form>
		<br/>
		<a href="/index.php/admin/user">>>返回用户列表</a>
	</div>
</div>





</div>
</div>