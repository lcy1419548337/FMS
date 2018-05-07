<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--    <h1>
        ===${pb}
    </h1>--%>
    <div class="container" style="background-color: skyblue;width: auto">
        <div class="row clearfix" style="display:block;" align="center">
            <div class="col-md-12 column" >
                <table class="table table-bordered">
                    <thead>

                    <tr>
                        <th>
                            动物编号
                        </th>
                        <th>
                            饲料编号
                        </th>
                        <th>
                            饲料用量
                        </th>
                        <th>
                            饲料使用时间
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator var="p" value="pb.list">
                        <tr>
                            <td >
                                            <span>
                                               <%-- <s:property value="#p.id.animalId"/>--%>
                                                ${p.id.animalId}
                                            </span>
                            </td>
                            <td>
                               <%-- <s:property value="#p.id.feedId"/>--%>
                                    ${p.id.feedId}
                            </td>
                            <td>
                                <%--<s:property value="#p.id.feedAccount"/>--%>
                                    ${p.id.feedAccount}
                            </td>

                            <td style="width: 200px;padding-right: 0px;border-right: 0px;">
                                <div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">
                                    <%--<s:property value="#p.id.feedUseTime"/>--%>
                                        <%--${p.id.feedUseTime}--%>
                                            ${fn:substring(p.id.feedUseTime,0,19)}
                                </div>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath }/feed_toModifyFeed?feedId=${p.id.feedId}">更改</a>
                                <br>
                                <a href="${pageContext.request.contextPath }/feed_deleteOne?feedId=${p.id.feedId}">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <div class="pagination" align="center" style="display: block;">
                    <span>第 <s:property value="pb.page"/>/<s:property value="pb.totalPage"/> 页</span>
                    <s:if test="pb.page != 1">
                        <a href="javascript:;" class="firstPage" onclick="showFeedByPage(1)">第一页</a>
                        <a onclick="showFeedByPage(page=<s:property value="pb.page-1"/>)" href="javascript:;">上一页</a>
                    </s:if>

                    <s:iterator var="i" begin="1" end="pb.totalPage">
                        <s:if test="pb.page != #i">
                            <a onclick="showFeedByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>

                    <s:if test="pb.page != pb.totalPage">
                        <a class="nextPage" onclick="showFeedByPage(<s:property value="pb.page+1"/>)" href="javascript:;">下一页</a>
                        <a class="lastPage" onclick="showFeedByPage(<s:property value="pb.totalPage"/>)" href="javascript:;">最后一页</a>
                    </s:if>
                    <button onclick="toJumpPage()" style="margin-left: 50px">跳转到此页</button>
                    <input type="text" id="jumpPage" style="width: 50px;">
                    <input type="hidden" id="theTotalPage" value="<s:property value="pb.totalPage"/>">
                    <script>
                        function toJumpPage() {

                            var thePage = document.getElementById("jumpPage");
                            var theTotalPage = document.getElementById("theTotalPage");

                            //alert(thePage.value > parseInt(theTotalPage.value));
                            if (thePage.value > parseInt(theTotalPage.value)) {
                                alert("超出页数范围");
                            }else {
                                //alert(thePage.value);
                                showFeedByPage(thePage.value);
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
