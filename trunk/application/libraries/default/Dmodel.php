<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 公共数据调用类
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $bmodel
 * @property Mbrand $brand
 */
class Dmodel {
	private $ci;   
	
	public $bmodel = null;
	
	//**********************数据库操作类****************/
	public $brand = null;							//品牌相关类
	
	function __construct(){
		$this->ci = ci();
		$this->bmodel = model("bmodel");
		$this->brand = library("mbrand","model");
	}
	function set_class($log,$memcache){
		$this->bmodel->set_class($log, $memcache);
		$this->brand->set_bmodel($this->bmodel);
	}
}