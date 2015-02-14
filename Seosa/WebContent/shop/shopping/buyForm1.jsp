<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<%@ page import = "bookshop.shopping.CustomerDataBean" %>
<%@ page import = "bookshop.shopping.CustomerDBBean" %>
<%@ page import = "bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<%
   String book_kind = request.getParameter("book_kind");
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

    <title>Book Shopping Mall-구매 페이지</title>

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
            <li><a href="../shopping/cartList1.jsp?book_kind=all">장바구니</a></li>
             <li><a href="../shopping/buyList1.jsp">구매목록</a></li>
            <a class="btn btn-default" href="javascript:window.location='../shopping/logout.jsp'" role="button">로그아웃 &raquo;</a>
            </ul>
            </div>
          </div>
        </nav>
        
  <%
List<CartDataBean> cartLists = null;
List<String> accountLists = null;
CartDataBean cartList = null;
CustomerDataBean member= null;
int number = 0;
int total = 0;

if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain1.jsp");        
}else{
	CartDBBean bookProcess = CartDBBean.getInstance();
    cartLists = bookProcess.getCart(buyer);
    
    CustomerDBBean memberProcess = CustomerDBBean.getInstance();
    member = memberProcess.getMember(buyer);
    
    BuyDBBean buyProcess = BuyDBBean.getInstance();
    accountLists = buyProcess.getAccount();
%>
 
		<div class="container">
           <div class="jumbotron">

  <h3><b>구매 하기</b></h3>

  <form name="inform" method="post" action="updateCart.jsp">
  <table> 
    <tr> 
      <td width="50">번호</td> 
      <td width="300">책이름</td> 
      <td width="100">판매가격</td>
      <td width="150">수량</td> 
      <td width="150">금액</td>
    </tr>   
<%
  for(int i=0;i<cartLists.size();i++){
     cartList = cartLists.get(i);
%>
     
     <tr> 
       <td width="50"><%=++number %></td> 
       <td width="300" align="left">
         <img src="../../imageFile/<%=cartList.getBook_image()%>" 
           border="0" width="30" height="50" align="middle">
           <%=cartList.getBook_title()%>
       </td> 
       <td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
       <td width="150"><%=cartList.getBuy_count()%></td> 
       <td width="150">
          <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
          <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
      </td>
    </tr>
<%
  }
%>
  <tr>
    <td colspan="5" align="right"><b>총 구매금액 : <%=NumberFormat.getInstance().format(total)%></b></td>
  </tr>
</table>
</form>
<%} 
 %>
<br>
<form method="post" action="buyPro.jsp" name="buyinput">
 <table>
   <tr> 
    <td  colspan="2"><font size="+1" ><b>주문자 정보</b></font></td>
   </tr>
   <tr> 
    <td  width="200" align="left">성명</td>
    <td  width="400" align="left"><%=member.getName()%></td>
   </tr>
   <tr> 
    <td  width="200" align="left">전화번호</td>
    <td  width="400" align="left"><%=member.getTel()%></td>
   </tr>
   <tr> 
    <td  width="200" align="left">주소</td>
    <td  width="400" align="left"><%=member.getAddress()%></td>
   </tr>
   <tr> 
     <td  width="200" align="left">결제계좌</td>
     <td  width="400" align="left">
       <select name="account">
        <%
          for(int i=0;i<accountLists.size();i++){
           String accountList = accountLists.get(i);
         %>
           <option value="<%=accountList %>"><%=accountList %></option>
        <%}%>
       </select>
    </td>
  </tr>
  </table>
  <br>
   
<table>
  <tr> 
   <td  colspan="2" align="center"><font size="+1" ><b>배송지 정보</b></font></td>
  </tr>
  <tr> 
    <td  width="200" align="left">성명</td>
    <td  width="400" align="left">
      <input type="text" name="deliveryName" value="<%=member.getName()%>">
    </td>
  </tr>
  <tr> 
    <td  width="200" align="left">전화번호</td>
    <td  width="400" align="left">
      <input type="text" name="deliveryTel" value="<%=member.getTel()%>">
    </td>
  </tr>
  <tr> 
    <td  width="200" align="left">주소</td>
    <td  width="400" align="left">
      <input type="text" name="deliveryAddess" value="<%=member.getAddress()%>">
    </td>
  </tr>
   <tr> 
      <td colspan="2" align="center"> 
       <button type="submit" class="btn">확인</button>
       <a class="btn btn-default" href="javascript:window.location='shopMain1.jsp'" role="button">취소 &raquo;</a>        
     </td>
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