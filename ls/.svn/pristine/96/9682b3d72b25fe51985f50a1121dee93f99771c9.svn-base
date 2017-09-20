<?php
class Cache extends CI_Model {  //资讯站中拷

    //redis对象
    private $redis;

    //存储方式 0redis 1file
    public $method;

    //文件缓存目录
    private $cache_dir;

    //可用状态
    private $enable;

    private $i=0;

    public function __construct()
    {
        //parent::__construct();
        //设置缓存可用状态
        $this->enable = 1;
        if(class_exists('Redis')){
            $this->redis = new Redis();
            if(CONTEXT)
                //如果是正式环境，使用web服务器上的REDIS
                $this->redis->connect('59.110.45.155',6379);
            else
                //否则使用本地的Redis
                $this->redis->connect('localhost',6379);

            $this->method=0;
        }else{
            $this->method=1;
        }
        $this->cache_dir = CACHE_PATH;

        //私有key
        $this->private_keys = array(
            '__cache_names','__cache_times','__cache_counts'
        );

    }

    /**
     * 获取指定键值的数据
     * @param  string $key 指定的键名
     * @return mixed       返回数据
     */
    public function get($key,$set_count=TRUE){

        //如果没有开启缓存，每次读取时都先清空缓存
        if(!$this->enable){
            $this->flush();
        }

        //检测如不存在自动读数据库的数据，并设置
        $this->auto_set($key);
        //如果是文件存储
        if ($this->method) {
            $filepath = $this->get_cache_filepath($key);
            if (file_exists($filepath)) {
                $content = file_get_contents($filepath);
            }
        //否则用Redis
        }else{
            $content = $this->redis->get($key);
        }
        if($set_count)$this->set_count($key);
        return json_decode($content,TRUE);
    }
    
    /**
     * 设置数据
     * @param string $key   指定的键名
     * @param mixed  $value 设置的数据
     */
    public function set($key,$value,$second=0){
        if (is_php('5.4')) {
            $value = json_encode($value,JSON_UNESCAPED_UNICODE);
        }else{
            $value = json_encode($value);
        }
        //如果文件存储方式，该方式暂不支持过期时间
        if ($this->method) {
            $filepath = $this->get_cache_filepath($key);
            $text=file_put_contents($filepath,$value);
            log_message('DEBUG', '---------------------cache_set_token_file----------------');
            log_message('DEBUG', '---------------------cache_set_token_file----------------'.$text.'--------');
        }else{
            $this->redis->set($key,$value);
            if($second){
                $this->redis->expire($key);
            }
            log_message('DEBUG', '---------------------cache_set_token_Redis----------------');
        }
        $this->set_time($key);
    }

    /**
     * 设置缓存的名称
     * @param string $key  缓存key
     * @param string $name 缓存名称
     */
    public function set_name($key,$name='未命名'){
        if($this->is_private($key))return;
        $cache_names = $this->get('__cache_names');
        if(!$cache_names)$cache_names=array();
        $cache_names[$key] = $name;
        $this->set('__cache_names',$cache_names);
    }

    /**
     * 获取缓存的名称
     * @param string $key  缓存key
     */
    public function get_name($key=NULL){
        $cache_names = $this->get('__cache_names');
        if($key){
            return $cache_names[$key];
        }else{
            return $cache_names;
        }
    }

    /**
     * 设置缓存的设置时间
     * @param string $key  缓存key
     * @param string $time 时间戳
     */
    public function set_time($key,$time=NULL){
        if($this->is_private($key))return;
        $cache_times = $this->get('__cache_times');
        if(!$cache_times)$cache_times=array();
        $cache_times[$key] = $time?$time:time();
        $this->set('__cache_times',$cache_times);
    }

    /**
     * 获取缓存的设置时间
     * @param string $key  缓存key
     */
    public function get_time($key=NULL){
        $cache_times = $this->get('__cache_times');
        if($key){
            return $cache_times[$key];
        }else{
            return $cache_times;
        }
    }

    /**
     * 设置累加调用次数
     * @param string $key  缓存key
     */
    public function set_count($key){
        if($this->is_private($key))return;
        $cache_counts = $this->get('__cache_counts');
        if(!$cache_counts)$cache_counts=array(
            $keys => 0,
        );
        $cache_counts[$key]++;
        $this->set('__cache_counts',$cache_counts);
    }

    /**
     * 获取调用次数
     * @param string $key  缓存key
     */
    public function get_count($key=NULL){
        $cache_counts = $this->get('__cache_counts');
        if($key){
            return $cache_counts[$key];
        }else{
            return $cache_counts;
        }
    }


    /**
     * 是否私有key
     */
    public function is_private($key){
        return in_array($key,$this->private_keys);
    }

    /**
     * 删除键
     * @param string  $key        指定的键名
     * @param int     $is_regexp  是否使用正则匹配
     * @param string  $modifier   正则修饰符
     */
    public function delete($key,$is_regexp=0,$modifier=''){
        //如果使用了正则匹配
        if ($is_regexp) {
            //取出所有缓存的键名
            $key_array = $this->keys();
            //遍历keys
            foreach ($key_array as $k) {
                //如匹配则删除
                if (preg_match('/'.$key.'/'.$modifier,$k)) {
                    $this->delete($k);
                }
            }
        }else{
            if($this->method){
                $filepath = $this->get_cache_filepath($key);
                @unlink($filepath);
            }else{
                $this->redis->delete($key);
            }
        }
    }
    
    /**
     * 删除所有key
     * @return void
     */
    function flush(){
        if ($this->method) {
            $keys = $this->keys();
            foreach ($keys as $key) {
                @unlink($this->get_cache_filepath($key));
            }
        }else{
            $this->redis->flushdb();
        }
    }

    /**
     * 查找键，通过正则匹配
     * @param  string  $paeern       键名
     * @param  string  $modifier     修饰符
     * @return array                 匹配到的键名数组
     */
    function find($pattern,$modifier=''){
        $keys = $this->keys();
        $finded_keys = array();
        foreach ($keys as $key){
            if(preg_match('/'.$pattern.'/'.$modifier,$key)){
                $finded_keys[] = $key;
            }
        }
        return $finded_keys;
    }

    /**
     * 返回所有key
     * @return mixed
     */
    public function keys(){
        if ($this->method) {
            $keys = scandir($this->cache_dir);
            array_shift($keys);
            array_shift($keys);
        }else{
            $keys = $this->redis->keys('*');
        }
        
        foreach($this->private_keys as $key){
            $pos = array_search($key,$keys);
            if($pos!==FALSE)unset($keys[$pos]);
        }

        return $keys;
    }

    /**
     * 判断键是否存在
     * @param string $key   指定的键名
     */
    function exists($key){
        if ($this->method) {
            $filepath = $this->get_cache_filepath($key);
            return file_exists($filepath);
        }else{
            return $this->redis->exists($key);
        }
    }

    /**
     * 返回缓存文件路径
     */
    private function get_cache_filepath($key){
        return $this->cache_dir.'/'.$key;
    }
    
    /**
     * 判断并取出数据库，设置数据
     * @param string $key   指定的键名
     * @return void
     */
    private function auto_set($key){

        //先处理数据库缓存数据
        switch($key){
            

            /****************************************************
             *
             *  名称类数据
             * 
             ***************************************************/
            //标签名称
            case 'tag_names':
                //如果不存在该键，则从数据库读数据，并加入缓存中
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('wx_fans_tag')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'标签名称');
                }
            break;

            //公司名称
            case 'company_names':
                //如果不存在该键，则从数据库读数据，并加入缓存中
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('company','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'公司名称');
                }
            break;

            //管理员名
            case 'manager_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('manager')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'管理员名');
                }
            break;

            //售前团队名
            case 'front_team_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('front_team','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'售前团队名');
                }
            break;

            //售后团队名
            case 'back_team_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('back_team','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'售后团队名');
                }
            break;

            //角色组名
            case 'role_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('role','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'角色组名');
                }
            break;

            //角色类型名
            case 'role_type_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->order_by('order_index')->get('role_type')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'角色类型名');
                }
            break;

            //功能模块名
            case 'module_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('function_module','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'功能模块名');
                }
            break;

            //功能名
            case 'function_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('function','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'功能名');
                }
            break;

            //产品名
            case 'product_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('product','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'产品名');
                }
            break;

            //产品中文名
            case 'product_cnames':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,cname')->get_where('product','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','cname'));
                    $this->set_name($key,'产品中文名');
                }
            break;

            //产品标签名
            case 'product_tag_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('product_tag','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'产品标签名');
                }
            break;

            //产品分类名
            case 'product_class_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('product_class','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'产品分类名');
                }
            break;

            //配送方式名
            case 'ship_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('ship','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'配送方式名');
                }
            break;

            //货物渠道名
            case 'goods_channel_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get('goods_channel')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'货物渠道名');
                }
            break;

            //供货商类型名
            case 'supplier_type_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get('supplier_type')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'供货商类型名');
                }
            break;

            //推广渠道名
            case 'extend_channel_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('extend_channel','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'推广渠道名');
                }
            break;

            //推广账户名
            case 'extend_account_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('extend_account','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'推广账户名');
                }
            break;

            //订购渠道名
            case 'order_channel_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get('order_channel')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'订购渠道名');
                }
            break;

            //咨询数据字段
            case 'consult_data_fields_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get('consult_data_fields')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'咨询数据字段');
                }
            break;

            //客户意向类型名
            case 'guest_intent_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get_where('guest_intent','enable=1')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'客户意向类型名');
                }
            break;
            
            //地区名
            case 'region_names':
                if (!$this->exists($key)){
                    $result = $this->db->select('id,name')->get('region')->result_array();
                    $this->set($key,array_point($result,'id','name'));
                    $this->set_name($key,'地区名');
                }
            break;


            /****************************************************
             *
             *  状态类数据
             * 
             ***************************************************/
            
            //产品立项状态
            case 'product_apply_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未批准',''),
                        1 => array('已批准',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'产品立项状态');
                }
            break;
            
            //采购单流程状态
            case 'purchase_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未审核',''),
                        1 => array('产品部已审',''),
                        2 => array('总经办已审',''),
                        3 => array('会计已校对',''),
                        4 => array('出纳已付款',''),
                        5 => array('已验货入库',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'采购单流程状态');
                }
            break;

            //采购单审核状态
            case 'purchase_aduit_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('成功',''),
                        1 => array('失败',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'采购单审核状态');
                }
            break;

            //采购单付款状态
            case 'purchase_pay_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未付款',''),
                        1 => array('部分付款',''),
                        2 => array('全部付款',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'采购单付款状态');
                }
            break;

            //采购单入库状态
            case 'purchase_input_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未入库',''),
                        1 => array('部分入库',''),
                        2 => array('全部入库',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'采购单入库状态');
                }
            break;

            //内部采购单流程状态名
            case 'inner_purchase_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未确认',''),
                        1 => array('供货方已确认出货',''),
                        2 => array('需求方已确认收货',''),
                        3 => array('采购结算完毕',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'内部采购单流程状态名');
                }
            break;

            //售后客户归属状态名
            case 'back_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未分配',''),
                        1 => array('已回收',''),
                        2 => array('已分配',''),
                        3 => array('已放弃',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'售后客户归属状态名');
                }
            break;

            //可用状态
            case 'enable_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('正常',''),
                        1 => array('删除',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'可用状态');
                }
            break;

            //订单状态
            case 'order_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('正常',''),
                        1 => array('删除',''),
                        2 => array('冻结',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'订单状态');
                }
            break;

            //发货处理方式名
            case 'send_method':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('普通',''),
                        1 => array('批量打印',''),
                        2 => array('电子面单',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'发货处理方式名');
                }
            break;

            //发货状态名
            case 'send_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未发货',''),
                        1 => array('发货中',''),
                        2 => array('已发货',''),
                        3 => array('退货中',''),
                        4 => array('已退货',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'发货状态名');
                }
            break;

            //付款状态名
            case 'pay_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('未到款',''),
                        1 => array('部分到款',''),
                        2 => array('全部到款',''),
                        3 => array('退款中',''),
                        4 => array('已退款',''),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'付款状态名');
                }
            break;

            //物流状态名
            case 'ship_status':
                if (!$this->exists($key)){
                    $result = array(
                        0 => array('在途中','#f90'),
                        1 => array('已收件','#f90'),
                        2 => array('异常','#f00'),
                        3 => array('已签收','#090'),
                        4 => array('已退签','#6cc'),
                        5 => array('派件中','#09f'),
                        6 => array('退回中','#f6c'),
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'物流状态名');
                }
            break;

            //工单状态名
            case 'workorder_status':
                if (!$this->exists($key)){
                    $result = array(
                        -1 => array('未分配','#fc3'),//黄
                        0  => array('未处理','#f66'),//红
                        1  => array('处理中','#39f'),//蓝
                        2  => array('已完成','#093'),//绿
                    );
                    $this->set($key,$result);
                    $this->set_name($key,'工单状态名');
                }
            break;


            /****************************************************
             *
             *  其他类型数据
             * 
             ***************************************************/

            //系统配置
            case 'system_config':
                if (!$this->exists($key)){
                    $result = $this->get_where('system_config','id=1')->result_array();
                    $this->set($key,$result);
                    $this->set_name($key,'系统配置');
                }
            break;
            
            /*
            //当前用户的角色组树
            case 'role_tree':
                if (!$this->exists($key)){
                    $this->set($key,get_child_roles());
                    $this->set_name($key,'当前用户的角色组树');
                }
            break;
            
            //当前用户的角色组ID
            case 'role_tree_ids':
                if (!$this->exists($key)){
                    $role_tree = $this->get('role_tree');
                    $this->set($key,array_column($role_tree,'id'));
                    $this->set_name($key,'当前用户的角色组ID');
                }
            break;
            
            //当前用户的角色组树(包含自身的角色组)
            case 'role_tree_and_self':
                if (!$this->exists($key)){
                    $this->set($key,get_child_roles(1));
                    $this->set_name($key,'当前用户的角色组树(包含自身的角色组)');
                }
            break;
            
            //当前用户的角色组ID(包含自身的角色组)
            case 'role_tree_and_self_ids':
                if (!$this->exists($key)){
                    $role_tree = $this->get('role_tree_and_self');
                    $this->set($key,array_column($role_tree,'id'));
                    $this->set_name($key,'当前用户的角色组ID(包含自身的角色组)');
                }
            break;
            */

        }
    }
    
    /**
     * 获取微信tagid
     * add by lyh 2017-01-20
     */
    public function get_wx_tagid($tagname){
        
        $key = 'tagname_'.$tagname;
        $tagid = $this->redis->get($key);
        
        if(empty($tagid)){
            $result = $this->db->select('id')->get_where('wx_fans_tag',array('name' => $tagname))->row_array();
            if(empty($result)){
                $this->db->insert('wx_fans_tag',array('name' => $tagname));
                $tagid = $this->db->insert_id();
            }else{
                $tagid = $result['id'];
            }
            $this->redis->set($key,$tagid);
        }
        return $tagid;
    }
    
    /**
     * 获取微信粉丝用户信息
     * 
     * $wx_id   客服微信号
     * $fans_id 粉丝微信id
     * $fd      db粉丝表对应字段
     * 
     * add by lyh 2017-01-20
     */
    public function get_wx_fansinfo($wx_id,$fans_id,$fd,$from_db=true){
    
        $key = 'wxfans_info_'.$wx_id.'_'.$fans_id;
        $value = $this->redis->hGet($key,$fd);

        if(false === $value){
            $value = null;
            if($from_db){
                $result = $this->db->select($fd)->get_where('wx_fans',array('wx' => $wx_id,'fans_wx'=>$fans_id))->row_array();
                if($result){
                    $value = $result[$fd];
                    $this->redis->hSet($key,$fd,$value);
                }
            }
        }
        return $value;
    }
    
    /**
     * 获取微信粉丝用户信息
     *
     * $wx_id   客服微信号
     * $fans_id 粉丝微信id
     * $fd      db粉丝表对应字段
     * $value   db粉丝表对应字段值
     *
     * add by lyh 2017-01-20
     */
    public function set_wx_fansinfo($wx_id,$fans_id,$fd,$value){
        
        $key = 'wxfans_info_'.$wx_id.'_'.$fans_id;
        $this->redis->hSet($key,$fd,$value);
        
    }
    
}