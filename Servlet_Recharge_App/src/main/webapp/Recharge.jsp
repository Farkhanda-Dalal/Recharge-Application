<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
	bool = (Boolean) session.getAttribute("result");
	if (bool != null) {
		if (bool == false) {
	%>
	<div class="mx-auto p-3" style="width: 700px">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-exclamation-triangle-fill"
				viewBox="0 0 16 16">
  <path
					d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg>
			<path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
			</svg>
			Password and Confirm Password Fields should be same
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	}
	%>

	<%!Integer iobj;%>
	<%
	iobj = (Integer) session.getAttribute("message");
	if (iobj != null) {

		if (iobj.intValue()== 0) {
	%>
	<div class="mx-auto p-3" style="width: 700px">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-exclamation-triangle-fill"
				viewBox="0 0 16 16">
  <path
					d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg>
			<path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
			</svg>
			You have already logged in with this Email or Mobile No
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	}session.invalidate();
	%>
	<div class="container text-center">
		<div
			class="row position-absolute top-50 start-50 translate-middle border border-success"
			style="width: 1000px; border-radius: 35px;">

			<div class="col">
				<img src="./Images/My password-amico.png" class="img-fluid"
					alt="..." style="height: 500px">
			</div>

			<div class="col"
				style="background-color: #bf00ff; border-radius: 35px;">
				<div align="center" style="padding-top: 90px">
					<form action="RegisterController">
						<table style="border-spacing: 0 25px; border-collapse: separate;">
							<tr>
								<td>Name</td>
								<td><input type="text" name="name" maxlength="30"></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email" maxlength="35"></td>
							</tr>
							<tr>
								<td>Mobile No</td>
								<td><input type="text" name="mobNo" maxlength="10"></td>
							</tr>

							<tr>
								<td>Password</td>
								<td><input type="text" name="password" maxlength="8"></td>
							</tr>
							<tr>
								<td>Confirm Password</td>
								<td><input type="text" name="con_password" maxlength="8"></td>
							</tr>


						</table>
						<div class="d-flex justify-content-center">
							<td><input type="submit" value="Register" name="Register"></td>
						</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="fixed-bottom">
	<h5 class="text-center p-5">Already registered? <a href="Login.jsp">Go to Login Page</a></h5>
	</div>
</body>
</html>