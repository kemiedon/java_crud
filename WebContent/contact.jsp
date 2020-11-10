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
          <li class="nav-item"> <a class="nav-link" href="index.html">首頁</a> </li>
          <li class="nav-item"> <a class="nav-link" href="news-list.html">最新消息</a> </li>
          <li class="nav-item"> <a class="nav-link" href="product-list.html">產品介紹</a> </li>
          <li class="nav-item"> <a class="nav-link active" href="">門市地點</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-5 text-center text-md-right" style="	background-image: url(imgs/choco.jpg);	background-position: right bottom;	background-size: cover;	background-repeat: repeat;	background-attachment: fixed;">
    <div class="container">
      <div class="row">
        <div class="p-5 mx-auto mx-md-0 ml-md-auto col-10 col-md-9">
          <h3 class="display-4 text-white">產品介紹</h3>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12" style="">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"> <a href="#">首頁</a> </li>
            <li class="breadcrumb-item active">門市地點</li>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="p-0 order-2 order-lg-1 col-lg-5"> <img class="img-fluid d-block" src="imgs/product/details/product-big-5.jpg"> </div>
        <div class="d-flex flex-column justify-content-center p-3 order-1 order-lg-2 col-lg-7">
          <h3 class="">關於Cake House</h3>
          <p class="lead mb-0" contenteditable="true">Cake House 成立於1988年，創辦人為Jay&amp;Judy<br>我們為了讓更多人吃到安心又好吃的手作甜點，採用法國奶油、日本麵粉，致力完成讓全世界都吃得到的幸福甜點</p>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="">門市地點</h2><iframe width="100%" height="400" src="https://maps.google.com/maps?q=New%20York&amp;z=14&amp;output=embed" scrolling="no" frameborder="0"></iframe>
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