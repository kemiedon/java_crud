<%@ page import="java.io.*,java.util.*, javax.servlet.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <style>
    <%@include file="../theme.css"%>
  </style>
</head>

<body>
<%@include file="../parts/navbar.jsp"%>
  <div class="text-center py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 p-3">
          <h1 class="mb-0 text-left">產品管理</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"> <a href="#">首頁</a> </li>
            <li class="breadcrumb-item active">產品管理</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="pb-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <a href="<%=request.getContextPath()%>/list" class="btn btn-sm btn-primary my-3">回列表</a>

            <form action="insert" method="post" class="justify-content-center" enctype="multipart/form-data">
         
            <h2 class="my-2">
             		新增產品
            </h2>
            <c:if test="${product != null}">
              <input type="hidden" name="id" value="<c:out value='${product.id}' />" />
            </c:if>
            <div class="form-group"> <label>產品圖片</label> 
            <img src="../uploads/products" />
            <input type="file" class="form-control" name="name" value="<c:out value='${product.name}' />"> </div>
            <div class="form-group"> <label>產品名稱</label> <input type="text" class="form-control" name="name" placeholder="輸入產品名稱" value="<c:out value='${product.name}' />"> </div>
            <div class="form-group"> <label>價格</label> <input type="text" class="form-control" name="price" placeholder="輸入 價格" value="<c:out value='${product.price}' />"> </div>
            <div class="col-md-12 d-flex justify-content-end">
            <%   Date date = new Date();%>

              <input type="hidden" class="form-control" name="created_at" value="<%= date.toString()%>">	 

              <button type="submit" class="btn btn-primary d-inline-flex">確定送出</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="py-3">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <p class="mb-0">© 2014-2018 MacroViz. All rights reserved</p>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>