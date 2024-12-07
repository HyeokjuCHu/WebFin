<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>이미지 업로드</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Pixabay Clone</a>
  <div class="collapse navbar-collapse">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="imageList.jsp">이미지 목록</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
  <h2>이미지 업로드</h2>
  <form action="uploadImage" method="post">
    <div class="form-group">
      <label for="fileName">파일 이름</label>
      <input type="text" class="form-control" id="fileName" name="fileName" required>
    </div>
    <div class="form-group">
      <label for="publishP">공개 여부</label>
      <select class="form-control" id="publishP" name="publishP">
        <option value="true">공개</option>
        <option value="false">비공개</option>
      </select>
    </div>
    <div class="form-group">
      <label for="camType">카메라 종류</label>
      <input type="text" class="form-control" id="camType" name="camType">
    </div>
    <div class="form-group">
      <label for="resolution">해상도</label>
      <input type="text" class="form-control" id="resolution" name="resolution">
    </div>
    <button type="submit" class="btn btn-primary">업로드</button>
  </form>
</div>
</body>
</html>