<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 日志类
 * @author kevin email:kevin177703@gmail.com
 * @version 0.0.1
 */
class Dlog {
	var $web_no;
	function __construct() {
	}
	function set_web_no($web_no){
		$this->web_no = $web_no;
	}
}