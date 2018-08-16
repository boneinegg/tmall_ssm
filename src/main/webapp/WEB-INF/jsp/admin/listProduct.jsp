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

<script>
    $(function () {
        $("#addForm").submit(function () {
            return checkEmpty("name", "产品名称");
        })

    })
</script>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_property_list?cid=${category.id}">${category.name}</a></li>
        <li class="active">产品管理</li>
    </ol>
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
                    <td>${p.name}</td>
                    <td>${p.subTitle}</td>
                    <td>${p.originalPrice}</td>
                    <td>${p.promotePrice}</td>
                    <td>${p.stock}</td>
                    <td><span class="glyphicon glyphicon-picture"></span> </td>
                    <td><span class="glyphicon glyphicon-th-list"></span> </td>
                    <td><a href="admin_product_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a> </td>
                    <td><a href="admin_product_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span> </a> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_product_add">
                <table class="addTable">
                    <tr>
                        <td><label for="name">产品名称</label><input id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="subTitle">产品小标题</label><input id="subTitle" name="subTitle" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="originalPrice">原始价格</label><input id="originalPrice" name="originalPrice" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="promotePrice">优惠价格</label><input id="promotePrice" name="promotePrice" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td><label for="stock">库存</label><input id="stock" name="stock" type="text" class="form-control"></td>
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
