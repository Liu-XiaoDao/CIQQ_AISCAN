<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Apigoods extends CI_Controller{

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
		//类别总数
		$numrows=$this->db->query("SELECT count(*) as numrows from shua_api")->row()->numrows;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

    	$sql=" 1";

    	$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
		$apigoods=$this->db->query("SELECT * FROM shua_api WHERE{$sql} order by sort asc {$limit}")->result_array();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $numrows,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));

        $data['title']='api销售管理';
		$data['numrows'] = $numrows;
		$data['apigoods'] = $apigoods;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'api';
		$this->load->view('admin/apigoods@index',$data);
	}

	public function add()
	{
		if (IS_POST) {
			$name=$_POST['name'];
    		$price=$_POST['price'];
    		$sort=$_POST['sort'];
    		$level=$_POST['level'];
   		 	$active=$_POST['active'];

   		 	$content="";
   		 	if($name==NULL or $price==NULL){
        		$content=remsg('保存错误,请确保每项都不为空!',3);
    		} else {
        		$sql="insert into `shua_api` (`name`,`price`,`level`,`sort`,`active`) values ('".$name."','".$price."','".$level."','".$sort."','".$active."')";
    			if($this->db->query($sql)){
    				//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
                	$this->logs->save(1);
	     			$content=remsg('添加类别成功！<br/><br/><a href="/admin/apigoods">>>返回类别列表</a>',1);
    			}else
	     			$content=remsg('添加类别失败！'.$this->db->_error_message(),4);
    		}

        	$data['title']='api商品管理';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/info',$data);
		}else{
			$data['title']='api商品管理';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/apigoods@add',$data);
		}
		
	}

	public function edit($aid)
	{
		if (IS_POST) {
    		$row=$this->db->query("select * from shua_api where aid='$aid' limit 1")->row();
    		//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

    		if(!$row)
	     		$content=remsg('当前记录不存在！',3);

       		$name=$_POST['name'];
       		$price=$_POST['price'];
       		$level=$_POST['level'];
       		$sort=$_POST['sort'];
       		$active=$_POST['active'];

       		if($name==NULL or $price==NULL){
            	$content=remsg('保存错误,请确保每项都不为空!',3);
        	} else {
            	if($this->db->query("update shua_api set name='$name',price='$price',level='$level',sort='$sort',active='$active' where aid='{$aid}'")){
            		//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
        			$this->logs->save(3);
	               	$content=remsg('修改api商品成功！<br/><br/><a href="/admin/apigoods">>>返回api商品列表</a>',1);
	            }
            	else{
	               	$content=remsg('修改api商品失败！'.$DB->error(),4);
            	}
        	}
        	$data['title']='api商品管理';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/info',$data);
		}else{

			$row=$this->db->query("select * from shua_api where aid='$aid' limit 1")->row_array();
			//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

			$data['row']=$row;
			$data['aid'] = $aid;
			$data['title']='api商品管理';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'api';
			$this->load->view('admin/apigoods@edit',$data);
		}
		
	}



	public function del($tid)
	{
		$content="";
    	$sql="DELETE FROM shua_api WHERE aid='$aid'";
    	if($this->db->query($sql)){
    		//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(2);

        	$content=remsg('删除成功！<br/><br/><a href="/admin/apigoods">>>返回类别列表</a>',1);
    	}
    	else{
	      	$content=remsg('删除失败！',4);
    	}

	    $data['title']='api商品管理';
	    $data['content'] = $content;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'api';
		$this->load->view('admin/info',$data);
	}


}
