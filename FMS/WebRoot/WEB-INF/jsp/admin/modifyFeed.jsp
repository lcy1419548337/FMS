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
		$(document).ready(function(){ 		 
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
		
		$("#form_datetime2").datetimepicker({
			format: 'yyyy-mm-dd',//显示格式
			todayHighlight: 1,//今天高亮
			minView: "month",//设置只显示到月份
			startView:2,
			forceParse: 0,
			showMeridian: 1,
			autoclose: 1//选择后自动关闭
		});
		});
        </script>
        <script type="text/javascript">
/*         	function choose(obj){
        	document.getElementById("hide1").style.display = "none";
        	document.getElementById("hide2").style.display = "none";
        		var choosed = document.getElementById(obj);
  				if(choosed.style.display != "block"){choosed.style.display = "block";}
  				else{choosed.style.display = "none";}
        	} */
        	
        	
        	function choose(categoryName){
			//alert("categoryName")
			if(categoryName == "null"){
			document.getElementById("feedCategory").value="9999";
			}else{
			var changeValue = document.getElementById("feedCategory");
			//alert(changeValue.value);
			changeValue.value = categoryName;
			//alert(changeValue.value);
			}
		}
        	function chooseSupplier(supplierId){
			//alert("categoryName")
			if(supplierId == "null"){
			document.getElementById("supplierId").value="9999";
			}else{
			var changeValue = document.getElementById("supplierId");
			//alert(changeValue.value);
			changeValue.value = supplierId;
			//alert(changeValue.value);
			}
		}
        	
        </script>  


<!-- 	<script type="text/javascript">
	$(function(){
		//发送ajax 查询所有分类
		$.post("${pageContext.request.contextPath}/category",{"method":"findall"},function(obj){
			//alert(obj);
			//遍历json列表,获取每一个分类,包装成li标签,插入到ul内部
			//方法1
			$.each($(obj),function(){
			$("#c_ul").append("<li><a href='${pageContext.request.contextPath}/product?method=findByPage&pageNumber=1&cid="+this.cid+"'>"+this.cname+"</a></li>");
			});
			//方法2
		},"json");
	})
</script> -->


		<script type="text/javascript">
	function checkAnimalId(){
		 //alert("准备开始异步校验");
	//获得文本框value
	var feedId = document.getElementById("feedId").value;
	//1.创建异步交互对象
	var xhr = createXmlHttp();
	//2.设置监听
	xhr.onreadystatechange = function(obj){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					var obj = document.getElementById("span1").innerHTML = xhr.response;
					document.getElementById("check").value = "yes";
					document.getElementById("an").style.display = "none";
					document.getElementById("ac").style.display = "none";
					document.getElementById("ar").style.display = "none";
					document.getElementById("ab").style.display = "none";
					if(xhr.response == "动物不存在"){
					document.getElementById("check").value = "no";
					document.getElementById("an").style.display = "block";
					document.getElementById("ac").style.display = "block";
					document.getElementById("ar").style.display = "block";
					document.getElementById("ab").style.display = "block";
					}
					alert(document.getElementById("check").value);
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
		</script>
		
  </head>
  
<body>
   
<!-- <!-- <h1 class="aaa" onclick="aaa()">aaaaaaaaaaaaaaaaaaaaaaaaaa</h1> --> -->

<div style="text-align: center; width: 800px;margin: auto;" id="hide2">

<form class="form-horizontal" id="form1" name="form1" method="post" action="${pageContext.request.contextPath }/feed_addFeedInformation?changeOrSave=change">
	<div class="form-group" id="fi">
	
    		<label class="col-sm-2 control-label" for="feedId">饲料编号：</label>
    		
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedId" id="feedId" onblur="checkFeedId()" value="${rs.feed.feedId }"/>
    		<span id="span1" ></span>
    	</div>
  
  	</div>
  	
  	<div class="form-group" id="fn">
   			<label class="col-sm-2 control-label" for="feedName">饲料名称：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedName" id="feedName" value="${rs.feed.feedName }"  />
		</div> 
	</div>
	
<div class="form-group" id="fn">
    		<label class="col-sm-2 control-label" for="feedCategory">饲料分类：</label>
   		<div class="col-sm-10" style="width: 200px;" >
    		<input class="form-control" type="text" name="feedCategory" id="feedCategory" readonly="readonly" value="${rs.feed.feedCategory }"/>
    	</div>
    	<div class="btn-group" style="display: block;">
				 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
					<span class="caret"></span>
				</button>
		<ul class="dropdown-menu" style="left: 160px;top: 30px;overflow: scroll;height: 200px;">
		<li>
			<p id="null" onclick="choose(this.id)">9999:无</p>
		</li>
				<s:iterator var="category" value="#session.categories">
					<li>
						 <p id="${category.categoryId }" onclick="choose(this.id)">${category.categoryName }</p>
					</li>
				</s:iterator>	
				</ul>
			</div>
</div>
  	<div class="form-group" id="fin">
   			<label class="col-sm-2 control-label" for="feedIntroduction">饲料简介：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="feedIntroduction" id="feedIntroduction" value="${rs.feed.feedIntroduction }"  />
		</div> 
	</div>

	<div class="form-group" id="fr">
    		<label class="col-sm-2 control-label" for="remarks">饲料备注：</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="remarks" id="remarks" value="${rs.feed.remarks }"/>
    	</div>
    </div>
  	
		<div class="form-group" id="fs">
    		<label class="col-sm-2 control-label" for="supplierId">供应商编号</label>
   		<div class="col-sm-10" style="width: 200px;">
    		<input class="form-control" type="text" name="supplierId" id="supplierId" value="${rs.feed.supplier.supplierId }" readonly="readonly"/>
    	</div>
    		   <div class="btn-group" style="display: block;">
				 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" style="left: 160px;top: 30px;overflow: scroll;height: 200px;">
				<li>
			<p id="null" onclick="chooseSupplier(this.id)">9999:无</p>
				</li>
				<s:iterator var="supplier" value="#session.suppliers">
					<li>
						 <p id="${supplier.supplierId }" onclick="chooseSupplier(this.id)">${ supplier.supplierId }：${supplier.supplierName }</p>
					</li>
				</s:iterator>	
				</ul>
			</div>
    	</div>
    	
	<div class="form-group">
   			<label class="col-sm-2 control-label" for="stock">库存</label>
    	<div class="col-sm-10">
    		<input class="form-control" type="text" name="stock" id="stock" value="${rs.feedInformation.stock }" />
		</div> 
	</div>
	
<!-- 	<div class="form-group">
    		<label class="col-sm-2 control-label" for="recorderTime">记录时间：</label>
    	<div class="col-sm-10">
		   <input size="16" type="text" value="" id="form_datetime2" class="form-control" name="recorderTime">	
		    <input class="form-control" type="text" name="animalRegistDate" id="animalRegistDate" placeholder="注册日期"/>
    	</div>
	</div> -->
    <!-- 
		private Integer number;
	private Animal animal;
	private Integer age;
	private Timestamp registerDate;
	private Integer batch;
	private Integer health;
	private Float currentYield;
	private Float currentWeight;
	private Timestamp recorderTime;    
     -->
<!--      <input type="hidden" id="theHide1" name="feedCategory" value="">
     <input type="hidden" id="theHide1" name="feedCategory" value=""> -->
    <div>
    	<input type="hidden" name="animalHadOrNot" id="check">
    	<input type="submit" value="确认更改" class="btn btn-default">
    </div>
</form>



</div>
</body>
</html>
