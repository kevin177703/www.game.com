<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 品牌相关
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $model
 */
class Mbrand{
	private $ci;   
	private $model;
	function __construct(){
		$this->ci = ci();
	}
	function set_bmodel($model){
		$this->model = $model;
	}
	/**
	 * 根据域名获取网站信息
	 * @param string $host 网站域名
	 */
	function get_brand_for_host($host){
		//此方法未例外，必须另外获取mode和memcache对象
		if(empty($this->model))$this->model = model("bmodel");
		if(empty($this->model->memcache))$this->model->memcache = library("dmemcache");
		$sql = "SELECT b.id,b.`name`,bh.`host`,bh.app,bh.agent_id FROM  "
			  ."{$this->model->table($this->model->table_brand)} b LEFT JOIN  "
			  ."{$this->model->table($this->model->table_brand_host)} bh ON b.id=bh.brand_id "
			  ."where b.del='N' and bh.del='N' and bh.host='{$host}'";
		$data = $this->model->one($sql);
		return $data;
	}
}