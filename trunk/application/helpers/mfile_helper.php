<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 文件处理方法  
 * @version 1.0.0
 * @author kevin177703@gmail.com 
 */
if(!function_exists('set_md5')){
	/**
	 * 设置md5
	 * @param string $value 需要md5的数据
	 * @param string $is_name  是否是name值
	 * @param string $key  md5加密密钥
	 * @param string $is_ip  是否启用ip加密
	 * @return string
	 */
	function set_md5($value,$is_name=false,$is_ip=true){
		$ip = $is_ip?ip():"";
		$md5 = md5($value.$ip.KEY.HOST);
		$md5 = $is_name?substr($md5,11,20):substr($md5,2,23);
		return strtoupper($md5);
	}
}
if(!function_exists('set_cookieI')){
	/**
	 * 设置cookie
	 * @param $name key
	 * @param $value value
	 * @param $expire 时间，默认浏览器时间
	 */
	function set_cookieI($name,$value,$expire=0){
		setcookie($name,$value,$expire,'/');
		$value = set_md5($value.$name);
		$name = set_md5($name,true);
		setcookie($name,$value,$expire,'/');
	}
}
if(!function_exists('get_cookieI')){
	/**
	 * 获取cookie
	 * @param $name key
	 */
	function get_cookieI($name){
		$value = isset($_COOKIE[$name])?$_COOKIE[$name]:null;
		if(empty($value))return $value;
		$_name = set_md5($name,true);
		$_value = isset($_COOKIE[$_name])?$_COOKIE[$_name]:null;
		if($_value==set_md5($value.$name)){
			return $value;
		}
		return null;
	}
}
if(!function_exists('del_cookieI')){
	/**
	 * 删除cookie
	 * @param $name key
	 */
	function del_cookieI($name){
		$_name = set_md5($name,true);
		$time = time()-100;
		setcookie($name,null,$time,'/');
		setcookie($_name,null,$time,'/');
	}
}
if(!function_exists('del_all_cookie')){
	/**
	 * 删除所有的cookie
	 */
	function del_all_cookie(){
		if(!is_array($_COOKIE) || count($_COOKIE)<1)return false;
		$time = time()-100;
		foreach ($_COOKIE as $k=>$v){
			setcookie($k,null,$time,'/');
		}
	}
}