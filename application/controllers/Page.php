<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends CI_Controller {


	public function index($now_page=1)
	{

echo "page";

		//获取分页标记
        $data['pager'] = $this->get_pager(array(
            'record_count'  => 100,
            'page_size'     => 20,
            'now_page'     => 2,
        ));

		$this->load->view('page',$data);
	}
}
