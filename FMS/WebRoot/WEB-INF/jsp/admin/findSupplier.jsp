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
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>

  <body style="background-color: white;">
	  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
<%--			<form action="${pageContext.request.contextPath }/supplier_findSupplier?" method="get">	--%>
			<label for="supplierId">供应商编号</label>
				<input type="text" name="supplierId" id="supplierId">
			<label for="supplierName">供应商名称</label>
				<input type="text" name="supplierName" id="supplierName">
				<input  type="hidden" value="1" name="page">
				<%--<input type="submit" value="开始查找">--%>
	<button type="button" onclick="showSupplier()">查找</button>
			<script type="text/javascript">
                function showSupplier() {
                    //alert("show");
                    //var theForm = $("#showForm");
                    //alert(theForm);
                    //theForm.submit();
                    var supplierId=$("#supplierId").val();
                    var supplierName=$("#supplierName").val();
                    var url = "${pageContext.request.contextPath }/supplier_findSupplier";
                    var data = {"supplierId":supplierId , "supplierName":supplierName ,"page":1};
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

                function showSupplierByPage(thePage) {
                    //alert("show");
                    //var theForm = $("#showForm");
                    //alert(theForm);
                    //theForm.submit();
                    var supplierId=$("#supplierId").val();
                    var supplierName=$("#supplierName").val();
                    var url = "${pageContext.request.contextPath }/supplier_findSupplier";
                    var data = {"supplierId":supplierId , "supplierName":supplierName ,"page":thePage};
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
                            alert("失败，请稍后再试！");
                        }
                    });
                }
			</script>
							<%--<a href="${pageContext.request.contextPath }/supplier_findAllByPage?page=1" target="content">
				<button>查询全部供应商</button>--%>
				</a>
		</div>
	</div>
</div> 

<%--<c:if test="${not empty pageBean.list }">
	<h1>pageBean.list 存在！</h1>
	
		<div class="container">
	<div class="row clearfix" style="display:block;" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							供应商编号
						</th>
						<th>
							供应商名称
						</th>
						<th>
							供应商地址
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<s:iterator var="r" value="pageBean.list">
					<tr>
						<td>
							<s:property value="#r.supplierId"/>
						</td>
						<td>
							<s:property value="#r.supplierName"/>
						</td>
						<td>
							<s:property value="#r.supplierLocation"/>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/supplier_toModifySupplier?supplierId=${r.supplierId}">更改</a>
							<a href="${pageContext.request.contextPath}/supplier_toDeleteSupplier?supplierId=${r.supplierId}">移除</a>
						</td>
					</tr>
				</s:iterator>

				</tbody>
			</table>
							<div class="pagination" align="center" style="display: block;">
			<span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
			<!-- 
			<label for=""animalId"">动物编号</label>
				<input type="text" name="animalId">
			<label for="animalName">动物名称</label>
				<input type="text" name="animalName">
				<label for="animalBatch">动物批次</label>
				<input type="text" name="animalBatch">
				<div>
				<label for="health">动物健康状况</label>
				<input type="text" name="health">
			 -->
			<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/supplier_findSupplier?page=1
				&supplierId=${help.supplierId }
				&supplierName=${help.supplierName }
				" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/supplier_findSupplier?page=<s:property value="pageBean.page-1"/>
				&supplierId=${help.supplierId }
				&supplierName=${help.supplierName }
				">上一页</a>
			</s:if>
			
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/supplier_findSupplier?page=<s:property value="#i"/>
				&supplierId=${help.supplierId }
				&supplierName=${help.supplierName }
					"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/supplier_findSupplier?page=<s:property value="pageBean.page+1"/>
				&supplierId=${help.supplierId }
				&supplierName=${help.supplierName }
				">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/supplier_findSupplier?page=<s:property value="pageBean.totalPage"/>
				&supplierId=${help.supplierId }
				&supplierName=${help.supplierName }
				">最后一页</a>
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
