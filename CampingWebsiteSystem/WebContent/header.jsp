<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="./MCamp.jsp">露營系統 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./RecipeSelectServlet2?page=1">食材販售</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">會員系統</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href=".\PageServlet">器材販售</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="Campinginsert.jsp">露營活動</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/CampingWebsiteSystem/FormArticle.jsp">部落格</a>
      </li>
     
    </ul>
  </div>
</nav>
</body>
</html>