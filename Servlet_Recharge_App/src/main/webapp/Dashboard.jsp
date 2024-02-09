<%@page import="recharge.dao.TransactionDao"%>
<%@page import="recharge.dao.TransactionDaoImpl"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="recharge.model.Transaction"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="recharge.model.Register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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

<link rel="stylesheet" href="Card.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid"
			style="background-color: #DDA0DD; height: 60px">
			<a class="navbar-brand" href="#">Recharge XS</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="Home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Plans</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Services </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Sim Purchase</a></li>
							<li><a class="dropdown-item" href="#">Recharge</a></li>
							<li><a class="dropdown-item" href="#">Block Sim</a></li>
						</ul></li>
				</ul>
			</div>

			<div class="btn-group dropstart">
				<button style="border: none" type="button" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fa-solid fa-user fa-2xl"></i>
				</button>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" type="button"><a href="AddCard.jsp">Add Card</a></button></li>
					<li><button class="dropdown-item" type="button"><a href="History.jsp">History</a></button></li>
					<li><button class="dropdown-item" type="button">Log
							Out</button></li>
				</ul>
			</div>
		</div>
	</nav>

<%!Integer iobj;%>
	<%
		iobj = (Integer) session.getAttribute("card");
		if (iobj != null) {
			if (iobj.intValue() > 0) {
	%>
		<div class="mx-auto p-3" style="width: 600px">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-check-circle-fill"
				viewBox="0 0 16 16">
  <path  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
</svg>
			Card Added Successfully
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	if (iobj.intValue() == 0) {
	%>
		<div class="mx-auto p-3" style="width: 600px">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
  <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>
  <path  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
</svg>
			Card was not added.Retry again
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
	<%
	}
	}
	%>
	
<%!Transaction trans; %>
<%
trans=(Transaction)request.getAttribute("tdetails");
if(trans!=null)
{
%>
	<div class="mx-auto p-3" style="width: 700px">
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-check-circle-fill"
				viewBox="0 0 16 16">
  <path  d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
</svg>

			Transaction Successfull. <%=trans.getTransPrice() %> deducted from <%=trans.getAccNo() %>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
	</div>
<%
}
%>
	
	<div class="text-center">
		<form action="DashboardController">
			<div class="row mx-auto" style="width: 600px">
				<div class="col-6 mx-auto p-2">
					<p>
					<h5 class="text-end ">Choose Service Provider</h5>
					</p>
				</div>
				<div class="col-6 mx-auto p-2 ">
					<div class="mx-auto p-2">
						<select id="inputState" class="form-select" name="sim">
							<option selected>Airtel</option>
							<option>Jio</option>
							<option>VI</option>
						</select>
					</div>
				</div>
			</div>
			<h5>
				<input type="submit" name="done"
					style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">
			</h5>
	</div>
	</form>
	</div>

	<%
	String sim;
	%>
	<%
	sim = (String) session.getAttribute("sim");
	if (sim != null) {
	%>
	<h1 class="text-center" style="padding-top: 15px">Choose Plan for
		Recharging</h1>
	<div class="row mx-auto" style="width: 1000px">
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col mx-auto">
				<div class="card" style="border-radius: 20px; border-color: black">
					<div class="card-body" name="planName">
						<h4 class="card-title text-center"><%=sim%>
							Family Plan
						</h4>
						<p class="card-text text-center">
							Validity :365 days <br> Users :4 <br> Data :Unlimited <br>
							Calling :Unlimited<br> Messaging:Unlimited
						</p>
						<div class="d-flex justify-content-center">
							<form action="DashboardController">
								<button type="submit" name="Family_Pack" style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">2999</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col mx-auto">
				<div class="card" style="border-radius: 20px; border-color: black">
					<div class="card-body" name="planName">
						<h4 class="card-title text-center"
							style="border-radius: 20px; border-color: black"><%=sim%>
							Super Saver
						</h4>
						<p class="card-text text-center">
							Validity :28 days <br> Users :1 <br> Data :2GB/day <br>
							Calling :Unlimited<br> Messaging:Unlimited
						</p>
						<div class="d-flex justify-content-center">
							<form action="DashboardController">
								<button type="submit" name="Super_Saver" 
									style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">299</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col mx-auto">
				<div class="card" style="border-radius: 20px; border-color: black">
					<div class="card-body" name="planName">
						<h4 class="card-title text-center"><%=sim %>
							Combo Pack
						</h4>
						<p class="card-text text-center">
							Validity :84 days <br> Users :2 <br> Data :2.5GB/day <br>
							Calling :Unlimited<br> Messaging:Unlimited
						</p>
						<div class="d-flex justify-content-center">
							<form action="DashboardController">
								<button type="submit" name="Combo_Pack"
									style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">600</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col mx-auto">
				<div class="card" style="border-radius: 20px; border-color: black">
					<div class="card-body text-center">
						<h4 class="card-title" name="planName"><%=sim %>
							Super Fast
						</h4>
						<p class="card-text text-center">
							Validity :28 days <br> Users :1 <br> Data :4GB/day <br>
							Calling :Unlimited<br> Messaging:Unlimited
						</p>
						<div class="d-flex justify-content-center">
							<form action="DashboardController">
								<button type="submit" name="Super_Fast"
									style="background-color: #DDA0DD; padding: 10px; border-radius: 10px">399</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<%!Transaction t;%>
	<%
	t = (Transaction) session.getAttribute("plan");
		if (t != null) {
	%>

	<div class="container sticky-top" style="padding-top: 30px">

		<div class="card-container">

			<div class="front">
				<div class="card-number-box">################</div>
				<div class="flexbox">
					<div class="box">
						<span>card holder</span>
						<div class="card-holder-name">full name</div>
					</div>
					<div class="box">
						<span>expires</span>
						<div class="expiration">
							<span class="exp-month">mm</span> <span class="exp-year">yy</span>
						</div>
					</div>
				</div>
			</div>

			<div class="back">
				<div class="stripe"></div>
				<div class="box">
					<span>cvv</span>
					<div class="cvv-box"></div>
					<img src="image/visa.png" alt="">
				</div>
			</div>

		</div>

		<form class="cred_card" action="DashboardController">

			<div class="row mx-auto" style="padding-top: 30px">
				<div class="col-6 align-self-center p-3">
					<h3>
						<input class="text-center" type="text" name="plan"
							style="border-radius: 10px" value="<%=t.getTransPlan()%>"
							>
					</h3>
				</div>
				<div class="col-6 align-self-center p-3">
					<h3>
						<input class="text-center" type="text" name="price"
							style="border-radius: 10px" value="<%=t.getTransPrice()%>"
							>
					</h3>
				</div>
			</div>

			<div class="inputBox">
				<span>mobile number</span> <input type="text" name="mobNo"
					placeholder="Enter you mobile no" maxlength="10" class="mob-input">

				<div class="inputBox">
					<span>Recharge On</span> <input type="text" name="re_mobNo"
						placeholder="Enter mobile no you want to recharge on"
						maxlength="10" class="re-mob-input">

					<div class="inputBox">
						<span>card number</span> <input type="text" name="accNo"
							placeholder="Enter a 16 digit card number" maxlength="16"
							class="card-number-input">
					</div>
					<div class="inputBox">
						<span>card holder</span> <input type="text" name="accName"
							placeholder="Enter card holder name in capital letters"
							class="card-holder-input">
					</div>
					<div class="flexbox">
						<div class="inputBox">
							<span>expiration mm</span> <select name="month" id=""
								class="month-input">
								<option value="month" selected disabled>month</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>
						<div class="inputBox">
							<span>expiration yy</span> <select name="year" id=""
								class="year-input">
								<option value="year" selected disabled>year</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
								<option value="2026">2026</option>
								<option value="2027">2027</option>
								<option value="2028">2028</option>
								<option value="2029">2029</option>
								<option value="2030">2030</option>
							</select>
						</div>
						<div class="inputBox">
							<span>cvv</span> <input type="text" name="cvv" maxlength="3"
								placeholder="3 digit CVV" class="cvv-input">
						</div>
					</div>
					<input type="submit" name="submit_card" class="submit-btn"
						onclick="return validateForm()">
		</form>
	</div>
	<script>
  
function  validateForm() {
	var mobNo= document.querySelector(".mob-input").value;
    var re_mobNo = document.querySelector(".re-mob-input").value;
    var accNo= document.querySelector(".card-number-input").value;
    var accName = document.querySelector(".card-holder-input").value;
    var month = document.querySelector(".month-input").value;
    var year = document.querySelector(".year-input").value;
    var cvv = document.querySelector(".cvv-input").value;

    // Validate card number
    if (.length !== 16 || isNaN(accNo)) {
        alert("Please enter a valid card number. Only digits . Should contain 16 Digits number");
        return false;
    }

    // Validate card holder name
    if (!/^[a-zA-Z ]+$/.test(accName)) {
        alert("Please enter a valid name. Only Alphabets");
        return false;
    }

    // Validate expiration date
    var today = new Date();
    var expirationDate = new Date(year, month - 1, 1); // set to 1st day of the month
    if (expirationDate < today) {
        alert("Please enter a valid expiration date.");
        return false;
    }

    // Validate CVV
    if (cvv.length !== 3 || isNaN(cvv)) {
        alert("Please enter a valid CVV.");
        return false;
    }

    return true;
}


document.querySelector('.card-number-input').oninput = () =>{
    document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
}

document.querySelector('.card-holder-input').oninput = () =>{
    document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
}

document.querySelector('.month-input').oninput = () =>{
    document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
}

document.querySelector('.year-input').oninput = () =>{
    document.querySelector('.exp-year').innerText = document.querySelector('.year-input').value;
}

document.querySelector('.cvv-input').onmouseenter = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
}

document.querySelector('.cvv-input').onmouseleave = () =>{
    document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
    document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
}

document.querySelector('.cvv-input').oninput = () =>{
    document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
}


</script>

	<%
	}
	session.invalidate();
	%>

</body>
</html>