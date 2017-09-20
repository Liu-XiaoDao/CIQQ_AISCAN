<?php include VIEWPATH.'admin/__header.php';?>
<?php


if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">
    <div class="alert alert-info">
    	系统共有 <b><?php echo $numrows; ?></b> 个类别<br/><a href="/index.php/admin/gmanege/add" class="btn btn-primary">添加类别</a>
    </div>

      <div class="table-responsive">
        <table class="table table-striped">
          <thead><tr><th>ID</th><th>名称</th><th>剩余数量</th><th>总库存</th><th>价格</th><th>状态</th><th>操作</th></tr></thead>
          <tbody>
		<?php
			foreach ($tools as $key => $tool) {
		?>
		<tr>
			<td><b><?php echo $tool['tid'];?></b></td>
			<td><?php echo $tool['name'];?></td>
			<td><?php echo $tool['num'];?></td>
      <td><?php echo $tool['stock'];?></td>
			<td><?php echo $tool['price'];?></td>
			<td><?php if($tool['active']==1){ ?> <font color=green>上架中</font><?php }else{ ?><font color=red>已下架</font><?php }?></td>
			<td><a href="/index.php/admin/gmanege/edit/<?php echo $tool['tid']; ?>" class="btn btn-info btn-xs">编辑</a>&nbsp;<a href="/index.php/admin/gmanege/del/<?php echo $tool['tid']; ?>" class="btn btn-xs btn-danger" onclick="return confirm(\'你确实要删除此商品吗？\');">删除</a></td>
		</tr>

		<?php
			}
		?>

          </tbody>
        </table>
        <?php echo $pager;?>
      </div>

    </div>
  </div>