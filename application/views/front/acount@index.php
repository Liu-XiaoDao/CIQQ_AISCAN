<?php include VIEWPATH.'front/__header.php';?>
<?php
if($islogin==1){}else exit("<script language='javascript'>window.location.href='/index.php/front/login';</script>");
?>
  <div class="container" style="padding-top:70px;">
    <div class="col-sm-12 col-md-10 center-block" style="float: none;">


<div class="panel panel-primary">
<div class="panel-heading"><h3 class="panel-title">账户充值--您当前账户余额为<?php echo $user['account'];?></h3></div>
<div class="panel-body">
	<!-- <div class="form-group" style="text-align: center;">
	  <h3 class="panel-title">请扫描此二维码转账</h3>
	  <img src="/imgs/zhifu.png">
	</div>
	<div class="form-group" style="text-align: center;">
	  <h3 class="panel-title">请扫描此二维码转账</h3>
	  <img src="/imgs/zhifu.png">
	</div> -->
	<div class="row" style="text-align: center;margin: 0 auto;">
  		<div class="col-xs-6 col-md-3" style="width: 50%;">
    		<a href="#" class="thumbnail">
    			<h3 class="panel-title">微信请扫描此二维码转账</h3>
      			<img style="height: 300px;" src="/imgs/weixinhdjlwn92nfn.png">
    		</a>
  		</div>
  		<div class="col-xs-6 col-md-3" style="width: 50%;">
    		<a href="#" class="thumbnail">
    			<h3 class="panel-title">支付宝请扫描此二维码转账</h3>
      			<img style="height: 300px;" src="/imgs/zhifubao30NBA.png">
    		</a>
  		</div>
	</div>
	<br/>
    <div class="panel panel-primary">
        <div class="panel-heading" style="background: red;"><h3 class="panel-title">注意:</h3></div>
			<ul class="list-group">
				<li class="list-group-item" style="color: red;">用户充值（充值3分钟不到账请联系客服QQ：<span style="color: red;">70902234</span>）</li>
				<li class="list-group-item" style="color: red;">扫描二维码无法填写备注的，请直接打开支付宝“转账”！</li>
				<li class="list-group-item">温馨提示：余额不支持提现，建议用多少冲多少！</li>
				<li class="list-group-item">关于到账：转账成功后请等待3-5分钟，然后重新登录账户或刷新页面即可！</li>
				<li class="list-group-item">付款方式：使用微信请直接添加好友后转账</li>
				<li class="list-group-item">付款方式：充值请直接转账需充值的金额到支付宝：953524960@qq.com，备注/付款说明请填写您的登录帐号：<span style="color: red;"><?php echo $user['username'];?></span></li>
				<li class="list-group-item">重要说明：备注/付款说明必须准确无误的填写为您的登录帐号：<span style="color: red;"><?php echo $user['username'];?></span>，如果填写错误 请联系客服 QQ：<span style="color: red;">70902234</span>！</li>
    		</ul>
     </div>
</div>
</div>

