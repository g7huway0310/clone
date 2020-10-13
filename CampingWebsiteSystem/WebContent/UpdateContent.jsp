<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>請輸入修改貼文內容</title>
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

<script type="text/javascript">
        $(document).ready(function() {
            $(".dropdown img.flag").addClass("flagvisibility");

            $(".dropdown dt a").click(function() {
                $(".dropdown dd ul").toggle();
            });
                        
            $(".dropdown dd ul li a").click(function() {
                var text = $(this).html();
                $(".dropdown dt a span").html(text);
                $(".dropdown dd ul").hide();
                $("#result").html("Selected value is: " + getSelectedValue("sample"));
            });
                        
            function getSelectedValue(id) {
                return $("#" + id).find("dt a span.value").html();
            }

            $(document).bind('click', function(e) {
                var $clicked = $(e.target);
                if (! $clicked.parents().hasClass("dropdown"))
                    $(".dropdown dd ul").hide();
            });


            $("#flagSwitcher").click(function() {
                $(".dropdown img.flag").toggleClass("flagvisibility");
            });
        });
     </script>
</head>
<body>
<jsp:include page="./header.jsp" />

<jsp:useBean id="updcon" class="article.ArticleBean" scope="session"/>
<h2>
修改貼文
</h2>
<form action=".\ArticleServlet" method="post">
<table  cellspacing="2" cellpadding="1" border="1" width="100%">

<tr bgcolor="#FFFFE1">
    <td>貼文標題:</td>
       <td><input type="text" name="title" size="38" maxlength="38"></td>
    <td><jsp:getProperty name="updcon" property="title" /></td>
</tr>

<tr bgcolor="#F2F4FB">
    <td>貼文內容:</td>
        <td><input type="text" name="text" size="80" maxlength="500"></td>
    <td><jsp:getProperty name="updcon" property="text" /></td>
</tr>

<tr bgcolor="#F2F4FB">
    <td>會員編號:</td>
        <td><input type="text" name="memberid" size="80" maxlength="80"></td>
    <td><jsp:getProperty name="updcon" property="memberid" /></td>
</tr>

<tr bgcolor="#FFFFE1">
    <td>貼文編碼:</td>
        <td><input type="text" name="articleid" size="80" maxlength="80"></td>
    <td><jsp:getProperty name="updcon" property="articleid" /></td>
</tr>

</table>
<input type="submit" name="submit" value="submitUpdate">
</form>



</body>
</html>