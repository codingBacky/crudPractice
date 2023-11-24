<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 <meta charset="utf-8">

</head>

<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Member Modify Page</h1>


	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Member Modify</div>
			<div class="panel-body">
				<form action="/member/modify" method="post" role="form">
					<div class="form-group">
						<label>email</label> 
						<input class="form-control" name='email'
							value='<c:out value="${member.email}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>name</label> 
						<input class="form-control" name='name'
							value='<c:out value="${member.name}"/>'>
					</div>
					<div class="form-group">
						<label>phone</label>
						<input class="form-control" name='phone'
						value='<c:out value="${member.phone}"/>'>
					</div>
					<div class="form-group">
						<label>address</label> 
						<input class="form-control" name='address'
							value='<c:out value="${member.address}"/>'>
					</div>
					<div class="form-group">
						<label>age</label> 
						<input class="form-control" name='age'
							value='<c:out value="${member.age}"/>'>
					</div>
					
					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
	
<!--모달창 추가-->

</div>
<!-- /.panel-body -->
</div>
<!-- /.panel -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	
	$(document).ready(function(){
		var formObj = $("form");
		
		$("button").click(function(e){
			e.preventDefault();//이동 중지
			
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === "remove"){
				formObj.attr("action","/member/remove");
 				 $("form input[name!='email']").remove();
			}else if(operation === "list"){
				//self.location = "/board/list";//get방식으로 날라간다~~
				formObj.attr("action","/member/list").attr("method","get");
			}
			formObj.submit();
		});
		
		
	});
	
	
</script>
 </body>
         
</html>