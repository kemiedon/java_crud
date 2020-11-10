<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cake House-純手作的幸福甜點</title>
  <link rel="stylesheet" href="css/theme.css">
  <link rel="stylesheet" href="css/my.css">
</head>

<body>
  <%@include file="parts/front_navbar.jsp" %>
  <div id="Banner">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="imgs/hero-1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="imgs/strawberry.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="imgs/choco.jpg" class="d-block w-100" alt="...">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <section id="News" class="py-5">
    <div class="container">
      <h2 class="text-center pb-4">最新消息</h2>
      <div class="row">
        <div class="col-12 col-md-8 mx-auto">
          <ul class="list-group">
            <li class="list-group-item">
              <div class="row">
                <div class="col-12 col-sm-3">2020-10-29</div>
                <div class="col-12 col-sm-9"><a href="news.html">萬聖節派對蛋糕製作課程</a></div>
              </div>
            </li>
            <li class="list-group-item">
              <div class="row">
                <div class="col-12 col-sm-3">2020-10-15</div>
                <div class="col-12 col-sm-9"><a href="">杯子蛋糕DIY活動</a></div>
              </div>
            </li>
            <li class="list-group-item">
              <div class="row">
                <div class="col-12 col-sm-3">2020-10-05</div>
                <div class="col-12 col-sm-9"><a href="">新品上市-法式馬卡龍</a></div>
              </div>
            </li>
            <li class="list-group-item">
              <div class="row">
                <div class="col-12 col-sm-3">2020-09-29</div>
                <div class="col-12 col-sm-9"><a href="">新品上市-彩虹蛋糕</a></div>
              </div>
            </li>

          </ul>
        </div>
      </div>

    </div>
  </section>
  <section id="HotProduct" class="py-5">
    <div class="container">
      <h2 class="text-center pb-4">熱銷產品</h2>
      <div class="row">
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-1.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">原味核桃杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-2.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">經典巧克力杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-3.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">莓果巧克力杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-4.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">彩虹杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-5.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">草莓巧克力杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-6.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">雙莓杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-7.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">經典紅絲絨杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-12 col-sm-3 mb-4">
          <a href="product.html">
            <div class="card">
              <img src="imgs/product/product-8.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <p class="card-text">
                  <h5 class="text-center">草莓紅絲絨杯子蛋糕</h5>
                </p>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </section>
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
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js">
  </script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js">
  </script>
</body>

</html>