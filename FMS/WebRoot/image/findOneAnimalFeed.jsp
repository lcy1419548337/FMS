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
    function showFeed() {
        //alert("show");
        //var theForm = $("#showForm");
        //alert(theForm);
        //theForm.submit();
        var startDate=$("#form_datetime1").val();
        var endDate=$("#form_datetime2").val();
        var animalId = $("#animalId").val();
        var url = "${pageContext.request.contextPath}/feed_showFeed";
        var data = {"animalId":animalId , "startDate":startDate , "endDate":endDate};
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
    function showFeedByPage(thePage) {
        //alert("show");
        //var theForm = $("#showForm");
        //alert(theForm);
        //theForm.submit();
        var startDate=$("#form_datetime1").val();
        var endDate=$("#form_datetime2").val();
        var animalId = $("#animalId").val();
        var url = "${pageContext.request.contextPath}/feed_showFeed";
        var data = {"animalId":animalId , "startDate":startDate , "endDate":endDate , "page":thePage};
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
    <div class="row clearfix" style="width: 1100px;">
        <%--左侧--%>



<div style="margin-top:10px;" align="center">
    <form method="get" action="${pageContext.request.contextPath}/feed_showFeed" id="f">
    <span style="font-size:20px;">开始时间：</span>
        <input id="form_datetime1" type="text" name="startDate">—<span style="font-size:20px;">结束时间</span>
        <input class="Wdate" type="text" id="form_datetime2" name="endDate"><br/>
    <br>
    <span style="font-size:20px;">
        <label for="animalId">动物编号</label>
        <input type="text" name="animalId" id="animalId" placeholder="请输入动物编号" onblur="checkAnimalId()" />
    <br>
        <span id="span1" ></span>


        </span>
        <label for="feedId">饲料编号</label>
        <input type="text" name="feedId" id="feedId" placeholder="请输入饲料编号"/>
        <br>
    </form>
    <br>
    <button type="button" class="btn btn-primary"  onclick="showFeed()">查看饲料使用情况</button>
</div>


<%--右侧--%>

          <div id="showForm" style="width: 1200px;height: 1000px;background-color: #70cbea">

              <%--<%@ include file="/js/showForm.jsp" %>--%>
          </div>


    </div>
</div>
</body>
</html>
