<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="container">
    <div class="row clearfix" style="display:block;" align="center">
        <div class="col-md-12 column" >
            <table class="table table-bordered">
                <thead>

                <tr>
                    <th>
                        集群编号
                    </th>
                    <th>
                        集群名称
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <s:iterator var="p" value="allGroup.list">
                    <tr>
                        <td >
						<span>
							<s:property value="#p.groupId"/>
							</span>
                        </td>
                        <td>
                            <s:property value="#p.groupName"/>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath }/group_findByGroupId?groupId=${p.groupId}" target="_blank">查看详细</a>
                            <br>
                            <button type="button" onclick="deleteOneGroup(this.value)" value="${p.groupId}">删除集群</button>
                            <script type="text/javascript">
                                function deleteOneGroup(id) {
                                    var url = "${pageContext.request.contextPath }/group_deleteOneGroup";
                                    var data = {"groupId":id };
                                    $.ajax({
                                        type : "get",
                                        async : false,  //同步请求
                                        url : url,
                                        data : data,
                                        timeout:1000,
                                        success:function(dates){
                                            //alert(dates);
                                            showGroupByPage2(${pageBean.page});//要刷新的div
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
                <button type="button" onclick="showGroupByPage2(${pageBean.page})">刷新</button>
                <span>第 <s:property value="allGroup.page"/>/<s:property value="allGroup.totalPage"/> 页</span>
                <s:if test="allGroup.page != 1">
                    <a href="javascript:;" class="firstPage" onclick="showGroupByPage2(1)">第一页</a>
                    <a onclick="showGroupByPage2(page=<s:property value="allGroup.page-1"/>)" href="javascript:;">上一页</a>
                </s:if>

                <s:iterator var="i" begin="1" end="allGroup.totalPage">
                    <s:if test="allGroup.page != #i">
                        <a onclick="showGroupByPage2(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                    </s:if>
                    <s:else>
                        <span class="currentPage"><s:property value="#i"/></span>
                    </s:else>
                </s:iterator>

                <s:if test="allGroup.page != allGroup.totalPage">
                    <a class="nextPage" onclick="showGroupByPage2(<s:property value="allGroup.page+1"/>)" href="javascript:;">下一页</a>
                    <a class="lastPage" onclick="showGroupByPage2(<s:property value="allGroup.totalPage"/>)" href="javascript:;">最后一页</a>
                </s:if>
            </div>
        </div>
    </div>
</div>

