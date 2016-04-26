<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 日志相关
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $model
 */
class Mlog{
	private $ci;   
	private $model;
	function __construct(){
		$this->ci = ci();
	}
	function set_bmodel($model){
		$this->model = $model;
	}
	/**
	 * 添加登录日志
	 * @param $username 账号
	 * @param $operate_no 操作编号
	 * @param $brand_id	品牌编号
	 * @param $explain 登录解释
	 * @param $status 登录状态
	 * @param $is_admin	
	 */
	function login($username,$operate_no,$brand_id,$explain,$is_admin='N',$status="N"){
		$ip = ip();
		$where = array("username"=>$username,"operate_no"=>$operate_no,"brand_id"=>$brand_id);
		$data = array(
				"username"=>$username,
				"operate_no"=>$operate_no,
				"brand_id"=>$brand_id,
				"explain"=>$explain,
				"status"=>$status,
				"is_admin"=>$is_admin,
				"ip"=>$ip
		);
		$info = $this->model->get($this->model->table_log_login, $where);
		if(isset($info['id'])){
			$this->model->edit($this->model->table_log_login, $data, $where);
		}else{
			$data['addtime']=time();
			$this->model->save($this->model->table_log_login, $data);
		}
	}
	/**
	 * 获取24小时内登录日志数目
	 * @param $where
	 */
	function login_num($where){
		//24小时内
		$where['addtime >'] = time()-24*3600;
		return $this->model->total($this->model->table_log_login,$where);
	}
}