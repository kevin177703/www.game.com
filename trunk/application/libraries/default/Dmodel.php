<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 公共数据调用类
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 * 
 */
class Dmodel {
	private $ci;               
	
	function __construct(){
		$this->ci = ci();
		$this->model = model("bmodel");	
	}
	function init($init){
	}
}