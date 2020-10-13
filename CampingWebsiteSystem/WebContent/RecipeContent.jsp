<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
 div{
    margin:5px
  
 }



</style>
<title>Content</title>
</head>
<body>
<div align="center">
<a href="<c:url value="./RecipeSelectServlet2?page=1"/>"><input type="button" value="���ЦC��"/></a>
</div>
<table border="1" width="80%" align="center">
<c:forEach var='recipe' items='${list}'>
<tr  align="center">
        <td colspan="8"><h1>${recipe.rename}</h1><br>
            <img src="${recipe.image}" width="500" Height="500" /><br>
            <input type="submit" name="qtysubmit" value="�ʶR����">
        </td>
        
 <tr align="center" > 
        <td><h4>����²�z:</h4></td>
        <td colspan="7"><h4>${recipe.brief}</h4></td>
              
    </tr> 
 <tr align="center"> 
        <td><h4>���ЧǸ�</h4></td>
        <td><h4>${recipe.reid}</h4></td>  
        <td><h4>�w���s�@�ɶ�</h4></td>
        <td><h4>${recipe.time}����</h4></td>
        <td><h4>���q<h4></td>
        <td><h4>${recipe.people}�H��</h4></td>       
    </tr> 
    <tr align="center">   
        <td><h4>����</h4></td>
        <td colspan="7"> ${recipe.ingredient}</td>      
    </tr> 
    <tr>   
        <td align="center"><h4>�B�J�@</h4></td>
        <td colspan="7"> ${recipe.tip1}</td>      
    </tr> 
    <tr>   
        <td align="center"><h4>�B�J�G</h4></td>
        <td colspan="7"> ${recipe.tip2}</td>      
    </tr>
    <c:if test="${recipe.tip3 != 'null'}">
    <tr>   
        <td align="center"><h4>�B�J�T</h4></td>
        <td colspan="7">${recipe.tip3}</td>      
    </tr>
    </c:if>
    <c:if test="${recipe.tip4 != 'null'}">
    <tr>   
        <td align="center"><h4>�B�J�|</h4></td>
        <td colspan="7">${recipe.tip4}</td>      
    </tr>
    </c:if>    
    <c:if test="${recipe.tip5 != 'null'}">
    <tr>   
        <td align="center"><h4>�B�J��</h4></td>
        <td colspan="7">${recipe.tip5}</td>      
    </tr>
    </c:if>   
    <c:if test="${recipe.tip6 != 'null'}">
    <tr>   
        <td align="center"><h4>�B�J��</h4></td>
        <td colspan="7">${recipe.tip6}</td>      
    </tr>
    </c:if>
    <c:if test="${recipe.note != 'null'}">
    <tr>   
        <td align="center"><h4>�p�m�{:</h4></td>
        <td colspan="7">${recipe.note}</td>      
    </tr>
    </c:if> 

</c:forEach>
</table>
<div align="center">
<a href="<c:url value="./RecipeSelectServlet2?page=1"/>"><input type="button" value="���ЦC��"/></a>
</div>
</body>
</html>