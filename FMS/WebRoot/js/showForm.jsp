<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<c:if test="${not empty pb}">
    <h1>
        ===${pb.list.id.animalId}
    </h1>
    <div class="container">
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
                                                <s:property value="#p.id.animalId"/>
                                                ${p.id.animalId}
                                            </span>
                            </td>
                            <td>
                                <s:property value="#p.id.feedId"/>
                                ${p.id.feedId}
                            </td>
                            <td>
                                <s:property value="#p.id.feedAmount"/>
                                ${p.id.feedAmount}
                            </td>

                            <td style="width: 200px;padding-right: 0px;border-right: 0px;">
                                <div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">
                                    <s:property value="#p.id.feedUseTime"/>
                                    ${p.id.feedUseTime}
                                </div>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath }/feed_toModifyFeed?feedId=${p.feed.feedId}">更改</a>
                                <br>
                                <a href="${pageContext.request.contextPath }/feed_deleteOne?feedId=${p.feed.feedId}">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <div class="pagination" align="center" style="display: block;">
                    <span>第 <s:property value="pb.page"/>/<s:property value="pb.totalPage"/> 页</span>
                    <s:if test="pb.page != 1">
                        <a href="${ pageContext.request.contextPath }/animal_chartAction" class="firstPage">第一页</a>
                        <a href="${ pageContext.request.contextPath }/animal_chartAction?page=<s:property value="pb.page-1"/>">上一页</a>
                    </s:if>

                    <s:iterator var="i" begin="1" end="pb.totalPage">
                        <s:if test="pb.page != #i">
                            <a href="${ pageContext.request.contextPath }/animal_chartAction?page=<s:property value="#i"/>"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>

                    <s:if test="pb.page != pb.totalPage">
                        <a class="nextPage" href="${ pageContext.request.contextPath }/animal_chartAction?page=<s:property value="pb.page+1"/>">下一页</a>
                        <a class="lastPage" href="${ pageContext.request.contextPath }/animal_chartAction?page=<s:property value="pb.totalPage"/>">最后一页</a>
                    </s:if>
                </div>
            </div>
        </div>
    </div>

</c:if>