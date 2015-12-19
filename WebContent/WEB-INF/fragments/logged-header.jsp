<!-- logged-header -->

		<div class="header-area">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="user-menu">
							<ul>
								<li><a href="UserProfile?usrid=${user.userID}"><i class="fa fa-user"></i>My Account</a></li>
								<li><a href="CartServlet?usrid=${user.userID}"><i class="fa fa-user"></i> My Cart</a></li>
								<li><a href="LogoutServlet"><i class="fa fa-user"></i> Logout</a></li>
								<li><a href="LogoutServlet"><i class="fa fa-user"></i> Welcome ${user.firstName} ${user.lastName} !</a></li>
							</ul>
						</div>
					</div>

					
				</div>
			</div>
		</div>

		<!-- end logged-header -->