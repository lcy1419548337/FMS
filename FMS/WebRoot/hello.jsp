<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>生鲜乳温度控制系统</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<style type="text/css">
.backDiv{
background-image: url('${pageContext.request.contextPath}/image/背景1.jpg');
margin: 100px auto;
}
body{
background-color: white;
}
</style>
  </head>
  
  <body>
 
    <div style="width: 609px;height: 624px;" class="backDiv">
  
    	<div class="container">
	<div class="row clearfix" style="width: 600px;>
		<div class="col-md-12 column" style="width: 600px;" align="center">
		<div style="margin-top: 200px;">
		<h1 align="center">
    		<p>生鲜乳温度控制系统</p>
    	</h1>
    	</div>
			<form role="form" style="width: 600px; margin-top: 50px;">
				<div class="form-group" style="width: 200px;">
					 <label for="exampleInputEmail1">用户名</label>
					 <input type="text" class="form-control" id="exampleInputUsername1" placeholder="用户名"  />
				</div>
				<div class="form-group" style="width: 200px;">
					 <label for="exampleInputPassword1">密码</label>
					 <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码"/>
				</div>
				<div class="checkbox">
				</div> <button type="submit" class="btn btn-default">登陆</button>
			</form>
		</div>
	</div>
</div>
    
    </div>
  </body>
</html>
