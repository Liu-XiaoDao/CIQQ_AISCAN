<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">

		<div class="panel panel-primary">
			<div class="panel-heading"><h3 class="panel-title">添加api账号</h3></div>
			<div class="panel-body">
				<form action="/index.php/admin/apiuser/add" method="POST">
				<div class="form-group">
					<label>账号:</label><br>
					<input type="text" class="form-control" name="api" placeholder="填写api账号"  value="" required>
				</div>
				<div class="form-group">
					<label>密码:</label><br>
					<input type="text" class="form-control" name="apipw" placeholder="填写密码，密码在展示时会用md5加密" value="" required>
				</div>
				<input type="submit" class="btn btn-primary btn-block" value="确定添加"></form>
				<br/><a href="/index.php/admin/apiuser">>>返回api账号列表</a>
			</div>
		</div>


</div>
</div>