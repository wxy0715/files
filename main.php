<?php
$serve = '39.97.123.62:3306';
$username = 'lsblj';
$password = 'lsblj';
$dbname = 'lsblj';
$mysqli = new Mysqli($serve,$username,$password,$dbname);
if($mysqli->connect_error){
	die('connect error:'.$mysqli->connect_errno);
}
$mysqli->set_charset('UTF-8'); // 设置数据库字符集

$result = $mysqli->query('show tables');
$data = $result->fetch_all(); // 从结果集中获取所有数据
$result->close();
//创建文件
if(!file_exists('code')){
	mkdir('code');
}

function convertUnderline2 ( $str , $ucfirst = true){
    $str = explode('_' , $str);
    foreach($str as $key=>$val)
        $str[$key] = ucfirst($val);
 
    if(!$ucfirst)
        $str[0] = strtolower($str[0]);
 
    return implode('' , $str);
}

function getFieldJavaType($type){
	if(strpos($type,'varchar')!==false || strpos($type,'char')!==false){
		return 'String';
	}elseif(strpos($type,'int')!==false){
		return 'Integer';
	}else{
		return 'String';
	}
}

function getJdbcType($type){
	if(strpos($type,'int')!==false){
		return 'INTEGER';
	}elseif(strpos($type,'text')!==false){
		return 'CLOB';
	}elseif(strpos($type,'datetime')!==false){ //datetiem转为VARCHAR
		return 'VARCHAR';
	}else{
		return strtoupper($type);
	}
}

function rn($i){
	return str_repeat("\r\n",$i);
}

function tab($i){
	return str_repeat("\t",$i);
}

function generateDomain($tablename, $table){
	if(!file_exists('code/domain')){
		mkdir('code/domain');
	}
	$string = "package com.longersec.blj.domain;".rn(2);//包名
	$string .= "public class ".ucfirst($tablename)." {".rn(2);
	for($i=0; $i<count($table); $i++){ //构造器
		$string .= tab(1)."private ".getFieldJavaType($table[$i][1])." ".$table[$i][0].";".rn(2);
	}
	$string .= rn(2);

	$string .= tab(1)."public ".$tablename."() {".rn(1);
	$string .= tab(2)."super();".rn(1);
	$string .= tab(1)."}".rn(2);

	for($i=0; $i<count($table); $i++){ //get和set
		$string .= tab(1)."public ".getFieldJavaType($table[$i][1])." get".ucfirst($table[$i][0])."() {".rn(1);
	    $string .= tab(2)."return ".$table[$i][0].";".rn(1);
	    $string .= tab(1)."}".rn(2);

	    $string .= tab(1)."public void set".ucfirst($table[$i][0])."(".getFieldJavaType($table[$i][1])." ".$table[$i][0].") {".rn(1);
	    $string .= tab(2)."this.".$table[$i][0]." = ".$table[$i][0].";".rn(1);
	    $string .= tab(1)."}".rn(2);
	}

	$string .= tab(1)."@Override".rn(1); //toString
    $string .= tab(1)."public String toString() {".rn(1);
    $string .= tab(2)."return \"".ucfirst($tablename)."{ \"+".rn(1);
    for($i=0; $i<count($table); $i++){
    	 $string .= tab(3)."\",".$table[$i][0]."=\" + ".$table[$i][0]." +".rn(1);
    }
     $string .= tab(3)."\"\";".rn(1);
     $string .= tab(1)."}".rn(1);
  
	
	$string .= "}".rn(1);
	file_put_contents('code/domain/'.ucfirst($tablename).".java", $string);
}

function generateService($tablename, $table){
	if(!file_exists('code/service')){
		mkdir('code/service');
	}

	$string = "package com.longersec.blj.service;".rn(2);//包名
	$string .= "import java.util.List;".rn(1);
	$string .= "import com.longersec.blj.domain.".ucfirst($tablename).";".rn(2);//包名
	$string .= "public interface ".ucfirst($tablename)."Service {".rn(2);
	$string .= tab(1)."int add".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).");".rn(2);
	$string .= tab(1)."int edit".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).");".rn(2);
	$string .= tab(1)."int del".ucfirst($tablename)."(List<Integer> ids);".rn(2);
	$string .= tab(1)."List<Object> findAll(".ucfirst($tablename)." ".lcfirst($tablename).", int page_start, int page_length);".rn(2);
	$string .= tab(1).ucfirst($tablename)." getById(Integer id);".rn(2);
	$string .= "}".rn(2);

	file_put_contents('code/service/'.ucfirst($tablename)."Service.java", $string);
}

function generateServiceImpl($tablename, $table){
	if(!file_exists('code/service/impl')){
		mkdir('code/service/impl');
	}
	$string = "package com.longersec.blj.service.impl;".rn(2);//包名
	$string .= "import java.util.List;".rn(1);
	$string .= "import org.springframework.beans.factory.annotation.Autowired;".rn(1);
	$string .= "import org.springframework.stereotype.Service;".rn(1);
	$string .= "import org.springframework.transaction.annotation.Transactional;".rn(1);
	$string .= "import com.longersec.blj.dao.".ucfirst($tablename)."Dao;".rn(1);//包名
	$string .= "import com.longersec.blj.domain.".ucfirst($tablename).";".rn(1);//包名
	$string .= "import com.longersec.blj.service.".ucfirst($tablename)."Service;".rn(3);//包名
	$string .= tab(0)."@Service".rn(1);
	$string .= tab(0)."@Transactional".rn(1);
	$string .= tab(0)."public class ".ucfirst($tablename)."ServiceImpl implements ".ucfirst($tablename)."Service{".rn(2);
	$string .= tab(1)."@Autowired".rn(1);
	$string .= tab(1)."private ".ucfirst($tablename)."Dao ".$tablename."Dao;".rn(2);
	$string .= tab(1)."@Override".rn(1);
	$string .= tab(1)."public int edit".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).") {".rn(1);
	$string .= tab(2)."// TODO Auto-generated method stub".rn(1);
	$string .= tab(2)."return this.".$tablename."Dao.edit".ucfirst($tablename)."(".lcfirst($tablename).");".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@Override".rn(1);
	$string .= tab(1)."public int add".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).") {".rn(1);
	$string .= tab(2)."// TODO Auto-generated method stub".rn(1);
	$string .= tab(2)."return this.".$tablename."Dao.add".ucfirst($tablename)."(".lcfirst($tablename).");".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@Override".rn(1);
	$string .= tab(1)."public int del".ucfirst($tablename)."(List<Integer> ids) {".rn(1);
	$string .= tab(2)."// TODO Auto-generated method stub".rn(1);
	$string .= tab(2)."return this.".$tablename."Dao.del".ucfirst($tablename)."(ids);".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@Override".rn(1);
	$string .= tab(1)."public List<Object> findAll(".ucfirst($tablename)." ".lcfirst($tablename).", int page_start, int page_length) {".rn(1);
	$string .= tab(2)."return ".$tablename."Dao.findAll(".lcfirst($tablename).", page_start, page_length);".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@Override".rn(1);
	$string .= tab(1)."public ".ucfirst($tablename)." getById(Integer id) {".rn(1);
	$string .= tab(2)."return ".$tablename."Dao.getById(id);".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= "}".rn(1);
	file_put_contents('code/service/impl/'.ucfirst($tablename)."ServiceImpl.java", $string);
}

function generateDao($tablename, $table){
	if(!file_exists('code/dao')){
		mkdir('code/dao');
	}
	$string = "package com.longersec.blj.dao;".rn(2);
	$string .= "import java.util.List;".rn(1);
	$string .= "import org.apache.ibatis.annotations.Param;".rn(1);
	$string .= "import com.longersec.blj.domain.".ucfirst($tablename).";".rn(2);
	$string .= tab(0)."public interface ".ucfirst($tablename)."Dao {".rn(2);
	$string .= tab(1)."int edit".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).");".rn(2);
	$string .= tab(1)."int add".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).");".rn(2);
	$string .= tab(1)."int del".ucfirst($tablename)."(List<Integer> ids);".rn(2);
	$string .= tab(1)."List<Object> findAll(@Param(\"".lcfirst($tablename)."\")".ucfirst($tablename)." ".lcfirst($tablename).", @Param(\"page_start\")int page_start, @Param(\"page_length\")int page_length);".rn(2);
	$string .= tab(1).ucfirst($tablename)." getById(Integer id);".rn(2);
	$string .= "}".rn(1);
	file_put_contents('code/dao/'.ucfirst($tablename)."Dao.java", $string);
}

function generateMapper($tablename, $table){
	if(!file_exists('code/dao')){
		mkdir('code/dao');
	}
	$string = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>".rn(1);
	$string .= "<!DOCTYPE mapper PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"".rn(1);
	$string .= tab(2)."\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">".rn(1);
	$string .= "<mapper namespace=\"com.longersec.blj.dao.".ucfirst(convertUnderline2($tablename))."Dao\">".rn(1);//dao路径
	$string .= tab(1)."<resultMap id=\"BaseResultMap\" type=\"com.longersec.blj.domain.".ucfirst(convertUnderline2($tablename))."\">".rn(1);//domian路径
	for($i=0; $i<count($table); $i++){
		if($table[$i][3]=='PRI'){
			$string .= tab(2)."<id column=\"".$table[$i][0]."\" jdbcType=\"".getJdbcType(substr($table[$i][1],0,strpos($table[$i][1],'(')===false?strlen($table[$i][1]):strpos($table[$i][1],'(')))."\" property=\"".$table[$i][0]."\"/>".rn(1);
		}else{
			$string .= tab(2)."<result column=\"".$table[$i][0]."\" jdbcType=\"".getJdbcType(substr($table[$i][1],0,strpos($table[$i][1],'(')===false?strlen($table[$i][1]):strpos($table[$i][1],'(')))."\" property=\"".$table[$i][0]."\"/>".rn(1);
		}
	}
	$string .= tab(1)."</resultMap>".rn(2);
	$string .= tab(1)."<resultMap id=\"".lcfirst(convertUnderline2($tablename))."RecordCounts\" type=\"java.lang.Long\">".rn(1);
	$string .= tab(2)."<result column=\"recordCounts\" jdbcType=\"BIGINT\"/>".rn(1);
	$string .= tab(1)."</resultMap>".rn(2);
	$string .= tab(1)."<insert id=\"add".ucfirst(convertUnderline2($tablename))."\" parameterType=\"com.longersec.blj.domain.".ucfirst(convertUnderline2($tablename))."\">".rn(1);//domian路径
	$string .= tab(2)."INSERT INTO lsblj_".$tablename.rn(1);//表名
	$string .= tab(2)."<set>".rn(1);
	for($i=1; $i<count($table); $i++){
		$string .= tab(2)."<if test=\"".$table[$i][0]." != null\">`".$table[$i][0]."`=#{".$table[$i][0]."},</if>".rn(1);
	}
	$string .= tab(2)."</set>".rn(1);
	$string .= tab(1)."</insert>".rn(2);
	$string .= tab(1)."<update id=\"edit".ucfirst(convertUnderline2($tablename))."\" parameterType=\"com.longersec.blj.domain.".ucfirst(convertUnderline2($tablename))."\">".rn(1);//domian路径
	$string .= tab(2)."UPDATE lsblj_".$tablename.rn(1);//表名
	$string .= tab(2)."<set>".rn(1);
	for($i=1; $i<count($table); $i++){
		$string .= tab(2)."<if test=\"".$table[$i][0]." != null\">`".$table[$i][0]."`=#{".$table[$i][0]."},</if>".rn(1);
	}
	$string .= tab(2)."</set>".rn(1);
	$string .= tab(2)."where id=#{id}".rn(1);
	$string .= tab(1)."</update>".rn(2);
	$string .= tab(1)."<delete id=\"del".ucfirst(convertUnderline2($tablename))."\" parameterType=\"java.util.List\">".rn(1);
	$string .= tab(2)."DELETE FROM lsblj_".$tablename."".rn(1); //表名
	$string .= tab(2)."where id IN (".rn(1);
	$string .= tab(2)."<foreach collection=\"list\" item=\"item\" separator=\",\">".rn(1);
	$string .= tab(2)."#{item},".rn(1);
	$string .= tab(2)."</foreach>".rn(1);
	$string .= tab(2)."0)".rn(1);
	$string .= tab(1)."</delete>".rn(1);
	    
	$string .= tab(1)."<select id=\"findAll\" resultType=\"java.lang.Object\" resultMap=\"BaseResultMap, ".lcfirst(convertUnderline2($tablename))."RecordCounts\">".rn(1);
	$string .= tab(2)."SELECT ".rn(1);
	$string .= tab(2)."SQL_CALC_FOUND_ROWS ".rn(1);
	$string .= tab(2)."* FROM lsblj_".$tablename." ".rn(1);//表名
	$string .= tab(2)."<if test=\"page_start != null and page_length != null\">".rn(1);
	$string .= tab(2)."LIMIT #{page_start},#{page_length}".rn(1);
	$string .= tab(2)."</if>".rn(1);
	$string .= tab(2).";SELECT found_rows() AS recordCounts;".rn(1);
	$string .= tab(1)."</select>".rn(1);

	$string .= tab(1)."<select id=\"getById\" resultMap=\"BaseResultMap\">".rn(1);
	$string .= tab(2)."SELECT * FROM lsblj_".$tablename." where id=#{id}".rn(1);//表名
	$string .= tab(1)."</select>".rn(1);
	$string .= "</mapper>".rn(1);
	file_put_contents("code/dao/".ucfirst(convertUnderline2($tablename))."Mapper.xml", $string);
}

function generateController($tablename, $table){
	if(!file_exists('code/web')){
		mkdir('code/web');
	}
	$string = "package com.longersec.blj.web;".rn(2);//包名
	$string .= tab(0)."import java.util.ArrayList;".rn(1);
	$string .= tab(0)."import java.util.Arrays;".rn(1);
	$string .= tab(0)."import java.util.List;".rn(1);
	$string .= tab(0)."import java.util.Map;".rn(1);
	$string .= tab(0)."import javax.servlet.http.HttpServletRequest;".rn(1);
	$string .= tab(0)."import javax.servlet.http.HttpSession;".rn(1);
	$string .= tab(0)."import org.apache.commons.collections.CollectionUtils;".rn(1);
	$string .= tab(0)."import org.springframework.beans.factory.annotation.Autowired;".rn(1);
	$string .= tab(0)."import org.springframework.stereotype.Controller;".rn(1);
	$string .= tab(0)."import org.springframework.web.bind.annotation.RequestBody;".rn(1);
	$string .= tab(0)."import org.springframework.web.bind.annotation.RequestParam;".rn(1);
	$string .= tab(0)."import org.springframework.web.bind.annotation.RequestMapping;".rn(1);
	$string .= tab(0)."import org.springframework.web.bind.annotation.RequestMethod;".rn(1);
	$string .= tab(0)."import org.springframework.web.bind.annotation.ResponseBody;".rn(1);
	$string .= tab(0)."import org.springframework.web.servlet.ModelAndView;".rn(1);
	$string .= tab(0)."import com.longersec.blj.domain.".ucfirst($tablename).";".rn(1);//包名
	$string .= tab(0)."import com.longersec.blj.service.".ucfirst($tablename)."Service;".rn(1);//包名
	$string .= tab(0)."import net.sf.json.JSONArray;".rn(1);
	$string .= tab(0)."import net.sf.json.JSONObject;".rn(3);
	$string .= tab(0)."/**".rn(1);
	$string .= tab(0)." * ".rn(1);
	$string .= tab(0)." */".rn(1);
	$string .= tab(0)."@Controller".rn(1);
	$string .= tab(0)."@RequestMapping(value = \"/".lcfirst($tablename)."\")".rn(1);
	$string .= tab(0)."public class ".ucfirst($tablename)."Controller {".rn(2);
	$string .= tab(1)."@Autowired".rn(1);
	$string .= tab(1)."private ".ucfirst($tablename)."Service ".lcfirst($tablename)."Service;".rn(2);
	$string .= tab(1)."@RequestMapping(\"/list".ucfirst($tablename)."\")".rn(1);
	$string .= tab(1)."@ResponseBody".rn(1);
	$string .= tab(1)."public JSONObject list".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).",HttpServletRequest request, HttpSession session) {".rn(1);
	$string .= tab(2)."int page_start = Integer.parseInt(request.getParameter(\"start\"));".rn(1);
	$string .= tab(2)."int page_length = Integer.parseInt(request.getParameter(\"length\"));".rn(1);
	$string .= tab(2)."ArrayList<Object> result".$tablename."s = new ArrayList<Object>();".rn(1);
	$string .= tab(2)."ArrayList<".ucfirst($tablename)."> ".lcfirst($tablename)."s = new ArrayList<>();".rn(1);
	$string .= tab(2)."long total = 0;".rn(1);
	$string .= tab(2)."ArrayList<Object> result".$tablename."s = (ArrayList<Object>)".lcfirst($tablename)."Service.findAll(".lcfirst($tablename).", page_start, page_length);".rn(1);
	$string .= tab(2)."if(CollectionUtils.isNotEmpty(result".$tablename."s)) {".rn(1);
	$string .= tab(3)."".lcfirst($tablename)."s = (ArrayList<".ucfirst($tablename).">)result".$tablename."s.get(0);".rn(1);
	$string .= tab(3)."total = ((ArrayList<Long>) result".$tablename."s.get(1)).get(0);".rn(1);
	$string .= tab(2)."}".rn(1);
	$string .= tab(2)."JSONArray jsonArray = JSONArray.fromObject(".lcfirst($tablename)."s);".rn(1);
	$string .= tab(2)."JSONObject result = new JSONObject();".rn(1);
	$string .= tab(2)."result.put(\"recordsTotal\", total);".rn(1);
	$string .= tab(2)."result.put(\"recordsFiltered\", total);".rn(1);
	$string .= tab(2)."result.put(\"data\", jsonArray);".rn(1);
	$string .= tab(2)."return result;".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@RequestMapping(\"/add".ucfirst($tablename)."\")".rn(1);
	$string .= tab(1)."@ResponseBody".rn(1);
	$string .= tab(1)."public JSONObject add".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).", HttpServletRequest request, HttpSession session) {".rn(1);
	$string .= tab(2)."JSONObject result = new JSONObject();".rn(1);
	$string .= tab(3)."int r = ".lcfirst($tablename)."Service.add".ucfirst($tablename)."(".lcfirst($tablename).");".rn(1);
	$string .= tab(3)."result.put(\"success\", r == 1);".rn(1);
	$string .= tab(2)."return result;".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@RequestMapping(\"/edit".ucfirst($tablename)."\")".rn(1);
	$string .= tab(1)."@ResponseBody".rn(1);
	$string .= tab(1)."public JSONObject edit".ucfirst($tablename)."(".ucfirst($tablename)." ".lcfirst($tablename).", HttpServletRequest request, HttpSession session) {".rn(1);
	$string .= tab(2)."JSONObject result = new JSONObject();".rn(1);
	$string .= tab(3)."int r = ".lcfirst($tablename)."Service.edit".ucfirst($tablename)."(".lcfirst($tablename).");".rn(1);
	$string .= tab(3)."result.put(\"success\", r == 1);".rn(1);
	$string .= tab(2)."return result;".rn(1);
	$string .= tab(1)."}".rn(2);
	$string .= tab(1)."@RequestMapping(\"/del".ucfirst($tablename)."\")".rn(1);
	$string .= tab(1)."@ResponseBody".rn(1);
	$string .= tab(1)."public JSONObject del".ucfirst($tablename)."(@RequestParam(value = \"ids[]\") Integer[] ids, HttpServletRequest request, HttpSession session) {".rn(1);
	$string .= tab(2)."JSONObject result = new JSONObject();".rn(1);
	$string .= tab(2)."List<Integer> _ids =  Arrays.asList(ids);".rn(1);
	$string .= tab(2)."result.put(\"success\", true);".rn(1);
	$string .= tab(2)."if(_ids.isEmpty()) {".rn(1);
	$string .= tab(3)."result.put(\"success\", false);".rn(1);
	$string .= tab(3)."result.put(\"msg\", \"id不能为空\");".rn(1);
	$string .= tab(2)."}".rn(1);
	$string .= tab(3)."int r = ".lcfirst($tablename)."Service.del".ucfirst($tablename)."(_ids);".rn(1);
	$string .= tab(3)."result.put(\"success\", r == 1);".rn(1);
	$string .= tab(2)."return result;".rn(1);
	$string .= tab(1)."}".rn(1);
	$string .= tab(0)."}".rn(1);

	file_put_contents('code/web/'.ucfirst($tablename)."Controller.java", $string);
}

for($i=0; $i<count($data); $i++){
	echo 'SHOW COLUMNS FROM '.$data[$i][0]."<br>";
	$result = $mysqli->query('SHOW COLUMNS FROM '.$data[$i][0]) or die($mysqli->error);
	$table = $result->fetch_all(); // 从结果集中获取所有数据
	$result->close();
	generateDomain(convertUnderline2(substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	generateService(convertUnderline2(substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	generateServiceImpl(convertUnderline2(substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	generateDao(convertUnderline2(substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	generateMapper((substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	generateController(convertUnderline2(substr($data[$i][0],strpos($data[$i][0],'_')+1)), $table);
	echo '<pre>';print_r($table);echo '</pre>';
}
//ucfirst 首字符转为大写

?>
