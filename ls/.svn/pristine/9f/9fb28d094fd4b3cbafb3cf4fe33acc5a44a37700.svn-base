<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setpayinfo extends CI_Controller {

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


	public function index($now_page=1)
	{
		$data['title'] = '网站支付设置';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'set';
		$data['content']="<p>功能马上上线</p>";
		$this->load->view('admin/setpayinfo@index',$data);
	}
}
