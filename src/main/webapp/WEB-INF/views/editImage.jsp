<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="org.example.webfinal.ImageVO" %>
<%@ page import="org.example.webfinal.ImageService" %>
<%
    // Retrieve image ID from the request parameter
    int id = Integer.parseInt(request.getParameter("id"));

    // Instantiate ImageService and retrieve image by ID
    ImageService imageService = new ImageService();
    ImageVO image = imageService.getImageById(id);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이미지 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Pixabay Clone</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="image/list">이미지 목록</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <h2>이미지 수정</h2>
    <!-- Form action points to the update URL -->
    <form action="/image/update" method="post">
        <!-- Hidden field to pass the image ID for update -->
        <input type="hidden" name="id" value="<%= image.getId() %>">

        <div class="form-group">
            <label for="fileName">파일 이름</label>
            <input type="text" class="form-control" id="fileName" name="fileName" value="<%= image.getFileName() %>" required>
        </div>

        <div class="form-group">
            <label for="publishP">올린 사람</label>
            <input type="text" class="form-control" id="publishP" name="publishP" value="<%= image.getPublishP() %>" required>
        </div>

        <div class="form-group">
            <label for="camType">카메라 종류</label>
            <input type="text" class="form-control" id="camType" name="camType" value="<%= image.getCamType() %>">
        </div>

        <div class="form-group">
            <label for="resolution">해상도</label>
            <input type="text" class="form-control" id="resolution" name="resolution" value="<%= image.getResolution() %>">
        </div>

        <button type="submit" class="btn btn-primary">수정하기</button>
    </form>
</div>
</body>
</html>
