<%@page import="java.text.SimpleDateFormat"%>
<%@page import="recharge.model.Transaction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>History</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<h4 class="d-flex justify-content-center p-4"
		style="background-color: #DDA0DD">Do you want to view you
		recharge history ?</h4>
		
	<%!String his_mob;%>
	<%
	his_mob = (String) session.getAttribute("mob");
	if (his_mob != null) {
	%>
	<div class="mx-auto p-3" style="width: 600px">
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
			Not a registered mobile number
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	%>
	
	
	<form action="HistoryController">
		<div class="row mx-auto" style="width: 600px">
			<div class="col-6 mx-auto p-2">
				<p>
				<h5 class="text-end ">Enter Mobile Number</h5>
				</p>
			</div>
			<div class="col-6 mx-auto p-2 ">
				<div class="mx-auto p-2">
					<input type="text" name="his_mob" maxlength="10">
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center p-1">
			<h5>
				<input type="submit" name="done"
					style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">
			</h5>
		</div>
	</form>

	<%!List<Transaction> lsth; %>
	<%lsth=(List<Transaction>)request.getAttribute("hist_list");
	if(lsth!=null)
	{
	%>
	<div class="d-flex justify-content-center p-1">
	<table class="table table-border" style="width: 1000px" >
  <thead>
    <tr>
      <th scope="col">Recharge From</th>
      <th scope="col">Recharge To</th>
      <th scope="col">Transaction Id</th>
      <th scope="col">Transaction Date</th>
      <th scope="col">Transaction Plan</th>
      <th scope="col">Transaction Price</th>
      <th scope="col">Account Number</th>
    </tr>
  </thead>
  <tbody>
    <% 
    
    for(Transaction t:lsth)
    {
	%>
	<tr>
       <th scope="row"><%=t.getMobNo()%></th>
       <td><%=t.getRe_mobNo()%></td>
       <td><%=t.getTransId()%></td>
       <td><%=t.getTransDate() %></td>
       <td><%=t.getTransPlan()%></td>
       <td><%=t.getTransPrice()%></td>
       <td><%=t.getAccNo()%></td>
    </tr>
	<% 
	}
    %>
          </tbody>
</table>
</div>
    <%
	}
	%>

</body>
</html>