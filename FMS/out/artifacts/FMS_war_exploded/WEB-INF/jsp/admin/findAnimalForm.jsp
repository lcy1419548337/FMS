<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--    <h1>
        ===${pb}
    </h1>--%>

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
                        动物名称
                    </th>
                    <th>
                        动物分类
                    </th>
                    <th>
                        注册日期
                    </th>
                    <th>
                        批次
                    </th>
                    <th>
                        健康情况
                    </th>
                    <th>
                        近期体重
                    </th>
                    <th>
                        年龄
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        产量
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
                <s:iterator var="r" value="pageBean.list">
                    <tr>
                        <td>
                            <s:property value="#r.animal.animalId"/>
                        </td>
                        <td>
                            <s:property value="#r.animal.animalName"/>
                        </td>
                        <td>
                            <s:property value="#r.animal.animalCategory.categoryId"/>
                        </td>
                        <td>
                            <s:property value="#r.animal.animalRegisterDate"/>
                        </td>
                        <td>
                            <s:property value="#r.animal.animalBatch"/>
                        </td>
                        <td>
                            <s:property value="#r.animalInformation.health"/>
                        </td>
                        <td>
                            <s:property value="#r.animalInformation.currentWeight"/>
                        </td>
                        <td>
                            <s:property value="#r.animalInformation.age"/>
                        </td>
                        <td>
                            <s:property value="#r.animalInformation.sex"/>
                        </td>
                        <td>
                            <s:property value="#r.animalInformation.currentYield"/>
                        </td>
                        <td>
                            <%--<s:property value="#r.animalInformation.recorderTime"/>--%>
                            ${fn:substring(r.animalInformation.recorderTime,0 ,19 )}
                        </td>
                        <td>
                            <%--<a href="${ pageContext.request.contextPath }/animal_deleteOne?animalId=${r.animal.animalId}">删除</a>--%>
                            <a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?animalId=${r.animal.animalId }&toChange=yes" target="_blank">更改</a>
                            <button type="button" value="${r.animal.animalId}" onclick="deleteOne(this.value)">删除</button>
                                <script type="text/javascript">
                                function deleteOne(id) {
                                    var url = "${pageContext.request.contextPath }/animal_deleteOne";
                                    var data = {"animalId":id };
                                    $.ajax({
                                        type : "get",
                                        async : false,  //同步请求
                                        url : url,
                                        data : data,
                                        timeout:1000,
                                        success:function(dates){
                                            //alert(dates);
                                            showAnimalByPage(${pageBean.page});//要刷新的div
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
<%--            <div class="pagination" align="center" style="display: block;">
                <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
                <!--
                <label for=""animalId"">动物编号</label>
                    <input type="text" name="animalId">
                <label for="animalName">动物名称</label>
                    <input type="text" name="animalName">
                    <label for="animalBatch">动物批次</label>
                    <input type="text" name="animalBatch">
                    <div>
                    <label for="health">动物健康状况</label>
                    <input type="text" name="health">
                 -->
                <s:if test="pageBean.page != 1">
                    <a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=1
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				" class="firstPage">第一页</a>
                    <a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.page-1"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">上一页</a>
                </s:if>

                <s:iterator var="i" begin="1" end="pageBean.totalPage">
                    <s:if test="pageBean.page != #i">
                        <a href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="#i"/>
					&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
					"><s:property value="#i"/></a>
                    </s:if>
                    <s:else>
                        <span class="currentPage"><s:property value="#i"/></span>
                    </s:else>
                </s:iterator>

                <s:if test="pageBean.page != pageBean.totalPage">
                    <a class="nextPage" href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.page+1"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">下一页</a>
                    <a class="lastPage" href="${ pageContext.request.contextPath }/animal_findAnimalInformation?page=<s:property value="pageBean.totalPage"/>
				&animalId=${help.animalId }
				&animalCategory=${help.animalCategory }
				&animalName=${help.animalName }
				&animalBatch=${help.animalBatch }
				&health=${help.health }
				">最后一页</a>
                </s:if>
            </div>--%>
            <div class="pagination" align="center" style="display: block;">
                <button type="button" onclick="showAnimalByPage(${pageBean.page})">刷新</button>
                <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
                <s:if test="pageBean.page != 1">
                    <a href="javascript:;" class="firstPage" onclick="showAnimalByPage(1)">第一页</a>
                    <a onclick="showAnimalByPage(page=<s:property value="pageBean.page-1"/>)" href="javascript:;">上一页</a>
                </s:if>

                <s:iterator var="i" begin="1" end="pageBean.totalPage">
                    <s:if test="pageBean.page != #i">
                        <a onclick="showAnimalByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                    </s:if>
                    <s:else>
                        <span class="currentPage"><s:property value="#i"/></span>
                    </s:else>
                </s:iterator>

                <s:if test="pageBean.page != pageBean.totalPage">
                    <a class="nextPage" onclick="showAnimalByPage(<s:property value="pageBean.page+1"/>)" href="javascript:;">下一页</a>
                    <a class="lastPage" onclick="showAnimalByPage(<s:property value="pageBean.totalPage"/>)" href="javascript:;">最后一页</a>
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
                            showAnimalByPage(thePage.value);
                        }
                    }
                </script>
            </div>
        </div>
    </div>
</div>
