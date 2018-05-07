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
	<link href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
	
	<link href="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/core.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript"> 
		$(document).ready(function(){ 		 
		 $("#form_datetime").datetimepicker({
			format: 'yyyy-mm-dd hh:mm:ss',//显示格式
			todayHighlight: 1,//今天高亮
			 timeText: '时间',
             hourText: '小时',
             minuteText: '分钟',
             secondText: '秒', 
             currentText: '现在',
             closeText: '完成',
             showSecond: true, //显示秒  
			startView:2,
			forceParse: 0,
			showMeridian: 1,
			autoclose: 1//选择后自动关闭
		});
		
		$("#form_datetime2").datetimepicker({
			format: 'yyyy-mm-dd',//显示格式
			todayHighlight: 1,//今天高亮
			minView: "month",//设置只显示到月份
			startView:2,
			forceParse: 0,
			showMeridian: 1,
			autoclose: 1//选择后自动关闭
		});
		});
        </script>


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
	document.getElementById("la").value = obj;
	
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
	document.getElementById("milk").value = obj;
	
	}
	
</script>	
  </head>
  
  <body style="background-color: white;">
  <div style="width: 1500px;margin: auto;background-color: #F5F5F5;">
  
  <div style="background-color: #FFDAB9; margin: auto; text-align: center; width: 100%;font-size: 40px;height: 100px; display: block;">
  	<div>生鲜乳温度控制系统</div>
	<div style="font-size: 25px;margin: 10px;">历史温度监控</div>
  </div>
  <a style="float: right; font-size: 25px;">返回</a>
  <div style="width: 1500px;height: 800px; margin: auto;" align="center">
  <div style="width: 1500px; margin: 10px 10px 10px 550px;height: 200px;">
  <div style="width: 200px;font-size: 25px; float: left;">

   			牧场编号：<input type="text" onclick="change()" id="la" style="width: 170px;height: 35px;font-size: 20px;" class="form-control"></input>

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
 
   <div style="width: 400px;float: left;font-size: 25px;">
	<div class="form-group" style="width: 1000px;">
	<div class="col-sm-10" style="width: 300px;float: left;">
 		选择时间<input size="16" type="text" value="" id="form_datetime2" class="form-control" name="recorderTime" style="width: 170px;font-size: 20px;">	
    	</div>
	</div>
   
 </div>
 </div>
 <div class="left">
 	
 	<div style="width: 500px; margin: auto;font-size: 20px;">
 	<strong>预冷后生鲜乳的历史温度监测中心</strong>
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
