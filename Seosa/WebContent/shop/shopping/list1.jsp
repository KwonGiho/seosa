<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ include file="../etc/color.jspf"%> 

<%
  String book_kind = request.getParameter("book_kind");
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

    <title>서 사 - 상품 페이지</title>

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
 List<ShopBookDataBean> bookLists = null;
 ShopBookDataBean bookList = null;
 String book_kindName="";
  
 ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
 
 bookLists = bookProcess.getBooks(book_kind);
 if(book_kind.equals("100"))
	      book_kindName="문학";
 else if(book_kind.equals("200"))
	      book_kindName="외국어";  
 else if(book_kind.equals("300"))
	      book_kindName="컴퓨터";
 else if(book_kind.equals("all"))
	      book_kindName="전체";
%>



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


      <!-- START THE FEATURETTES -->

        <%
        int i;
	 	for(i=0;i<bookLists.size();i++){
 	   bookList = (ShopBookDataBean)bookLists.get(i);
 	   //if(i%2==0)
 	   //{
		%>
		<br>
      <div class="row featurette">
		       <div class="container">
        <div class="col-md-4">
          <!--<img class="featurette-image img-responsive" data-src="../../imageFile/<%=bookList.getBook_image()%>"   alt="Generic placeholder image">-->
          <img src="../../imageFile/<%=bookList.getBook_image()%>" class="img-polaroid">
        </div>
        <div class="col-md-4">
          <h2 class="featurette-heading"><a href="bookContent1.jsp?book_id=<%=bookList.getBook_id()%>&book_kind=<%=book_kind%>"></a><span class="text-muted"><a href="bookContent1.jsp?book_id=<%=bookList.getBook_id()%>&book_kind=<%=book_kind%>"><%=bookList.getBook_title() %></a></span></h2>
          <p class="lead">
          	<%if(bookList.getBook_count()==0){ %>
              <b>일시품절</b>
        	<%}else{ %>
        	              &nbsp;
        	<%} %>
        </p>
        	<b>출판사 : </b><%=bookList.getPublishing_com()%>
        	<b>저자 : </b><%=bookList.getAuthor()%>
        	<br><b> 정가 : </b><%=NumberFormat.getInstance().format(bookList.getBook_price())%><br>
        	<b>판매가 : </b><b><font color="red">
         <%=NumberFormat.getInstance().format((int)(bookList.getBook_price()*((double)(100-bookList.getDiscount_rate())/100)))%>
         </font></b>
  <br>
          </div>
      </div>

 	  <%
 	  // }
 } 
%>
      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
 <hr>

      
    </div> <!-- /.container -->


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