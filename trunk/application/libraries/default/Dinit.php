<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 默认处理方法  
 * @version 1.0.0
 * @author kevin177703@gmail.com 
 */
/**
 * @property Dmodel $model
 * @property Dcurl $curl
 * @property Dmemcache $memcache
 * @property Dlog $log
 * @property Dsmarty $smarty
 */
class Dinit{
	//*******************CI*************************
	private $ci = null;        
	//*******************自定义类**********************
	public $model = null;					//数据库模型类
	public $smarty = null;             		//smarty类
	public $curl = null;                    //数据链接类
	public $log = null;                     //文件日志类
	public $memcache = null;                //缓存类
	//**********************************************
	//构造函数
	function __construct(){
		$this->ci = ci();
		$this->smarty = library("dsmarty");
		$this->model = library("dmodel");
		$this->curl = library("curl");
		$this->log = library("log");
		$this->memcache = library("memcache");
	}
	//引入smarty模版，带参数
	function display($html, $data = array()) {
		$this->smarty->assign($data);
		$this->smarty->display($this->version.'/html/'.$html.'.html');
	}
	//引入smarty模版参数
	function assign($data){
		$this->smarty->assign($data);
	}
	//直接返回smarty模版数据,带参数
	function fetch($html, $data = array()) {
		$this->smarty->assign($data);
		return $this->smarty->fetch($this->version.'/html/'.$html.'.html');
	}
}