<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 公共数据调用类
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
/**
 * @property Bmodel_model $bmodel
 * @property Mbrand $brand
 * @property Mmember $member
 * @property Madmin $admin
 * @property Mpubmod $pubmod
 */
class Dmodel {
	private $ci;   
	
	//**********************基础数据库操作类*************/
	public $bmodel = null;
	
	//**********************数据库操作类****************/
	public $brand = null;							//品牌相关类
	public $member = null;							//会员相关类
	public $admin = null;							//后台管理员相关类
	public $pubmod = null;							//前后台公共
	
	function __construct(){
		$this->ci = ci();
		$this->bmodel = model("bmodel");
		$this->brand = library("mbrand","model");
		$this->member = library("mmember","model");
		$this->admin = library("madmin","model");
		$this->pubmod = library("mpubmod","model");
	}
	function set_class($log,$memcache){
		$this->bmodel->set_class($log, $memcache);
		$this->brand->set_bmodel($this->bmodel);
		$this->member->set_bmodel($this->bmodel);
		$this->admin->set_bmodel($this->bmodel);
		$this->pubmod->set_bmodel($this->bmodel);
	}
}