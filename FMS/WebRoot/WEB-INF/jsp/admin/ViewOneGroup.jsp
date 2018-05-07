<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
                                <%--<s:property value="#p.time"/>--%>
                                    11${fn:substring(p.time,0,19)}
                            </td>

                            <td>
                                <a href="${pageContext.request.contextPath }/group_toModifyGroup?animalId=${p.animal.animalId}&groupId=${p.groupInformation.groupId}">更改</a>
                                <br>
                                <a href="${pageContext.request.contextPath }/group_deleteOne?animalId=${p.animal.animalId}&groupId=${p.groupInformation.groupId}">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <div class="pagination" align="center" style="display: block;">
                    <button type="button" onclick="showGroupByPage(${pageBean.page})">刷新</button>
                    <span>第 <s:property value="allGroup.page"/>/<s:property value="allGroup.totalPage"/> 页</span>
                    <s:if test="allGroup.page != 1">
                        <a href="javascript:;" class="firstPage" onclick="showGroupByPage(1)">第一页</a>
                        <a onclick="showGroupByPage(page=<s:property value="allGroup.page-1"/>)" href="javascript:;">上一页</a>
                    </s:if>

                    <s:iterator var="i" begin="1" end="allGroup.totalPage">
                        <s:if test="allGroup.page != #i">
                            <a onclick="showGroupByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>

                    <s:if test="allGroup.page != allGroup.totalPage">
                        <a class="nextPage" onclick="showGroupByPage(<s:property value="allGroup.page+1"/>)" href="javascript:;">下一页</a>
                        <a class="lastPage" onclick="showGroupByPage(<s:property value="allGroup.totalPage"/>)" href="javascript:;">最后一页</a>
                    </s:if>
                </div>
            </div>
        </div>
    </div>
