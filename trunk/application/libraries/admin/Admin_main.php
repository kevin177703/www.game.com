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
		$this->init->display("main/login");
	}
	//后台登陆页ajax
	function ajax_login(){
		
	}
}