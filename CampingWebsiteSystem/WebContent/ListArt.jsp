<%@page import="article.ArticleBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>文章列表</title>
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

<table border="1" width="1800px" align"center">
	<tr>
		<td colspan="2" align="center" bgcolor="lightblue"><h2>文章列表</h2></td>
		<td colspan="2" align="center" bgcolor="lightblue"><h2>內容</h2></td>
	</tr> 
	
	<tr>
		<th aligh="center" width="300px">MemberID</th>
			
		<th aligh="center" width="500px">Title</th>

		<th aligh="center" width="1000px">Text</th>
	</tr>

<c:forEach var="article" items="${alist}">
	<tr>
		<td>${article.memberid}</td>
		<td>${article.title}</td>
		<td>${article.text}</td>
	
	</tr>

</c:forEach>



<%
	ArrayList<ArticleBean> list = (ArrayList<ArticleBean>)request.getAttribute("alist"); 
	for(int i = 0; i<list.size(); i++){
		ArticleBean articleBean = list.get(i);
		System.out.println("text = "+articleBean.getText());
		System.out.println("title = "+articleBean.getTitle());
		System.out.println("ID = "+articleBean.getMemberid());
%>		
		<tr>
			<td><%= list.get(i).getMemberid() %></td>
			<td><%=list.get(i).getTitle() %></td>
			<td><%=list.get(i).getText() %></td>
		</tr>

<%		
	}
%>

	

</table>
<div class="header">
<div class="row">
			  <div class="col-md-12">
				 <div class="header-left">
					 <div class="logo">
						<a href="index.html"><img src="images/logo.png" alt=""/></a>
					 </div>
					 <div class="menu">
						  <a class="toggleMenu" href="#"><img src="images/nav.png" alt="" /></a>
						    <ul class="nav" id="nav">
						    	<li><a href="<c:url value='.\PageServlet' />">Shop</a></li>
						    	<li><a href="team.html">Team</a></li>
						    	<li><a href="experiance.html">Events</a></li>
						    	<li><a href="experiance.html">Experiance</a></li>
						    	<li><a href="shop.html">Company</a></li>
								<li><a href="contact.html">Contact</a></li>								
								<div class="clear"></div>
							</ul>
							<script type="text/javascript" src="js/responsive-nav.js"></script>
				    </div>							
	    		    <div class="clear"></div>
	    	 </div>
	    	 </div>
 </div>
	    	
</div>

</body>
</html>