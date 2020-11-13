<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/theme.css" type="text/css">
  <link rel="stylesheet" href="css/my.css">
</head>

<body>
  <nav class="navbar navbar-expand-md navbar-dark bg-secondary">
    <div class="container"> <a class="navbar-brand" href="#">
        <img class="img-fluid d-block" src="imgs/logo.png">
      </a> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar16">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar16">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"> <a class="nav-link" href="index.htmI">首頁</a> </li>
          <li class="nav-item"> <a class="nav-link active" href="#">最新消息</a> </li>
          <li class="nav-item"> <a class="nav-link" href="product-list.html">產品介紹</a> </li>
          <li class="nav-item"> <a class="nav-link" href="contact.html">門市地點</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-5 text-center text-md-right" style="	background-image: url(imgs/page-news.jpg);	background-position: right bottom;	background-size: cover;	background-repeat: repeat;	background-attachment: fixed;">
    <div class="container">
      <div class="row">
        <div class="p-5 mx-auto mx-md-0 ml-md-auto col-10 col-md-9">
          <h3 class="display-4 text-white">最新消息</h3>
        </div>
      </div>
    </div>
  </div>
  <div class="py-3">
    <div class="container">
      <div class="row">
        <div class="text-center col-md-12">
          <h1>最新消息</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-10 col-md-10 p-3 mx-auto">
          <ul class="list-group">
          <c:forEach var="news" items="${listNews}" varStatus="loop">
            <li class="list-group-item">
              <div class="row">
                <div class="col-12 col-sm-3"><c:out value="${news.published_at}"/></div>
                <div class="col-12 col-sm-9"><a href="news-page?id=<c:out value="${news.id}"/>"><c:out value="${news.title}"/></a></div>
              </div>
            </li>
           </c:forEach> 
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="py-3 bg-dark">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center d-md-flex align-items-center"> <img class="img-fluid d-block mr-4" src="imgs/logo.png">
          <ul class="nav mx-md-auto d-flex justify-content-center">
            <li class="nav-item"> <a class="nav-link active" href="index.html">首頁</a> </li>
            <li class="nav-item"> <a class="nav-link" href="news-list.html">最新消息</a> </li>
            <li class="nav-item"> <a class="nav-link" href="product-list.html">產品介紹</a> </li>
            <li class="nav-item"> <a class="nav-link" href="contact.html">門市地點</a> </li>
          </ul>
          <div class="row">
            <div class="col-md-12 d-flex align-items-center justify-content-md-between justify-content-center my-2"> <a href="#">
                <i class="d-block fa fa-facebook-official text-muted fa-lg mx-2"></i>
              </a> <a href="#">
                <i class="d-block fa fa-instagram text-muted fa-lg mx-2"></i>
              </a> <a href="#">
                <i class="d-block fa fa-twitter text-muted fa-lg ml-2"></i>
              </a> </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 text-center">
          <p class="mt-2 mb-0 text-white">© 2014-2018 Cake House. All rights reserved</p>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>