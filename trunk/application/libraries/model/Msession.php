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
				$this->model->memcache->set($key, $info);
			}
		}
		//更新session活动时间,10分钟更新一次
		if(isset($info['lasttime']) && $info['lasttime']<time()-10*60){
			$this->edit_session(array('lasttime'=>time()), $token);
		}
		if(isset($info['session'])){
			$info = json_decode($info['session'],true);
		}
		$this->del_session_for_time();
		return $info;
	}
	/**
	 * 添加session
	 * @param $session 用户信息
	 * @param $token 令牌
	 * @param $is_admin 
	 */
	function add_session($session,$token,$is_admin='N'){
		if(!isset($session['id']))return false;
		$data = array(
				"token"=>$token,
				"session"=>json_encode($session),
				"uid"=>$session['id'],
				"is_admin"=>$is_admin,
				"lasttime"=>time(),
				"addtime"=>time()
		);
		return $this->model->save($this->model->table_session, $data);
	}
	/**
	 * 更新session
	 * @param $data 要更新的值
	 * @param $toten 令牌
	 */
	function edit_session($data,$token){
		$this->model->memcache->setNo($this->model->memcache->mem_no_session."_{$token}");
		return $this->model->edit($this->model->table_session, $data, array("token"=>$token));
	}
	/**
	 * 根据uid删除session
	 * @param $uid
	 * @param $is_admin
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
		$key = $this->model->table_session."_del_session_for_time";
		//每一小时删除一次单位时间内的缓存
		if($this->model->memcache->get($key) < time()-60*60){
			if($time<1)$time = time()-48*3600;
			$this->_del_session(array("lasttime <"=>$time));
		}
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