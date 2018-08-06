<%--
  Created by IntelliJ IDEA.
  User: vinzor
  Date: 18-8-6
  Time: 下午4:24
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
        pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>编辑分类</title>

<script>
    $(function() {
        $("#editForm").submit(function () {
            if (!checkEmpty("name", "分类名称"))
                return false;
            return true;
        });
    });
</script>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li class="active">编辑分类</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-header">编辑分类</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_category_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td><label for="name">分类名称</label><input id="name" name="name" value="${c.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="categoryPic">分类图片</label> <input id="categoryPic" accept="image/*" type="file" name="image"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" aligen="center">
                            <input type="hidden" name="id" value="${c.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>