<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>貼文</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>

<link rel="stylesheet" href="css/fwslider.css" media="all">
<script src="js/jquery-ui.min.js"></script>
<script src="js/fwslider.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<h2>
貼文
</h2>

<h5>新增貼文</h5>
<form action="./ArticleServlet" method="post">

<table  cellspacing="2" cellpadding="1" border="1" width="100%">
<tr>
    <td>貼文標題:</td>
    <td><input type="text" name="title" size="38" maxlength="38"></td>
</tr>

<tr>
    <td>文章內容:</td>
    <td><input type="text" name="text" size="38"></td>
</tr>

<tr>
    <td>會員號碼:</td>
    <td><input type="text" name="memberid" maxlength="38"></td>
</tr>

<tr>
    <td>文章編碼:</td>
    <td><input type="text" name="articleid" maxlength="38"></td>
</tr>

</table>

<input type="submit" name="submit" value="submit">

</form>

<h5>刪除貼文</h5>

<form action="./ArticleServlet" method="post">

<tr>
    <td>貼文編號:</td>
    <td><input type="text" name="articleid" size="38" maxlength="38"></td>
</tr>

<input type="submit" name="submit" value="delete">
</form>


<h5>貼文列表&貼文修改</h5>


<form action="./ArticleServlet" method="post">

<tr>
    <td>貼文編號:</td>
    <td><input type="text" name="title2" size="38" maxlength="38"></td>
</tr>
<input type="submit" name="submit" value="selectId">

<input type="submit" name="submit" value="red_list">
</form>


<h5>貼文標題查詢</h5>

<form action="./ArticleServlet" method="post">

<tr>
    <td>貼文標題:</td>
    <td><input type="text" name="title1" size="38" maxlength="38"></td>
</tr>

<input type="submit" name="submit" value="brsearch">
</form>


<script>

</script>
</body>
</html>