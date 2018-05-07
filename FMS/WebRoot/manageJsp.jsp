<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'manager.jsp' starting page</title>
    <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
    <link href="${pageContext.request.contextPath}/Styles/frame.css" rel="Stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/Styles/menu.css" rel="Stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
    
    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
            border: 0;
            overflow: hidden;
            height: 100%;
            max-height: 80%;
        }
    </style>
    <script language="javascript" type="text/javascript">
        $(function(){
    　　$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');

   $('.tree li.parent_li > span').on('click', function (e) {
       　　 var children = $(this).parent('li.parent_li').find(' > ul > li');
        　　if (children.is(":visible")) {
            　　children.hide('fast');
            　　$(this).attr('title', 'Expand this branch').find(' > i').addClass('glyphicon glyphicon-plus').removeClass('glyphicon glyphicon-minus');
        　　} else {
            　　children.show('fast');
            　　$(this).attr('title', 'Collapse this branch').find(' > i').addClass('glyphicon glyphicon-minus').removeClass('glyphicon glyphicon-plus');
        　　}
        　　e.stopPropagation();
    　　});
    
    $('.tree').addClass('glyphicon glyphicon-user');
/*     $('.tree li').not(':has(li)').removeClass('glyphicon glyphicon-user'); */
    $('.tree #hideFirst').hide('fast');

    
　　});
    </script>
    <style type="text/css">
    	li {
	list-style: none;
	margin: 5px;
}
ul {
	padding: 10px;
}
    </style>
  </head>
  
  <body style="width: 500px;height: 1000px;">
  
<form id="form1" runat="server" >
    <div id="framecontentLeft" style="font-family: monospace; font-style: inherit;width:15%;overflow: scroll;background-color: white;">
	<div class="tree well" style="background-color: white;border: none;padding: 0;margin-bottom: 50px;">
	导航界面
        <ul>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> 遇冷前的生鲜乳温度监测</span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <a href="/FMS/hello3.jsp" target="content"><span>实时温度监测</span></a>
                    </li>
                    <li id="hideFirst">
                        <a href="/FMS/hello4.jsp" target="content"><span>历史温度查询</span> </a>
                    </li>
                </ul>
            </li>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> 遇冷后生鲜乳温度监测</span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                         <a href="/FMS/hello3.jsp" target="content"><span>实时温度监测</span></a>
                    </li>
                    <li id="hideFirst">
                         <a href="/FMS/hello5.jsp" target="content"><span>历史温度监测</span></a>
                    </li>
                </ul>
            </li>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> 制冷后生鲜乳温度查询</span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <a href="/FMS/hello2.jsp" target="content"><span>实时温度查询</span></a>
                        
                    </li>
                    <li id="hideFirst">
                        <a href="/FMS/hello5.jsp" target="content"><span>历史温度查询</span> </a>
                        
                    </li>
                </ul>
            </li>
            
            
                        <li>
                <span><i class="glyphicon glyphicon-plus"></i> 管理员账户管理</span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i>管理员账户信息管理</span> <a href=""></a>
                        <ul>
							<li>
                                <span><i class="icon-leaf"></i> 增加管理员账户</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 删除管理员账户</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 修改管理员账户</span> <a href=""></a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath }/admin_toFindAdmin" target="content"><span><i class="icon-leaf"></i> 查询管理员账户</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    </div>
    <div id="framecontentTop" style="background-color: blue;">
        <div style="text-align: center;">
            <div style="float: right;">
                <a href="Default.aspx?act=logout" style="color: yellow;">退出</a>
            </div>
            <h1 style="margin: 5px; font-family: fantasy;">
                <strong>温度监测系统</strong>
            </h1>
            <span class="glyphicon icon_pencil"></span>
           <!--  <span class="glyphicon glyphicon-home"></span>    <span class="glyphicon glyphicon-signal"></span> -->
        </div>
    </div>
  
    <div id="maincontent" style="display:block; width: 85%;background-image: url('/FMS/image/背景1.jpg');" align="center">
        <iframe id="content" name="content" onload="Javascript:SetWinHeight(this)" frameborder="0"
                scrolling="yes" width="100%" height="100%"></iframe>
    </div>
</form>
</body>
</html>
