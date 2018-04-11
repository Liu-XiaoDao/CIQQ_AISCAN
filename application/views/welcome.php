<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  	<meta charset="utf-8"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>
  	<title><?php echo $conf['sitename']?> - <?php echo $conf['title']?></title>

  	<meta name="keywords" content="<?php echo $conf['keywords']?>">
 	<meta name="description" content="<?php echo $conf['description']?>">

	<!-- <link href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"> -->
  	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>

	<!-- <link href="http://cdn.qqzzz.net/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> --> <!--没用吧-->
	<link href="http://cdn.qqzzz.net/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

	<link href="http://cdn.qqzzz.net/assets/plugins/pjax/pjax.css" rel="stylesheet" />
	<!-- <link href="http://cdn.qqzzz.net/assets/css/style2.css" rel="stylesheet" /> -->

	<link href="/css/style2.css" rel="stylesheet" />

  	<script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

	<STYLE type="text/css">
		/*先注释*/
		/*body{cursor:url('images/XSSB-1.cur'), auto;}
		a{cursor:url('images/XSSB-2.cur'), auto;}
		body,.main{
			background:#ecedf0 url("/bj.png") fixed;
			background-repeat:repeat;
		}*/
	</STYLE>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-default">
    	<div class="container">
      		<div class="navbar-header">
        		<a class="navbar-brand" href="/">第一营销</a>
      		</div>
      		<div id="navbar" class="collapse navbar-collapse">
        		<ul class="nav navbar-nav navbar-right">
        			<?php if($is_user_login===1){?>
        			<!-- <li><a href="/front/home"><?//php echo $user['nick'];?>欢迎回家个人中心</a></li> -->
        			<li><a href="/index.php/front/home">个人中心</a></li>
        			<?php }else{?>
        			<li><a href="/index.php/front/login"><span class="glyphicon glyphicon-log-in"></span> 登陆</a></li>
        			<li><a href="/index.php/front/regisn"><span class="glyphicon glyphicon-asterisk"></span> 注册</a></li>
        			<?php }?>
        		</ul>
      		</div>
    	</div>
  	</nav>



	<div class="col-lg-6 col-md-8 col-sm-10 col-xs-12 center-block" style="padding-top: 70px;" role="main">

<!-- 		<div class="panel panel-default">  这是logo
			<div class="panel-body" style="text-align: center;background: black;">
				<a href="http://www.2914288214.com/"><img src="imgs/logo.png"></a>
			</div>
		</div> -->
		<div class="modal fade" align="left" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        				<h4 class="modal-title" id="myModalLabel"><?php echo $conf['sitename']?></h4>
      				</div>
      				<div class="modal-body">
	  					<?php echo $conf['modal']?>
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      				</div>
    			</div>
  			</div>
		</div>

		<div class="panel panel-info">
			<div class="list-group-item reed" style="background:#64b2ca;">
				<h3 class="panel-title">
					<font color="#fff">
						<i class="fa fa-volume-up"></i>&nbsp;&nbsp;<b><?php echo $conf['sitename']?></b>
					</font>
				</h3>
			</div>
			<?php echo $ai ?>
			<div class="list-group-item reed">
				<marquee scrollAmount="8" direction="left" Align="Middle" style="font-weight: bold;line-height: 20px;font-size: 20px;color: #177D06;"><?php echo $conf['marquee']?></marquee>
			</div>
			<?php
				if (!empty($conf['point1'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">1</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point1']?></div>
			<?php
				}
			?>
			<?php
				if (!empty($conf['point2'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">2</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point2']?></div>
			<?php
				}
			?>
			<?php
				if (!empty($conf['point3'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">3</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point3']?></div>
			<?php
				}
			?>
			<?php
				if (!empty($conf['point4'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">4</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point4']?></div>
			<?php
				}
			?>
			<?php
				if (!empty($conf['point5'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">5</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point5']?></div>
			<?php
				}
			?>
			<?php
				if (!empty($conf['point6'])) {
			?>
				<div class="list-group-item reed"><span class="btn btn-danger btn-xs">6</span>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $conf['point6']?></div>
			<?php
				}
			?>
		</div>

		<div class="panel panel-info">
			<div class="modal-body"><?php echo $conf['middlepoint']?></div>
		</div>

		<div class="panel panel-info">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#onlinebuy" data-toggle="tab">在线支付下单</a></li>
				<li><a href="#deblock" data-toggle="tab">帐号解封</a></li>
			</ul>
			<div class="list-group-item">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="onlinebuy">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">选择商品</div>
								<select name="tid" id="tid" class="form-control" onchange="getPoint();">
									<?php echo $select?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">商品价格</div>
								<input type="text" name="need" id="need" class="form-control" disabled/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">购买数量</div>
								<input type="number" class="form-control" name="buynum" min="1" id="buynum" value="" required>
							</div>
						</div>

						<!-- <div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</div>
								<input type="text" name="beizhu" id="beizhu" value="" class="form-control" placeholder="(请填写您的备注信息)" required/>
							</div>
						</div> -->

						<div id="pay_frame" class="form-group text-center" style="display:none;">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">订单编号</div>
									<input class="form-control" name="orderid" id="orderid" value="" disabled>
								</div>
							</div>
							<div class="alert alert-success">下单成功,请到<a href="/index.php/front/home">个人中心</a>查看</div>

						</div>
						<input type="submit" id="submit_buy" class="btn btn-primary btn-block" value="立即购买">
						<br>
						<a class="btn btn-block btn-success" href="#" id="firstinfo" data-toggle="modal" data-target="#gmbk"><b>第一次购买必看,点这里了解</b></a>
					</div>


			
<!-- 					<div class="tab-pane fade in" id="query">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">请输入ID</div>
								<input type="text" name="qq" id="qq3" value="<?php //echo $qq?>" class="form-control" required/>
							</div>
						</div>
						<input type="submit" id="submit_query" class="btn btn-primary btn-block" value="立即查询">
						<div id="result2" class="form-group text-center" style="display:none;">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>ＱＱ</th>
										<th>商品名称</th>
										<th>购买时间</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody id="list"></tbody>
							</table>
						</div>
					</div> -->


					<div class="tab-pane fade in" id="deblock">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">选择商品</div>
								<select name="aid" id="aid" class="form-control" onchange="getapiPoint();">
									<?php echo $apiselect?>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">商品价格</div>
								<input type="text" name="apineed" id="apineed" class="form-control" disabled/>
							</div>
						</div>

						<!-- <div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</div>
								<input type="text" name="paibeizhu" id="apibeizhu" value="" class="form-control" placeholder="(请填写您的备注信息)" required/>
							</div>
						</div> -->

						<div class="form-group" style="margin-bottom: 0;">
							<div class="list-group-item reed" style="border-bottom: 0px solid red;background-color: #eee;border-bottom-right-radius:0px;border-bottom-left-radius:0px;">提示：请一行一个，单次上传不超过10000行！（大单超过3W数据 可以联系网站客服人工上传）<br/>提示：上传数据无需带密码或密保，如果带密码密保上传，请以“----”分割，例：号码----密码----密保<br/>提示：上传不可解封的号码不能退款，同时网站不支持退单。请上传的时候考虑清楚！</div>
						</div>
						<div class="form-group">
							<textarea style="border-top-right-radius:0px;border-top-left-radius:0px;" class="form-control" name="apiqqs" id="apiqqs" rows="20"></textarea>	
						</div>

						<div id="apipay_frame" class="form-group text-center" style="display:none;">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">订单编号</div>
									<input class="form-control" name="apiorderid" id="apiorderid" value="" disabled>
								</div>
							</div>
							<div class="alert alert-success">下单成功,请到<a href="/index.php/front/home">个人中心</a>查看</div>

						</div>
						<input type="submit" id="submit_api" class="btn btn-primary btn-block" value="立即购买">		
					</div>
				</div>
			</div>
		</div>		




<script type="text/javascript">
	function getPoint() {
		var price = $('#tid option:selected').attr('price');
		$('#need').val('￥'+price);
	}
	getPoint();

	function getapiPoint() {
		var apiprice = $('#aid option:selected').attr('price');
		$('#apineed').val('￥'+apiprice);
	}
	getapiPoint();


	$(document).ready(function(){
		$("#submit_buy").click(function(){
			var tid=$("#tid").val();
			var buynum=$("#buynum").val();
			var beizhu=$("#beizhu").val();

			if(buynum=='' || tid=='' || beizhu==''){
				alert('请确保每项不能为空！');
				return false;
			}
			$('#pay_frame').hide();
			$('#submit_buy').val('Loading');
			$.ajax({
				type : "POST",
				url : "/ajax/pay",
				data : {tid:tid,buynum:buynum,beizhu:beizhu},
				dataType : 'json',
				success : function(data) {
					if(data.code == 0){
						$('#tid').attr("disabled",true);
						$('#buynum').attr("disabled",true);
						$('#beizhu').attr("disabled",true);
						$('#submit_buy').hide();
						$('#orderid').val(data.trade_no);
						$("#pay_frame").slideDown();
					}else{
						alert(data.msg);
					}
					$('#submit_buy').val('立即购买');
				} 
			});
		});
	
		$("#submit_api").click(function(){

			var apiqqs=$("#apiqqs").val();
			var aid=$("#aid").val();
			var apibeizhu=$("#apibeizhu").val();

			if(apiqqs=='' || aid=='' || apibeizhu==''){
				alert('请确保每项不能为空！');
				return false;
			}
			$('#apipay_frame').hide();
			$('#submit_api').val('Loading');
			$.ajax({
				type : "POST",
				url : "/ajax/apipay",
				data : {aid:aid,apiqqs:apiqqs,apibeizhu:apibeizhu},
				dataType : 'json',
				success : function(data) {
					if(data.code == 0){
						$('#aid').attr("disabled",true);
						$('#apibeizhu').attr("disabled",true);
						$('#submit_api').hide();
						$('#apiorderid').val(data.api_trade_no);
						$("#apipay_frame").slideDown();
					}else{
						alert(data.msg);
					}
					$('#submit_buy').val('立即购买');
				} 
			});
		});


		//qq购买不能小于0,如果小于0,则重置为1
		$("#buynum").change(function(){
    		var num = $(this).val();
    		if (num<0) {
    			$(this).val(1);
    		}
  		});


		//第一次购买提示
		$("#firstinfo").click(function(){
			
			$('#myModal').modal({
				keyboard: true
			});
		});




		//之前不定时出现的提示框,就是首页自动出的那个
		// var isModal=<?php //echo empty($conf['modal'])?'false':'true';?>;
		// if( !$.cookie('op') && isModal==true){
		// 	$('#myModal').modal({
		// 		keyboard: true
		// 	});

		// 	var cookietime = new Date(); 
		// 	cookietime.setTime(cookietime.getTime() + (10*60*1000));
		// 	$.cookie('op', false, { expires: cookietime });
		// }
	});
</script>


			</div>
		</div>
	</body>
</html>