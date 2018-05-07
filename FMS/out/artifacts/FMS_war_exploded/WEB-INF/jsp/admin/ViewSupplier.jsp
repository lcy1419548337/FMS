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
                            供应商编号
                        </th>
                        <th>
                            供应商名称
                        </th>
                        <th>
                            供应商地址
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
                                <s:property value="#r.supplierId"/>
                            </td>
                            <td>
                                <s:property value="#r.supplierName"/>
                            </td>
                            <td>
                                <s:property value="#r.supplierLocation"/>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/supplier_toModifySupplier?supplierId=${r.supplierId}" target="_blank">更改</a>
                                <a href="${pageContext.request.contextPath}/supplier_toDeleteSupplier?supplierId=${r.supplierId}">移除</a>
                            </td>
                        </tr>
                    </s:iterator>

                    </tbody>
                </table>
                <div class="pagination" align="center" style="display: block;">
                    <button type="button" onclick="showSupplierByPage(${pageBean.page})">刷新</button>
                    <span>第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
                    <s:if test="pageBean.page != 1">
                        <a href="javascript:;" class="firstPage" onclick="showSupplierByPage(1)">第一页</a>
                        <a onclick="showSupplierByPage()(page=<s:property value="pageBean.page-1"/>)" href="javascript:;">上一页</a>
                    </s:if>

                    <s:iterator var="i" begin="1" end="pageBean.totalPage">
                        <s:if test="pageBean.page != #i">
                            <a onclick="showSupplierByPage(<s:property value="#i"/>)" href="javascript:;"><s:property value="#i"/></a>
                        </s:if>
                        <s:else>
                            <span class="currentPage"><s:property value="#i"/></span>
                        </s:else>
                    </s:iterator>

                    <s:if test="pageBean.page != pageBean.totalPage">
                        <a class="nextPage" onclick="showSupplierByPage(<s:property value="pageBean.page+1"/>)" href="javascript:;">下一页</a>
                        <a class="lastPage" onclick="showSupplierByPage(<s:property value="pageBean.totalPage"/>)" href="javascript:;">最后一页</a>
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
                                showSupplierByPage(thePage.value);
                            }
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>

