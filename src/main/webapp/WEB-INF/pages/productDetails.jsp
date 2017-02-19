<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1>Product</h1>
<table class=" table table-bordered">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Calories</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td>${product.calories}</td>
        <td>${product.description}</td>
    </tr>
</table>
<button class="btn btn-default" onclick="location.href='/products'">Go Back</button>
</div>
</body>
</html>
