<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">

		<div class="panel panel-primary">
			<div class="panel-heading"><h3 class="panel-title">修改api账号</h3></div>
   			<div class="panel-body">
				<form action="/index.php/admin/apiuser/edit/<?php echo $id;?>" method="POST">
					<div class="form-group">
						<label>账号:</label><br>
						<input type="text" class="form-control" name="username" value="<?php echo $api['username'];?>" required>
					</div>
					<div class="form-group">
						<label>密码:(请重新填写明文密码)</label><br>
						<input type="text" class="form-control" name="password" value="<?php echo $api['password'];?>" required>
					</div>

					<input type="submit" class="btn btn-primary btn-block" value="确定修改">
				</form>
				<br/><a href="/index.php/admin/apiuser">>>返回api账号列表</a>
			</div>
		</div>
	</div>
</div>