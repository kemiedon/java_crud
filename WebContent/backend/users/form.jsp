<%@ page import="java.io.*,java.util.*, javax.servlet.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
          <h1 class="mb-0 text-left">使用者管理</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"> <a href="#">首頁</a> </li>
            <li class="breadcrumb-item active">使用者管理</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="pb-5">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <a href="<%=request.getContextPath()%>/user/list" class="btn btn-sm btn-primary my-3">回列表</a>
			<c:if test="${one_user == null}">
            <form action="insert" method="post" class="justify-content-center">
			</c:if>
			<c:if test="${one_user != null}">
            <form action="update" method="post" class="justify-content-center">
			</c:if>
            <h2 class="my-2">     
            <c:if test="${one_user != null}">
            	編輯使用者
            </c:if>     
            <c:if test="${one_user == null}">
            	新增使用者
            </c:if>
                
            </h2>
            
            <div class="form-group"> <label>使用者名稱</label> 
            <input type="text" class="form-control" name="name1" placeholder="輸入使用者名稱" value="<c:out value="${one_user.name}" />"> </div>
            <div class="form-group"> <label>E-mail</label> 
            <input type="email" class="form-control" name="email1" placeholder="輸入 email" value="<c:out value="${one_user.email}"/>" > </div>
            <div class="col-md-12 d-flex justify-content-end">
            <%   Date date = new Date();%>
            	<c:if test="${one_user == null}">
            		<input type="hidden" class="form-control" name="created_at" value="<%= date.toString()%>">	 
            	</c:if>
               <c:if test="${one_user != null}">
            		<input type="hidden" class="form-control" name="updated_at" value="<%= date.toString()%>">	 
            	</c:if>
            	<input type="hidden" class="form-control" name="id" value="<c:out value="${one_user.id}" />">	 
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
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>