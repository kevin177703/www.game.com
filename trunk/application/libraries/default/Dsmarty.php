<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include_once ROOT_APP_THIRD_PARTY."smarty/Smarty.class.php";
class Dsmarty extends Smarty {
	function __construct() {
		parent::__construct ();
		$this->left_delimiter = '{{';
		$this->right_delimiter = "}}";
		$this->caching = false;
	}
	//设置对应的网站编码
	function set_web_no($web_no){
		$this->template_dir = ROOT_PUBLIC.$web_no."/";
		$this->compile_dir = ROOT_TMP.$web_no.'/smarty/templates_c';
		$this->cache_dir = ROOT_TMP.$web_no.'/smarty/cache';
		if(!file_exists($this->compile_dir))make_dir($this->compile_dir);
		if(!file_exists($this->cache_dir))make_dir($this->cache_dir);
	}
	// assign($key,$value=null)
	// display($html)
}