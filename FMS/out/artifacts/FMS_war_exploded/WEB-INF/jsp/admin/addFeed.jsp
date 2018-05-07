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
			format: 'yyyy-mm-dd',//显示格式
			todayHighlight: 1,//今天高亮
			minView: "month",//设置只显示到月份
			startView:2,
			forceParse: 0,
			showMeridian: 1,
			autoclose: 1//选择后自动关闭
		});
		});
		
		function choose(categoryName){
			//alert("categoryName")
			var changeValue = document.getElementById("theHide");
			//alert(changeValue.value);
			changeValue.value = categoryName;
			//alert(changeValue.value);
		}
        </script>  

		
		
  </head>
  
<body>
   
<!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> -->
<div style="text-align: center; width: 800px;margin: auto;">
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/feed_addFeed?changeOrSave=save">
<input type="hidden" id="theHide" name="Category" value="willBeChange"/>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedId" id="feedId" placeholder="请输入饲料编号" />
    	</div>
  
  	</div>
  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="feedName">饲料名称：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedName" id="feedName" placeholder="请输入饲料名称" />
		</div> 
	</div>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedCategory">饲料分类：</label>
   		<div class="col-sm-10">
    		<!-- <input class="form-control" type="text" name="feedCategory" id="feedCategory" placeholder="请选择饲料分类"/> -->
    		<div class="form-control">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
				<s:iterator var="category" value="categories">
					<li>
						 <p id="${category.categoryId }" onclick="choose(this.id)">${category.categoryName }</p>
					</li>
				</s:iterator>	
				</ul>
			</div>
    	</div>
    	
    	<!-- 测试 -->
<%--     	<div class="btn-group">
				<button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
				<s:iterator var="category" value="categories">
					<li>
						 <p id="${category.categoryId }" onclick="choose(this.id)">${category.categoryName }</p>
					</li>
				</s:iterator>
				</ul>
			</div> --%>
    	
	</div>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedIntroduction">饲料简介：</label>
    	<div class="col-sm-10">
		   <input size="16" type="textarea" value="" id="feedIntroduction" class="form-control" name="feedIntroduction">	
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>
	

	
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="remarks">备注：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="remarks" id="remarks" placeholder="备注"/>
    	</div>
    </div>
    <div>
    	<input type="submit" value="确认添加" class="btn btn-default">
    </div>
</form>
</div>
</body>
</html>
