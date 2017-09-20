<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Apiorder extends CI_Controller{

	public $islogin = 0;

	public function __construct(){
		parent::__construct();

        if(isset($_SESSION['user'])&&isset($_SESSION['style'])&&$_SESSION['style']===2)
		{
			$this->islogin=1;		
		}else{
			$this->islogin=0;
            exit("<script language='javascript'>alert('您还没有登陆！');window.location.href='/front/login';</script>");
		}

	}


	public function index($page = 1)
	{
		
		$user = $_SESSION['user'];
		$uid = $user['id'];
		//订单数量
		$numrows=$this->db->query("SELECT count(*) as numrows from apiorder where uid=$uid")->row()->numrows;
        $this->logs->append($this->db->last_query());
        $this->logs->save(4);
		//完成
		$ondate=$this->db->query("select count(*) as wcount from apiorder where uid=$uid and status=2")->row()->wcount;
        $this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$con='系统共有 <b>'.$numrows.'</b> 个订单。';
		

   	
  		$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
    	$apiorders=$this->db->query("SELECT * FROM apiorder WHERE uid=$uid order by addtime desc {$limit}")->result_array();
        $this->logs->append($this->db->last_query());
        $this->logs->save(4);


    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $numrows,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));


    	$data['con'] = $con;
		$data['title'] = 'api订单管理';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'apiorder';
    	$data['apiorders'] = $apiorders;
    	$this->load->view('front/apiorder@index',$data);
	}



	public function detail($api_trade_no){

        $user = $_SESSION['user'];
        $uid = $user['id'];

		$apiordersql = "select * from apiorder where uid={$uid} and api_trade_no='{$api_trade_no}' limit 1";
		$apiorder = $this->db->query($apiordersql)->row_array();//本平台订单
        $this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$api_order = $apiorder['api_order'];//本平台订单所属第三方订单号


		$apiusersql = "select * from apiuser where isactive=1 limit 1";
	 	$apiuser = $this->db->query($apiusersql)->row_array();
        $this->logs->append($this->db->last_query());
        $this->logs->save(4);


	 	// 1. 初始化
 		$moneych = curl_init();
 		// 2. 设置选项，包括URL
 		curl_setopt($moneych,CURLOPT_URL,"http://api.qqhao456.com/api.php?u=".$apiuser['username']."&s=".$apiuser['password']."&order=".$api_order);
 		curl_setopt($moneych,CURLOPT_RETURNTRANSFER,1);
 		curl_setopt($moneych,CURLOPT_HEADER,0);
 		// 3. 执行并获取HTML文档内容
 		$moneyoutput = curl_exec($moneych);
 		if($moneyoutput === FALSE ){
 			echo "CURL Error:".curl_error($moneych);
 		}



 		$out=array();
    	preg_match_all("/({.*})({.*})/U",$moneyoutput,$out);
    	print_r($out);
    	$order1 = $out[1][0];
    	$order2 = $out[2][0];

 		$order1=str_replace("{","[",$order1);
 		$order1=str_replace("}","]",$order1);

 		$order2=str_replace("{","",$order2);
 		$order2=str_replace("}","",$order2);


 		$order1array=json_decode($order1);//json转数组
 		// $order2array=json_decode($order2);//json转数组 这个不能转
 		// 
 		$order2array=explode(",",$order2);
 

 		$api_order_info="解封订单:有效数量为".$order1array[1].",订单金额为".$order1array[2];
 		$qqs_status_array=array();//存放要展示的数组,美容为每个qq的号码和状态

 		foreach ($order2array as $key => $value) {
 			$statusnum=array();
    		preg_match_all("/.*([0-9])/",$value,$statusnum);
    		$qq_status_num = $statusnum[1][0];
    		$info=$value."----";//每个qq的展示信息例如:498660833---已解封
    		if ($qq_status_num==0) {
    			$info.="未付款";
    		}elseif ($qq_status_num==3) {
    			$info.="等待处理";
    		}elseif ($qq_status_num==4) {
    			$info.="解封成功";
    		}elseif ($qq_status_num==5) {
    			$info.="不可解封";
    		}elseif ($qq_status_num==6) {
    			$info.="等待处理";
    		}
    		$qqs_status_array[]=$info;

 		}

 		// 4. 释放curl句柄
 		curl_close($moneych);


		$data['title'] = 'api订单详情';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'apiorder';
    	$data['api_order_info'] = $api_order_info;
    	$data['order'] = $apiorder;
    	$data['qqs_status_array'] = $qqs_status_array;
    	$this->load->view('front/apiorder@detail',$data);
	}



}
