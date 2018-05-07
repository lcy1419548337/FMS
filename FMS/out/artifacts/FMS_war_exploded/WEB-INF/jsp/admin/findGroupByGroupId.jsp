<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript">
	function checkAnimalId(){
		 //alert("准备开始异步校验");
	//获得文本框value
	var animalId = document.getElementById("animalId").value;
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span1").innerHTML = xhr.response;		
					if(xhr.response == "动物不存在"){
					document.getElementById("check").value = "no";
					}
					alert(document.getElementById("check").value);
				}
			}
		}
	//3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/animal_findById?time="+new Date().getTime()+"&animalId="+animalId,true);
	//4.发送
	xhr.send(null);
	}
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
		var ai = document.getElementById("animalId");
		var as = document.getElementById("span1");
		if(ai.value == null || as.innerHTML == "动物不存在"){
		alert("动物不存在");
		}
		else{
		document.getElementById("form1").submit();
		}
		}
		</script>

  </head>

  <body style="background-color: white;">
	  <div class="container">
	  <%-- <h1>${sessionScope.groups }</h1> --%>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="${pageContext.request.contextPath }/group_findGroupLockId?page=1?groupId=${id}" method="get">
 				   <label for="chooseGroup">选择集群编号</label>
				   <input type="text" id="showCategory" width="10px" name="groupId" value="${id }" readonly="readonly">
					<span class="caret"></span>
				<ul class="dropdown-menu">
  				<s:iterator value="#session.groups" var="g">
					<li>
						 <p id="${g }" onclick="choose(this.id)"> <s:property value="#g"/></p>
					</li>
				</s:iterator>

<!-- 				<li>1</li>
				<li>1</li>
				<li>1</li>
				<li>1</li>
				<li>1</li>
				<li>1</li>	 -->
				</ul>
				<!-- <input class="form-control" type="text" name="groupId" id="groupId" placeholder="集群编号"/> -->

			<label for="animalId">动物编号</label>
				<input type="text" name="animalId" onblur="checkAnimalId()">
				<span id="span1"></span>
				<input type="submit" value="开始查找">
			</form>
		</div>
	</div>
</div>  
<c:if test="${not empty pageBean}">
<h1>
	1111${refresh }
</h1>
	<div class="container">
	<div class="row clearfix" style="display:block;" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>

					<tr>
						<th>
							集群编号
						</th>
						<th>
							动物编号
						</th>
						<th>
							记录时间
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
							<s:property value="#p.groupInformation.groupId"/>
							</span>
						</td>
						<td>
							<s:property value="#p.animal.animalId"/>
						</td>
						<td>
							<%--<s:property value="#p.time"/>--%>
							${fn:substring(p.time,0 ,19 )}

						</td>

						<td>
							<a href="${pageContext.request.contextPath }/group_toModifyGroup?animalId=${p.animal.animalId}&groupId=${p.groupInformation.groupId}">更改</a>
							<br>
							<a href="${pageContext.request.contextPath }/group_deleteOneAnimal?animalId=${p.animal.animalId}&groupId=${p.groupInformation.groupId}">删除</a>
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
				<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?animalId=${information.animalId }&groupId=${information.groupId }" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?animalId=${information.animalId }&groupId=${information.groupId }">上一页</a>
			</s:if>
		
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?animalId=${information.animalId }&groupId=${information.groupId }&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/feed_findFeedInformation?animalId=${information.animalId }&groupId=${information.groupId }&page=<s:property value="pageBean.page+1"/>">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/feed_findFeedInformation?animalId=${information.animalId }&groupId=${information.groupId }&page=<s:property value="pageBean.totalPage"/>">最后一页</a>
			</s:if>
	</div>
		</div>
	</div>
</div>


</c:if>
<c:if test="${not empty allGroup }">
<h1>1111 + ${allGroup.list }</h1>
<div class="container">
	<div class="row clearfix" style="display:block;" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>

					<tr>
						<th>
							集群编号
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<s:iterator var="p" value="allGroup.list">
					<tr>
						<td >
						<span>
							<s:property value="#p"/>
							</span>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/group_findGroupInformation?groupId=${p}" target="_blank">查看详细</a>
							<br>
							<a href="${pageContext.request.contextPath }/group_findAllGroup">删除</a>
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
			<span>第 <s:property value="allGroup.page"/>/<s:property value="allGroup.totalPage"/> 页</span>
			<s:if test="pageBean.page != 1">
				<a href="${pageContext.request.contextPath }/group_findAllGroup" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/group_findAllGroup?page=${allGroup.page}">上一页</a>
			</s:if>
		
			<s:iterator var="i" begin="1" end="allGroup.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/group_findAllGroup?page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/group_findAllGroup?page=<s:property value="allGroup.page+1"/>">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/group_findAllGroup?page=<s:property value="allPage.totalPage"/>">最后一页</a>
			</s:if>
	</div>
		</div>
	</div>
</div>
</c:if>
  </body>
</html>
