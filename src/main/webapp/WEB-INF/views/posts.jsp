<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
        .logout-btn {
            float: right;
            margin: 10px;
            padding: 5px 10px;
            background-color: #006bb3;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: #004a80;
        }
        .image-thumbnail {
            width: 100px;
            height: auto;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='./delete/' + id;
        }
    </script>
</head>
<body>
<h1>자유게시판</h1>
<a href="../login/logout" class="logout-btn">Logout</a>

<!-- 검색 바 추가 -->
<form action="./list" method="get" style="margin-bottom: 20px;">
    <label>
        <input type="text" name="keyword" placeholder="Search..." value="${param.keyword}" />
    </label>
    <button type="submit">Search</button>
    <button type="button" onclick="location.href='./list';">Reset</button>
</form>

<table id="list" width="90%">
    <tr>
        <th>No</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Description</th>
        <th>Image</th>
        <th>Created Time</th>
        <th>Views</th>
        <th>Likes</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${totalcnt-status.index}</td>
            <td><a href="view/${u.id}">${u.title}</a></td>
            <td>${u.userid}</td>
            <td>${u.description}</td>
            <td>
                <!-- 이미지 파일 경로를 확인하고, 이미지가 있다면 표시 -->
                <c:if test="${not empty u.filename}">
                    <img src="${pageContext.request.contextPath}/upload/${u.filename}" class="image-thumbnail" alt="Image"/>
                </c:if>
                <c:if test="${empty u.filename}">
                    No Image
                </c:if>
            </td>
            <td>
                <fmt:formatDate value="${u.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>${u.views}</td>
            <td>${u.likes}</td>
            <td><a href="edit/${u.id}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.id}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="./add">Add New Post</a>
</body>
</html>
