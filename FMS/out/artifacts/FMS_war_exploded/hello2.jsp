<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'hello2.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
.choose tr {
	margin: 5px;
}
.choose td {
	margin: 5px;
	text-align: center;
}
a {
	color: black;
	font-size: 20px;
}
.left{
	width: 700px;
	float: left;
}
.right{
	width: 700px;
	height:200px;
	float: right;
	margin-top: 50px;
	margin-left:50px;
	border: 5px solid black;
}
.left th {
	font-size: 20px;
	width: 150px;
	height: 50px;
	padding: 10px;
	border:2px solid black;
}
.left tr {
	width: 150px;
	height: 50px;
	padding: 10px;
	border:2px solid black;
}
.left td {
	width: 150px;
	height: 50px;
	padding: 10px;
	text-align: center;
	border:2px solid black;
}
</style>


<script type="text/javascript">
	function change(){
	var obj = document.getElementById("ch");
	//alert(obj.style.display);
/* 	if(obj.style.display.value == null | obj.style.display.value==''){
	obj.style.display = 'block';
	alert(obj.style.display)
	} */
	
	if(obj.style.display != "block"){obj.style.display = "block";}
  				else{obj.style.display = "none";}
  	
	}
	
	function changeP(obj){
	var c = document.getElementById("ch").style.display = "none";
	document.getElementById("la").innerHTML = "牧场编号：" +  obj;
	
	}
	
		function changeMilk(){
	var obj = document.getElementById("milkId");
	//alert(obj.style.display);
/* 	if(obj.style.display.value == null | obj.style.display.value==''){
	obj.style.display = 'block';
	alert(obj.style.display)
	} */
	
	if(obj.style.display != "block"){obj.style.display = "block";}
  				else{obj.style.display = "none";}
  	
	}
	
	function changeP2(obj){
	var c = document.getElementById("milkId").style.display = "none";
	document.getElementById("milk").innerHTML = "牧场编号：" +  obj;
	
	}
	
</script>	
  </head>
  
  <body style="background-color: white;">
  <div style="width: 1500px;margin: auto;background-color: #F5F5F5;">
  
  <div style="background-color: #FFDAB9; margin: auto; text-align: center; width: 100%;font-size: 40px;height: 100px; display: block;">
  	<div>生鲜乳温度控制系统</div>
	<div style="font-size: 25px;margin: 10px;">实时温度监控</div>
  </div>
  <a style="float: right; font-size: 25px;">返回</a>
  <div style="width: 1500px;height: 800px; margin: auto;" align="center">
  <div style="width: 1500px; margin: 10px 10px 10px 550px;height: 200px;">
  <div style="width: 200px;font-size: 25px; float: left;">

   			<button onclick="change()" id="la" style="width: 170px;height: 50px;font-size: 25px;">牧场编号：</button>

   <div style="width: 100px; margin: auto;height:100px;overflow-y scroll;overflow-x: hidden;" >
   <div id="ch" style="display: none; background-color: white;">

   		<div style="color: purple;" class="choose">
   			<table width="100px;" height="60px;color: yellow;">
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(1)">1</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(2)">2</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(3)">3</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(4)">4</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(5)">5</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP(6)">6</a>
   					</td>
   				</tr>
   			</table>
   		</div>
   </div>
</div>
 </div>
 
   <div style="width: 200px;float: left;font-size: 25px;">

   			<button onclick="changeMilk()" id="milk" style="width: 170px;height: 50px;font-size: 25px;">奶罐编号：</button>

   <div style="width: 100px; margin: auto;height:100px;overflow-y scroll;overflow-x: hidden;" >
   <div id="milkId" style="display: none; background-color: white;">

   		<div style="color: purple;" class="choose">
   			<table width="100px;" height="60px;color: yellow;">
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(1)">1</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(2)">2</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(3)">3</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(4)">4</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(5)">5</a>
   					</td>
   				</tr>
   				
   				<tr>
   					<td>
   						<a href="#" onclick="changeP2(6)">6</a>
   					</td>
   				</tr>
   			</table>
   		</div>
   </div>
</div>
 </div>
 </div>
 <div class="left">
 	
 	<div style="width: 500px; margin: auto;font-size: 20px;">
 	<strong>制冷后储奶罐中生鲜乳实时温度监测中心</strong>
 	</div>
 		<table>
			<th>日期</th>
			<th>数据更新时间</th>
			<th>储奶罐编号</th>
			<th>温度信息</th>
			<tr>
				<td>2015.6.7</td>
				<td>2015.6.7</td>
				<td>1</td>
				<td>34</td>
			</tr>
			<tr>
				<td>2015.6.7</td>
				<td>2015.6.7</td>
				<td>1</td>
				<td>34</td>
			</tr>
			<tr>
				<td>2015.6.7</td>
				<td>2015.6.7</td>
				<td>1</td>
				<td>34</td>
			</tr>
			<tr>
				<td>2015.6.7</td>
				<td>2015.6.7</td>
				<td>1</td>
				<td>34</td>
			</tr>
 		</table>
 	</div>
 <div class="right">
 
 </div>
 </div>
 </div>
  </body>
</html>
