<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Image</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .cancel {
            background-color: #f44336;
        }

        .cancel:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<h1>Edit Image</h1>
<form action="${pageContext.request.contextPath}/image/update" method="post">
    <input type="hidden" name="id" value="${image.id}"/> <!-- 이미지 ID 숨김 필드 -->

    <label for="user_id">User ID</label>
    <input type="text" id="user_id" name="user_id" value="${image.user_id}" required/>

    <label for="filename">Filename</label>
    <input type="text" id="filename" name="filename" value="${image.filename}" required/>

    <label for="title">Title</label>
    <input type="text" id="title" name="title" value="${image.title}" required/>

    <label for="description">Description</label>
    <textarea id="description" name="description" rows="4" required>${image.description}</textarea>

    <label for="likes">Likes</label>
    <input type="number" id="likes" name="likes" value="${image.likes}" min="0"/>

    <label for="views">Views</label>
    <input type="number" id="views" name="views" value="${image.views}" min="0"/>

    <input type="submit" value="Update Image"/>
    <a class="cancel" href="${pageContext.request.contextPath}/image/list">Cancel</a> <!-- 취소 링크 -->
</form>
</body>
</html>
