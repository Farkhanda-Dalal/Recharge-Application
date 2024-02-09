<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
</head>
<body>
	<%!Boolean bool;%>
	<%
	if (!session.isNew()) {
		bool = (Boolean) session.getAttribute("message");
		if (bool.booleanValue() == false) {
	%>
	<div align="center" style="padding-top: 10px">
	<div class="alert alert-primary d-flex align-items-center" role="alert" style="width: 330px" >
		<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
		<div> Invalid email or password. Login Again</div>
	</div>
	</div>
	<%
	}
	}
	session.invalidate();
	%>
	<div class="container text-center">
		<div class="row position-absolute top-50 start-50 translate-middle border border-success" style="width: 1000px;border-radius: 35px;">
			<div class="col" style="background-color:#bf00ff;border-radius: 35px;">
			<div align="center" style="padding-top: 90px" >
				<form action="LoginController" >
					<table style="border-spacing: 0 25px;border-collapse: separate;">
						<tr>
							<td>Mobile No</td>
							<td><input type="text" name="mobNo" maxlength="10"></td>
						</tr>
						<div>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email" maxlength="30"></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="text" name="password" maxlength="8"></td>
						</tr>
					</table>
					<input type="submit" value="Login"> 
				</div>
				</form>
<!-- 				<div style="padding-top: 25px"> -->
<!-- 				<a href="ForgotPassword.jsp" class="text-center" style="color: black;">Forgot Password?</a> -->
<!-- 				</div> -->
				
			</div>
			<div class="col">
			<img src="./Images/My password-amico.png" class="img-fluid" alt="..." style="height: 500px">
			</div>
		</div>
	</div>

</body>
</html>