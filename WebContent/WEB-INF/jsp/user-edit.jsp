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
						<h2>Edit Your Profile</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page title area -->
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form class="form-horizontal" action="UserEdit" method="post">
				<fieldset>
		<input type="hidden" id="userID" name="userID" value="${user.userID}" />
					<!-- Form Name -->
					<legend>Profile Info</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">Username</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="username" value="${user.username}" required>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">Password</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="password" value="${user.password}" required>
						</div>
					</div>
					

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">First Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="firstname" value="${user.firstName}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">Last Name</label>
						<div class="col-sm-8">
							<input type="text" name="lastname" value="${user.lastName}" class="form-control" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">Email</label>
						<div class="col-sm-8">
							<input type="email" name="email" value="${user.email}"  class="form-control" required>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-sm-3 control-label" for="textinput">Phone Number</label>
						<div class="col-sm-8">
							<input type="text" name="phonenumber" value="${user.phoneNumber}" class="form-control" required>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<div class="pull-right">
								<button type="submit" class="btn btn-default">Save</button>
								<a href="UserProfile?usrid=${user.userID}" class="btn btn-default">Cancel</a>
							</div>
						</div>
					</div>

				</fieldset>
			</form>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</body>
</html>