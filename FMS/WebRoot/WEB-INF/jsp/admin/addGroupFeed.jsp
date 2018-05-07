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
	var msg = $("#msg").value;
	if (msg == "添加成功") {
	    alert("添加成功");
	}else if (msg == "添加失败"){
	    alert("添加失败");
	}
    function checkFeedId(){
        //alert("准备开始异步校验");
        //获得文本框value
        var feedId = document.getElementById("feedId").value;
        //1.创建异步交互对象
        var xhr = createXmlHttp();
        //2.设置监听
        xhr.onreadystatechange = function(obj){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    //var fi = document.getElementById("fi").style;
                    var obj = document.getElementById("span2").innerHTML = xhr.response;
                    var result = document.getElementById("checkFeed");
                    if(xhr.response == "饲料不存在"){
                        //fs.display="block";
                        //alert("隐藏完成");
                        result.value = "no";
                    }else{
                        //alert("显示完成");
                        result.value = "yes";
                    }
                }
            }
        }
        //3.打开连接
        xhr.open("GET","${pageContext.request.contextPath}/feed_findById?time="+new Date().getTime()+"&feedId="+feedId,true);
        //4.发送
        xhr.send(null);
    }
	function checkGroupId(){
		 //alert("准备开始异步校验");
	//获得文本框value
	var groupId = document.getElementById("groupId").value;
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span1").innerHTML = xhr.response;		
					if(xhr.response == "集群不存在"){
					document.getElementById("checkGroup").value = "no";
					}else {
					    document.getElementById("checkGroup").value = "yes";
					}
					alert(document.getElementById("checkGroup").value);
				}
			}
		}
	//3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/group_findById?groupId="+groupId,true);
	//4.发送
	xhr.send(null);
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
		var CheckGroup = document.getElementById("checkGroup").value;
		var CheckFeed= document.getElementById("checkFeed").value;
		alert(CheckGroup)
		if(CheckGroup == "yes"){
		alert("动物存在");
			if (CheckFeed == "yes") {
                var form1 = document.getElementById("form1");
                form1.submit();
			}else {
			    alert("饲料不存在")
			}
		}
		else{
		alert("动物不存在")
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
	<h1>
		<s:actionmessage key="success"></s:actionmessage>
	</h1>
<form class="form-horizontal" id="form1" name="form1" method="get" action="${pageContext.request.contextPath }/group_groupUseFeed">
	
  	<div class="form-group">
   			<label class="col-sm-2 control-label" for="groupId">集群编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="groupId" id="groupId" placeholder="集群编号" onblur="checkGroupId()"/>
    		<span id="span1"></span>
		</div> 
	</div>
	<%--<div class="form-group">
    		<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedId" id="feedId" placeholder="请输入饲料编号" onblur="checkFeedId()"/>
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
    		<label class="col-sm-2 control-label" for="amount">用量：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="amount" id="amount" placeholder="请输入用量"/>
    	</div>
  
  	</div>
	<div class="form-group">
    		<label class="col-sm-2 control-label" for="form_datetime">添加日期：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime" class="form-control" name="feedUseTime">	
		    <!-- <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/> -->
    	</div>
	</div>
    <div>
		<input type="hidden" value="no" id="checkGroup">
		<input type="hidden" value="no" id="checkFeed">
    	<input type="button" value="确认添加" class="btn btn-default" onclick="submitForm()">
		<input type="hidden" id="msg" value="">
    </div>
</form>
</div>
</body>
</html>
