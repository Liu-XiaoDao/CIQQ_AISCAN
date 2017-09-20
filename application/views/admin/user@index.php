<?php include VIEWPATH.'admin/__header.php';?>
<?php


if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">


    <div class="alert alert-info">
    	系统共有 <b><?php echo $usercount; ?></b> 个用户<br/>
    </div>

      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
              <tr><th>用户名</th><th>昵称</th><th>年龄</th><th>电话</th><th>邮箱</th><th>QQ</th><th>账户余额</th><th>操作</th></tr>
          </thead>
          <tbody>
		      <?php
			       foreach ($users as $key => $user) {
		      ?>

		      <tr>
            <td><b><?php echo $user['username'];?></b></td>
            <td><?php echo $user['nick'];?></td>
            <td><?php echo $user['age'];?></td>
            <td><?php echo $user['phone'];?></td>
            <td><?php echo $user['mail'];?></td>
            <td><?php echo $user['qq'];?></td>
            <td><?php echo $user['account'];?></td>
            <td><a href="/index.php/admin/user/recharge/<?php echo $user['id'];?>" class="btn btn-info btn-xs">充值</a>&nbsp;<a href="/index.php/admin/user/editpw/<?php echo $user['id'];?>" class="btn btn-info btn-xs">改密</a>&nbsp;<a href="/index.php/admin/user/del/<?php echo $user['id'];?>" class="btn btn-xs btn-danger" onclick="return confirm(\'你确实要删除此商品吗？\');">删除</a></td>
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