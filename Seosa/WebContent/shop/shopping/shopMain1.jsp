<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>서 사-메인 페이지</title>

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
              
     <a class="btn btn-default" href="javascript:window.location='../shopping/logout.jsp'" role="button">로그아웃 &raquo;</a>
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
        </div>
        </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>書    肆</h1>Seo Sa
        <p>중고책 서점 서사에 오신 것을 환영합니다. </p>
        <p><a class="btn btn-primary btn-lg" href="../shopping/list1.jsp?book_kind=all" role="button">전체 목록 보기 &raquo;</a></p>
        
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2> 문 학 </h2>
          <p>문학 분야 책을 모아두었습니다. </p>
          <p><a class="btn btn-default" href="../shopping/list1.jsp?book_kind=100" role="button">더보기 &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2> 외 국 어 </h2>
          <p>외국어 분야 책을 모아두었습니다.</p>
          <p><a class="btn btn-default" href="../shopping/list1.jsp?book_kind=200" role="button">더보기 &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2> 컴 퓨 터 </h2>
          <p>컴퓨터 분야 책을 모아두었습니다.</p>
          <p><a class="btn btn-default" href="../shopping/list1.jsp?book_kind=300" role="button">더보기 &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <jsp:include page="../module/bottom.jsp" flush="false" />
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

  </body>
</html>
