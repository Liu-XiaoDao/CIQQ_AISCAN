<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {


	public function index()
	{
		$data['title'] = '第一营销后台登录';
		$data['islogin'] = 0;
		$this->load->view('admin/login',$data);
	}

	public function loginme(){
		$conf = $this->cacheqq->pre_fetch();
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

		if(isset($_POST['user']) && isset($_POST['pass'])){
			$user=$_POST['user'];
			$pass=$_POST['pass'];
			$password_hash='!@#%!s!0';

			if($user==$conf['admin_user'] && $pass==$conf['admin_pwd']) {
				$session=md5($user.$pass.$password_hash);
				$token=authcode("{$user}\t{$session}", 'ENCODE', SYS_KEY);
				$_SESSION['admin_token']=$token;
				$_SESSION['style']=1;//普通用户登陆后类型为2
				
				// setcookie("admin_token", $token, time() + 604800);
				@header('Content-Type: text/html; charset=UTF-8');
				exit("<script language='javascript'>alert('登陆管理中心成功！');window.location.href='/admin/home';</script>");
			}elseif ($pass != $conf['admin_pwd']) {
				@header('Content-Type: text/html; charset=UTF-8');
				exit("<script language='javascript'>alert('用户名或密码不正确！');history.go(-1);</script>");
			}
		}
	}


	public function logout(){
		// setcookie("admin_token", "", time() - 604800);
		//清空session数组
        unset($_SESSION);

        session_destroy();
		@header('Content-Type: text/html; charset=UTF-8');
		exit("<script language='javascript'>alert('您已成功注销本次登陆！');window.location.href='/admin/login';</script>");		
	}
}
