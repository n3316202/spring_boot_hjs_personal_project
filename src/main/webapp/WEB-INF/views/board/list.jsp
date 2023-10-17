<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>개인프로젝트</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	 
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>

<body>
 	<%@ include file="../common/header.jsp" %>  

<main>
<div class="container mt-3">
    <div class="container-fluid">
      <!-- Page Heading -->
      <h1 class="text-center h3 mb-2 text-gray-800 mt-4">게시판</h1>
      <!-- <p class="mb-4">
        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the{' '}
        <a target="_blank" href="https://datatables.net"> official DataTables documentation </a>
        .
      </p> -->
      <!-- DataTales Example -->
      <div class="card shadow mb-4 mt-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr class="text-center">
                  <th>번호</th>
                  <th>이름</th>
                  <th>제목</th>
                  <th>날짜</th>
                  <th>히트</th>
                  <th class="text-center">삭제</th>
                </tr>
              </thead>

              <tbody>
              <c:forEach var="board" items="${boards}">
                <tr class="text-center">
                  <td>${board.bid}</td>
                  <td>${board.bname}</td>
                  <td>
                    <a href="board.bid">${board.btitle}</a>
                  </td>
                  <td>${board.bhit}</td>
                  <td>${board.bdate}</td>
                  <td>
                    <button class="btn btn-success" value="${board.bid}">삭제</button>
                  </td>
                </tr>
                </c:forEach>
	
              </tbody>
            </table>
          </div>
          
       <!--    페이징 처리 -->
        
          <nav class="d-flex justify-content-center" aria-label="Page navigation example">
            <ul class="pagination">
              
              <c:if test="${pageMaker.prev}">					
			    <li class="page-item">
                	<a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}"><button class="page-link" aria-label="Previous" > « </button></a>
              	</li>
			  </c:if>
		
			  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			  	<li class="page-item">
		        	<a href="list${pageMaker.makeQuery(idx)}"><button class="page-link">${idx}</button></a>
		        </li>
			  </c:forEach>
              

              <c:if test="${pageMaker.next && pageMaker.endPage > 0}">				
			    <li class="page-item">
                	<a href="list${pageMaker.makeQuery(pageMaker.endPage +1)}"><button class="page-link" aria-label="Next" > » </button></a>
              	</li>
			  </c:if>
              
            </ul>
          </nav>
          
        </div>
      </div>
    </div>
  </div>
</main>

	<%@ include file = "../common/footer.jsp" %>
	</body>
</html>
