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
		<h1 class="page-header">Member Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Member Read Page</div>
			<div class="panel-body">
				<div class="form-group">
					<label>email</label> <input class="form-control" name='email'
						value='<c:out value="${member.email}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>name</label> <input class="form-control" name='name'
						value='<c:out value="${member.name}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>phone</label> <input class="form-control" name='phone'
						value='<c:out value="${member.phone}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>address</label> <input class="form-control" name='address'
						value='<c:out value="${member.address}"/>' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>age</label> <input class="form-control" name='age'
						value='<c:out value="${member.age}"/>' readonly="readonly">
				</div>

				<button data-oper='modify' class="btn btn-default" type="submit">Modify</button>
				<button data-oper='list' class="btn btn-info" type="submit">List</button>

				<form action="/member/modify" method="get" id="operForm">
					<input type="hidden" id="email" name="email" value="${member.email}">
					
				</form>


			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").click(function(e) {
			operForm.attr("action", "/member/modify").submit();
		});

		$("button[data-oper='list']").click(function(e) {
			operForm.find("#email").remove();
			operForm.attr("action", "/member/list").submit();

		});

	});
</script>


</body>
         
</html>