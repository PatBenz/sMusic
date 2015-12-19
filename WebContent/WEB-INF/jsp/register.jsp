<jsp:include page="/WEB-INF/fragments/head.jsp" />

<body>

	<jsp:include page="/WEB-INF/fragments/header.jsp" />
	<!-- End header area -->

	<jsp:include page="/WEB-INF/fragments/brandingarea.jsp" />
	<!-- End site branding area -->

	<jsp:include page="/WEB-INF/fragments/mainmenu.jsp" />
	<!-- End mainmenu area -->

	<div class="well">
		<form class="form-horizontal" action="Register" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Username:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="username" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" name="password"
						required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">First Name:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="firstname" required>
				</div>
				</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Last Name:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="lastname" required>
				</div>
			</div>



			<div class="form-group">
				<label class="control-label col-sm-2">Phone:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="phone" required>
				</div>
			</div>




			<div class="form-group">
				<label class="control-label col-sm-2">Email:</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" name="email" required>
				</div>

			</div>




			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" name="action" class="btn btn-default">Submit</button>


				</div>
			</div>


		</form>
	</div>


</body>
</html>