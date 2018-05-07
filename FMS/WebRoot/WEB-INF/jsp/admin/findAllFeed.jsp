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
	<div class="row clearfix" style="display:block;" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>
				<!-- 
					private Integer feedId;
					private String feedName;
					private Integer feedCategory;
					private String feedIntroduction;
					private String remarks;
					private Set animalFeedInformations = new HashSet(0);
					private Set feedInformations = new HashSet(0);
					private Integer number;
					private Formula formula;
					private Integer feedId;
					private Integer categoryId;
					private String supplier;
					private Double stock;
					private String remark;
				 -->
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
							供应商
						</th>
						<th>
						<!-- 
	private Integer category;
	private String supplier;
	private Integer feedId;
	private String feedName;
	private String findAllOrNot;
						 -->
							
						</th>
					</tr>
				</thead>
				<tbody>
				<s:iterator var="p" value="pageBean.list">
					<tr>
						<td>
							<s:property value="#p.feed.feedId"/>
						</td>
						<td>
							<s:property value="#p.feed.feedId"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.categoryId"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.supplier"/>
						</td>

					</tr>
				</s:iterator>
				

					<!-- <tr class="success">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr> -->
					<!-- <tr class="error">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr> -->
					<!-- <tr class="warning">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr> -->
					<!-- <tr class="info">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr> -->
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
				<a class="lastPage" href="${ pageContext.request.contextPath }/feed_findFeedInformation?findAllOrNot=${information.findAllOrNot }&&feedName=${information.feedName }&feedId=${information.feedId }&supplier=${information.supplier }&categoryId=${information.category }page=<s:property value="pageBean.totalPage"/>">最后一页</a>
			</s:if>
		
		
			<%-- <s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=1" class="firstPage">&nbsp;</a>
				<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
			</s:if>
			
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
			</s:if> --%>

	</div>
		</div>
	</div>
</div>

  </body>
</html>
