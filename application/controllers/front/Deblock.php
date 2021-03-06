<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Deblock extends CI_Controller{

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
		$numrows=$this->db->query("SELECT count(*) as numrows from apiorder where uid={$uid}")->row()->numrows;
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);
		//未完成
		$ondate=$this->db->query("select count(*) as wcount from apiorder where status=0 and uid={$uid}")->row()->wcount;
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);

		$con='共有 <b>'.$numrows.'</b> 个订单，其中未完成的有 <b>'.$ondate.'</b> 个。';
		

   	
  		$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
    	$orders=$this->db->query("SELECT * FROM apiorder WHERE uid={$uid} order by status asc, api_trade_no desc {$limit}")->result_array();
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
    	$data['c'] = 'api';
    	$data['orders'] = $orders;
    	$this->load->view('front/deblock@index',$data);
	}

	public function detail($trade_no){
		$ordersql = "select * from shua_pay where trade_no='{$trade_no}' limit 1";
		$order = $this->db->query($ordersql)->row_array();
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);
		
		$qqsql = "select * from trade_qq where trade_no='{$trade_no}'";
		$qqs = $this->db->query($qqsql)->result_array();
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);


		$data['title'] = '订单详情';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'order';
    	$data['order'] = $order;
    	$data['qqs'] = $qqs;
    	$this->load->view('front/order@detail',$data);
	}
}
