<?php
class Logs extends CI_Model {
    
    

    //添加时间
    public $add_time;
    //内容
    public $content;

    public function __construct(){

        $this->add_time=date("Y-m-d H:i:s");

    }

    public function append($content){
        $this->content.=$content."<br/>";
    }

    public function save($style=0){
        $username = "";
        if (isset($_SESSION['style'])) {
           if($_SESSION['style']==1){
                $username = "系统管理员";
            } else {
                $username = $_SESSION['username'];
            }
        }else{
            $username = "游客";
        }
        
        

        $insert_data=array(
            'username'          =>  $username,
            'module_name'       =>  MODULE_NAME,
            'controller_name'   =>  CONTROLLER_NAME,
            'action_name'       =>  ACTION_NAME,
            'addtime'           =>  $this->add_time,
            'content'           =>  addslashes($this->content),
            'style'             =>  $style,
        );
        $this->db->insert('system_logs',$insert_data);
        $this->content="";
    }

    

}

?>