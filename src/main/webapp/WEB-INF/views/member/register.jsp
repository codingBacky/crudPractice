<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">

</head>

<body>
<div class="row">
   <div class="col-lg-12">
	<div class="panel panel-default">
      	<div class="panel-heading">
      		Member Register
 
   		</div>
         <!-- /.panel-heading -->
         <div class="panel-body">
           	<form role="from" action="/member/register" method="post">
           		<div class="form-group">
	           		<label for="email">email</label>
	           		<input class="form-control" name="email"/>
           		</div>
           		<div class="form-group">
           			<label for="name">name</label>
	           		<input class="form-control" name="name" />
           		</div>
           		<div class="form-group">
           			<label>phone</label>
	           		<input class="form-control" name="phone">
           		</div>
           		<div class="form-group">
           			<label>address</label>
	           		<input class="form-control" name="address">
           		</div>
           		<div class="form-group">
           			<label>age</label>
	           		<input class="form-control" name="age">
           		</div>
	           		<button type="submit" class="btn btn-default">Submit</button>
	           		<button type="reset" class="btn btn-danger">Reset</button>
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
         
</html>