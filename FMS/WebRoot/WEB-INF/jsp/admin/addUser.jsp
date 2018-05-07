<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

		
		
  </head>
  
<body style="padding-top: 50px">
   
<!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> -->
<div style="text-align: center; width: 800px;margin: auto;">
	<s:actionmessage></s:actionmessage>
<form class="form-horizontal" id="form1" name="form1" method="get" action="${pageContext.request.contextPath }/admin_addUser">
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="adminName">用户名：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="adminname" id="adminName" placeholder="请输入用户名" />
    	</div>
  
  	</div>
	<div class="form-group" id="fc">
		<label class="col-sm-2 control-label" for="level">身份：</label>
		<div class="col-sm-10" style="width: 200px;" >
			<input class="form-control" type="text" name="theLevel" id="level" placeholder="请选择身份" readonly="readonly" onblur="checkFeedId()"/>
			<span id="span2"></span>
		</div>
		<div class="btn-group" style="display: block;">
			<button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" style="left: 160px;top: 30px;overflow: scroll;height:auto;overflow-x: hidden">
				<s:iterator var="l" value="level">
					<li>
						<strong><a onclick="choose(this.innerHTML)" style="font-size: medium" href="javascript:void(0)">${l}</a></strong>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
        function choose(level){
            //alert("categoryName")
            var changeValue = document.getElementById("level");
            //var changeValue2 = document.getElementById("feedCategory2");
            //alert(changeValue.value);
            changeValue.value = level;
            //changeValue2.value = categoryName;
            //alert(changeValue.value);
        }
	</script>

    <div>
    	<input type="submit" value="确认添加" class="btn btn-default">
    </div>
</form>
</div>
</body>
</html>
