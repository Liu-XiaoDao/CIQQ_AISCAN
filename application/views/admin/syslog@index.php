
<?php include VIEWPATH.'admin/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/admin/login';</script>");

?>

  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">
      <div class="table-responsive">
        <table class="table table-striped">
          <thead><tr><th>日志id</th><th>用户</th><th>执行方法</th><th>时间</th><th>执行sql</th></tr></thead>
          <tbody>
          <?php
              foreach ($logs as $key => $log) {
          ?>
                <tr>
                  <td><?php echo $log['id']; ?></td>
                  <td><?php echo $log['username']; ?></td>
                  <td><?php echo $log['module_name']; ?>/<?php echo $log['controller_name']; ?>/<?php echo $log['action_name']; ?></td>
                  <td><?php echo $log['addtime']; ?></td>
                  <td><?php echo $log['content']; ?></td>
                </tr>
          <?php   }  ?>
          </tbody>
        </table>
      </div>
<?php echo $pager; ?>
    </div>
  </div>




