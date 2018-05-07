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
	<link href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
	
	<link href="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css" rel="stylesheet">
	       		<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/core.min.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
		
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
        </script>
  </head>
  
  <body style="background-color: white;">
	<h1>hello</h1>
<%-- <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="${pageContext.request.contextPath }/animal_findAnimalInformation?page=1" method="get">
				   <label for="chooseCategory">选择动物分类</label>
				   <input type="text" id="showCategory" width="10px" readonly="readonly">
				   		<input type="hidden" name="animalCategory" id="theHide1">
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
				
			<label for=""animalId"">动物编号</label>
				<input type="text" name="animalId">
			<label for="animalName">动物名称</label>
				<input type="text" name="animalName">
				<label for="animalBatch">动物批次</label>
				<input type="text" name="animalBatch">
				<div>
				<label for="health">动物健康状况</label>
				<input type="text" name="health">

</div>
				<input type="submit" value="开始查找">
			</form>
							<a href="${pageContext.request.contextPath }/animal_findAnimalInformation?page=1" target="content">
				<button>查询全部动物</button>
				</a>
		</div>
	</div>
</div>  --%>

<div id="main" style="width: 600px; height: 400px;background-color: yellow;"></div>  
<%--     <script type="text/javascript">  
        // 基于准备好的dom，初始化echarts实例  
        var myChart = echarts.init(document.getElementById('main')); 

        var option = {  
            title: {  
                text: '折线图'  
            },  
            tooltip: {  
                trigger: 'axis'  
            },  
            legend: {  
                data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']  
            },  
            grid: {  
                left: '3%',  
                right: '4%',  
                bottom: '3%',  
                containLabel: true  
            },  
            toolbox: {  
                feature: {  
                    saveAsImage: {}  
                }  
            },  
            xAxis: {  
                type: 'category',  
                boundaryGap: false,  
                data: ['2017-12-1','2017-12-2','周三','周四','周五','周六','周日','12-2','12-3']  
            },  
            yAxis: {  
                type: 'value'  
            },  
            series: [  
                {  
                    name:'邮件营销',  
                    type:'line',  
                    stack: '总量',  
                    itemStyle : { normal: {label : {show: true}}},  
                    data:[120, 132, 101, 134, 90, 230, 210,220,220]  
                },  
                {  
                    name:'联盟广告',  
                    type:'line',  
                    stack: '总量',  
                    itemStyle : { normal: {label : {show: true}}},  
                    data:[220, 182, 191, 234, 290, 330, 310,220,2201]  
                },  
                {  
                    name:'视频广告',  
                    type:'line',  
                    stack: '总量',  
                    itemStyle : { normal: {label : {show: true}}},  
                    data:[150, 232, 201, 154, 190, 330, 410,220,220]  
                },  
                {  
                    name:'直接访问',  
                    type:'line',  
                    stack: '总量',  
                    itemStyle : { normal: {label : {show: true}}},  
                    data:[320, 332, 301, 334, 390, 330, 320,420,220]  
                },  
                {  
                    name:'搜索引擎',  
                    type:'line',  
                    stack: '总量',  
                    itemStyle : { normal: {label : {show: true}}},  
                    data:[820, 932, 901, 934, 1290, 1330, 1320,2203,2204]  
                }  
            ]  
        };  
        // 使用刚指定的配置项和数据显示图表  
        myChart.setOption(option);
                        myChart.setOption({
        title: {
            text: '异步数据加载示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    }); 
    </script>   --%>
    		<script type="text/javascript"> 
		/* function aaa(){
			alert("the aaa");
		} */
		$(document).ready(function(){
		 /* $(".aaa").click(function(){
		 	alert("aaa");
		 }); */
		 
		 
		 $("#form_datetime1").datetimepicker({
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
		});
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
            xhr.open("GET","${pageContext.request.contextPath}/animal_findById?time="+new Date().getTime()+"&animalId="+animalId,true);
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
    
<div style="margin-top:10px;">  
        <span style="font-size:20px;">开始时间：</span><input id="form_datetime1" type="text">—<span style="font-size:20px;">结束时间</span><input class="Wdate" type="text" id="form_datetime2"><br/>
    <br>
    <span style="font-size:20px;">
        <label for="animalId">动物编号</label><input type="text" name="animalId" id="animalId" placeholder="请输入动物编号" onblur="checkAnimalId()" />
    <br>
        <span id="span1" ></span>
        </span>
    <br>
    <span style="font-size:20px;">展示方式：</span>

        <input name="chart" type="radio" value="1" checked="checked">折线图  
        <input name="chart" type="radio" value="2">柱状图

        <button type="button" class="btn btn-primary"  onclick="jchart()">查看</button>  
    </div>  
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->  
    <div id="main" style="width: 700px;height:400px;"></div>  
    <script type="text/javascript">  
        //-------------------图表开始--------------------  
        function jchart(){  
            //获取参数  
            var startDate=$("#form_datetime1").val();  
            var endDate=$("#form_datetime2").val();  
            var chart=$("input[name=chart]:checked").val();
            var animalId = $("#animalId").val();
            //基于准备好的dom，初始化echarts实例  
            var myChart = echarts.init(document.getElementById('main'));  
            //图表显示加载样式  
            myChart.showLoading();  
            var options = {  
                    title: {  
                       text: "",  
                   },  
                   tooltip: {  
                       trigger: 'axis'  
                   },  
                   legend: {  
                       data: []  
                   },  
                   toolbox: {  
                       show: true,  
                       feature: {  
                           mark: false  
                       }  
                   },  
                   calculable: true,  
                   label:{   
                       normal:{   
                       show: true,   
                       position: 'inside'}   
                    },  
                   xAxis: [  
                       {  
                           /* axisLabel: {rotate: 90,}, */  
                           type: 'category',  
                           data: []  
                       }  
                   ],  
                   yAxis: [  
                       {  
                           type: 'value',  
                           splitArea: { show: true }  
                       }  
                   ],  
                   series: []  
            };  
            //通过Ajax获取数据  
            $.ajax({  
                async : false, //同步执行  
                url : "${pageContext.request.contextPath}/animal_chartAction",
                data: {"startDate":startDate,"endDate":endDate,"chart":chart,"animalId":animalId},
                dataType : "json",  
                success:function(data) {  
                    //将返回的category和series对象赋值给options对象内的category和series  
                    //主体内容  
                    options.series = data.series;  
                    //头部动态选择  
                    options.legend.data = data.legend;  
                    //因为xAxis是一个数组 这里需要是xAxis[i]的形式,横坐标  
                    options.xAxis[0].data = data.category;  
                    myChart.hideLoading();  
                    // 使用刚指定的配置项和数据显示图表  
                    myChart.setOption(options);  
                },  
                error : function(errorMsg) {  
                    alert("图表请求数据失败啦!");  
                }  
            })  
        }  
    </script>  

  </body>
</html>
