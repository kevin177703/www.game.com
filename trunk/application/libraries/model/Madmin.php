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
	 * @param $where 查询条件
	 */
	function get_user($where){
		return $this->model->get($this->model->table_admin, $where);
	}
}