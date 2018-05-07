<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
 <link href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<!-- <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script> -->
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<!-- <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script> -->
 <script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<!-- <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
.Footer  
{  
  clear: both; /* 清除浮动元素格式 */  
  position: relative;  
  margin-top: -120px; /* Footer 高度的负值 */  
  height: 120px;  
}
</style>
  </head>
  
  <body style="background-color: gray;">
 <div style="background-color:gray;">
 	<h1 align="center" style="color: black;">
 		<strong>饲料管理系统</strong>
 	</h1>
 </div>
<!--   <div style="position: relative;height: auto;min-height: 100%;"> -->
  <div style="display:flex;justify-content:center;align-items:center;display: inline-block;position: absolute;left: 17.7%;">
   <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="carousel slide" id="carousel-721546">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-721546">
					</li>
					<li data-slide-to="1" data-target="#carousel-721546">
					</li>
					<li data-slide-to="2" data-target="#carousel-721546">
					</li>
					<li data-slide-to="3" data-target="#carousel-721546">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img alt="" src="${ pageContext.request.contextPath }/image/牧场1.jpg" />
						<div class="carousel-caption">
							<h4>
								草原
							</h4>
							<p>
								一川草色青袅袅，绕屋水声如在家。怅望美人不携手，墙东又发数枝花。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${ pageContext.request.contextPath }/image/牧场2.jpg" />
						<div class="carousel-caption">
							<h4>
								牧场
							</h4>
							<p>
								一碧无垠骏马翔，少年鞭响牧歌扬。姑娘舞动裙欢悦，篝火星燃醉晚阳。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${ pageContext.request.contextPath }/image/青草1.jpg" />
						<div class="carousel-caption">
							<h4>
								青草
							</h4>
							<p>
								青草离离原上草,一岁一枯荣。野火烧不尽,春风吹又生。远芳侵古道,晴翠接荒城。又送王孙去,萋萋满别情。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="${ pageContext.request.contextPath }/image/饲料1.jpg" />
						<div class="carousel-caption">
							<h4>
								饲料
							</h4>
							<p>
								锄禾日当午，汗滴禾下土。谁知盘中餐，粒粒皆辛苦。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-721546" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-721546" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span6" style="display: inline-block;width: 50%;float: left;height: 125px;text-align: center;background-color: white;padding-top: 40px;">
					 <a href="${ pageContext.request.contextPath }/toLogin_toUserLogin" style="font-size: 30px;">我是顾客</a>
				</div>
				<div class="span6"style="display: inline-block;width: 50%;float: right;height: 125px;text-align: center;background-color: yellow;padding-top: 40px;">
					 <a href="${ pageContext.request.contextPath }/toLogin_toAdminLogin" style="font-size: 30px;">我是管理员</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<div class="container" style="float: left;width:18%;display: block;">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h2>
					牧场介绍
				</h2>
				<p>
					关山草原位于宝鸡陇县境内，享有“小天山”之美誉。这里的地貌与中欧阿尔卑斯山相似，幽涧水泽兼具，草原森林相间，地势广阔，水肥草美，牧马成群，景色秀丽。
					关山草原位于宝鸡陇县境内，享有“小天山”之美誉。这里的地貌与中欧阿尔卑斯山相似，幽涧水泽兼具，草原森林相间，地势广阔，水肥草美，牧马成群，景色秀丽。
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="container" style="float: right;width:18%;display: block;">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h2>
					牧场介绍
				</h2>
				<p>
					关山草原位于宝鸡陇县境内，享有“小天山”之美誉。这里的地貌与中欧阿尔卑斯山相似，幽涧水泽兼具，草原森林相间，地势广阔，水肥草美，牧马成群，景色秀丽。
					关山草原位于宝鸡陇县境内，享有“小天山”之美誉。这里的地貌与中欧阿尔卑斯山相似，幽涧水泽兼具，草原森林相间，地势广阔，水肥草美，牧马成群，景色秀丽。
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="#">Learn more</a>
				</p>
		</div>
	</div>
</div>
</div>
	<div style="text-align: center;">
	<div class="Footer">
	<h1>
		CopyRight@copy2012 
	</h1>
	</div>
</div>
  </body>
</html>
