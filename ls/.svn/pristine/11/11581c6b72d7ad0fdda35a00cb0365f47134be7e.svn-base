<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Apiuser extends CI_Controller{

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
		$numrows=$this->db->query("SELECT count(*) as count FROM apiuser WHERE 1 ")->row()->count;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		$page_size=10; //每页显示数量
    	$start=($page-1)*$page_size;//每页从第几条开始
   	 	$limit=" limit {$start},{$page_size}";//
		$apiusers=$this->db->query("SELECT * FROM apiuser WHERE 1 order by id asc {$limit}")->result_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);


		//获取分页标记
    	$data['pager'] = $this->get_pager(array(
        	'record_count'  => $numrows,
        	'page_size'     => $page_size,
        	'now_page'     => $page,
    	));


    	$data['numrows']=$numrows;
		$data['apiusers']=$apiusers;
		$data['title']='api用户管理';
		$data['islogin'] = $this->islogin;
		$data['c'] = 'api';
		$this->load->view('admin/apiuser@index',$data);

	}

	public function status(){

		$stytusql = "update apiuser set isactive=0";
		$this->db->query($stytusql);
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(3);

		if ($this->db->affected_rows()) {
			$id=$_GET['id'];
		 		$isactive=$_GET['status'];

   			if($id==NULL or $isactive==NULL){
        		exit('{"code":400,"msg":"修改状态失败失败！"}');
    		} else {
        		if($this->db->query("update apiuser set isactive='$isactive' where id='{$id}'")){
        			//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
        			$this->logs->save(3);
               		exit('{"code":200}');
        		}
        		else{
               		exit('{"code":400,"msg":"修改状态失败失败！"}');
        		}
    		}
		}else{
			exit('{"code":400,"msg":"修改状态失败失败！"}');
		}

    		
	}

	

	







	public function add()
	{
		if (IS_POST) {
    		$api=$_POST['api'];
    		$apipw=$_POST['apipw'];
    		$apipw = md5($apipw);
    		if($api==NULL or $apipw==NULL){
        			$content=remsg('保存错误,请确保每项都不为空!',3);
    		} else {
        			$sql="insert into `apiuser` (`username`,`password`,`isactive`) values ('".$api."','".$apipw."',0)";
        			$this->db->query($sql);

    				if($this->db->affected_rows()){
        
	     				$content=remsg('添加api账号成功！<br/><br/><a href="/admin/apiuser">>>返回类别列表</a>',1);
    				}else
	     				$content=remsg('添加api账号失败！',4);
    		}

    		$data['title']='api账号添加';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/info',$data);

		}else{
			$data['title']='api账号添加';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/apiuser@add',$data);
		}
		
	}

	public function edit($id)
	{
		if (IS_POST) {
    		$api=$_POST['username'];
    		$apipw=$_POST['password'];
    		$apipw = md5($apipw);
    		if($api==NULL or $apipw==NULL){
        			$content=remsg('保存错误,请确保每项都不为空!',3);
    		} else {
        			$sql="update apiuser set username='{$api}',password='{$apipw}' where id={$id}";
        			$this->db->query($sql);

    				if($this->db->affected_rows()){
        
	     				$content=remsg('修改api账号成功！<br/><br/><a href="/admin/apiuser">>>返回api账号列表</a>',1);
    				}else
	     				$content=remsg('修改api账号失败！',4);
    		}

    		$data['title']='api账号添加';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/info',$data);

		}else{
			$sql = "select * from apiuser where id={$id} limit 1";
			$api=$this->db->query($sql)->row_array();
			$data['id']=$api['id'];
			$data['api']=$api;
			$data['title']='api账号添加';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/apiuser@edit',$data);
		}
		
	}



	public function del($id)
	{
		$content="";
    	$sql="DELETE FROM apiuser WHERE id='$id'";
    	if($this->db->query($sql))
        	$content=remsg('删除成功！<br/><br/><a href="/admin/gres">>>返回api账号列表</a>',1);
    	else
	      	$content=remsg('删除失败！',4);
	    $data['title']='api账号管理';
	    $data['content'] = $content;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'api';
		$this->load->view('admin/info',$data);	
	}


}
