<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board List</h1>

		
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">
			Member List
			<a href="/member/register">
    			<button>Goto Register</button>
			</a></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<!--             <table width="100%"
               class="table table-striped table-bordered table-hover"
               id="dataTables-example"> -->
					<thead>
						<tr>
							<th>이메일</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>나이</th>
						</tr>

					</thead>
					<c:forEach items="${list}" var="member">
						<tr class="odd gradeX">
							<td>${member.email}</td>
							<td><a class="move" href="${member.email}">${member.name}</a> </td>
							<td>${member.phone}</td>
							<td>${member.address}</td>
							<td>${member.age}</td>
						</tr>
					</c:forEach>
				</table>

					<!-- 페이징 처리 -->
				<div>
					<ul>

						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.startPage - 1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" }">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link"
								href="${pageMaker.endPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</div>

				<!-- 페이징 처리 -->

				<form action="/member/list" id="actionForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				</form>
					
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


 </body>

 <script type="text/javascript">
 
 var actionForm = $("#actionForm");
 
 $(document).ready(function() {
    $(".move").on('click' ,function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='email' value='" + $(this).attr('href') + "' />");
			actionForm.attr("action", "/member/get");
			actionForm.submit();
		});    
    });
 
//페이지 버튼 클릭 이동

	$(".page-item a").click(function(e){
		e.preventDefault();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
  </script>
</html>