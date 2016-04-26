<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 公共处理方法  
 * @version 1.0.0
 * @author kevin email:kevin177703@gmail.com
 */
if(!function_exists('ci')){
	/**
	 * 获取ci对象
	 */
	function ci(){
		$CI =& get_instance();
		return $CI;
	}
}
if(!function_exists('post')){
	/**
	 * 获取post数据
	 * @param $name 参数
	 * @param $type 强制类型
	 */
	function post($name,$type=null){
		$data = ci()->input->post($name,true);
		$data = trim($data);
		if($type=='int')$data = intval($data);
		return $data;
	}
}
if(!function_exists('get')){
	/**
	 * 获取get数据
	 * @param $name 参数
	 * @param $type 强制类型
	 */
	function get($name,$type=null){
		$data = ci()->input->get($name,true);
		$data = trim($data);
		if($type=='int')$data = intval($data);
		return $data;
	}
}
if(!function_exists('get_data')){
	/**
	 * 获取post或get数据
	 * @param $name 参数
	 * @param $type 强制类型
	 */
	function get_data($name,$type=null){
		if(isset($_POST[$name]))return post($name,$type);
		if(isset($_GET[$name]))return get($name,$type);
		return null;
	}
}
if(!function_exists('library')){
	/**
	 * 加载library
	 * @param $library library文件名
	 * @param $file library目录
	 */
	function library($library,$file='default',$data=array()) {
		$ci = ci();
		$library = strtolower($library);
		$path = ucfirst($library);
		if(!empty($file)){
			$path = strtolower($file)."/".$path;
		}
		$ci->load->library($path,$library);
		return $ci->$library;
	}
}
if(!function_exists('model')){
	/**
	 * 加载model
	 * @param $model model文件名
	 */
	function model($model){
		$ci = ci();
		$model = strtolower($model)."_model";
		$ci->load->model($model);
		return $ci->$model;
	}
}
if(!function_exists('ip')){
	/**
	 * 获取ip
	 */
	function ip(){
		if (isset($HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"])){
			$ip = $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
		}elseif (isset($HTTP_SERVER_VARS["HTTP_CLIENT_IP"])){
			$ip = $HTTP_SERVER_VARS["HTTP_CLIENT_IP"];
		}elseif (isset($HTTP_SERVER_VARS["REMOTE_ADDR"])){
			$ip = $HTTP_SERVER_VARS["REMOTE_ADDR"];
		}elseif (getenv("HTTP_X_FORWARDED_FOR")){
			$ip = getenv("HTTP_X_FORWARDED_FOR");
		}elseif (getenv("HTTP_CLIENT_IP")){
			$ip = getenv("HTTP_CLIENT_IP");
		}elseif (getenv("REMOTE_ADDR")){
			$ip = getenv("REMOTE_ADDR");
		}elseif(isset($_SERVER['REMOTE_ADDR'])){
			$ip = $_SERVER['REMOTE_ADDR'];
		}else{
			$ip = "";
		}
		preg_match("/[\d\.]{7,15}/", $ip, $cips);
		$ip = isset($cips[0]) ? $cips[0] : 'unknown';
		unset($cips);
		return $ip;
	}
}
if(!function_exists('ex')){
	/**
	 * 分割字符串为数组
	 * @param  $data 需要分割的字符串
	 * @param  $l    分割符
	 */
	function ex($data,$l=','){
		if(empty($data))return array();
		$data = explode($l, $data);
		return $data;
	}
}
if(!function_exists('array2sort')){
	/**
	 * 按指定字段排序
	 * @param $data 要排序的数组
	 * @param $sort 要排序的字段
	 * @param $desc 是否倒序
	 */
	function array2sort($data,$sort,$desc=true){
		$info = array();
		$_key = "array2sort_desc_key";
		foreach ($data as $k=>$v){
			$v[$_key]=$k;
			$info[]=$v;
		}
		$num=count($info);
		if(!$desc){
			for($i=0;$i<$num;$i++){
				for($j=0;$j<$num-1;$j++){
					if($info[$j][$sort] > $info[$j+1][$sort]){
						foreach ($info[$j] as $key=>$temp){
							$t=$info[$j+1][$key];
							$info[$j+1][$key]=$info[$j][$key];
							$info[$j][$key]=$t;
						}
					}
				}
			}
		}
		else{
			for($i=0;$i<$num;$i++){
				for($j=0;$j<$num-1;$j++){
					if($info[$j][$sort] < $info[$j+1][$sort]){
						foreach ($info[$j] as $key=>$temp){
							$t=$info[$j+1][$key];
							$info[$j+1][$key]=$info[$j][$key];
							$info[$j][$key]=$t;
						}
					}
				}
			}
		}
		$data = array();
		foreach ($info as $v){
			$data[$v[$_key]]=$v;
			unset($data[$v[$_key]][$_key]);
		}
		return $data;
	}
}
if(!function_exists('merge')){
	/**
	 * 合并两个数组
	 * @param  $one
	 * @param  $two
	 */
	function merge($one,$two){
		if(empty($one) || count($one)<1)return $two;
		if(empty($two) || count($two)<1)return $one;
		$info = array();
		$i = 0;
		foreach ($one as $v){
			$info[$i]=$v;
			$i++;
		}
		foreach ($two as $v){
			$info[$i]=$v;
			$i++;
		}
		return $info;
	}
}
if(!function_exists('json_error')){
	/**
	 * 失败
	 * @param $data 参数
	 * @param $msg 提示
	 */
	function json_error($msg="error",$data=array()){
		$data=array("result"=>false,"msg"=>$msg,"data"=>$data);
		echo json_encode($data);
		exit();
	}
}
if(!function_exists('json_ok')){
	/**
	 * 成功
	 * @param $data 参数
	 * @param $msg 提示
	 */
	function json_ok($data=array(),$msg="success"){
		$data=array("result"=>true,"msg"=>$msg,"data"=>$data);
		echo json_encode($data);
		exit();
	}
}
if(!function_exists('skip')){
	/**
	 * 跳转
	 * @param $url
	 * @param $param
	 */
	function skip($url="/",$message=""){
		$message = empty($message)?"":"alert('{$message}');";
		$url = url($url);
		$skip = '页面跳转中...若没跳转，请<a href="'.$url.'">点击这里</a><script>window.location= "'.$url.'";'.$message.'</script>';
		echo $skip;
		exit();
	}
}
if(!function_exists('url')){
	/**
	 * 生成url
	 * @param $url
	 * @param $param
	 */
	function url($url,$param=null){
		if(is_array($param)){
			$str = "";
			foreach ($param as $k=>$v){
				$str .= "&{$k}={$v}";
			}
			$param = ltrim($str,'&');
		}
		$param = empty($param)?"":"?".$param;
		$url = ($url=="/" || empty($url))?"/":$url.".html";
		$url = $url.$param;
		return $url;
	}
}
if(!function_exists('ex_string')){
	/**
	 * 截取字符串为数组
	 * @param $string  字符串  
	 * @param $delimiter  截取的符号
	 */
	function ex_string($string,$delimiter){
		$str = explode($delimiter, $string);
		$len = count($str);
		if(empty($str[$len-1]) && $len-1>0){
			unset($str[$len-1]);
		}
		return $str;
	}
}
if(!function_exists('get_rand')){
	/**
	 * 创建随机字符
	 * @param  $len 长度
	 * @param  $title 首字符
	 * @param  $istoupper 是否大写
	 */
	function get_rand($len,$title='',$istoupper=false){
		$rand = get_rand_chr(18).microtime().get_rand_num(18);
		$rand = get_rand_chr(32,1).md5($rand).get_rand_num(32);
		$rand = str_shuffle($rand);
		$max = strlen($rand)-$len;
		$min = $max-rand(1, $max);
		$rand = $title.substr($rand,$min,$len);
		if($istoupper)$rand=strtoupper($rand);
		return $rand;
	}
}
if(!function_exists('get_rand_num')){
	/**
	 * 创建随机数字串
	 * @param $len 长度
	 */
	function get_rand_num($len){
		$a = mt_rand(100000000,999999999);
		$b = mt_rand(100000000,999999999);
		$c = mt_rand(100000000,999999999);
		$d = mt_rand(100000000,999999999);
		$e = mt_rand(100000000,999999999);
		$f = mt_rand(1,9);
		$rand = $a.$b.$c.$d.$e;
		$rand = str_shuffle($rand);
		$max = strlen($rand)-$len;
		$min = $max-rand(1, $max);
		$rand = $f.substr($rand,$min,$len-1);
		return $rand;
	}
}
if(!function_exists('get_rand_chr')){
	/**
	 * 创建随机字符串
	 * @param  $len 长度
	 * @param  $min 0大小写混合，1全小写，2全大写
	 */
	function get_rand_chr($len,$min=0){
		$rand = array_merge(range('a','z'),range('A','Z'));
		shuffle($rand);
		$rand = implode('',array_slice($rand,0,$len));
		if($min==1)$rand=strtolower($rand); //全部小写
		if($min==2)$rand=strtoupper($rand); //全部大写
		return $rand;
	}
}
if(!function_exists('set_user_pass')){
	/**
	 * 设置用户的密码
	 * @param $username  用户名
	 * @param $password  密码
	 */
	function set_user_pass($username,$password){
		$password = strtolower($username).'|'.strtolower($password);
		$password = md5($password);
		$password = strtolower($password);
		return $password;
	}
}
if(!function_exists('safe_sql')){
	/**
	 * 安全检查sql语句
	 * @param $data  要检查的数据
	 */
	function safe_sql($data,$need="[被屏蔽的字符]"){
		if(is_array($data)){
			$info = array();
			foreach ($data as $k=>$v){
				$k = safe_sql($k);
				$info[$k]=safe_sql($v);
			}
			return $info;
		}
		$sql = array("select","delete","insert","update","union","into","load_file","outfile");
		foreach ($sql as $v){
			$v = "{$v}";
			$data = str_replace($v,$need,$data);
		}
		return $data;
	}
}
if(!function_exists('color')){
	/**
	 * 设置字体颜色
	 * @param $data 需要设置的文字
	 * @param $color 颜色css
	 */
	function color($data,$color='red'){
		$html = "<span class='{$color}'> {$data} </span>";
		return $html;
	}
}
if(!function_exists('time_red')){
	/**
	 * 判断指定时间是否是当天时间，当天时间，颜色变为红色
	 * @param $time
	 */
	function time_red($time){
		$_date = date('Y-m-d');
		$date = date("y-m-d H:i:s",$time);
		if($time>strtotime($_date)){
			$date = color($date);
		}
		return $date;
	}
}
if(!function_exists('make_dir')){
	/**
	 * 创建目录
	 * @param $path 写入地址
	 * @param $is_file 是否有文件
	 */
	function make_dir($path,$is_file=false){
		$path = str_replace('\\','/',$path);
		$info = explode('/', $path);
		$_path = '';
		$len = count($info);
		for($i=0;$i<$len;$i++){
			$_path .= $info[$i];
			if($i==$len-1 && $is_file)continue;
			$_path .= '/';
			if(file_exists($_path))continue;
			@chmod($_path, 0777);
			@mkdir($_path);
			//每层添加index.html,防止目录读取
			if(!file_exists($_path.'index.html')){
				$content = '<!DOCTYPE html><html><head><title>403 Forbidden</title><meta charset="UTF-8">'
						.'</head><body><h1>Directory access is forbidden.</h1></body></html>';
						write($_path.'index.html',$content,'w+');
			}
		}
	}
}
if(!function_exists('write')){
	/**
	 * 文件写入
	 * @param $path  文件路径
	 * @param $data  文件内容
	 * @param $mode  写入方式
	 */
	function write($path,$data,$mode="a+"){
		make_dir($path,true);
		if ( ! $fp = @fopen($path, $mode)){
			return FALSE;
		}
		@flock($fp, LOCK_EX);
		@fwrite($fp, $data);
		@flock($fp, LOCK_UN);
		@fclose($fp);
		return TRUE;
	}
}
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
		$key = "^D0Fs)83&^bd9*vd42wet?.17yua(23*df5er";
		$ip = $is_ip?ip():"";
		$md5 = md5($value.$ip.$key.ROOT_HOST);
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
	 * @param $exception 不需要删除的cookie
	 */
	function del_all_cookie($exception=array()){
		if(!is_array($_COOKIE) || count($_COOKIE)<1)return false;
		$time = time()-100;
		foreach ($_COOKIE as $k=>$v){
			if(in_array($k, $exception))continue;
			setcookie($k,null,$time,'/');
		}
	}
}
if(!function_exists('check_ip')){
	/**
	 * 检查ip
	 * @param $ips ip段
	 * @param $ip 要检查的ip 
	 * @param $empty 若ip段为空时返回bool
	 */
	function check_ip($ips,$ip=null,$empty=true){
		if(empty($ip))$ip=ip();
		$ips = trim($ips);
		if(empty($ips))return $empty;
		$ips = explode("\r\n",$ips);
		$data= null;
		foreach($ips as $v){
			$v = trim($v);
			if(!empty($v))$data[]=$v;
		}
		$ipregexp = implode('|', str_replace( array('*','.'), array('\d+','\.') ,$data));
		return preg_match("/^(".$ipregexp.")$/", $ip);
	}
}
if(!function_exists('get_admin_password')){
	/**
	 * 设置后台登录密码加密方式
	 * @param $username
	 * @param $password
	 */
	function get_admin_password($username,$password){
		return md5("[{$username}|{$password}]");
	}
}
if(!function_exists('get_web_password')){
	/**
	 * 设置网站登录密码加密方式
	 * @param $username
	 * @param $password
	 */
	function get_web_password($username,$password){
		return md5("[{$username}|kevin|{$password}]");
	}
}