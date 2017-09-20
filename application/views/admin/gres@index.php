<?php include VIEWPATH.'admin/__header.php';?>
<?php


if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">


    <div class="alert alert-info">
    	系统共有 <b><?php echo $numrows; ?></b> 个QQ<br/><a href="/index.php/admin/gres/add" class="btn btn-primary">添加QQ号</a>
    </div>

      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
              <tr><th>ID</th><th>记录</th><th>类别</th><th>是否卖出</th><th>添加时间</th><th>操作</th></tr>
          </thead>
          <tbody>
		      <?php
			       foreach ($list as $key => $res) {
		      ?>

		      <tr>
            <td><b><?php echo $res['gid'];?></b></td>
            <td><?php echo $res['qqnum'];?></td>
            <td><?php echo $res['tname']; ?></td>
            <td>
                <?php 
                  if ($res['is_sell']==1) {
                ?>
                <font color=red>已卖出</font>
                <?php 
                  }else{
                ?>
                <font color=green>未卖出</font>
                <?php
                  }
                ?>
            </td>
            <td><?php echo $res['addtime'];?></td>
            <td><a href="/index.php/admin/gres/edit/<?php echo $res['gid'];?>" class="btn btn-info btn-xs">编辑</a>&nbsp;<a href="/index.php/admin/gres/del/<?php echo $res['gid'];?>" class="btn btn-xs btn-danger" onclick="return confirm(\'你确实要删除此商品吗？\');">删除</a></td>
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