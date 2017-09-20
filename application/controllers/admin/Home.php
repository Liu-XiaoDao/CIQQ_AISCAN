<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller{

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


	public function index()
	{
		$count1=$this->db->query("SELECT count(*) as count1 from shua_orders")->row()->count1;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$count2=$this->db->query("SELECT count(*) as count2 from shua_orders where status=1")->row()->count2;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$mysqlversion=$this->db->query("select VERSION() as version")->row()->version;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$data['c'] = 'home';
		$data['date'] = date("Y-m-d H:i:s");
		$data['count1']=$count1;
		$data['count2']=$count2;
		$data['mysqlversion']=$mysqlversion;
		$data['islogin'] = $this->islogin;
		$data['title'] = '第一营销管理中心';
		$this->load->view('admin/home',$data);
	}
}
