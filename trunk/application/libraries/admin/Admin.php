<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 后台base
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 * 
 * @property Dinit $init
 */
class Admin{
	private $init;                           		//默认起始类
	public $token=null;								//令牌
	
	//**********************后台参数*******************/
	public $uid = 0;								//管理员id
	public $username = "";							//管理员账号
	public $group_id ="";							//管理员组id
	public $group_name = "";						//管理员组名称
	public $opener_name = "";						//操作员名称[组别][账号]
	
	function __construct(){
	}
	//装载后台基础数据
	function load($init){
		$this->init = $init;
		$token_name = md5("atoken".ROOT_HOST);
		$this->token = get_cookieI($token_name);
		if(empty($this->token)){
			$this->token = get_rand(32);
			set_cookieI($token_name, $this->token);
		}
		//删除默认过期时间的session
		$this->init->model->session->del_session_for_time();
		$session = $this->init->model->session->get_session($this->token,'Y');
		if(isset($session['uid'])){
			$this->uid = $session['uid'];
			$this->username = $session['username'];
			$this->group_id = $session['group_id'];
			$this->group_name = $session['group_name'];
			$this->opener_name = "[{$this->group_name}]{$this->username}";
		}
	}
}