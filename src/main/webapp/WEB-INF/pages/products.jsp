<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1>Products</h1>

    <c:if test="${!empty allProducts}">
        <table class="table table-striped">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Calories</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="product" items="${allProducts}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.calories}</td>
                    <td>${product.description}</td>
                    <td>
                        <div style="float: left; width: 33%;">
                            <spring:url var="productUrl" value="/productDetails/${product.id}"/>
                            <button class="btn btn-block btn-info" onclick="location.href='${productUrl}'">Select
                            </button>
                        </div>
                        <div style="float: left;width: 33%;">
                            <spring:url var="editUrl" value="/edit/${product.id}"/>
                            <button class="btn btn-block btn-warning" onclick="location.href='${editUrl}'">Edit</button>
                        </div>
                        <div style="float: left; width: 33%">
                            <spring:url var="deleteUrl" value="/delete/${product.id}"/>
                            <form method="post" action="${deleteUrl}">
                                <button class="btn btn-block btn-danger" type="submit">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <spring:url value="/products/add" var="action"/>
    <form:form cssClass="form-inline" action="${action}" modelAttribute="product">

        <form:hidden path="id"/>

        <div class="form-group">
            <form:label path="name">
                <spring:message text="Name"/>
            </form:label>
            <form:input cssClass="form-control" path="name"/>
        </div>

        <div class="form-group">
            <form:label path="calories">
                <spring:message text="Calories"/>
            </form:label>
            <form:input cssClass="form-control" path="calories"/>
        </div>

        <div class="form-group">
            <form:label path="description">
                <spring:message text="Description"/>
            </form:label>
            <form:input cssClass="form-control" path="description"/>
        </div>

        <div class="form-group">
            <c:if test="${product.id eq 0}">
                <input class="btn btn-default" type="submit" value="<spring:message text="Add Product"/>">
            </c:if>
            <c:if test="${product.id > 0}">
                <input class="btn btn-default" type="submit" value="<spring:message text="Edit Product"/>">
            </c:if>
        </div>

    </form:form>
</div>
</body>
</html>
