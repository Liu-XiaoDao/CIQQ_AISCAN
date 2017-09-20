<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller{

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
		//所有类别
		$shuas=$this->db->query("SELECT * FROM shua_tools WHERE 1 order by sort asc")->result_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$shua_func = array();
		$select = "";
		foreach ($shuas as $key => $shua) {
			$shua_func[$shua['tid']] = $shua['name'];
			$select.='<option value="'.$shua['tid'].'">'.$shua['name'].'</option>';
		}


		//订单数量
		$numrows=$this->db->query("SELECT count(*) as numrows from shua_pay")->row()->numrows;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		//完成
		$ondate=$this->db->query("select count(*) as wcount from shua_pay where status=1")->row()->wcount;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);


		$con='系统共有 <b>'.$numrows.'</b> 个订单，其中已完成的有 <b>'.$ondate.'</b> 个。';
		

   	
  		$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
    	$orders=$this->db->query("SELECT * FROM shua_pay WHERE 1 order by addtime asc {$limit}")->result_array();
    	//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);


    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $numrows,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));


    	$data['con'] = $con;
		$data['title'] = '订单管理';
		$data['islogin'] = $this->islogin;
	   	$data['shua_func'] = $shua_func;
		$data['select'] = $select;
    	$data['c'] = 'order';
    	$data['orders'] = $orders;
    	$this->load->view('admin/order',$data);
	}


	public function query($page = 1)
	{
		$sql = " `uname`='".$_GET['username']."'";//要搜索的qq

		// $shuas=$this->db->query("SELECT * FROM shua_tools WHERE 1 order by sort asc")->result_array();
		// //插入语句写入数据库
  //   	$this->logs->append($this->db->last_query());
  //       $this->logs->save(4);

		// $shua_func = array();
		// $select = "";
		// foreach ($shuas as $key => $shua) {
		// 	$shua_func[$shua['tid']] = $shua['name'];
		// 	$select.='<option value="'.$shua['tid'].'">'.$shua['name'].'</option>';
		// }
		//订单总数
		$numrows=$this->db->query("SELECT count(*) as numrows from shua_pay WHERE{$sql}")->row()->numrows;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);
		//

		$con='包含 '.$_GET['username'].' 的共有 <b>'.$numrows.'</b> 个订单';
		
		$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
    	$orders=$this->db->query("SELECT * FROM shua_pay WHERE{$sql}  {$limit}")->result_array();
    	//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);


    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $numrows,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));


		// $data['shua_func'] = $shua_func;
		// $data['select'] = $select;
    	$data['con'] = $con;
		$data['title'] = '订单管理';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'order';
    	// $data['pages'] = $pages;
    	$data['orders'] = $orders;
    	$this->load->view('admin/order',$data);
	}


	public function status()
	{
		if($this->islogin==1){}else exit('{"code":301,"msg":"未登录"}');

		$id=intval($_GET['id']);
		$status=intval($_GET['status']);

		if($status==4){
			if($this->db->query("DELETE FROM shua_orders WHERE id='$id'")){
				//插入语句写入数据库
    			$this->logs->append($this->db->last_query());
        		$this->logs->save(2);
				exit('{"code":200}');
			}
			else{
				exit('{"code":400,"msg":"删除订单失败！'.$this->db->_error_message().'"}');
			}
		}else{
			if($this->db->query("update shua_orders set status='$status' where id='{$id}'")){
				//插入语句写入数据库
    			$this->logs->append($this->db->last_query());
        		$this->logs->save(3);
				exit('{"code":200}');
			}
			else{
				exit('{"code":400,"msg":"修改订单失败！'.$this->db->_error_message().'"}');
			}
		}
	}


	public function detail($trade_no){
		$ordersql = "select * from shua_pay where trade_no='{$trade_no}' limit 1";
		$order = $this->db->query($ordersql)->row_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$qqsql = "select * from trade_qq where trade_no='{$trade_no}'";
		$qqs = $this->db->query($qqsql)->result_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);


		$data['title'] = '订单详情';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'order';
    	$data['order'] = $order;
    	$data['qqs'] = $qqs;
    	$this->load->view('admin/order@detail',$data);
	}



}
