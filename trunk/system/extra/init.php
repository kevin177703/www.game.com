<?php
define('SUFFIX', '.html');//设置后缀
if(!isset($_SERVER['REQUEST_URI']) || !isset($_SERVER['HTTP_HOST'])){
	header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
	echo 'Please open the SERVER';
	exit(3);
}
$root_url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
define('ROOT_URL', $root_url);
$url = parse($root_url);
print_r($url);
$app = isset($url['expath'][1])?$url['expath'][1]:'';
$path = $url['path'];
if(in_array($app, array('admin','cli'))){
	unset($url['expath'][1]);
	$path = "";
	foreach ($url['expath'] as $v){
		$path .='/'.$v;
	}
	$path = substr($path,1);
	if(empty($path)) {
		$path="/";
	}
}else{
	$app='home';
}
define('APP', $app);
//添加参数
$query = isset($url['query'])?"?".trim($url['query']):"";
$_SERVER['REQUEST_URI'] = $path.$query;

//-------------------------------------------------方法区------------------------------
/**
 * 分解url
 * @param $url
 */
function parse($url){
	$info = parse_url($url);
	if(isset($info['path']))$info['path']=strtolower($info['path']);
	$path = isset($info['path'])&&!empty($info['path'])?explode('/', $info['path']):"";
	foreach ($path as $v){
		if($v=='index.php')continue;
		$v = str_replace(SUFFIX,'',$v);
		$info['expath'][] = $v;
	}
	return $info;
}
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
			$content = '<!DOCTYPE html><html><head><title>404 Page Not Found</title><meta charset="UTF-8">'
					.'</head><body><h1>404 Page Not Found</h1></body></html>';
					write($_path.'index.html',$content,'w+');
		}
	}
}
/**
 * 写入文件
 * @param  $path
 * @param  $data
 * @param  $mode
 */
function write_file($path, $data, $mode = FOPEN_WRITE_CREATE_DESTRUCTIVE){
	if ( ! $fp = @fopen($path, $mode)){
		return FALSE;
	}
	flock($fp, LOCK_EX);
	fwrite($fp, $data);
	flock($fp, LOCK_UN);
	fclose($fp);
	return TRUE;
}

/**
 * 文件写入
 * @param $path
 * @param $content
 * @param $mode
 */
function write($path,$content,$mode="a+"){
	make_dir($path,true);
	write_file($path,$content,$mode);
}
//获取ip
function get_ip(){
	if (isset($HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"])){
		$ip = $HTTP_SERVER_VARS["HTTP_X_FORWARDED_FOR"];
	}
	elseif (isset($HTTP_SERVER_VARS["HTTP_CLIENT_IP"])){
		$ip = $HTTP_SERVER_VARS["HTTP_CLIENT_IP"];
	}
	elseif (isset($HTTP_SERVER_VARS["REMOTE_ADDR"])){
		$ip = $HTTP_SERVER_VARS["REMOTE_ADDR"];
	}
	elseif (getenv("HTTP_X_FORWARDED_FOR")){
		$ip = getenv("HTTP_X_FORWARDED_FOR");
	}
	elseif (getenv("HTTP_CLIENT_IP")){
		$ip = getenv("HTTP_CLIENT_IP");
	}
	elseif (getenv("REMOTE_ADDR")){
		$ip = getenv("REMOTE_ADDR");
	}
	else{
		$ip = "";
	}
	preg_match("/[\d\.]{7,15}/", $ip, $cips);
	$ip = isset($cips[0]) ? $cips[0] : 'unknown';
	unset($cips);
	return $ip;
}