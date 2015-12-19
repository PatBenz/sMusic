<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/fragments/head.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="user-menu">
						<ul>
							<li><a href="Cart"><i class="fa fa-user"></i> My Cart</a></li>
							<li><a href="Checkout"><i class="fa fa-user"></i>
									Checkout</a></li>
							<li><a href="My Orders"><i class="fa fa-user"></i>
									Orders</a></li>
							<li><a href="LogoutServlet"><i class="fa fa-user"></i>
									Logout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/fragments/brandingarea.jsp" />
	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Your Profile</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page title area -->
	<div>
	</div>
	<div class="container">
		<div class="row">	
			<div
				class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">


				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">${user.firstName} ${user.lastName}</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<img alt="User Pic"
									src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png"
									class="img-circle img-responsive">
							</div>

							<!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
							<div class=" col-md-9 col-lg-9 ">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>Username:</td>
											<td>${user.username}</td>
										</tr>
										<tr>
											<td>Password:</td>
											<td>${user.password}</td>
										</tr>
										<tr>
											<td>First Name:</td>
											<td>${user.firstName}</td>
										</tr>

										<tr>
										<tr>
											<td>Last Name:</td>
											<td>${user.lastName}</td>
										</tr>
										<tr>
											<td>Email:</td>
											<td>${user.email}</td>
										</tr>
										<tr>
											<td>Phone Number:</td>
											<td>${user.phoneNumber}</td>
										</tr>

									</tbody>
								</table>

								<a href="UserEdit?usrid=${user.userID}" class="btn btn-primary">Edit</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>