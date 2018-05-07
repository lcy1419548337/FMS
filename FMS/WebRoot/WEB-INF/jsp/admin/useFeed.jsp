<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'addAnimal.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 引入bootstrap -->
	
	<link href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
	
	<link href="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" rel="stylesheet">
	
	<%-- <script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> --%>
	
<%-- 	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript">
		//日期插件
		$(".form_datetime").datetimepicker();
		</script> --%>
       		<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/core.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript"> 
		/* function aaa(){
			alert("the aaa");
		} */
		$(document).ready(function(){
		 /* $(".aaa").click(function(){
		 	alert("aaa");
		 }); */
		 
		 
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
		});
        </script>  
<script type="text/javascript">
	function checkAnimalId(){
		 //alert("准备开始异步校验");
	//获得文本框value
	var animalId = document.getElementById("animalId").value;
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span1").innerHTML = xhr.response;		
					if(xhr.response == "动物不存在"){
					document.getElementById("check").value = "no";
					}
					alert(document.getElementById("check").value);
				}
			}
		}
	//3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/animal_findById?time="+new Date().getTime()+"&animalId="+animalId,true);
	//4.发送
	xhr.send(null);
	}
	function checkFeedId(){
	//alert("准备开始异步校验");
	//获得文本框value
	var feedId = document.getElementById("feedId").value;
	//alert(feedId);
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span2").innerHTML = xhr.response;		
				}
			}
		}
	//3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/feed_findById?time="+new Date().getTime()+"&feedId="+feedId,true);
	//4.发送
	xhr.send(null);
	}

	function test(){
		alert("test");
	}
	
		function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
		function submitForm(){
		var ai = document.getElementById("animalId");
		var fi = document.getElementById("feedId");
		var as = document.getElementById("span1");
		var fs = document.getElementById("span2");
		if(ai.value == null || as.innerHTML == "动物不存在"){
		alert("动物不存在");
		}
		else if(fi.value == null || fs.innerHTML == "饲料不存在"){
		alert("饲料不存在");
		}
		else{
		document.getElementById("form1").submit();
		}
		}
		</script>
<%-- 		<script type="text/javascript">
		window.onload=function(){ 

	var id = document.getElementById(animalId);
		//id.value = ${pageBean.list.animal.animalName};
		alert(${pageBean.list.animal.animalId});
}
		</script> --%>
		
  </head>
  
<body>
   
<!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> -->
<div style="text-align: center; width: 800px;margin: auto;">
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/feed_useFeed">
	<div class="form-group">
		1111${sessionScope.formula}
    		<label class="col-sm-2 control-label" for="animalId">动物编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalId" id="animalId" placeholder="请输入动物编号" onblur="checkAnimalId()"/>
    		<span id="span1"></span>
    	</div>
  
  	</div>
<%--  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedId" id="feedId" placeholder="饲料编号" onblur="checkFeedId()"/>
    		<span id="span2"></span>
		</div> 
	</div>--%>
	<div class="form-group" id="fc">
		<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
		<div class="col-sm-10" style="width: 200px;" >
			<input class="form-control" type="text" name="feedId" id="feedId" placeholder="饲料编号" readonly="readonly" onblur="checkFeedId()"/>
			<span id="span2"></span>
		</div>
		<div class="btn-group" style="display: block;">
			<button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" style="left: 160px;top: 30px;overflow: scroll;height: 200px;">
				<li>
					<p id="null" onclick="choose(this.id)">无</p>
				</li>
				<s:iterator var="f" value="#session.formula">
					<li>
						<p id="${f.feedId }" onclick="choose(this.id)">${f.feedId}:${f.formulaName }</p>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
        function choose(feedId){
            //alert("categoryName")
            if(feedId == "null"){
                document.getElementById("feedId").value="无";
            }
            var changeValue = document.getElementById("feedId");
            //var changeValue2 = document.getElementById("feedCategory2");
            //alert(changeValue.value);
            changeValue.value = feedId;
            //changeValue2.value = categoryName;
            alert(changeValue.value);
        }
	</script>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedAmount">投放数量：</label>
   		<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedAmount" id="feedAmount" placeholder="投放数量"/>
    	</div>
	</div>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedUseTime">投放日期：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime" class="form-control" name=feedUseTime>	
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>
    <div>
    	<input type="button" value="确认添加" class="btn btn-default" onclick="submitForm()">
    </div>
</form>
</div>
</body>
</html>
