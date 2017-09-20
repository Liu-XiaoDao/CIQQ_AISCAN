<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acount extends CI_Controller{

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

	public function index()
	{
		$sql = "select * from users where username= ? and isable = 1 limit 1";
		$datasql = array($_SESSION['username']);
		$user = $this->db->query($sql,$datasql)->row_array();
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);

		
    	$data['user'] = $user;
		$data['title'] = '充值';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'acount';
    	$this->load->view('front/acount@index',$data);
	}
}
