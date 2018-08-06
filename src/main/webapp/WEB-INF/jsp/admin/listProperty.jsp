<%--
  Created by IntelliJ IDEA.
  User: vinzor
  Date: 18-8-6
  Time: 下午6:30
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>属性管理</title>

<script>
    $(function () {
        $("#addForm").submit(function () {
            if(!checkEmpty("name", "属性名称"))
                return false;
            return true;
        })
        
    })
</script>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
        <li class="active">属性管理</li>
    </ol>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
                <tr class="success">
                    <th>ID</th>
                    <th>名称</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${propertyList}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td><a href="admin_property_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a> </td>
                        <td><a deleteLink="true" href="admin_property_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span> </a> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增属性</div>
        <div class="panel-body">
            <form class="addTable">

            </form>
        </div>
    </div>
</div>
