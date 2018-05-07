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

		<script type="text/javascript"> 
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

        function showFeed() {
            //alert("show");
            //var theForm = $("#showForm");
            //alert(theForm);
            //theForm.submit();
            var animalId=$("#animalId").val();
            var category=$("#theHide1").val();
            var animalName = $("#animalName").val();
            var animalBatch = $("#animalBatch").val();
            var health = $("#health").val();
            //alert(health);
            var url = "${pageContext.request.contextPath }/animal_findAnimalInformation";
            var data = {"animalId":animalId , "category":category , "animalName":animalName , "animalBatch":animalBatch, "health":health, "page":1};
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

        function showAnimalByPage(thePage) {
            //alert("show");
            //var theForm = $("#showForm");
            //alert(theForm);
            //theForm.submit();
            var animalId=$("#animalId").val();
            var category=$("#category").val();
            var animalName = $("#animalName").val();
            var animalBatch = $("#animalBatch").val();
            var health = $("#health").val();

            var url = "${pageContext.request.contextPath }/animal_findAnimalInformation";
            var data = {"animalId":animalId , "category":category , "animalName":animalName , "animalBatch":animalBatch, "health":health,"page":thePage};
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


  </head>

  <body style="background-color: white;">
	  <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<%--<form action="${pageContext.request.contextPath }/animal_findAnimalInformation?page=1" method="get">--%>
				   <label for="chooseCategory">选择动物分类</label>
				   <input type="text" id="showCategory" width="10px" readonly="readonly">
				   		<input type="hidden" name="category" id="theHide1">
						<button name="chooseCategory" data-toggle="dropdown" class="btn btn-default dropdown-toggle">
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
				<s:iterator var="category" value="animalCategory">
					<li>
						 <p id="${category.categoryId }" onclick="choose(this.id)">${category.categoryId }:${category.categoryName }</p>
					</li>
				</s:iterator>	
				</ul>
				
			<label for="animalId">动物编号</label>
				<input type="text" name="animalId" , id="animalId">
			<label for="animalName">动物名称</label>
				<input type="text" name="animalName" , id="animalName">
				<label for="animalBatch">动物批次</label>
					<input type="text" id="animalBatch" name="animalBatch">
				<div>
					<label for="health">健康状况</label>
					<input type="text" id="health" name="health">

</div>
				<%--<input type="submit" value="开始查找">--%>
				<button onclick="showFeed()">查找</button>
			<%--</form>--%>
				<button onclick="showAnimalByPage(${pageBean.page})">刷新${pageBean.page}</button>
		</div>
	</div>
</div> 

<%--<c:if test="${not empty pageBean.list }">
<!-- 	<h1>pageBean.list 存在！</h1> -->
	
		<div class="container">
	<div class="row clearfix" style="display:block;" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							动物编号
						</th>
						<th>
							动物名称
						</th>
						<th>
							动物分类
						</th>
						<th>
							注册日期
						</th>
						<th>
							批次
						</th>
						<th>
							健康情况
						</th>
						<th>
							近期体重
						</th>
						<th>
							年龄
						</th>
						<th>
							产量
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
				<s:iterator var="r" value="pageBean.list">
					<tr>
						<td>
							<s:property value="#r.animal.animalId"/>
						</td>
						<td>
							<s:property value="#r.animal.animalName"/>
						</td>
						<td>
							<s:property value="#r.animal.animalCategory.categoryId"/>
						</td>
						<td>
							<s:property value="#r.animal.animalRegisterDate"/>
						</td>
						<td>
							<s:property value="#r.animal.animalBatch"/>
						</td>
						<td>
							<s:property value="#r.animalInformation.health"/>
						</td>
						<td>
							<s:property value="#r.animalInformation.currentWeight"/>
						</td>
						<td>
							<s:property value="#r.animalInformation.age"/>
						</td>
						<td>
							<s:property value="#r.animalInformation.currentYield"/>
						</td>
						<td>
							<s:property value="#r.animalInformation.recorderTime"/>
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/animal_deleteOne?animalId=${r.animal.animalId}">删除</a>
							<a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?animalId=${r.animal.animalId }&toChange=yes">更改</a>
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
				<a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=1
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				" class="firstPage">第一页</a>
				<a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.page-1"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">上一页</a>
			</s:if>
			
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="#i"/>
					&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
					"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.page+1"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">下一页</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.totalPage"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">最后一页</a>
			</s:if>
	</div>
		</div>
	</div>
</div>
	
</c:if>--%>

	  <div id="showForm" style="width: 1200px;height: 1000px;background-color: #70cbea;margin: auto" align="center">

		  <%--<%@ include file="/js/showForm.jsp" %>--%>
	  </div>

  </body>
</html>
