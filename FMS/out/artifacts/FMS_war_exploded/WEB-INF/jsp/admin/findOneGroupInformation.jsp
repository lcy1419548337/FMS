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
    function showGroup() {
        //alert("show");
        //var theForm = $("#showForm");
        //alert(theForm);
        //theForm.submit();
        var startDate=$("#form_datetime1").val();
        var endDate=$("#form_datetime2").val();
        var groupId = $("#groupId").val();
        var feedId = $("#feedId").val();
        var url = "${pageContext.request.contextPath}/group_showGroupFeed";
        var data = {"groupId":groupId , "startDate":startDate , "endDate":endDate, "feedId":feedId, "page":1};
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

    function showGroupByPage(thePage) {
        //alert("show");
        //var theForm = $("#showForm");
        //alert(theForm);
        //theForm.submit();
        var startDate=$("#form_datetime1").val();
        var endDate=$("#form_datetime2").val();
        var groupId = $("#groupId").val();
        var feedId = $("#feedId").val();
        var url = "${pageContext.request.contextPath}/group_showGroupFeed";
        var data = {"groupId":groupId , "startDate":startDate , "endDate":endDate , "page":thePage , "feedId":feedId};
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
<script type="text/javascript">
    function checkGroupId(){
        //alert("准备开始异步校验");
        //获得文本框value
        var groupId = document.getElementById("groupId").value;
        //1.创建异步交互对象
        var xhr = createXmlHttp();
        //2.设置监听
        xhr.onreadystatechange = function(obj){
            if(xhr.readyState == 4){
                if(xhr.status == 200){
                    var obj = document.getElementById("span1").innerHTML = xhr.response;
                }
            }
        }
        //3.打开连接
        xhr.open("GET","${pageContext.request.contextPath}/group_findById?groupId="+groupId,true);
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
<div class="container">
    <div class="row clearfix" style="width: 1100px;">
        <%--左侧--%>



<div style="margin-top:10px;" align="center">
    <form method="get" action="${pageContext.request.contextPath}/feed_showFeed" id="f">
    <span style="font-size:20px;">开始时间：</span><input id="form_datetime1" type="text" name="startDate">—<span style="font-size:20px;">结束时间</span><input class="Wdate" type="text" id="form_datetime2" name="endDate"><br/>
    <br>
    <span style="font-size:20px;">
        <label for="groupId">集群编号</label><input type="text" name="groupId" id="groupId" placeholder="请输入集群编号" onblur="checkGroupId()" />
    <br>
        <span id="span1" ></span>
        </span>
    </form>
    <br>
    <span style="font-size:20px;">展示方式：</span>

    <input name="chart" type="radio" value="1" checked="checked">折线图
    <input name="chart" type="radio" value="2">柱状图

    <button type="button" class="btn btn-primary"  onclick="jchart()">查看生长情况</button>
    <button type="button" class="btn btn-primary"  onclick="showGroup()">查看饲料使用情况</button>
</div>
            <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
            <div id="main" style="width: 700px;height:400px;margin: auto;" ></div>

<%--右侧--%>

          <div id="showForm" style="width: 1200px;height: 1000px;">

              <%--<%@ include file="/js/showForm.jsp" %>--%>
          </div>

<script type="text/javascript">
    //-------------------图表开始--------------------
    function jchart(){
        //获取参数
        var startDate=$("#form_datetime1").val();
        var endDate=$("#form_datetime2").val();
        var chart=$("input[name=chart]:checked").val();
        var groupId = $("#groupId").val();
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
            url : "${pageContext.request.contextPath}/group_chartAction",
            data: {"startDate":startDate,"endDate":endDate,"chart":chart,"groupId":groupId},
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

    </div>
</div>
</body>
</html>
