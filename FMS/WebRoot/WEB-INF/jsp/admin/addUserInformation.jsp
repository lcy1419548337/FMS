<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'adminLogin.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function change(){
		var img1 = document.getElementById("checkImg");
		img1.src="${pageContext.request.contextPath}/login_checkImage?time="+new Date().getTime();
	}
</script>

<script type="text/javascript">
	function checkAdminName(){
		 //alert("准备开始异步校验");
	//获得文本框value
	var adminName = document.getElementById("adminName").value;
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span1").innerHTML = xhr.response;
				}
			}
		}
	//3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/login_findById?time="+new Date().getTime()+"&adminname="+adminName,true);
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
		</script>
  </head>
  
  <body>
    <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					用户注册
				</h1>
				<p>
					欢迎
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
			<form action="${pageContext.request.contextPath }/login_userRegist" method="get">
				<div class="form-group">
					 <label for="adminName">用户名</label><input type="text" id="adminName" name="adminname" class="form-control" readonly="readonly" value="${sessionScope.user.adminname}"/>
					 <s:fielderror fieldName="adminname"></s:fielderror>
					<span id="span1"></span>
				</div>
				<div class="form-group">
					<label >身份</label><input type="text" class="form-control" value="${sessionScope.identity }" readonly="readonly"/>
				</div>
				<div class="form-group">

					<label for="oldPassword">原密码</label><input type="password" name="oldPassword" class="form-control" id="oldPassword" />
					<s:fielderror fieldName="oldPassword"></s:fielderror>
					<s:fielderror>
						<s:param>oldPasswordError</s:param>
					</s:fielderror>
				</div>
				<div class="form-group">
					 <label for="password">新密码</label><input type="password" id="password" name="password" class="form-control"/>
					<s:fielderror fieldName="password"></s:fielderror>
				</div>
				<div class="form-group">
					 <label for="rePassword">确认新密码</label><input type="password" name="rePassword" class="form-control" id="rePassword" />
					 <s:fielderror fieldName="rePassword"></s:fielderror>
				</div>
				<div class="form-group">
					 <label for="email">Email address</label><input type="email" name="email" class="form-control" id="email" />
					 <s:fielderror fieldName="email"></s:fielderror>
				</div> 
				<div class="form-group">
					 <label for="phone">手机号码</label><input type="phonenumber" name="phone" class="form-control" id="phone" />
				</div> 
				<div class="form-group">

				<label for="checkCode">请输入验证码：</label>
									<input type="text" id="checkCode" name="checkCode" class="text captcha" maxlength="4" autocomplete="off" ><img onclick="change()" id="checkImg" class="captchaImage" src="${pageContext.request.contextPath }/login_checkImage" title="点击更换验证码"><span id="captchaSpan">
									<s:fielderror >
             							<s:param>checkCodeError</s:param>
									</s:fielderror>

				</div>
				 <button type="submit" class="btn btn-default">确认信息</button>
			</form>
		</div>
	</div>
</div>
  </body>
</html>
