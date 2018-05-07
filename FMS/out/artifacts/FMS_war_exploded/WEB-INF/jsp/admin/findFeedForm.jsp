<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container" style="width: 1500px;" align="center">
        <button type="button" onclick="showFeedByPage(${pageBean.page})">刷新</button>
	<div class="row clearfix" style="display:block;width: 1500px" align="center">
		<div class="col-md-12 column" >
			<table class="table table-bordered">
				<thead>

					<tr>
						<th>
							饲料编号
						</th>
						<th>
							饲料名称
						</th>
						<th>
							饲料分类
						</th>
						<th>
							饲料介绍
						</th>
						<th>
							饲料备注
						</th>
						<th>
							供应商编号
						</th>
						<th>
							供应商名称
						</th>
						<th>
							库存
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
							<s:property value="#p.feed.feedId"/>
							</span>
						</td>
						<td>
							<s:property value="#p.feed.feedName"/>
						</td>
						<td>
							<s:property value="#p.feed.feedCategory"/>
						</td>

						<td style="width: 200px;padding-right: 0px;border-right: 0px;">
						<div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">
							<s:property value="#p.feed.feedIntroduction"/>
						</div>
						</td>

						<td onmouseover="showRemarks()" style="width: 200px;padding-right: 0px;border-right: 0px;">
						<div style="overflow: scroll;overflow-x: hidden;height: 100px;width: 100%;">

 							<div style="float: right;width: 300px;height: 200px;color: #000000;display: block;" id="hideRemarks">
								<span>
									<s:property value="#p.feed.remarks"/>
								</span>
							</div>
							</div>
						</td>
						<td>
							<s:property value="#p.feed.supplier.supplierId"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.supplier"/>
						</td>
						<td>
							<s:property value="#p.feedInformation.stock"/>
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/feed_toModifyFeed?feedId=${p.feed.feedId}" target="_blank">更改</a>
							<br>
							<%--<a href="${pageContext.request.contextPath }/feed_deleteOne?feedId=${p.feed.feedId}">删除</a>--%>
                            <button type="button" value="${p.feed.feedId}" onclick="deleteOne(this.value)">删除</button>
                            <script type="text/javascript">
                                function deleteOne(id) {
                                    var url = "${pageContext.request.contextPath }/feed_deleteOne";
                                    var data = {"feedId":id };
                                    $.ajax({
                                        type : "get",
                                        async : false,  //同步请求
                                        url : url,
                                        data : data,
                                        timeout:1000,
                                        success:function(dates){
                                            //alert(dates);
                                            showFeedByPage(${pageBean.page});//要刷新的div
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
                <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
                <s:if test="pageBean.page != 1">
                    <a href="javascript:;" class="firstPage" onclick="showFeedByPage(1)">第一页</a>
                    <a onclick="showFeedByPage(<s:property value="pageBean.page-1"/>)" href="javascript:;">上一页</a>
                </s:if>

                <s:iterator var="i" begin="1" end="pageBean.totalPage">
                    <s:if test="pageBean.page != #i">
                        <a onclick="showFeedByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                    </s:if>
                    <s:else>
                        <span class="currentPage"><s:property value="#i"/></span>
                    </s:else>
                </s:iterator>

                <s:if test="pageBean.page != pageBean.totalPage">
                    <a class="nextPage" onclick="showFeedByPage(<s:property value="pageBean.page+1"/>)" href="javascript:;">下一页</a>
                    <a class="lastPage" onclick="showFeedByPage(<s:property value="pageBean.totalPage"/>)" href="javascript:;">最后一页</a>
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
                            showFeedByPage(thePage.value);
                        }
                    }
				</script>
            </div>
		</div>
	</div>
</div>