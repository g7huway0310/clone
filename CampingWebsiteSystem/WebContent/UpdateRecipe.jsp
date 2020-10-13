<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��s����</title>
</head>
<body>
<h2>
��s����
</h2>
<form action=".\RecipeServlet" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="100%">
<c:forEach var='recipe' items='${list}'>
<tr>
    <td width="30">�п�J�Q�ק諸���ЧǸ�</td>
    <td><input type="text" name="reid" size="5" maxlength="5" value="${recipe.reid}"></td>
</tr>
<tr>
    <td>���ЦW��</td>
    <td><input type="text" name="rename" size="10" maxlength="10" value="${recipe.rename}">   
    </td>
</tr>
<tr>
    <td>����²��</td>
    <td><textarea name="brief" cols="40" rows="5" >${recipe.brief}</textarea>(���r200�Ӧr)</td>
</tr>
<tr>
    <td width="150">�Ϥ��W��</td>
    <td><input type="text" name="img" size="100" maxlength="200" value="${recipe.image}"></td>
</tr>
<tr>
    <td>����</td>
     <td><textarea cols="50" rows="5" name="INGREDIENTS" >${recipe.ingredient}</textarea></td>
</tr>
<tr>
    <td>�B�J�@</td>
     <td><textarea cols="50" rows="5" name="tip1" >${recipe.tip1}</textarea></td>
</tr>
<tr>
    <td>�B�J�G</td>
    <td><textarea cols="50" rows="5" name="tip2" >${recipe.tip2}</textarea></td>
</tr>
<tr>
    <td>�B�J�T</td>
    <td><textarea cols="50" rows="5" name="tip3" >${recipe.tip3}</textarea></td>
</tr>
<tr>
    <td>�B�J�|</td>
    <td><textarea cols="50" rows="5" name="tip4" >${recipe.tip4}</textarea></td>
</tr>
<tr>
    <td>�B�J��</td>
    <td><textarea cols="50" rows="5" name="tip5">${recipe.tip5}</textarea></td>
</tr>
<tr>
    <td>�B�J��</td>
    <td><textarea cols="50" rows="5" name="tip6">${recipe.tip6}</textarea></td>
</tr>
<tr>
    <td>�Ƶ�</td>
    <td><textarea cols="50" rows="5" name="note">${recipe.note}</textarea></td>
</tr>
<tr>
    <td>���q</td>
    <td><input type="text" name="people" size="5" maxlength="5" value="${recipe.people}">/�H��   
    </td>
</tr>
<tr>
    <td>�w���s�@�ɶ�</td>
    <td><input type="text" name="time" size="5" maxlength="5" value="${recipe.time}">/����   
    </td>
</tr>
</c:forEach>
</table>
<center>
<input type="submit" name="Update" value="�e�X">
<a href="Recipe.jsp"><input type="button" value="����"/></a>
</center>
</form>
</body>
</html>