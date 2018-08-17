<%--
  Created by IntelliJ IDEA.
  User: vinzor
  Date: 18-8-6
  Time: 下午6:30
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>属性管理</title>

<%--<script>--%>
    <%--$(function () {--%>
        <%--$("#addForm").submit(function () {--%>
            <%--if(!checkEmpty("name", "产品名称"))--%>
                <%--return false;--%>
            <%--if(!checkEmpty("subTitle", "产品小标题"))--%>
                <%--return false;--%>
            <%--if(!checkEmpty("originalPrice", "原价格"))--%>
                <%--return false;--%>
            <%--if(!checkEmpty("promotePrice", "优惠价格"))--%>
                <%--return false;--%>
            <%--if(!checkEmpty("stock", "库存"))--%>
                <%--return false;--%>
            <%--return true;--%>
        <%--})--%>
    <%--})--%>
<%--</script>--%>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_product_list?cid=${category.id}">${category.name}</a></li>
        <li class="active">产品管理</li>
    </ol>
    <div class="row-fluid">
        <a id="add_product" class="label label-success" href="#">添加产品</a>
    </div>
    <br>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>产品名称</th>
                <th>产品小标题</th>
                <th>原始价格</th>
                <th>优惠价格</th>
                <th>库存数量</th>
                <th>图片管理</th>
                <th>设置属性</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td><img height="20px" src="img/product/${p.id}.jpg"></td>
                    <td id="name_${p.id}">${p.name}</td>
                    <td id="subTitle_${p.id}">${p.subTitle}</td>
                    <td id="originalPrice_${p.id}">${p.originalPrice}</td>
                    <td id="promotePrice_${p.id}">${p.promotePrice}</td>
                    <td id="stock_${p.id}">${p.stock}</td>
                    <td><span class="glyphicon glyphicon-picture"></span> </td>
                    <td><a href="admin_propertyValue_edit?pid=${p.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a id="edit_${p.id}" class="edit_product" href="#"><span class="glyphicon glyphicon-edit"></span></a> </td>
                    <td><a href="admin_product_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span> </a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="modal" id="add_product_dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4 class="modal-title">添加产品</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addForm" action="admin_product_add">
                        <table class="addTable">
                            <tr>
                                <td><label for="name">产品名称</label>
                                    <input id="name" name="name" type="text" required="required" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="subTitle">产品小标题</label>
                                    <input id="subTitle" name="subTitle" type="text" required="required" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="originalPrice">原始价格</label>
                                    <input id="originalPrice" name="originalPrice" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="promotePrice">优惠价格</label>
                                    <input id="promotePrice" name="promotePrice" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="stock">库存</label>
                                    <input id="stock" name="stock" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr class="submitTR">
                                <td colspan="2" align="center">
                                    <input type="hidden" name="cid" value="${category.id}">
                                    <button type="submit" class="btn btn-success">提 交</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="edit_product_dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="close">
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4 class="modal-title">编辑产品</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="editForm" action="admin_product_update" enctype="multipart/form-data">
                        <table class="editTable">
                            <tr>
                                <td><label for="edit_name">产品名称</label>
                                    <input id="edit_name" placeholder="产品名称" name="name" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="edit_subTitle">产品小标题</label>
                                    <input id="edit_subTitle" name="subTitle" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="edit_originalPrice">原始价格</label>
                                    <input id="edit_originalPrice" name="originalPrice" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="edit_promotePrice">优惠价格</label>
                                    <input id="edit_promotePrice" name="promotePrice" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td><label for="edit_stock">库存</label>
                                    <input id="edit_stock" name="stock" required="required" type="text" class="form-control">
                                </td>
                            </tr>
                            <tr class="submitTR">
                                <td colspan="2" align="center">
                                    <%--<input type="hidden" name="id" value="${p.id}">--%>
                                    <%--<input type="hidden" name="cid" value="${p.cid}">--%>
                                    <button type="submit" class="btn btn-success">提交</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

<%--<div class="panel panel-warning addDiv">--%>
        <%--<div class="panel-heading">新增产品</div>--%>
        <%--<div class="panel-body">--%>
            <%--<form method="post" id="addForm" action="admin_product_add">--%>
                <%--<table class="addTable">--%>
                    <%--<tr>--%>
                        <%--<td><label for="name">产品名称</label>--%>
                            <%--<input id="name" name="name" type="text" required="required" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td><label for="subTitle">产品小标题</label>--%>
                            <%--<input id="subTitle" name="subTitle" type="text" required="required" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td><label for="originalPrice">原始价格</label>--%>
                            <%--<input id="originalPrice" name="originalPrice" required="required" type="text" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td><label for="promotePrice">优惠价格</label>--%>
                            <%--<input id="promotePrice" name="promotePrice" required="required" type="text" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td><label for="stock">库存</label>--%>
                            <%--<input id="stock" name="stock" required="required" type="text" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr class="submitTR">--%>
                        <%--<td colspan="2" align="center">--%>
                            <%--<input type="hidden" name="cid" value="${category.id}">--%>
                            <%--<button type="submit" class="btn btn-success">提 交</button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>

<script>
    $("#add_product").click(function () {
        // var draftid = this.id.split("-")[1];
        // $("#edit_id").val(draftid);
        // $("#edit_name").val($("#name_"+draftid).text());
        // $("#edit_description").val($("#description_"+draftid).text());
        // $("#edit_draft_form label.error").remove();
        $("#add_product_dialog").modal("show");
    });

    $(".edit_product").click(function () {
        var pid = this.id.split("_")[1];
        // $("#edit_id").val(draftid);
        $("#edit_name").val($("#name_"+pid).text());
        $("#edit_subTitle").val($("#subTitle_"+pid).text());
        $("#edit_originalPrice").val($("#originalPrice_"+pid).text());
        $("#edit_promotePrice").val($("#promotePrice_"+pid).text());
        $("#edit_stock").val($("#stock_"+pid).text());
        // $("#edit_draft_form label.error").remove();
        $("#edit_product_dialog").modal("show");
    });

</script>