<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">

<div class="panel panel-primary">
	<div class="panel-heading"><h3 class="panel-title">添加一个api商品</h3></div>
	<div class="panel-body">
		<form action="/index.php/admin/apigoods/add" method="POST">
			<div class="form-group">
				<label>商品名称:</label><br>
				<input type="text" class="form-control" name="name" value="" required>
			</div>
			<div class="form-group">
				<label>价格:</label><br>
				<input type="text" class="form-control" name="price" value="" required>
			</div>
			<div class="form-group">
				<label>排序(数字越小越靠前):</label><br>
				<input type="number" class="form-control" name="sort" value="10" required>
			</div>

			<div class="form-group">
				<label>调用api几级接口:</label><br>
				<input type="number" class="form-control" name="level" value="1" required>
			</div>

			<div class="form-group">
				<label>是否上架:</label><br>
				<select class="form-control" name="active"><option value="1">1_是</option><option value="0">0_否</option></select>
			</div>
			<input type="submit" class="btn btn-primary btn-block" value="确定添加">
		</form>
		<br/>
		<a href="/index.php/admin/apigoods">>>返回类别列表</a>
	</div>
</div>
</div>
</div>