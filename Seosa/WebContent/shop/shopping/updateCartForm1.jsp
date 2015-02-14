<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.CartDBBean" %>

<%@ include file="../etc/color.jspf"%> 

<%
 String cart_id = request.getParameter("cart_id");
 String buy_count = request.getParameter("buy_count");
 String book_kind = request.getParameter("book_kind");
 

 if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain1.jsp");        
 }else{
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>서 사-수량 수정 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="../etc/style.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.min.css" rel="stylesheet" media = "screen">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">
  </head>

  <body>
      <nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./shopMain1.jsp">Seosa</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
 <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
        <%
 try{
   if(session.getAttribute("id")==null){%>

   <form class="form-inline" method="post" action="loginPro.jsp">
  <input type="text" class="input-small" placeholder="id" name="id" size="15" maxlength="50">
  <input type="password" class="input-small" placeholder="Pw" name="passwd" size="15" maxlength="16">
  <button type="submit" class="btn">Sign in</button>
</form>
     
         
 <%}else{%>
<li><a href="../shopping/cartList1.jsp?book_kind=all">장바구니</a></li>
 <li><a href="../shopping/buyList1.jsp">구매목록</a></li>
              
    <!--  <input type="button"  value="로그아웃" 
        onclick="javascript:window.location='../shopping/logout.jsp'">-->
     <a class="btn btn-default" href="javascript:window.location='../shopping/logout.jsp'" role="button">로그아웃 &raquo;</a>
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
        </div>
        </nav>
  
    <form method="POST" name="updateForm"  action="updateCart.jsp" > 
	 변경할 수량 : 
	 <input type="text" name="buy_count" size="5" value="<%=buy_count%>">
     <input type="hidden" name="cart_id" value="<%=cart_id%>">
     <input type="hidden" name="book_kind" value="<%=book_kind%>">
	 <input type="submit" value="변경" >  
</form>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

  </body>
</html>
<%}%>