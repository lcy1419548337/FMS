<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

    <div class="container" style="background-color: #70cbea;">
        <div class="row clearfix" style="display:block;" align="center">
            <div class="col-md-12 column" >
                <table class="table table-bordered">
                    <thead>

                    <tr>
                        <th>
                            集群编号
                        </th>
                        <th>
                            动物编号
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
                    <s:iterator var="p" value="pageBean.list">
                        <tr>
                            <td >
						<span>
							<s:property value="#p.groupInformation.groupId"/>
							</span>
                            </td>
                            <td>
                                <s:property value="#p.animal.animalId"/>
                            </td>
                            <td>
                               <%-- <s:property value="#p.time"/>--%>
                                ${fn:substring(p.time,0 ,19 )}

                            </td>

                            <td>
                                <a href="${pageContext.request.contextPath }/group_toModifyGroup?animalId=${p.animal.animalId}&groupId=${p.groupInformation.groupId}" target="_blank">更改</a>
                                <br>
                                <button type="button" value="${p.animal.animalId}" onclick="deleteOne(this.value)">删除</button>
                                <script type="text/javascript">
                                    function deleteOne(id) {
                                        var url = "${pageContext.request.contextPath }/group_deleteOneByAjax";
                                        var data = {"animalId":id };
                                        $.ajax({
                                            type : "get",
                                            async : false,  //同步请求
                                            url : url,
                                            data : data,
                                            timeout:1000,
                                            success:function(dates){
                                                //alert(dates);
                                                showGroupByPage(${pageBean.page});//要刷新的div
                                            },
                                            error: function() {
                                                alert("失败，请稍后再试！");
                                            }
                                        });
                                    }
                                </script>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <div class="pagination" align="center" style="display: block;">
                    <button type="button" onclick="showGroupByPage(${pageBean.page})">刷新</button>
                    <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
                    <s:if test="pageBean.page != 1">
                        <a href="javascript:;" class="firstPage" onclick="showGroupByPage(1)">第一页</a>
                        <a onclick="showGroupByPage(page=<s:property value="pageBean.page-1"/>)" href="javascript:;">上一页</a>
                    </s:if>

                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a onclick="showGroupByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>

                    <s:if test="pageBean.page != pageBean.totalPage">
                        <a class="nextPage" onclick="showGroupByPage(<s:property value="pageBean.page+1"/>)" href="javascript:;">下一页</a>
                        <a class="lastPage" onclick="showGroupByPage(<s:property value="pageBean.totalPage"/>)" href="javascript:;">最后一页</a>
                    </s:if>
                    <button onclick="toJumpPage()" style="margin-left: 50px">跳转到此页</button>
                    <input type="text" id="jumpPage" style="width: 50px;">
                    <input type="hidden" id="theTotalPage" value="<s:property value="pageBean.totalPage"/>">
                    <script>
                        function toJumpPage() {

                            var thePage = document.getElementById("jumpPage");
                            var theTotalPage = document.getElementById("theTotalPage");

                            //alert(thePage.value > parseInt(theTotalPage.value));
                            if (thePage.value > parseInt(theTotalPage.value)) {
                                alert("超出页数范围");
                            }else {
                                //alert(thePage.value);
                                showGroupByPage(thePage.value);
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>

