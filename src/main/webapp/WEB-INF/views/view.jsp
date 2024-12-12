<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Post</title>
</head>
<body>
<h1>${post.title}</h1>
<p>By: ${post.userid}</p>
<p>${post.description}</p>
<p><strong>Created:</strong> <fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
<p><strong>Views:</strong> ${post.views}</p>
<p><strong>Likes:</strong> ${post.likes}</p> <!-- 좋아요 수 표시 -->
<c:if test="${not empty post.filename}">
    <img src="${pageContext.request.contextPath}/upload/${post.filename}" alt="Post Image" width="500"/>
    <!-- 다운로드 버튼 추가 -->
    <form action="${pageContext.request.contextPath}/download/${post.id}" method="get">
        <button type="submit">Download Image</button>
    </form>
</c:if>

<!-- 좋아요 버튼 추가 -->
<form action="like/${post.id}" method="post">
    <button type="submit">Like</button>
</form>

<br/><br/>
<a href="../list">Back to List</a>
</body>
</html>
