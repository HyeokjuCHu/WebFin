<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>이미지 목록</title>
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
        <a class="nav-link" href="/image/add">Upload</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container">
  <h2>이미지 목록</h2>
  <table class="table">
    <thead>
    <tr>
      <th>파일 이름</th>
      <th>업로드 날짜</th>
      <th>공개 여부</th>
      <th>좋아요 수</th>
      <th>조회수</th>
      <th>다운로드 수</th>
      <th>카메라 종류</th>
      <th>해상도</th>
      <th>작업</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="image" items="${images}">
      <tr>
        <td>${image.fileName}</td>
        <td>${image.uploadDate}</td>
        <td>${image.publishP}</td>
        <td>${image.likeCnt}</td>
        <td>${image.viewCnt}</td>
        <td>${image.downCnt}</td>
        <td>${image.camType}</td>
        <td>${image.resolution}</td>
        <td>
          <a href="image/edit?id=${image.id}">수정</a>
          <a href="deleteImage?id=${image.id}">삭제</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
