<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * session相关
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $model
 */
class Msession{
	private $ci;   
	private $model;
	function __construct(){
		$this->ci = ci();
	}
	function set_bmodel($model){
		$this->model = $model;
	}
	/**
	 * 获取session
	 * @param $token 令牌
	 * @param $is_admin 是否是后台
	 */
	function get_session($token,$is_admin="N"){
		$no = $this->model->memcache->getNo($this->model->memcache->mem_no_session);
		$token_no = $this->model->memcache->getNo($this->model->memcache->mem_no_session."_{$token}");
		$key = $this->model->memcache->mem_session."_get_session_{$token}_{$is_admin}_{$no}_{$token_no}";
		$info = $this->model->memcache->get($key);
		if(empty($info)){
			$info = null;
			$data = $this->model->get($this->model->table_session,array("token"=>$token,"is_admin"=>$is_admin));
			if(isset($data['session'])){
				$info = json_decode($data['session'],true);
				$this->model->memcache->set($key, $info);
			}
		}
		return $info;
	}
	/**
	 * 根据uid删除session
	 * @param $uid
	 */
	function del_session_for_uid($uid,$is_admin='N'){
		$this->model->memcache->setNo($this->model->memcache->mem_no_session);
		return $this->_del_session(array("uid"=>$uid,"is_admin"=>$is_admin));
	}
	/**
	 * 根据时间删除session
	 * @param $time 默认0，删除48小时之前的session
	 */
	function del_session_for_time($time=0){
		if($time<1)$time = time()-48*3600;
		$this->_del_session(array("updatetime <"=>$time));
	}
	/**
	 * 根据令牌删除session
	 * @param $token
	 */
	function del_session_for_token($token,$is_admin='N'){
		$this->model->memcache->setNo($this->model->memcache->mem_no_session."_{$token}");
		return $this->_del_session(array("token"=>$token,"is_admin"=>$is_admin));
	}
	/**
	 * 根据条件删除session
	 * @param $where
	 */
	private function _del_session($where){
		return $this->model->tdel($this->model->table_session, $where);
	}
}