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
   
<div style="text-align: center; width: 800px;margin: auto;">
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/supplier_modifySupplier">
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="supplierId">供应商编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" value="${supplier.supplierId}" readonly="readonly" type="text" name="supplierId" id="supplierId" placeholder="请输入供应商编号" />
    	</div>
  
  	</div>
  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="supplierName">供应商名称：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" value="${supplier.supplierName}" name="supplierName" id="supplierName"  />
		</div> 
	</div>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="supplierLocation">供应商地址：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="${supplier.supplierLocation}" id="supplierLocation" class="form-control" name="supplierLocation" >
    	</div>
	</div>
    <div>
    	<input type="submit" value="确认更改" class="btn btn-default">
    </div>
</form>
</div>
</body>
</html>
