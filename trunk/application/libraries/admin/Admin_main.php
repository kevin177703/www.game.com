<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 后台默认操作
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 * 
 * @property Dinit $init
 * @property Admin $admin
 */
class Admin_main{
	private $init;                           //默认类
	private $admin;                          //后台base
	function __construct($init){
		$this->init = $init;
		$this->admin = library("admin","admin");
		$this->admin->load($init);
	}
	//后台首页
	function index(){
	}
	//后台登录页
	function login(){
		if($this->admin->uid>0)skip();
		$this->init->display("main/login");
	}
	//后台登陆页ajax
	function ajax_login(){
		if($this->admin->uid>0)json_ok("您已经登录，请不要重复登录");
		$username = post("username");
		$password = post("password");
		if(empty($username))json_error("账号不能为空");
		if(empty($password))json_error("密码不能为空");
		$username = strtolower($username);
		$password = strtolower($password);
		$operate_no = get_rand(18);
		$this->init->model->log->login($username,$operate_no,$this->init->brand_id,"登录失败",'Y');
		/**
		$user_total = $this->init->model->log->login_num(array("username"=>$username));
		if($user_total>=5)json_error("账号登录次数超过5次，请24小时后再登录");
		*/
		$user = $this->init->model->admin->get_user_for_username($username);
		if(!isset($user['id'])){
			$this->init->model->log->login($username,$operate_no,$this->init->brand_id,"账号不存在",'Y');
			json_error("登录账号不存在,请重试");
		}
		if($user['password']!=get_admin_password($username, $password)){
			$this->init->model->log->login($username,$operate_no,$this->init->brand_id,"密码错误",'Y');
			json_error("登录密码错误，请重试");
		}
		//登陆成功后查询用户所在组
		$group = $this->init->model->admin->get_group_for_id($user['group_id']);
		if(!isset($group['id'])){
			$this->init->model->log->login($username,$operate_no,$this->init->brand_id,"用户组错误",'Y');
			json_error("登录失败,请联系管理员001");
		}
		$session = array("user"=>$user,"group"=>$group);
		if($this->init->model->session->add_session($session, $this->admin->token,"Y")==false){
			$this->init->model->log->login($username,$operate_no,$this->init->brand_id,"session错误",'Y');
			json_error("登录失败,请联系管理员002");
		}
		//登录成功后记录登录信息
		$this->init->model->log->login($username,$operate_no,$this->init->brand_id,'登录成功','Y','Y');
		json_ok("登录成功");
	}
}