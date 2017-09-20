<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Deblock extends CI_Controller{

	public $islogin = 0;

	public function __construct(){
		parent::__construct();

        if(isset($_SESSION['admin_token'])&&$_SESSION['style']==1)
		{
			$this->islogin=1;		
		}else{
			$this->islogin=0;
			exit("<script language='javascript'>alert('您还没有登陆！');window.location.href='/admin/login';</script>");
		}

	}

	public function index($page = 1)
	{
        $data['title']='API信息';
		$data['islogin'] = $this->islogin;
		$data['c'] = 'api';
		$this->load->view('admin/deblock@index',$data);
	}

	public function test()
	{
		echo "string";
	}
	//解封各级价格
	public function price()
	{
		//拿到正在使用API账号
	 	$apiusersql = "select * from apiuser where isactive=1 limit 1";
	 	$apiuser = $this->db->query($apiusersql)->row_array();


		// 1. 初始化
 		$ch = curl_init();
 		// 2. 设置选项，包括URL
 		curl_setopt($ch,CURLOPT_URL,"http://api.qqhao456.com/api.php?u=".$apiuser['username']."&s=".$apiuser['password']."&price");
 		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
 		curl_setopt($ch,CURLOPT_HEADER,0);
 		// 3. 执行并获取HTML文档内容
 		$output = curl_exec($ch);
 		if($output === FALSE ){
 			echo "CURL Error:".curl_error($ch);
 		}
 		
 		$output=str_replace("{","[",$output);
 		$output=str_replace("}","]",$output);

 		$pricearray=json_decode($output);
 		$pricestr = "";
 		for ($i=0; $i < 8; $i++) { 
 			if ($i=4) {
 				$pricestr .= "解封普通:".$pricearray[4];
 			}
 			if ($i=5) {
 				$pricestr .= " 解封优先:".$pricearray[5];
 			}
 			if ($i=6) {
 				$pricestr .= " 解封特急:".$pricearray[6];
 			}
 			if ($i=7) {
 				$pricestr .= " 解封土豪:".$pricearray[7];
 			}
 		}

 		echo $pricestr;
 		
 		// 4. 释放curl句柄
 		curl_close($ch);
	}

	//拿到解封平台的各级等待数量
	public function wait()
	{
		//拿到正在使用API账号
	 	$apiusersql = "select * from apiuser where isactive=1 limit 1";
	 	$apiuser = $this->db->query($apiusersql)->row_array();

 		// 1. 初始化
 		$waitch = curl_init();
 		// 2. 设置选项，包括URL
 		curl_setopt($waitch,CURLOPT_URL,"http://api.qqhao456.com/api.php?u=".$apiuser['username']."&s=".$apiuser['password']."&wait");
 		curl_setopt($waitch,CURLOPT_RETURNTRANSFER,1);
 		curl_setopt($waitch,CURLOPT_HEADER,0);
 		// 3. 执行并获取HTML文档内容
 		$waitoutput = curl_exec($waitch);
 		if($waitoutput === FALSE ){
 			echo "CURL Error:".curl_error($waitch);
 		}

 		$waitoutput=str_replace("{","[",$waitoutput);
 		$waitoutput=str_replace("}","]",$waitoutput);

 		$waitarray=json_decode($waitoutput);
 		$waitstr = "";
 		for ($i=0; $i < 8; $i++) { 
 			if ($i=4) {
 				$waitstr .= "解封普通:".$waitarray[4];
 			}
 			if ($i=5) {
 				$waitstr .= " 解封优先:".$waitarray[5];
 			}
 			if ($i=6) {
 				$waitstr .= " 解封特急:".$waitarray[6];
 			}
 			if ($i=7) {
 				$waitstr .= " 解封土豪:".$waitarray[7];
 			}
 		}

 		echo $waitstr;

 		// 4. 释放curl句柄
 		curl_close($waitch);
 		exit();
	}

	//拿到在api账号在第三方的余额
	public function money()
	{
		//拿到正在使用API账号
	 	$apiusersql = "select * from apiuser where isactive=1 limit 1";
	 	$apiuser = $this->db->query($apiusersql)->row_array();

 		// 1. 初始化
 		$moneych = curl_init();
 		// 2. 设置选项，包括URL
 		curl_setopt($moneych,CURLOPT_URL,"http://api.qqhao456.com/api.php?u=".$apiuser['username']."&s=".$apiuser['password']."&money");
 		curl_setopt($moneych,CURLOPT_RETURNTRANSFER,1);
 		curl_setopt($moneych,CURLOPT_HEADER,0);
 		// 3. 执行并获取HTML文档内容
 		$moneyoutput = curl_exec($moneych);
 		if($moneyoutput === FALSE ){
 			echo "CURL Error:".curl_error($moneych);
 		}

 		$moneyoutput=str_replace("{"," ",$moneyoutput);
 		$moneyoutput=str_replace("}","元",$moneyoutput);

 		echo $moneyoutput;
 		// 4. 释放curl句柄
 		curl_close($moneych);

	}

}
