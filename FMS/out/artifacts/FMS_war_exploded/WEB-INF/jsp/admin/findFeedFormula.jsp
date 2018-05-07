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

  <body style="background-color: white;">
  <script type="text/javascript">
      function showFormula() {
          //alert("show");
          //var theForm = $("#showForm");
          //alert(theForm);
          //theForm.submit();
          var feedId=$("#feedId").val();
          var formulaName=$("#formulaName").val();
          var formula = $("#formula").val();
          //var health = $("#health").val();

          var url = "${pageContext.request.contextPath }/feed_findFeedFormula";
          var data = {"feedId":feedId , "formulaName":formulaName , "formula":formula ,"page":1};
          $.ajax({
              type : "get",
              async : false,  //同步请求
              url : url,
              data : data,
              timeout:1000,
              success:function(dates){
                  //alert(dates);
                  $("#showForm").html(dates);//要刷新的div
              },
              error: function() {
                  // alert("失败，请稍后再试！");
              }
          });
      }

      function showFormulaByPage(thePage) {
          //alert("show");
          //var theForm = $("#showForm");
          //alert(theForm);
          //theForm.submit();
          var feedId=$("#feedId").val();
          var formulaName=$("#formulaName").val();
          var formula = $("#formula").val();
          //var health = $("#health").val();

          var url = "${pageContext.request.contextPath }/feed_findFeedFormula";
          var data = {"feedId":feedId , "formulaName":formulaName , "formula":formula ,"page":thePage};
          $.ajax({
              type : "get",
              async : false,  //同步请求
              url : url,
              data : data,
              timeout:1000,
              success:function(dates){
                  //alert(dates);
                  $("#showForm").html(dates);//要刷新的div
              },
              error: function() {
                  // alert("失败，请稍后再试！");
              }
          });
      }

  </script>
	  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">

			<label for="feedId">饲料编号</label>
				<input type="text" name="feedId" id="feedId" placeholder="请输入饲料">
			<label for="formulaName">配方名称</label>
			<input type="text" name="formulaName" id="formulaName" placeholder="请输入配方名称">
			<label for="formula">查询全部饲料信息</label>
				<input type="text" name="formula" id="formula" placeholder="请输入配方关键词">
				<input type="button" value="开始查找" onclick="showFormula()">

		</div>
	</div>
</div>  
<%--<c:if test="${not empty pageBean}">
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
							饲料编号
						</th>
						<th>
							饲料名称
						</th>
						<th>
							饲料分类
						</th>
						<th>
							饲料介绍
						</th>
						<th>
							饲料备注
						</th>
						<th>
							供应商编号
						</th>
						<th>
							供应商名称
						</th>
						<th>
							库存
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
							<s:property value="#p.feed.feedId"/>
							</span>
						</td>
						<td>
							<s:property value="#p.feed.feedName"/>
						</td>
						<td>
							<s:property value="#p.feed.feedCategory"/>
						</td>

						<td style="width: 200px;padding-right: 0px;border-right: 0px;">
						<div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">
							<s:property value="#p.feed.feedIntroduction"/>
						</div>
						</td>

						<td onmouseover="showRemarks()" style="width: 200px;padding-right: 0px;border-right: 0px;">
						<div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">
 							<s:property value="#p.feed.remarks"/>
&lt;%&ndash; 							<div style="float: right;width: 300px;height: 200px;background-color: #E8CCFF;color: #000000;display: block;" id="hideRemarks">
								<span>
									<s:property value="#p.feed.remarks"/>
								</span>
							</div> &ndash;%&gt;
							</div>
						</td>
						<td>
							<s:property value="#p.feed.supplier.supplierId"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.supplier"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.stock"/>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/feed_toModifyFeed?feedId=${p.feed.feedId}">更改</a>
							<br>
							<a href="${pageContext.request.contextPath }/feed_deleteOne?feedId=${p.feed.feedId}">删除</a>
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
				<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&page=<s:property value="pageBean.page-1"/>&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }">上一页</a>
			</s:if>
		
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }&page=<s:property value="pageBean.page+1"/>">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }&page=<s:property value="pageBean.totalPage"/>">最后一页</a>
			</s:if>
	</div>
		</div>
	</div>
</div>


</c:if>--%>
	  <div id="showForm" style="width: 1200px;height: 1000px;margin: auto" align="center">

		  <%--<%@ include file="/js/showForm.jsp" %>--%>
	  </div>
  </body>
</html>
