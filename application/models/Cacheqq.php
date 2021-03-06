<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Cacheqq extends CI_Model {

    public function __construct(){
        global $pass;
        $this->file_name=CACHE_PATH.'/'.md5(md5($pass)).'.txt';
    }

    public function get($key) {
        global $_CACHE;
        return $_CACHE[$key];
    }

    public function read() {
        if(CACHE_FILE==1) return str_replace('<?php exit;//','',file_get_contents($this->file_name));
        // global $DB;
        $row=$this->db->query("SELECT v FROM shua_config WHERE k='cache' limit 1");
        $row=$row->row_array();
        return $row['v'];
    }

    public function save($value) {
        if (is_array($value)) $value = serialize($value);
        if(CACHE_FILE==1) return file_put_contents($this->file_name,'<?php exit;//'.$value);
        // global $DB;
        $value = addslashes($value);
        return $this->db->query("update shua_config set v='$value' where k='cache'");
    }

    public function pre_fetch(){
        global $_CACHE;
        $_CACHE=array();
        $cache = $this->read();
        // $_CACHE = array_merge(@unserialize($cache),$_COOKIE);
        if(empty($_CACHE['version']) )
            $_CACHE = $this->update();//|| $_GET['clearcache']
        return $_CACHE;
    }

    public function update() {
        // global $DB;
        $cache = array();
        $configs = $this->db->query('SELECT * FROM shua_config where 1')->result_array();
        foreach ($configs as $key => $value) {
            if($value['k']=='cache') 
                continue;
            $cache[ $value['k'] ] = $value['v'];
        }

        $this->save($cache);
        return $cache;
    }

    public function clear() {
        // global $DB;
        return $this->db->query("update shua_config set v='' where k='cache'");
    }
}
