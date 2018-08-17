<%--
  Created by IntelliJ IDEA.
  User: vinzor
  Date: 18-8-17
  Time: 下午5:15
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<title>产品属性管理</title>

<script>
    $(function() {
        $("input.pvValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_product_list?cid=${category.id}">${category.name}</a></li>
        <li class="active">${product.name}</li>
        <li class="active">产品属性管理</li>
    </ol>
    <div class="editPVDiv">
        <c:forEach items="${propertyValueList}" var="pv">
            <div class="eachPV">
                <span class="pvName">${pv.property.name}</span>
                <span class="pvValue"><input pvid="${pv.id}" class="pvValue" type="text" value="${pv.value}"></span>
            </div>
        </c:forEach>
        <div style="clear: both"></div>
    </div>

</div>

