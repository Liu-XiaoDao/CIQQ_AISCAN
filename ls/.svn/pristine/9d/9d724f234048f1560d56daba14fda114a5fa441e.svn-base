<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Syslog extends CI_Controller{

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
		//日志总数
		$numrows=$this->db->query("SELECT count(*) as numrows from system_logs")->row()->numrows;
    	$sql=" 1";
    	$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
		
    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $numrows,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));
        $logs=$this->db->query("SELECT * FROM system_logs WHERE{$sql} {$limit}")->result_array();

        $data['title']='系统日志';
		$data['numrows'] = $numrows;
		$data['logs'] = $logs;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'set';
		$this->load->view('admin/syslog@index',$data);
	}

}
