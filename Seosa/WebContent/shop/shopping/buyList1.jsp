<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.BuyDataBean" %>
<%@ page import = "bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<%
  String buyer = (String)session.getAttribute("id");
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

    <title>서 사-구매목록 페이지</title>

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
          <ul class="nav navbar-nav">
            <li class="active"><a href="../shopping/list1.jsp?book_kind=all"">전체</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=100">문학</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=200">외국어</a></li>
            <li><a href="../shopping/list1.jsp?book_kind=300">컴퓨터</a></li>
            
               <%
 try{
   if(session.getAttribute("id")==null){%>

      
   <form name="inform" method="post" action="loginPro.jsp">
         아이디:  <input type="text" name="id" size="15" maxlength="50">
         비밀번호:  <input type="password" name="passwd" size="15" maxlength="16">
    <input type="submit" name="Submit" value="로그인">
   </form>
 <%}else{%>
<li><a href="../shopping/cartList1.jsp?book_kind=all">장바구니</a></li>
 <li><a href="../shopping/buyList1.jsp">구매목록</a></li>
    
     <a class="btn btn-default" href="javascript:window.location='../shopping/logout.jsp'" role="button">로그아웃 &raquo;</a>
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
 </ul>
            </div>
          </div>
        </nav>
 
		<div class="container">
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
  
<%

List<BuyDataBean> buyLists = null;
BuyDataBean buyList = null;
int count = 0;
int number = 0;
int total = 0;
long compareId=0;
long preId=0;

if(session.getAttribute("id")==null){
   response.sendRedirect("shopMain1.jsp");        
}else{
   BuyDBBean buyProcess = BuyDBBean.getInstance();
   count = buyProcess.getListCount(buyer);

   if(count == 0){
%>
   <h3><b>구매목록</b></h3>
   
   <table> 
     <tr><td align="center" >구매목록이 없습니다.</td> </tr>
   </table>
      <!-- <input type="button" value="메인으로" 
         onclick="javascript:window.location='shopMain1.jsp'">-->
      <p><a class="btn btn-default" href="javascript:window.location='shopMain1.jsp'" role="button">메인으로 &raquo;</a></p>        
         
<%
  }else{
    buyLists = buyProcess.getBuyList(buyer);
%>
    <h3><b>구매목록</b></h3>
<%
    for(int i=0;i<buyLists.size();i++){
       buyList = buyLists.get(i);
    	 
       if(i<buyLists.size()-1){
    	  BuyDataBean compare = buyLists.get(i+1);
    	  compareId = compare.getBuy_id();
    		 
    	  BuyDataBean pre = buyLists.get(buyLists.size()-2);
    	  preId = pre.getBuy_id();
       }  	 
%>
   <table> 
      <tr> 
        <td width="150">번호</td> 
        <td width="300">책이름</td> 
        <td width="100">판매가격</td>
        <td width="50">수량</td> 
        <td width="150">금액</td>
      </tr>
      <tr> 
        <td align="center"  width="150"><%=buyList.getBuy_id()%></td> 
        <td  width="300" align="left">
           <img src="../../imageFile/<%=buyList.getBook_image()%>" 
               border="0" width="30" height="50" align="middle">
             <%=buyList.getBook_title()%>
        </td> 
        <td width="100"> <%=NumberFormat.getInstance().format(buyList.getBuy_price())%></td>
        <td width="50"><%=buyList.getBuy_count()%></td> 
        <td width="150" >
           <%total += buyList.getBuy_count()*buyList.getBuy_price();%>
           <%=NumberFormat.getInstance().format(buyList.getBuy_count()*buyList.getBuy_price()) %>
       </td>
      </tr>
<%
    if( buyList.getBuy_id() != compareId || 
      (i == buyLists.size()-1) && preId != buyList.getBuy_id() ) {
%> 
      <tr>
       <td colspan="5" align="right">
         <b>총 금액 :  <%=NumberFormat.getInstance().format(total)%></b></td>
      </tr></table><br>
<% 
      compareId = buyList.getBuy_id();
       total = 0;
   }else{
%>
    </table><br>
<%
   }
 }
%>

<p><a class="btn btn-default" href="javascript:window.location='shopMain1.jsp'" role="button">메인으로 &raquo;</a></p>        
  
<%
 }
}
%>
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