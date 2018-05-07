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
		alert("准备添加");
		var fi = document.getElementById("feedId");
		var fs = document.getElementById("span2").innerHTML;
		if(fi.value == null || fs.innerHTML == "饲料不存在"){
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
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/feed_addFeedFormula">

  	<div class="form-group">
		<s:actionmessage></s:actionmessage>
   			<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedId" id="feedId" placeholder="饲料编号" onblur="checkFeedId()"/>
    		<span id="span2"></span>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="formulaName">配方名称：</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" name="formulaName" id="formulaName" placeholder="请输入配方名称"/>
			<span id="span1"></span>
		</div>
	</div>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="formula">配方详情：</label>
   		<div class="col-sm-10">
    		<input class="form-control" type="text" name="formula" id="formula" placeholder="请输入配方详情"/>
			<button onclick="showMaterial()" id="findMaterial" type="button">选择材料</button>
			<button onclick="deleteAll()" type="button">清空</button>
			<div style="background-color: #70cbea;height: 300px;overflow: scroll;overflow-x: hidden;display: none" id="materialForm">
				<input type="hidden" value="hide" id="hideOrShow">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>单价(元/kg)</th>
							<th>操作</th>
						</tr>
					<s:iterator value="material" var="m">
						<tr>
							<td>${m.id}</td>
							<td>${m.name}</td>
							<td>${m.price}</td>
							<td align="center">
                                <button onclick="addMaterial(${m.name},${m.price})" type="button" id="${m.name}" class="choose">选择</button>
                                <button onclick="deleteLastOne(${m.name},${m.price})" type="button">撤销</button>
                                <input type="hidden" id="hidden${m.name}" value="">
                                <input type="hidden" id="hiddenPrice${m.name}" value="">
                            </td>

						</tr>
					</s:iterator>
					</thead>
				</table>

			</div>
			<script type="text/javascript">
				function addMaterial(name,price) {
					//alert(name + ";" + price);
                    var theButton = document.getElementById(name);
                    if (theButton.innerHTML == "选择"){
					var formula = document.getElementById("formula");
					var oldFormula = formula.value;
					//alert(oldFormula);
                    var amount = prompt("请输入数量(kg)：");
					var newFormula = oldFormula + name + ":" + amount + ";";
					var theId = "hidden"+name;
					var theValue =  name + ":" + amount + ";";
					//alert(theId);
					var theHidden = document.getElementById(theId);
					//alert(theHidden);
                        theHidden.value = theValue;
					//alert(theHidden.value);
					formula.value = newFormula;
					//alert(formula.value);
					var allPrice = document.getElementById("allPrice");
					var oldPrice = parseFloat(allPrice.value);
					//alert(oldPrice);
					var addPrice = (parseFloat(price)*amount);
					//alert("addPrice = " + addPrice);
					var newPrice = oldPrice + (parseFloat(price)*amount);
					//alert("newPrice = " + newPrice);
					document.getElementById("hiddenPrice"+name).value = (parseFloat(price)*amount);
					//alert(newPrice);
					allPrice.value = newPrice.toFixed(3);
					theButton.innerHTML = theButton.innerHTML + "√";
                    }else {
                        alert("已选");
                    }
					//alert(allPrice.value);
                }
				function showMaterial() {
				var theForm = document.getElementById("materialForm");
				var hideOrShow = document.getElementById("hideOrShow").value;
				//alert(theForm);
				if (theForm.style.display == "none"){
				    theForm.style.display = "block";
				    //hideOrShow = "none";
				    //alert(hideOrShow);
                    //alert(theForm.style.display);
				} else {
				    theForm.style.display = "none";
                    //alert(theForm.style.display);
                    //hideOrShow = "hide";
				}
                }
                function deleteAll() {
                    var formula = document.getElementById("formula");
                    var allPrice = document.getElementById("allPrice");
                    formula.value = "";
                    allPrice.value = "0";
                    var els = document.getElementsByClassName("choose");
                    var i;
                    for(i = 0;i<els.length;i++){
                        els[i].innerHTML = "选择";
                    }
                }
                function deleteLastOne(name,price) {
				    if (document.getElementById(name).innerHTML == "选择"){
				        alert("没有选择这款材料！");
                    } else {
                    var formula = document.getElementById("formula").value;
                    var theHiddenInput = document.getElementById("hidden"+name);
                    var theName = theHiddenInput.value;
                    var theNameLength = theName.length;
                    //alert(theHiddenInput + ";" + theName + ";" + theNameLength);
                    var start = deleteTheMaterial(0,theNameLength,theName);
                    //alert(start);
                    var newFormula1 = formula.substr(0,start);
                    var newFormula2 = formula.substr(start+theNameLength,formula.length);
                    document.getElementById("formula").value = newFormula1+newFormula2;
                    document.getElementById(name).innerHTML = "选择";
                    var deletePrice = parseFloat(document.getElementById("hiddenPrice"+name).value);
                    var olePrice = parseFloat(document.getElementById("allPrice").value);
                    var newPrice =olePrice - deletePrice;
                    document.getElementById("allPrice").value = newPrice.toFixed(3);
                    //alert(newFormula1 + newFormula2);
                    }
                }
                function deleteTheMaterial(theStart,theLength,f) {
				    var formula = document.getElementById("formula").value;
				    var start = parseInt(theStart);
				    var length = parseInt(theLength);
				    //alert(start + ";" + length + ";" + formula);
				    if ((start+length) <= formula.length) {
                        var part = formula.substr(start, length);
                        //alert(part == f);
                        if (part == f){
                            //alert("start = " + start);
                            return start;
                        }
                        return deleteTheMaterial(start+1,theLength,f);
                    }
                }
			</script>
    	</div>
	</div>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="form_datetime">记录日期：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime" class="form-control" name="makeDate">
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label" for="form_datetime">总价（元）：</label>
		<div class="col-sm-10">
			<input size="16" type="text" value="0" id="allPrice" class="form-control" name="price">
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
