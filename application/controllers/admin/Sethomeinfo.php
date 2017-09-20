<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sethomeinfo extends CI_Controller {

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
		$conf = $this->cacheqq->pre_fetch();
		$data['title'] = '网站首页提示设置';
		$data['islogin'] = $this->islogin;
    	$data['c'] = 'set';
		$data['conf'] = $conf;
		$this->load->view('admin/sethomeinfo@index',$data);
	}

	public function set(){
		$marquee=$_POST['marquee'];
		$point1=$_POST['point1'];
		$point2=$_POST['point2'];
		$point3=$_POST['point3'];
		$point4=$_POST['point4'];
		$point5=$_POST['point5'];
		$point6=$_POST['point6'];
		$middlepoint=$_POST['middlepoint'];
		
		saveSetting('marquee',$marquee);
    	$this->logs->append($this->db->last_query());
		saveSetting('point1',$point1);
    	$this->logs->append($this->db->last_query());
		saveSetting('point2',$point2);
    	$this->logs->append($this->db->last_query());
		saveSetting('point3',$point3);
    	$this->logs->append($this->db->last_query());
		saveSetting('point4',$point4);
    	$this->logs->append($this->db->last_query());
		saveSetting('point5',$point5);
    	$this->logs->append($this->db->last_query());
		saveSetting('point6',$point6);
    	$this->logs->append($this->db->last_query());
		saveSetting('middlepoint',$middlepoint);
		$this->logs->append($this->db->last_query());
        $this->logs->save(3);

        //清楚缓存,在获取
		$ad=$this->cacheqq->clear();
		$this->logs->append($this->db->last_query());
        $this->logs->save(2);
		

		if($ad)
			$content=remsg('修改成功！',1);
		else 
			$content=remsg('修改失败！<br/>',4);

		$data['title']='网站基本信息设置';
		$data['content'] = $content;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'set';
		$this->load->view('admin/setwebinfo@setsuc',$data);
	}
}
