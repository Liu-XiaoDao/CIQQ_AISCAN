<?php include VIEWPATH.'admin/__header.php';?>
<?php


if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">



		<div class="panel panel-primary">
			<div class="panel-heading"><h3 class="panel-title">修改QQ信息</h3></div>
			<div class="panel-body">
				<form action="/index.php/admin/gres/edit/<?php echo $gid;?>" method="POST">
				<div class="form-group">
					<label>记录:</label><br>
					<input type="text" class="form-control" name="qqnum" value="<?php echo $row['qqnum']?>" required>
				</div>
				<!-- <div class="form-group">
					<label>QQ密码:</label><br>
					<input type="text" class="form-control" name="qqpw" value="<?php //echo $row['qqpw']?>" required>
				</div> -->
				<!-- <div class="form-group">
					<label>绑定手机号:</label><br>
					<input type="text" class="form-control" name="phone" value="<?php //echo $row['phone']?>" required>
				</div> -->
				<!-- <div class="form-group">
					<label>令牌:</label><br>
					<input type="text" class="form-control" name="code" value="<?php //echo $row['code']?>" required>
				</div> -->

				<div class="form-group">
					<label>所属类别:</label><br>
					<select class="form-control" name="leibie" default="<?php echo $row['tid']; ?>">
					<?php 
						foreach ($tools as $key => $tool) {
					?>
							<option value="<?php echo $tool['tid']; ?>"><?php echo $tool['name']; ?></option>';
					<?php
						}
					?>
					</select>
				</div>
				<div class="form-group">
					<label>是否卖出:</label><br>
					<select class="form-control" name="is_sell" default="<?php echo $row['is_sell']?>"><option value="0">0_否</option><option value="1">1_是</option></select>
				</div>
				<input type="submit" class="btn btn-primary btn-block" value="确定修改"></form>
				<br/><a href="/index.php/admin/gres">>>返回商品列表</a>
			</div>
		</div>

		<script><!--这个地方控制着是否上架的默认属性-->
			var items = $("select[default]");
			for (i = 0; i < items.length; i++) {
				$(items[i]).val($(items[i]).attr("default"));
			}
		</script>



</div>
</div>