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
  
  <body >
  
<form id="form1" runat="server" >
    <div id="framecontentLeft" style="font-family: monospace; font-style: inherit;width:15%;overflow: scroll;">
	<div class="tree well" style="background-color: #D2E6FA;border: none;padding: 0;margin-bottom: 50px;">
        <ul>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> <strong>动物管理</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i> 管理动物信息</span> <a href=""></a>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath }/animal_toAddAnimal" target="content"><span><i class="icon-leaf"></i>添加</span> </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/animal_toAddAnimalInformation" target="content"><span><i class="icon-leaf"></i>添加详细动物信息</span> </a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath }/animal_toFindAnimal" target="content"><span><i class="icon-leaf"></i>修改</span> </a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath }/animal_toFindAnimal" target="content"><span><i class="icon-leaf"></i>删除</span> </a>
                            </li>
                             <li>
                               <%--  <a href="${pageContext.request.contextPath }/animal_findByPage?page=1" target="content"><span><i class="icon-leaf"></i>查询动物信息</span> </a> --%>
                                <a href="${pageContext.request.contextPath }/animal_toFindAnimal" target="content"><span><i class="icon-leaf"></i>查询</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i> <strong>动物分类管理</strong></span> <a href=""></a>
                        <ul>
							<li>
                                <span><i class="icon-leaf"></i> 新增</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 删除</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 修改</span> <a href=""></a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/animal_findCategoryByPage?page=1" target="content"><span><i class="icon-leaf"></i>查询</span> </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> <strong>饲料管理</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i>管理饲料信息</span> <a href=""></a>
                        <ul>
							<li>
							  <a href="${pageContext.request.contextPath }/feed_toAddFeed" target="content"><span><i class="icon-leaf"></i>增加</span> </a>
                                <%-- <span><i class="icon-leaf"></i>增加饲料</span> <a href="${pageContext.request.contextPath }/feed_toAddFeed"></a> --%>
                            </li>
                             <li>
                               <a href="${pageContext.request.contextPath }/feed_toAddFeedInformation" target="content"> <span><i class="icon-leaf"></i> 增加饲料详细信息</span> </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/feed_toAddFeedInformation" target="content"> <span><i class="icon-leaf"></i> 删除</span> </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/feed_toAddFeedInformation" target="content"> <span><i class="icon-leaf"></i> 更改</span> </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/feed_toFindFeed" target="content"><span><i class="icon-leaf"></i>查询饲料信息</span> </a>
                            </li>
                        </ul>
                    </li>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i><strong>饲料使用管理</strong></span> <a href=""></a>
                        <ul>
							<li>
							  <a href="${pageContext.request.contextPath }/feed_toUseFeed" target="content"><span><i class="icon-leaf"></i>个体投放</span> </a>
                                <%-- <span><i class="icon-leaf"></i>增加饲料</span> <a href="${pageContext.request.contextPath }/feed_toAddFeed"></a> --%>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/group_toGroupUseFeed" target="content"><span><i class="icon-leaf"></i> 集群投放</span> </a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> #</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> #</span> <a href=""></a>
                            </li>
                        </ul>
                    </li>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i><strong>饲料配方管理</strong></span> <a href=""></a>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath }/feed_toAddFeedFormula" target="content"><span><i class="icon-leaf"></i>增加</span> </a>
                                <%-- <span><i class="icon-leaf"></i>增加饲料</span> <a href="${pageContext.request.contextPath }/feed_toAddFeed"></a> --%>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/feed_toFindFeedFormula" target="content"><span><i class="icon-leaf"></i> 查看</span> </a>
                            </li>
                            <li>
                                <span><i class="icon-leaf"></i> #</span> <a href=""></a>
                            </li>
                            <li>
                                <span><i class="icon-leaf"></i> #</span> <a href=""></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> <strong>供应商管理</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i>管理供应商信息</span> 
                        <ul>
							<li>
                                <a href="${pageContext.request.contextPath}/supplier_toAddSupplier" target="content"><span><i class="icon-leaf"></i>增加 </span> </a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath}/supplier_toAddSupplier" target="content"><span><i class="icon-leaf"></i>修改 </span> </a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath}/supplier_toAddSupplier" target="content"><span><i class="icon-leaf"></i>删除 </span> </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath }/supplier_toFindSupplier" target="content"><span><i class="icon-leaf"></i> 查看</span> </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> <strong>动物集群管理</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <ul>
							<li>
                                <a href="${pageContext.request.contextPath }/group_toAddGroup" target="content"> <span><i class="icon-leaf"></i> 增加</span></a>
                            </li>
                             <li>
                                 <a href="${pageContext.request.contextPath }/group_toFindGroup?page=1" target="content"><span><i class="icon-leaf"></i> 查看以及管理</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            
            
            <li>
                <span><i class="glyphicon glyphicon-plus"></i> <strong>商品信息管理</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i>商品管理</span> <a href=""></a>
                        <ul>
							<li>
                                <span><i class="icon-leaf"></i> 增加商品信息</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 删除商品</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 修改商品信息</span> <a href=""></a>
                            </li>
                             <li>
                                <span><i class="icon-leaf"></i> 查询商品</span> <a href=""></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            
                        <li>
                            <span><i class="glyphicon glyphicon-plus"></i> <strong>查看动物以及饲料使用的历史信息</strong></span> <a href=""></a>
                <ul>
                    <li id="hideFirst">
                        <span><i class="glyphicon glyphicon-minus"></i>查看信息</span> <a href=""></a>
                        <ul>
							<li>
                                <a href="${pageContext.request.contextPath }/feed_tofindOneAnimalFeed" target="content"><span><i class="icon-leaf"></i> 个体饲料历史</span> </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath }/group_tofindOneGroupFeed" target="content"><span><i class="icon-leaf"></i> 群体饲料历史</span> </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/group_toMakeChart" target="content"><span><i class="icon-leaf"></i> 集群生长状况</span> </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/animal_toMakeChart" target="content"><span><i class="icon-leaf"></i> 个体生长状况</span> </a>
                            </li>


                        </ul>
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
    <div id="framecontentTop" style="background-color: gray;">
        <div style="text-align: center;">
            <div style="float: right;">
                <a href="Default.aspx?act=logout" style="color: yellow;">退出</a>
            </div>
            <h1 style="margin: 5px; font-family: fantasy;">
                <strong>饲料监控后台管理系统</strong>
            </h1>
            <span class="glyphicon icon_pencil"></span>
           <!--  <span class="glyphicon glyphicon-home"></span>    <span class="glyphicon glyphicon-signal"></span> -->
            <p style="margin: 2px;font-size: 25px;"><strong>欢迎：${sessionScope.admin.adminname }</strong></p>
        </div>
    </div>
  
    <div id="maincontent" style="display:block; width: 85%;" align="center">
        <iframe id="content" name="content" onload="Javascript:SetWinHeight(this)" frameborder="0"
                scrolling="yes" width="100%" height="100%"></iframe>
    </div>
</form>
</body>
</html>
