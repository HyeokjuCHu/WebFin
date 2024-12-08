<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>이미지 업로드</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .header {
      text-align: center;
      padding: 50px;
    }
    .container {
      margin-top: 20px;
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
        <a class="nav-link" href="${pageContext.request.contextPath}/image/list">이미지 목록</a>
      </li>
    </ul>
  </div>
</nav>

<div class="header">
  <h2>이미지 업로드</h2>
</div>
<div class="container">
  <form action="<%= request.getContextPath() %>/image/add" method="post" enctype="multipart/form-data">
  <div class="form-group">
      <label for="user_id">사용자 ID</label>
      <input type="text" class="form-control" id="user_id" name="user_id" required>
    </div>
    <div class="form-group">
      <label for="file">파일 선택</label>
      <input type="file" class="form-control" id="file" name="file" required>
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title" name="title" required>
    </div>
    <div class="form-group">
      <label for="description">설명</label>
      <textarea class="form-control" id="description" name="description"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">업로드</button>
  </form>
</div>
</body>
</html>
