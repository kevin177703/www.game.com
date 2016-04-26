<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 后台管理员相关
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $model
 */
class Madmin{
	private $ci;   
	private $model;
	function __construct(){
		$this->ci = ci();
	}
	function set_bmodel($model){
		$this->model = $model;
	}
	/**
	 * 根据条件获取用户信息
	 * @param $username 登录账号
	 */
	function get_user_for_username($username){
		return $this->model->get($this->model->table_admin,array("username"=>$username));
	}
	/**
	 * 根据id获取用户组
	 * @param $id 组id
	 */
	function get_group_for_id($id){
		return $this->model->get($this->model->table_admin_group,array("id"=>$id));
	}
}