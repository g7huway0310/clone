<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />  
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>  
    <title>食譜 的主頁</title>
<style type="text/css">
    h1{
       text-align:center;
    }
    td{
      text-align:center;
    }
    h6{
    text-align:left;
    }
    ul{
    margin:0 auto;
    }
    li {
    float:left;
    text-align:center;
    list-style-type:none;
    margin:0 auto;
    }  
    .page{
    margin:0 auto;
    text-align:center;
    text-justify: distribute
    }  
</style>
</head>
<body>
	 
<jsp:include page="/header.jsp" />

<h1>露營料理食譜</h1>
<c:set var="funcName" value="SHO" scope="session"/>
<!-- 判斷購物車內是否有商品 -->
<c:choose>
   <c:when test="${RecipeShoppingCart.itemNumber > 0}">
      <!-- 購物車內有一項以上的商品 -->
      <c:set var="cartContent" value="購物車內有${RecipeShoppingCart.itemNumber}項商品"/>
   </c:when>
   <c:otherwise>
      <!-- 購物車內沒有商品 -->
      <c:set var="cartContent" value="您尚未購買任何商品"/>        
   </c:otherwise>
</c:choose>
<table border="1" width="80%" align="center">
<tr>
<td colspan="6">${cartContent} &emsp;&emsp;&emsp;
<a href="<c:url value='./ShowRecipeCartContent.jsp?page=${page}' />"><svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-cart4" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg></a>
金額小計(OK):<c:out value="${RecipeShoppingCart.subtotal}" default="0"/> 元 &emsp;&emsp;&emsp;

</td>
</tr>
    <tr class="table-active" align="center" valign="top">
        <td colspan="6">
                                第${page}頁 / 共${totalPages}頁            
            <a href="NewRecipe.jsp"><input type="button" value="分享食譜"/></a>
            <a href="DeleteRecipe.jsp"><input type="button" value="刪除食譜"/></a>
            <a href="<c:url value="./RecipeSelectServlet2?page=1"/>"><input type="button" value="食譜列表"/></a>
            <a href="<c:url value="./RecipeOrderListServlet"/>"><input type="button" value="查看訂單"/></a>
            <form action="./RecipeServlet" method="post">
            請輸入更新食譜序號 <input type="text" name="upid" title=""/><input type="submit" name="preUp" value="更新食譜"/>
            </form>
        </td>
    </tr>
    <tr align="center">
        <td colspan="6">
            <form action="./RecipeSelectServlet2" method="post">
                食譜關鍵字：<input type="text" name="re_name" title=""/><input type="submit" name="submit" value="查詢"/>
            </form>
        </td>
    </tr>
 
    <tr>
        <th>食譜名稱</th>
        <th>食譜簡述</th>
        <th>份量</th>
        <th>預估製作時間</th>
        <th>價格</th>
        <th>購買食材</th>
    </tr>
    <div class="shadow-sm p-3 mb-5 bg-white rounded">
    <c:forEach var='recipe' items='${bean}'>
    <tr class="table-success">
        <td><a href="<c:url value='/RecipeContentServlet?reid=${recipe.reid}'/>"><img src="${recipe.image}" width="250" Height="250" /><br>${recipe.rename}</a></td>
        <td>${recipe.brief}<br><br>
        <font>食材:${recipe.ingredient}</font>
        </td>
        <td width="60">${recipe.people}人份</td>
        <td>${recipe.time}分鐘</td>
        <c:if test="${recipe.price>0}">
        <td>${recipe.price}元</td>
        <form action="<c:url value='./BuyRecipeServlet'/>" method="POST">
         <td>購買數量:
               <select name='qty'>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>  
                  <select/>  
                  
         
         <!-- 這些隱藏欄位都會送到後端 -->
               <Input type='hidden' name='REID' value='${recipe.reid}'>
               <Input type='hidden' name='rename' value='${recipe.rename}'>
               <Input type='hidden' name='ingredient' value='${recipe.ingredient}'>
               <Input type='hidden' name='page' value='${param.page}'>
               <Input type='hidden' name='price' value='${recipe.price}'>
               <Input type='hidden' name='discount' value='${recipe.discount}'>  
         
        <input type="submit" name="cart" value="放入購物車">
        <c:if test="${recipe.discount<1}">
         <h6><FONT COLOR='RED'>本月主打,購買打${recipe.discount*10}折</h6>                
         </c:if></c:if><td/>
         <c:if test="${recipe.price<=0}">
         <td><td/>
         <td><td/>
         </c:if>
        </form>
    </tr>
    </c:forEach>
    </div>
</table>
<form action="/RecipeSelectServlet2" method="post">
        <div class="container">
            <nav width="100%" align="center" class="page">
                <ul>
                    <li><a href="<c:url value="./RecipeSelectServlet2?page=1"/>">首頁</a>&emsp;</li>
                    <li><a href="<c:url value="./RecipeSelectServlet2?page=${page-1>1?page-1:1}"/>">上一頁</a> &emsp;
                    </li>

                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                        <c:set var="active" value="${loop.index==page?'page':''}"/>
                        <li ${page}">
                            <a href="<c:url value="./RecipeSelectServlet2?page=${loop.index}&re_name=${rename1}"/>">${loop.index}</a> &emsp;
                        </li>
                    </c:forEach>
                    <li>
                        <a href="<c:url value="./RecipeSelectServlet2?page=${page+1<totalPages?page+1:totalPages}&re_name=${rename1}"/>">下一頁</a> &emsp;
                    </li>
                    <li>
                        <a href="<c:url value="./RecipeSelectServlet2?page=${totalPages}&re_name=${rename1}"/>">尾頁</a> &emsp;
                    </li>
                </ul>
            </nav>
        </div>
   


</form>
</body>
</html>