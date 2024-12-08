<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Image List</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      padding: 20px;
    }
    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
      background-color: #fff;
      border-radius: 5px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }
    th {
      background-color: #4CAF50;
      color: white;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #e9ecef;
    }
    .button {
      display: inline-block;
      padding: 10px 15px;
      margin: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      text-decoration: none;
    }
    .button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Pixabay Clone</a>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/image/add">이미지 업로드</a>
      </li>
    </ul>
  </div>
</nav>

<h1>Image List</h1>
<a class="button" href="${pageContext.request.contextPath}/image/add">Add New Image</a>

<div style="overflow-x: auto;">
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>User ID</th>
      <th>Filename</th>
      <th>Title</th>
      <th>Description</th>
      <th>Likes</th>
      <th>Views</th>
      <th>Created At</th>
      <th>Updated At</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty imageList}">
        <c:forEach items="${imageList}" var="image">
          <tr>
            <td>${image.id}</td>
            <td>${image.user_id}</td>
            <td>${image.filename}</td>
            <td>${image.title}</td>
            <td>${image.description}</td>
            <td>${image.likes}</td>
            <td>${image.views}</td>
            <td>${image.created_at}</td>
            <td>${image.updated_at}</td>
            <td>
              <a href="${pageContext.request.contextPath}/image/edit?id=${image.id}" aria-label="Edit Image ${image.id}">Edit</a> |
              <form action="${pageContext.request.contextPath}/image/delete" method="POST" style="display: inline;">
                <input type="hidden" name="id" value="${image.id}">
                <button type="submit" style="background: none; border: none; color: #4CAF50; text-decoration: underline; cursor: pointer;" aria-label="Delete Image ${image.id}">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="10" style="text-align: center;">No images found.</td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>
