<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stunning Royalty-Free Images</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            text-align: center;
            padding: 50px;
        }
        .search-bar {
            margin-bottom: 30px;
        }
        .image-card {
            margin: 10px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Stunning Royalty-Free Images & Royalty-Free Stock</h1>
    <form action="search" method="GET" class="search-bar">
        <input type="text" name="query" placeholder="Search for free Images, Videos, Music & more" class="form-control" style="width: 400px; display: inline-block;">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
    <div>
        <a href="image/add" class="btn btn-success">Upload</a>
    </div>
</div>

<div class="container">
    <h2>Over 5.2 million+ high quality stock images, videos and music shared by our talented community.</h2>
    <div class="row">
        <c:forEach var="image" items="${imageList}">
            <div class="col-md-4 image-card">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/images/${image.filename}" class="card-img-top" alt="${image.title}">
                    <div class="card-body">
                        <h5 class="card-title">${image.title}</h5>
                        <p class="card-text">${image.description}</p>
                        <p>Likes: ${image.likes} | Views: ${image.views}</p>
                        <a href="image/edit?id=${image.id}" class="btn btn-warning">Edit</a>
                        <form action="image/delete" method="POST" style="display:inline;">
                            <input type="hidden" name="id" value="${image.id}"/>
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
