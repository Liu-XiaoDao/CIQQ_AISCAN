<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller{

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
	public function index($page=1)
	{
		$usercount=$this->db->query("SELECT count(*) as usercount FROM users")->row()->usercount;
		$this->logs->append($this->db->last_query());
		$this->logs->save(4);

    	$page_size=10; //每页显示数量
        $start=($page-1)*$page_size;//每页从第几条开始
        $limit=" limit {$start},{$page_size}";//
		
    	//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => $usercount,
            'page_size'     => $page_size,
            'now_page'     => $page,
        ));
        $list=array();
        $users=$this->db->query("SELECT * FROM users {$limit}")->result_array();
        $this->logs->append($this->db->last_query());
		$this->logs->save(4);

        $data['title']='用户中心';
		$data['usercount'] = $usercount;
		$data['users'] = $users;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'user';
		$this->load->view('admin/user@index',$data);
	}

	public function del($id)
	{
		$content="";
    	$sql="DELETE FROM users WHERE id='$id'";
    	if($this->db->query($sql)){
    		$this->logs->append($this->db->last_query());
			$this->logs->save(2);

        	$content=remsg('删除成功！<br/><br/><a href="/admin/user">>>返回用户列表</a>',1);
    	}
    	else{
	      	$content=remsg('删除失败！'.$this->db->_error_message(),4);
    	}


	    $data['title']='用户管理';
	    $data['content'] = $content;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'user';
		$this->load->view('admin/user@delsuc',$data);
	}

	public function editpw($id)
	{
		if (IS_POST) {
    		$newpw=$_POST['newpw'];
    		if($newpw==NULL){
        			$content=remsg('保存错误,请填写新密码!',3);
    		} else {
    				$newpw = md5($newpw);
        			$sql="update users set password='$newpw' where id='{$id}'";
    				if($this->db->query($sql)){
    					$this->logs->append($this->db->last_query());
						$this->logs->save(3);
	     				$content=remsg('修改密码成功！<br/><br/><a href="/admin/user">>>返回用户列表</a>',1);
    				}else
	     				$content=remsg('添加密码失败！'.$this->db->_error_message(),4);
    		}
    		$data['title']='用户密码修改成功';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'user';
			$this->load->view('admin/info',$data);
		}else{
			$data['id']=$id;
			$data['title']='修改用户密码';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'user';
			$this->load->view('admin/user@editpw',$data);
		}
	}

	public function recharge($id)
	{
		if (IS_POST) {
    		$account=$_POST['account'];
    		if($account==NULL){
        		$content=remsg('保存错误,请输入金额!',3);
    		}elseif ($account < 0) {
    			$content=remsg('保存错误,金额不能为负!',3);
			}else {
        		$sql="update users set account=account+{$account} where id='{$id}'";
    			if($this->db->query($sql)){
    				$this->logs->append($this->db->last_query());
					$this->logs->save(3);
	     			$content=remsg('充值成功！<br/><br/><a href="/admin/user">>>返回用户列表</a>',1);
    			}else
	     			$content=remsg('充值失败！'.$this->db->_error_message(),4);
    		}



    		$data['title']='用户余额修改成功';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'user';
			$this->load->view('admin/info',$data);
		}else{
			$data['id']=$id;
			$data['title']='修改用户平台余额';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'user';
			$this->load->view('admin/user@editaccount',$data);
		}
	}
}
