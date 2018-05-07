<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>饲料监控系统</title>
    <script type="text/javascript" src="bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="test/css/htmleaf-demo.css">
	<link rel="stylesheet" href="test/assets/css/jquery.mCustomScrollbar.min.css" />
        <link rel="stylesheet" href="test/assets/css/custom.css">
    <link rel="stylesheet" href="src/tip-yellow/tip-yellow.css" type="text/css">
    <link rel="stylesheet" href="src/tip-darkgray/tip-darkgray.css" type="text/css">
    <link rel="stylesheet" href="src/tip-green/tip-green.css" type="text/css">
    <link rel="stylesheet" href="src/tip-skyblue/tip-skyblue.css" type="text/css">
    <link rel="stylesheet" href="src/tip-twitter/tip-twitter.css" type="text/css">
    <link rel="stylesheet" href="src/tip-violet/tip-violet.css" type="text/css">
    <link rel="stylesheet" href="src/tip-yellowsimple/tip-yellowsimple.css" type="text/css">
    <script type="text/javascript" src="src/jquery.poshytip.js"></script>

</head>

<style>
    html { overflow-y: hidden; }
</style>
<body>
	<div class="page-wrapper">
            <nav id="sidebar" class="sidebar-wrapper">
              <div class="sidebar-content">
                <a href="#" id="toggle-sidebar"><i class="fa fa-bars"></i></a>
                <div class="sidebar-brand">
                    <a href="#">pro sidebar</a>
                </div>
                <div class="sidebar-header">
                    <div class="user-pic">
                        <img class="img-responsive img-rounded" src="test/assets/img/user.jpg" alt="">
                    </div>
                    <c:if test="${not empty user}">
                        <div class="user-info">
                            <span class="user-name"><strong>${sessionScope.user.adminname }</strong></span>
                            <span class="user-role">${sessionScope.identity }</span>
<%--                            <div class="user-status">
                                <a href="#"><span class="label label-success">Online</span></a>
                            </div>--%>
                            <c:if test="${user.confirm == 0}">
                            <div class="user-status">
                                <a href="${ pageContext.request.contextPath }/login_toUserRegist"><span class="label label-success">请尽快完善信息</span></a>
                            </div>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${empty user}">
                        <div class="user-status" style="margin-top: 25px" align="center">
                            <a href="${ pageContext.request.contextPath }/toLogin_toAdminLogin"><span class="label label-success">点击登陆</span></a>
                        </div>
                    </c:if>

                </div><!-- sidebar-header  -->
<%--                <div class="sidebar-search">
                    <div>                   
                        <div class="input-group">                          
                            <input type="text" class="form-control search-menu" placeholder="Search for...">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        </div>
                    </div>                    
                </div>--%>

                  <style>
                      a{
                          font-size: large;
                      }
                  </style>
                  <c:if test="${not empty user}">


                <div class="sidebar-menu" style="overflow-y: hidden">
                    <ul>
                        <%--<li class="header-menu"><span>Dropdown  menu</span></li>--%>
                        <li class="sidebar-dropdown">
                            <a  href="#" ><i class="fa fa-tv"></i><span>动物信息管理</span><span class="label label-danger">New</span></a>
                            <div class="sidebar-submenu">
                                <ul >
                                    <li >
                                        <a href="${pageContext.request.contextPath }/animal_toAddAnimal" target="content" ><span><i class="icon-leaf"></i>添加</span> </a>
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
                            </div>
                        </li>                  
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-photo"></i><span>动物分类管理</span><span class="badge">3</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/animal_findCategoryByPage?page=1" target="content"><span><i class="icon-leaf"></i>查询</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-bar-chart-o"></i><span>饲料信息管理</span></a>
                            <div class="sidebar-submenu">
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
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-bar-chart-o"></i><span>供应商管理</span></a>
                            <div class="sidebar-submenu">
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
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-bar-chart-o"></i><span>投放饲料</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/feed_toUseFeed" target="content"><span><i class="icon-leaf"></i>个体投放</span> </a>
                                        <%-- <span><i class="icon-leaf"></i>增加饲料</span> <a href="${pageContext.request.contextPath }/feed_toAddFeed"></a> --%>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/group_toGroupUseFeed" target="content"><span><i class="icon-leaf"></i> 集群投放</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-bar-chart-o"></i><span>管理饲料配方</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/feed_toAddFeedFormula" target="content"><span><i class="icon-leaf"></i>增加</span> </a>
                                        <%-- <span><i class="icon-leaf"></i>增加饲料</span> <a href="${pageContext.request.contextPath }/feed_toAddFeed"></a> --%>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/feed_toFindFeedFormula" target="content"><span><i class="icon-leaf"></i> 查看</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-diamond"></i><span>动物集群管理</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/group_toAddGroup" target="content"> <span><i class="icon-leaf"></i> 增加</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/group_toFindGroup?page=1" target="content"><span><i class="icon-leaf"></i> 查看以及管理</span></a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-diamond"></i><span>动物生长情况</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/group_toMakeChart" target="content"><span><i class="icon-leaf"></i> 集群生长状况</span> </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/animal_toMakeChart" target="content"><span><i class="icon-leaf"></i> 个体生长状况</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fa fa-diamond"></i><span>饲料使用记录</span></a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/feed_tofindOneAnimalFeed" target="content"><span><i class="icon-leaf"></i> 个体饲料历史</span> </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath }/group_tofindOneGroupFeed" target="content"><span><i class="icon-leaf"></i> 群体饲料历史</span> </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                            <%--${user.level == 0}--%>
                            <c:if test="${user.level == 0}">
                                <li class="sidebar-dropdown">
                                    <a href="#"><i class="fa fa-diamond"></i><span>管理员账户</span></a>
                                    <div class="sidebar-submenu">
                                        <ul>
                                            <li>
                                                <a href="${pageContext.request.contextPath }/admin_toFindAdmin" target="content"><span><i class="icon-leaf"></i> 查询管理员账户</span></a>
                                            </li>
                                            <li>
                                                <a href="${pageContext.request.contextPath }/admin_toAddUser" target="_blank"><span><i class="icon-leaf"></i> 添加用户</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>

                    </ul>
                   </div><!-- sidebar-menu  -->            
                </div><!-- sidebar-content  -->

                <div class="sidebar-footer">
                    <a href="#" id="feedStockWaring" title="提示"><i class="fa fa-bell"></i><span class="label label-warning notification" id="feedWarning"></span></a>
                    <a href="#" id="needFeedWaring" title="nothing"><i class="fa fa-envelope"></i><span class="label label-success notification" id="feedUseWaring"></span></a>
                   <%-- <a href="#"><i class="fa fa-gear"></i></a>--%>
                    <a href="#"><i class="fa fa-power-off"></i></a>
                </div>
                </c:if>





                <script type="text/javascript">
                    //alert(1);
                    $("#feedStockWaring").poshytip({
                        className:"tip-green",
                        followCursor: true,
                        slide: false,
                        content:"这些饲料快用光了！",
                    });
                    $("#needFeedWaring").poshytip({
                        className:"tip-green",
                        followCursor: true,
                        slide: false,
                        content:"这些动物快饿晕了！",
                    });
                    //alert(2);
                </script>
                <script type="text/javascript">

 /*                   setTimeout(function() {
                            feedWaring();
                        },
                        2000);*/
                    /*30轮询读取函数*/
                   window.onload=function (ev) { feedWaring();
                       feedUseWaring(); }
                   setInterval(function() {

                            feedWaring();
                            feedUseWaring();

                        },
                        10000);
                    function feedWaring() {
                        $.ajax({

                            type: "POST",
                            url: "${pageContext.request.contextPath}/feed_feedWaring",
                            data: {},
                            timeout:1000,
                            success:function(date){

                                //alert(date);
                                document.getElementById("feedWarning").innerHTML = date;
                            },
                            error: function() {
                                //alert("失败，请稍后再试！");
                            }


                        });
                    }
 function feedUseWaring() {
     $.ajax({

         type: "POST",
         url: "${pageContext.request.contextPath}/feed_needUseFeedWaring",
         data: {},
         timeout:1000,
         success:function(date){

             //alert(date);
             document.getElementById("feedUseWaring").innerHTML = date;
         },
         error: function() {
             //alert("失败，请稍后再试！");
         }


     });
 }
                </script>

            </nav><!-- sidebar-wrapper  -->
        <nav>
        <div id="theHead" style="background-color: #494a5f;width: 100%;float: right">
            <div style="text-align: center;">
                <h1 style="margin: 5px; font-family: fantasy;">
                    <strong>饲料监控后台管理系统</strong>
                </h1>
                <span class="glyphicon icon_pencil"></span>
            </div>
        </div>
        <div style="display: block; float: right;width: 100%;height: 90%;padding-bottom: 20px" align="center" id="contentMain" class="theMainContent">
            <iframe id="content" name="content" onload="Javascript:SetWinHeight(this)" frameborder="0"
                    scrolling="yes" width="100%" height="100%"></iframe>
        </div>
        </nav>
        </div><!-- page-wrapper -->

	
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="test/js/jquery-1.11.0.min.js"><\/script>')</script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="assets/js//jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="test/assets/js/custom.js"></script>
</body>
</html>