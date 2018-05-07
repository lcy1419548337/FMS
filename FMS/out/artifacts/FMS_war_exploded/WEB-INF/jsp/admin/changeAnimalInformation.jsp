<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
        <script type="text/javascript">
        	function choose(obj){
        	document.getElementById("hide1").style.display = "none";
        	document.getElementById("hide2").style.display = "none";
        		var choosed = document.getElementById(obj);
  				if(choosed.style.display != "block"){choosed.style.display = "block";}
  				else{choosed.style.display = "none";}
        	}
        	
        	
        	
        	
        	
        </script>  


<!-- 	<script type="text/javascript">
	$(function(){
		//发送ajax 查询所有分类
		$.post("${pageContext.request.contextPath}/category",{"method":"findall"},function(obj){
			//alert(obj);
			//遍历json列表,获取每一个分类,包装成li标签,插入到ul内部
			//方法1
			$.each($(obj),function(){
			$("#c_ul").append("<li><a href='${pageContext.request.contextPath}/product?method=findByPage&pageNumber=1&cid="+this.cid+"'>"+this.cname+"</a></li>");
			});
			//方法2
		},"json");
	})
</script> -->


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
					document.getElementById("check").value = "yes";
					document.getElementById("an").style.display = "none";
					document.getElementById("ac").style.display = "none";
					document.getElementById("ar").style.display = "none";
					document.getElementById("ab").style.display = "none";
					if(xhr.response == "动物不存在"){
					document.getElementById("check").value = "no";
					document.getElementById("an").style.display = "block";
					document.getElementById("ac").style.display = "block";
					document.getElementById("ar").style.display = "block";
					document.getElementById("ab").style.display = "block";
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
		</script>
		
  </head>
  
<body>
   
<!-- <!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> --> -->
<!-- <input type="button" value="为已存在的动物添加信息" class="btn btn-default" onclick="choose('hide1')">
<input type="button" value="动物不存在" class="btn btn-default" onclick="choose('hide2')"> -->
<form action="${pageContext.request.contextPath }/animal_findAnimal">
	<input>
</form>
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/animal_checkHaveOrNot">

	<div class="form-group" style="display:none;" id="hide1">
    		<label class="col-sm-2 control-label" for="animalId2">动物编号：</label><span id="span"></span>
    	<div class="col-sm-10">
    		<input type="text" id="animalId2" name="animalId2" class="form-control" maxlength="20"">
    	</div>
   		<div>
    		<input type="submit" value="查询" class="btn btn-default">
    	</div>
  	</div>
</form>
<div style="text-align: center; width: 800px;margin: auto;display: none;" id="hide2">
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/animal_addAnimalInformation">
	<div class="form-group">
	
    		<label class="col-sm-2 control-label" for="animalId">动物编号：</label>
    		
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalId" id="animalId" placeholder="请输入动物编号" onblur="checkAnimalId()" />
    		<span id="span1" ></span>
    	</div>
  
  	</div>
  	
  	  	<div class="form-group" id="an">
   			<label class="col-sm-2 control-label" for="animalName">动物名称：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalName" id="animalName" placeholder="动物名称" value="${result.animalName }"  />
		</div> 
	</div>
	
	<div class="form-group" id="ac">
    		<label class="col-sm-2 control-label" for="animalCategory">动物分类：</label>
   		<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalCategory" id="animalCategory" placeholder="动物分类"/>
    	</div>
	</div>
	<div class="form-group" id="ar">
    		<label class="col-sm-2 control-label" for="animalRegistDate">注册日期：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime" class="form-control" name="registDate">	
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>

	<div class="form-group" id="ab">
    		<label class="col-sm-2 control-label" for="animalBatch">动物批次：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalBatch" id="animalBatch" placeholder="动物批次"/>
    	</div>
    </div>
  	
  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="currentYield">近期产量：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="currentYield" id="currentYield" placeholder="近期产量" />
		</div> 
	</div>
	<div class="form-group">
   			<label class="col-sm-2 control-label" for="currentWeight">当前体重：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="currentWeight" id="currentWeight" placeholder="当前体重" />
		</div> 
	</div>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="health">动物健康状况：</label>
   		<div class="col-sm-10">
    		<input class="form-control" type="text" name="health" id="health" placeholder="动物健康状况"/>
    	</div>
	</div>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="recorderTime">记录时间：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime2" class="form-control" name="recorderTime">	
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>
    <!-- 
		private Integer number;
	private Animal animal;
	private Integer age;
	private Timestamp registerDate;
	private Integer batch;
	private Integer health;
	private Float currentYield;
	private Float currentWeight;
	private Timestamp recorderTime;    
     -->
    <div>
    	<input type="hidden" name="animalHadOrNot" id="check">
    	<input type="submit" value="确认添加" class="btn btn-default">
    </div>
</form>



</div>
</body>
</html>
