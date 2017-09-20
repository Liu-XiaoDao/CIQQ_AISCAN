<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gres extends CI_Controller{

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
		$numrows=$this->db->query("SELECT count(*) as numrows from goods")->row()->numrows;
		//插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

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
        $list=array();
        $goods=$this->db->query("SELECT * FROM goods WHERE{$sql} {$limit}")->result_array();
        //插入语句写入数据库
    	$this->logs->append($this->db->last_query());
        $this->logs->save(4);

        foreach ($goods as $key => $good) {
        	$tid = $good['tid'];
        	$tname=$this->db->query("select * from shua_tools where tid='{$tid}' limit 1")->row()->name;
        	//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

        	$good['tname'] = $tname;
        	$list[]=$good;
        }

        $data['title']='商品仓库';
		$data['numrows'] = $numrows;
		$data['list'] = $list;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'clist';
		$this->load->view('admin/gres@index',$data);
	}

	public function add()
	{
		if (IS_POST) {
			$addtime=date("Y-m-d h:i:s");
    		$qqnum=$_POST['qqnum'];
    		$qqpw="a";
    		$leibie=$_POST['leibie'];
    		$is_sell=$_POST['is_sell'];
    		$phone="a";
    		$code="a";


    		if($qqnum==NULL or $qqpw==NULL or $leibie==NULL or $is_sell==NULL or $phone==NULL or $code==NULL){
        			$content=remsg('保存错误,请确保每项都不为空!',3);
    		} else {
        			$sql="insert into `goods` (`tid`,`qqnum`,`qqpw`,`is_sell`,`addtime`,`phone`,`code`) values ('".$leibie."','".$qqnum."','".$qqpw."','".$is_sell."','".$addtime."','".$phone."','".$code."')";
        			$this->db->query($sql);
        			//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
        			$this->logs->save(1);
					//该账号类型库存加1
		 			$stocksql = "update shua_tools set num=num+1,stock=stock+1 where tid='{$leibie}'";
		 			$this->db->query($stocksql);
		 			//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
        			$this->logs->save(3);

    				if($this->db->affected_rows()){
        
	     				$content=remsg('添加类别成功！<br/><br/><a href="/admin/gres">>>返回类别列表</a>',1);
    				}else
	     				$content=remsg('添加类别失败！'.$this->db->_error_message(),4);
    		}

    		$data['title']='商品仓库';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'clist';
			$this->load->view('admin/gres@addsuc',$data);

		}else{
			$tools=$this->db->query("SELECT * FROM shua_tools order by tid asc")->result_array();
			//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

			$data['tools']=$tools;

			$data['title']='商品仓库';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'clist';
			$this->load->view('admin/gres@add',$data);
		}
		
	}

	public function edit($gid)
	{
		if (IS_POST) {

    		$row=$this->db->query("select * from goods where gid='$gid' limit 1")->row();
    		//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

    		if(!$row)
	     		$content=remsg('当前QQ不存在！',3);

    		$qqnum=$_POST['qqnum'];
   		 	$qqpw="a";
   		 	$leibie=$_POST['leibie'];
    		$is_sell=$_POST['is_sell'];
    		$phone="a";
    		$code="a";

    		//判断qq原本是否卖出,再根据这个的值对仓库进行操作
        	if ($row->is_sell==1) {
        		if ($is_sell==0) {
        			//若原本已卖出,现在改为为卖出,库存加1
        			$countsql = "update shua_tools set stock=stock+1 where tid={$leibie}";
        			$this->db->query($countsql);
        			$this->logs->append($this->db->last_query());
        			$this->logs->save(3);
        		}
        	} else {
        		if ($is_sell==1) {
        			//若原本已卖出,现在改为为卖出,库存加1
        			$countsql = "update shua_tools set stock=stock-1 where tid={$leibie}";
        			$this->db->query($countsql);
        			$this->logs->append($this->db->last_query());
        			$this->logs->save(3);
        		}
        	}




       		if($qqnum==NULL or $qqpw==NULL or $leibie==NULL or $is_sell==NULL or $phone==NULL or $code==NULL){
            	$content=remsg('保存错误,请确保每项都不为空!',3);
        	} else {
            	if($this->db->query("update goods set tid='$leibie',qqnum='$qqnum',qqpw='$qqpw',is_sell='$is_sell',phone='$phone',code='$code' where gid='{$gid}'")){
            		//插入语句写入数据库
    				$this->logs->append($this->db->last_query());
        			$this->logs->save(3);
	               	$content=remsg('修改类别成功！<br/><br/><a href="/admin/gres">>>返回类别列表</a>',1);
            	}
            	else{
	               	$content=remsg('修改类别失败！'.$this->db->_error_message(),4);
            	}
        	}
        	
        	


        	$data['title']='商品管理';
			$data['content'] = $content;
			$data['islogin'] = $this->islogin;
			$data['c'] = 'clist';
			$this->load->view('admin/gres@editsuc',$data);

		}else{
			$tools=$this->db->query("SELECT * FROM shua_tools order by tid asc")->result_array();
			//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

			$row=$this->db->query("select * from goods where gid='$gid' limit 1")->row_array();
			//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(4);

			$data['tools']=$tools;
			$data['row']=$row;
			$data['gid'] = $gid;
			$data['title']='商品管理';
			$data['islogin'] = $this->islogin;
			$data['c'] = 'clist';
			$this->load->view('admin/gres@edit',$data);
		}
		
	}



	public function del($gid)
	{

		$content="";
    	$sql="DELETE FROM goods WHERE gid='$gid'";
    	if($this->db->query($sql)){
    		//插入语句写入数据库
    		$this->logs->append($this->db->last_query());
        	$this->logs->save(2);
        	$content=remsg('删除成功！<br/><br/><a href="/admin/gres">>>返回类别列表</a>',1);
    	}
    	else{
	      	$content=remsg('删除失败！'.$this->db->_error_message(),4);
    	}


	    $data['title']='商品管理';
	    $data['content'] = $content;
		$data['islogin'] = $this->islogin;
		$data['c'] = 'clist';
		$this->load->view('admin/gres@del',$data);
	}


}
