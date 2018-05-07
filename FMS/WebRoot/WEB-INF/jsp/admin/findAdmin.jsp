<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<style type="text/css">
td {
	text-align:center;
	height: 100px;
	width: 100px;
	overflow-x: hidden;
}
th {
	width: auto;
	text-align: center;
}

</style>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<script type="text/javascript">
		<%-- <%if(request.getSession().getAttribute("refresh").equals("yes")){ %>
		alert("需要刷新");
		location.reload();
		<% 
			session.removeAttribute("refresh");
			}
		%> --%>
<%-- if(${not empty refresh}){
alert("需要刷新");
location.reload();
<%session.removeAttribute("refresh");%>
} --%>
		//location.reload();

		
		function showRemarks(){
		var r = document.getElementById("hideRemarks");
		r.style.display = "block";
		} 
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
			var changeValue = document.getElementById("theHide1");
			//alert(changeValue.value);
			changeValue.value = categoryName;
			//alert(changeValue.value);
			document.getElementById("showCategory").value = changeValue.value;
			//alert(document.getElementById("showCategory").value);
		}
        </script>


  </head>

  <body style="background-color: white;text-align: center">
	  <div class="container" style="width: 1500px" align="center">
	  <h1>
	  	<a href="${pageContext.request.contextPath }/admin_findAllAdmin?page=222">test</a>
	  </h1>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="${pageContext.request.contextPath }/admin_findAllAdmin?page=1" method="get">
			<label for="adminname">用户名</label>
				<input type="text" name="adminname">
			<label for="email">邮箱</label>
				<input type="text" name="email">
			<label for="phone">电话</label>
				<input type="text" name="phone">
			<label for="checkbox">查询全部饲料信息</label>
				<input type="submit" value="开始查找">
			</form>
		</div>
	</div>
</div>  
<c:if test="${not empty pageBean}">

	<div class="container" align="center" style="width: 1500px">
	<div class="row clearfix" style="display:block;width: 1500px" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>

					<tr>
						<th>
							用户名
						</th>

						<th>
							电子邮箱
						</th>
						<th>
							电话
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<s:iterator var="p" value="pageBean.list">
					<tr>
						<td >
						<span>
							<s:property value="#p.adminname"/>
							</span>
						</td>
						<td>
							<s:property value="#p.email"/>
						</td>
						<td>
							<s:property value="#p.phone"/>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/admin_toModifyAdmin?adminname=${p.adminname}">更改</a>
							<br>
							<a href="${pageContext.request.contextPath }/admin_deleteOne?adminname=${p.adminname}">删除</a>
						</td>
						</tr>
				</s:iterator>
				</tbody>
			</table>
							<div class="pagination" align="center" style="display: block;">
							<!--
							${information.category }
							${information.supplier }
							${information.feedId }
							${information.feedName }
							${information.findAllOrNot }
							 -->
			<span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
			<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/admin_findAllAdmin?adminname=${admin.adminname }&email=${admin.email }&phone=${admin.phone }" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/admin_findAllAdmin?adminname=${admin.adminname }&email=${admin.email }&phone=${admin.phone }&page=<s:property value="pageBean.page-1"/>">上一页</a>
			</s:if>

			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/admin_findAllAdmin?adminname=${admin.adminname }&email=${admin.email }&phone=${admin.phone }&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>

			<s:if test="pageBean.page != pageBean.totalPage">
				<a class="nextPage" href="${ pageContext.request.contextPath }/admin_findAllAdmin?adminname=${admin.adminname }&email=${admin.email }&phone=${admin.phone }&page=<s:property value="pageBean.page+1"/>">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/admin_findAllAdmin?adminname=${admin.adminname }&email=${admin.email }&phone=${admin.phone }&page=<s:property value="pageBean.totalPage"/>">最后一页</a>
			</s:if>

	</div>
		</div>
	</div>
</div>


</c:if>
  </body>
</html>
