<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
</head>
<body>
    <h2>Add Product</h2>
    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br>
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>
        <label for="price">Price:</label><br>
        <input type="number" id="price" name="price" required><br>
        <label for="stock">Stock:</label><br>
        <input type="number" id="stock" name="stock" required><br>
        <label for="active">Active:</label><br>
        <input type="checkbox" id="active" name="active" value="Yes"><br>
        <label for="image">Image:</label><br>
        <input type="file" id="image" name="image" required><br>
        <button type="submit">Add Product</button>
    </form>
</body>
</html>
