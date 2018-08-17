<%--
  Created by IntelliJ IDEA.
  User: vinzor
  Date: 18-8-6
  Time: 下午2:47
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","分类名称"))
                return false;
            if(!checkEmpty("categoryPic","分类图片"))
                return false;
            return true;
        });
    });

</script>

<title>分类管理</title>

<div class="workingArea">
    <h1 class="label label-info" >分类管理</h1>
    <a id="add_category" href="#" class="label label-success" >添加分类</a>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>分类名称</th>
                <th>属性管理</th>
                <th>产品管理</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                    <td>${c.name}</td>

                    <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                    <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

    <div class="modal" id="add_category_dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" aria-label="close">
                        <span aria-hidden="true">x</span>
                    </button>
                    <h4 class="modal-title">添加分类</h4>
                </div>
                <div class="modal-body">
                    <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                        <table class="addTable">
                            <tr>
                                <td><label for="name">分类名称</label>
                                    <input  id="name" name="name" type="text" required="required" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="categoryPic">分类图片</label>
                                    <input id="categoryPic" accept="image/*" required="required" type="file" name="image" />
                                </td>
                            </tr>
                            <tr class="submitTR">
                                <td colspan="2" align="center">
                                    <button type="submit" class="btn btn-success">提 交</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="panel panel-warning addDiv">--%>
        <%--<div class="panel-heading">新增分类</div>--%>
        <%--<div class="panel-body">--%>
            <%--<form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">--%>
                <%--<table class="addTable">--%>
                    <%--<tr>--%>
                        <%--<td><label for="name">分类名称</label>--%>
                            <%--<input  id="name" name="name" type="text" required="required" class="form-control">--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <%--<td>--%>
                            <%--<label for="categoryPic">分类图片</label>--%>
                            <%--<input id="categoryPic" accept="image/*" required="required" type="file" name="image" />--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    <%--<tr class="submitTR">--%>
                        <%--<td colspan="2" align="center">--%>
                            <%--<button type="submit" class="btn btn-success">提 交</button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>

<script>
    $("#add_category").click(function () {
        // var draftid = this.id.split("-")[1];
        // $("#edit_id").val(draftid);
        // $("#edit_name").val($("#name_"+draftid).text());
        // $("#edit_description").val($("#description_"+draftid).text());
        // $("#edit_draft_form label.error").remove();
        $("#add_category_dialog").modal("show");
    });
</script>