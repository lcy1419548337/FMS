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
  
<body>
   
<!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> -->
<div style="text-align: center; width: 800px;margin: auto;">
<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/animal_addAnimal">
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="animalId">动物编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalId" id="animalId" placeholder="请输入动物编号" />
    	</div>
  
  	</div>
  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="animalName">动物名称：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalName" id="animalName" placeholder="动物名称" />
		</div> 
	</div>
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="category">动物分类：</label>
   		<div class="col-sm-10">
    		<input class="form-control" type="text" name="category" id="category" placeholder="动物分类"/>
    	</div>
	</div>

	<div class="form-group">
    		<label class="col-sm-2 control-label" for="form_datetime">注册日期：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime" class="form-control" name="registerDate">
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>

	
	
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="animalBatch">动物批次：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="animalBatch" id="animalBatch" placeholder="动物批次"/>
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
    	<input type="submit" value="确认添加" class="btn btn-default">
    </div>
</form>
</div>
</body>
</html>
