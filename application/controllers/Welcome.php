<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	
	public function __construct(){
		parent::__construct();
        if(isset($_SESSION['user'])&&isset($_SESSION['style'])&&$_SESSION['style']===2)
		{
			$this->is_user_login=1;		
		}else{
			$this->is_user_login=0;
		}

	}	
	public function index()
	{	//商品种类
		$rss=$this->db->query("SELECT * FROM shua_tools WHERE 1 order by sort asc")->result_array();

		$this->load->library('AipOcr');
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);
		$select='';
		foreach ($rss as $key => $value) {
			// $shua_func[$value['tid']]=$value['name'];
			$select.='<option value="'.$value['tid'].'" price="'.$value['price'].'">'.$value['name'].'---当前库存:'.$value['stock'].'</option>';
		}
		$data['select'] = $select;
		$apis=$this->db->query("SELECT * FROM shua_api WHERE 1 order by sort asc")->result_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);
		$apiselect='';
		foreach ($apis as $key => $api) {
			// $shua_func[$api['tid']]=$api['name'];
			$apiselect.='<option value="'.$api['aid'].'" price="'.$api['price'].'">'.$api['name'].'</option>';
		}
		$data['apiselect'] = $apiselect;

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
		$data['count1'] = $count1;
		$data['count2'] = $count2;
		$data['mysqlversion'] = $mysqlversion;
		$conf = $this->cacheqq->pre_fetch();
		$data['conf'] = $conf;



		
//识别图片文字

		$url = "http://itmanage.liuxiaodao.top/images/service/201712/65bcabd326d4ff3bbf83ee238a315918.jpg";

		// 调用通用文字识别, 图片参数为远程url图片
		$this->aipocr->basicGeneralUrl($url);

		// 如果有可选参数
		$options = array();
		$options["language_type"] = "CHN_ENG";
		$options["detect_direction"] = "true";
		$options["detect_language"] = "true";
		$options["probability"] = "true";

		// 带参数调用通用文字识别, 图片参数为远程url图片
		$info = $this->aipocr->basicGeneralUrl($url, $options);
		$data['ai'] = json_encode($info);
//发送邮件

		$this->load->library('email');
		$this->email->from('liu_xiaodao@163.com', 'Chunlaing');
		$this->email->to('957419420@qq.com');


		$this->email->subject('Email Test');
		$this->email->message('Testing the email class.');

		$this->email->send();
		echo $this->email->print_debugger();





		//用户登录的逻辑
		if ($this->is_user_login==1) {
			$data['is_user_login'] = $this->is_user_login;
			$data['user'] = $_SESSION['user'];
		} else {
			$data['is_user_login'] = $this->is_user_login;
		}
		$this->load->view('welcome',$data);
		
	}
}
