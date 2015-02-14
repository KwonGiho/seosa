<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf"%> 


<%
 String book_kind = request.getParameter("book_kind");
 String book_id = request.getParameter("book_id");
 String id = "";
 int buy_price=0;
 try{
   if(session.getAttribute("id")==null)
     id="not";
   else
     id= (String)session.getAttribute("id");    
}catch(Exception e){}
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

    <title>Book Shopping Mall-상품 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media = "screen">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
 
<%
ShopBookDataBean bookList = null;
String book_kindName="";
  
ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
 
bookList = bookProcess.getBook(Integer.parseInt(book_id));
     
if(book_kind.equals("100"))
	book_kindName="문학";
else if(book_kind.equals("200"))
	book_kindName="외국어";  
else if(book_kind.equals("300"))
	book_kindName="컴퓨터";

%>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>s
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./shopMain1.jsp">Seosa</a>

        </div>
 <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="../shopping/list1.jsp?book_kind=all"">전체</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=100">문학</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=200">외국어</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=300">컴퓨터</a></li>
       <div id="navbar" class="navbar-collapse collapse">
 <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">     
            <%
 try{
   if(session.getAttribute("id")==null){%>

 <%}else{%>
<li><a href="../shopping/cartList1.jsp?book_kind=all">장바구니</a></li>
<li><a href="../shopping/buyList1.jsp">구매목록</a></li>       
    
     <a class="btn btn-default" href="javascript:window.location='../shopping/logout.jsp'" role="button">로그아웃 &raquo;</a>
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
            </div>
          </div>
        </nav>
		<div class="container">
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
      <form name="inform" method="post" action="cartInsert.jsp">
<table> 
   <tr height="30"> 
     <td rowspan="6"  width="198">
        <img src="../../imageFile/<%=bookList.getBook_image()%>" 
             border="0" width="198" height="279"></td> 
     <td width="500"><font size="+1">
       <b><%=bookList.getBook_title() %></b></font></td>
   </tr> 
   <tr><td width="500">저자 : <%=bookList.getAuthor()%></td></tr>
   <tr><td width="500">출판사 : <%=bookList.getPublishing_com()%></td></tr> 
   <tr><td width="500">출판일 : <%=bookList.getPublishing_date()%></td></tr>
   <tr><td width="500">정가 : <%=NumberFormat.getInstance().format(bookList.getBook_price())%>원<br>
      <%buy_price = (int)(bookList.getBook_price()*((double)(100-bookList.getDiscount_rate())/100)) ;%>
            판매가 : <b><font color="red">
            <%=NumberFormat.getInstance().format((int)(buy_price))%>원
            </font></b></td> 
   <tr><td width="500">수량 : <input type="text" size="5"name="buy_count" value="1"> 개
 <%
   if(id.equals("not")){
     if(bookList.getBook_count()==0){
 %>
        <b>일시품절</b>
<%  
     }           
  }else{ 
     if(bookList.getBook_count()==0){
%>
         <b>일시품절</b>
                           
<%   }else{ %>	 
       <input type="hidden" name="book_id" value="<%=book_id %>">
       <input type="hidden" name="book_image" value="<%=bookList.getBook_image()%>">
       <input type="hidden" name="book_title" value="<%=bookList.getBook_title() %>">
       <input type="hidden" name="buy_price" value="<%=buy_price %>">
       <input type="hidden" name="book_kind" value="<%=book_kind %>">              
       <button type="submit" class="btn">장바구니에 담기</button>
<%}}%>
   </td>
  </tr>         
  <tr>
    <td colspan="3" align="left">
       <br><%=bookList.getBook_content()%></td>
  </tr> 
</table>
</form>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="../../assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
  </body>
</html>