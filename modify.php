<?php
$mysql_path = "/opt/freesvr/sql";
$db1_host = '127.0.0.1';
$db1_user = 'freesvr';
$db1_pwd = 'freesvr';
$db1_dbname = 'freesvr_d';//新的

$db2_host = '127.0.0.1';
$db2_user = 'freesvr';
$db2_pwd = 'freesvr';
$db2_dbname = 'audit_sec';


$link = mysql_connect($db1_host, $db1_user, $db1_pwd) or die(mysql_error());
//1.先删除之前的数据库
mysql_query("drop database if exists ".$db1_dbname);
mysql_query("create database ".$db1_dbname." DEFAULT CHARACTER SET utf8");
//2.判断有没有两个需要对比的sql文件
mysql_select_db($db1_dbname, $link) or die(mysql_error());
if(!file_exists(dirname(__FILE__)."/sec.sql")){
	echo 'no sec.sql';
	exit;
}
if(!file_exists(dirname(__FILE__)."/set.sql")){
	echo 'no set.sql';
	exit;
}
//3.导入数据库
exec($mysql_path."/bin/mysql -h$db1_host -u$db1_user -p$db1_user ".$db1_dbname." < ".dirname(__FILE__)."/sec.sql");
exec($mysql_path."/bin/mysql -h$db1_host -u$db1_user -p$db1_user ".$db1_dbname." < ".dirname(__FILE__)."/set.sql");
//4.查询数据库的所有表
$result = mysql_query("SHOW TABLES FROM ".$db1_dbname) or die(mysql_error());

if (!$result) {
	print "DB Error, could not list tables\n";
	print 'MySQL Error: ' . mysql_error();
	exit;
}

$i=0;
while ($row = mysql_fetch_row($result)) {
	$db1_tablesname[$row[0]] = $i;//lsblj_access_policy=>0
	$db1_tables[$i]['name'] = $row[0];//获取所有表名称
	$column_res = mysql_query("SHOW COLUMNS FROM ".$row[0]);
	unset($column);
	while($column_row = mysql_fetch_array($column_res,MYSQL_ASSOC)){
		$column[$column_row['Field']] = $column_row;//把字段信息赋值给field--$column[id->()]
	}
	$db1_tables[$i]['field'] = $column;//把表结构赋值给field

	$keys_res = mysql_query("SHOW keys FROM ".$row[0]);
	unset($keys);
	while($keys_row = mysql_fetch_array($keys_res,MYSQL_ASSOC)){
		$keys[$keys_row['Key_name']][] = $keys_row['Column_name'];
	}
	$db1_tables[$i]['key'] = $keys;//获取索引信息

	$i++;
}

//SETTING ��Ϣ
$result3 = mysql_query("SELECT * FROM setting");
while($setting[] = mysql_fetch_array($result3));

$result4 = mysql_query("SHOW CREATE PROCEDURE upgroups");
$row = mysql_fetch_array($result4);
$procedure['upgroups'] = $row['Create Procedure'];

$result4 = mysql_query("SHOW CREATE PROCEDURE updpgroups");
$row = mysql_fetch_array($result4);
$procedure['updpgroups'] = $row['Create Procedure'];

$result4 = mysql_query("SHOW CREATE PROCEDURE upmgroups");
$row = mysql_fetch_array($result4);
$procedure['upmgroups'] = $row['Create Procedure'];


$link2 = mysql_connect($db2_host, $db2_user, $db2_pwd) or die(mysql_error());
mysql_select_db($db2_dbname, $link2) or die(mysql_error());
$result2 = mysql_query("SHOW TABLES FROM ".$db2_dbname, $link2) or die(mysql_error());

if (!$result2) {
	print "DB Error, could not list tables\n";
	print 'MySQL Error: ' . mysql_error();
	exit;
}

$changepwd=0;
$result_udf = mysql_query("select * from setting where sname='PASSWORD_ENCRYPT_TYPE'");
if(mysql_num_rows($result_udf)){
	$result_udf = mysql_fetch_array($result_udf);
	if(empty($result_udf['svalue'])){
		$changepwd = 1;
	}
}else{
	$changepwd = 1;
}




$i=0;
while ($row = mysql_fetch_row($result2)) {
	$db2_tablesname[$row[0]] = $i;
	$db2_tables[$i]['name'] = $row[0];
	$column_res = mysql_query("SHOW COLUMNS FROM ".$row[0], $link2);
	unset($column);
	while($column_row = mysql_fetch_row($column_res,MYSQL_ASSOC)){
		$column[$column_row['Field']] = $column_row;
	}
	$db2_tables[$i]['field'] = $column;

	$keys_res = mysql_query("SHOW keys FROM ".$row[0]);
	unset($keys);
	while($keys_row = mysql_fetch_array($keys_res,MYSQL_ASSOC)){
		$keys[$keys_row['Key_name']][] = $keys_row['Column_name'];
	}
	$db2_tables[$i]['key'] = $keys;
	$i++;
}
$result3 = mysql_query("SELECT * FROM setting");
while($setting2[] = mysql_fetch_array($result3));

//echo '<pre>';print_r($db1_tables);echo '</pre>';
function compare_two_table($table1, $table2){
	$alert_sql = "";
	//print_r($table1);print_r($table2);
	$table2keyfieldname="";
	$table2primarykeyexists = 0;
	if($table1['key'])
	foreach($table1['key'] AS $key => $v){
		if($key=='PRIMARY'){
			$table1keyfieldname = $v[0];//id
			break;
		}
	}
	if($table2['key'])
	foreach($table2['key'] AS $key => $v){
		if($key=='PRIMARY'){
			$table2keyfieldname = $v[0];
			$table2primarykeyexists = 1;
			break;
		}
	}
	if($table2['name']=='disk_check'){
		//echo '<pre>';print_r($table1);print_r($table2);echo '</pre>';
		//var_dump($table1keyfieldname);
		//var_dump($table2keyfieldname);
	}
	if($table2primarykeyexists&&$table1keyfieldname!=$table2keyfieldname){
		$alter_sql .= 'ALTER TABLE '.$table1['name'].' '." modify `".$table2keyfieldname."` ".$table2['field'][$table2keyfieldname]['Type'].';';
		$alter_sql .= 'ALTER TABLE '.$table1['name'].' '.' DROP PRIMARY KEY;';
	}	

	foreach($table1['field'] AS $key => $field){
		//旧表字段为空时,把新表字段增加进去
		if(empty($table2['field'][$field['Field']])){
			$alter_sql .= 'ALTER TABLE '.$table1['name'].' '." ADD COLUMN `".$field['Field']."` ".$field['Type']." ".($field['Null']=='NO' ? 'NOT NULL' : 'NULL')." ".(($field['Default']=='') ? '' : 'DEFAULT \''.$field['Default']."' ").$field["Extra"]." ".(strtolower($field["Extra"])=='auto_increment' ? ' PRIMARY KEY ' : '').";";
		}else if($field['Type']!=$table2['field'][$field['Field']]['Type'] || $field['Null']!=$table2['field'][$field['Field']]['Null'] || $field['Default']!=$table2['field'][$field['Field']]['Default'] || $field['Extra']!=$table2['field'][$field['Field']]['Extra']){
			$alter_sql .= 'ALTER TABLE '.$table1['name'].' '." Modify COLUMN `".$field['Field']."` ".$field['Type']." ".($field['Null']=='NO' ? 'NOT NULL' : 'NULL')." ".(($field['Default']=='') ? '' : 'DEFAULT \''.$field['Default']."' ").$field["Extra"].";";
		}
	}
	//return substr($alter_sql,0,strlen($alter_sql)-1);
	return $alter_sql;
}


$link = mysql_connect($db1_host, $db1_user, $db1_pwd);
mysql_select_db($db1_dbname, $link);
$sql = "";
for($i=0; $i<count($db1_tablesname); $i++){
	if(array_key_exists($db1_tables[$i]['name'], $db2_tablesname)){
		$modstr = compare_two_table($db1_tables[$i], $db2_tables[$db2_tablesname[$db1_tables[$i]['name']]]);
		if(!empty($modstr)){
			$diff[$db1_tables[$i]['name']] .= $modstr;
			if($db1_tables[$i]['key'])
			foreach($db1_tables[$i]['key'] AS $key => $v){
				$found_db2table_key = 0;//用来判断是不是新建索引
				for($j=0; $j<count($db2_tables); $j++){
					if($db1_tables[$i]['name']==$db2_tables[$j]['name'] && $db2_tables[$j]['key']){
						foreach($db2_tables[$j]['key'] AS $key2 => $v2){
							if($key==$key2){
								if($v==$v2){
									$found_db2table_key=1;
									break;
								}
								if($key=='PRIMARY'){
									//$diff[$db1_tables[$i]['name']] .= 'ALTER TABLE '.$db1_tables[$i]['name'].' '.' DROP PRIMARY KEY;';									
								}else{
									$diff[$db1_tables[$i]['name']] .= 'ALTER TABLE '.$db1_tables[$i]['name'].' '.' DROP key '.$key.';';
								}
								break;
							}
						}
					}
				}
				if(!$found_db2table_key){
					if($key=='PRIMARY'){
						//$diff[$db1_tables[$i]['name']] .= 'ALTER TABLE '.$db1_tables[$i]['name'].' '.' ADD PRIMARY KEY ('.implode(',', $v).');';
					}else{
						$diff[$db1_tables[$i]['name']] .= 'ALTER TABLE '.$db1_tables[$i]['name'].' '.' ADD INDEX '.$key.'('.implode(',', $v).');';
					}
				}
			}			
			$sql .= $diff[$db1_tables[$i]['name']];			
		}
	}else{
		//显示建表语句
		$rs = mysql_query("SHOW CREATE TABLE ".$db1_tables[$i]['name'], $link);
		$f = mysql_fetch_array($rs, MYSQL_ASSOC);
		$diff[$db1_tables[$i]['name']] = str_replace("\n","",$f['Create Table']);
		$sql .= $diff[$db1_tables[$i]['name']].';';
	}
}
$settingstr = "INSERT INTO setting(sname, svalue) values";
$settingstrlen = strlen($settingstr);
for($i=0; $i<count($setting); $i++){
	$found = 0;
	for($j=0; $j<count($setting2); $j++){
		if($setting2[$j]['sname']==$setting[$i]['sname']){
			$found = 1;
			break;
		}
	}
	if(!$found){
		$settingstr .= "('".$setting[$i]['sname']."','".$setting[$i]['svalue']."'),";
	}
}
if(strlen($settingstr)==$settingstrlen){
	$settingstr = '';
}

$link2 = mysql_connect($db2_host, $db2_user, $db2_pwd);
mysql_select_db($db2_dbname, $link2);

if($diff)
foreach($diff AS $key => $value){
	echo str_replace(';', ";\n", $value);
	//mysql_query($value) or die(mysql_error());
}
else{
	
}
echo "\n".$settingstr."\n";

unlink('change.sql');
/*
$sql = "alter table disk_check drop primary key;".$sql;
$sql = "alter table password_rules drop primary key;".$sql;
$sql = "alter table replay_progress drop primary key;".$sql;
$sql = "alter table vncserver drop primary key;".$sql;
*/
if(changepwd){
	$sql .= ("alter table member modify password blob;");
	$sql .= ("alter table servers modify superpassword blob;");
	$sql .= ("alter table devices modify cur_password blob,modify old_password blob;");
	$sql .= ("alter table appdevices modify cur_password blob,modify old_password blob;");
	$sql .= ("alter table random modify inputpassword blob;");

	//member表
	$sql .= ("update member set password=aes_encrypt(udf_decrypt(password),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");

	//servers表
	$sql .= ("update servers set superpassword=aes_encrypt(udf_decrypt(superpassword),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");

	//devices表
	$sql .= ("update devices set cur_password=aes_encrypt(udf_decrypt(cur_password),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");
	$sql .= ("update devices set old_password=aes_encrypt(udf_decrypt(old_password),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");

	//appdevices表
	$sql .= ("update appdevices set cur_password=aes_encrypt(udf_decrypt(cur_password),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");
	$sql .= ("update appdevices set old_password=aes_encrypt(udf_decrypt(old_password),(select udf_decrypt(svalue) from setting where sname='PasswordKey'));");
	$sql .= ("update setting set svalue=1 where sname='PASSWORD_ENCRYPT_TYPE';");
	
}

$sql = str_replace('<br>', "\n", $sql);
$sql = str_replace(';', ";\n", $sql);
$sql .= substr($settingstr,0,strlen($settingstr)-1).';';
$sql .= "\nDROP procedure if exists upgroups;\n";
$sql .= "\nDROP procedure if exists updpgroups;\n";
$sql .= "\nDROP procedure if exists upmgroups;\n";
$sql .= "\nDELIMITER ;;\n";
$sql .= $procedure['upgroups'].";;\n";
$sql .= $procedure['updpgroups'].";;\n";
$sql .= $procedure['upmgroups'].";;\n";
$sql .= "\nDELIMITER ;";
file_put_contents("change.sql", $sql);
echo 'analysis complete'."\n";
echo 'upgrading....'."\n";
exec($mysql_path."/bin/mysql -h$db2_host -u$db2_user -p$db2_user ".$db2_dbname." < change.sql");
echo 'Congratulation!upgrade complete!'."\n";
//echo '<pre>';print_r($diff);echo '</pre>';
?>
