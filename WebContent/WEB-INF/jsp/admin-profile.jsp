<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/fragments/admin-head.jsp" />
    <body>      
       <jsp:include page="/WEB-INF/fragments/admin-header.jsp" />
                
		<div class="container-fluid">
		
		<div class="row-fluid">
			<jsp:include page="/WEB-INF/fragments/admin-sidebar.jsp" />
			<!--/span-->
			<div class="span9" id="content">

				<div class="row-fluid">

					<c:out value="${success}" escapeXml="false" />

					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Bootstrap dataTables with
								Toolbar</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar">
									<div class="btn-group"></div>
									<div class="btn-group pull-right">

										<ul class="dropdown-menu">
											<li><a href="#">Print</a></li>
											<li><a href="#">Save as PDF</a></li>
											<li><a href="#">Export to Excel</a></li>
										</ul>
									</div>
								</div>

								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="example2">
									<thead>
										<tr>
											<th>ID</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
											<th>Password</th>
											<th>Email</th>
											<th>Phone</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${user.userID}</td>
											<td>${user.firstName}</td>
											<td>${user.lastName}</td>
											<td>${user.username}</td>
											<td>${user.password}</td>
											<td>${user.email}</td>
											<td>${user.phoneNumber}</td>
										</tr>

									</tbody>
								</table>
								<a href="AdminEdit?usrid=${user.userID}">
									<button class="btn btn-primary">
										<i class="icon-pencil icon-white"></i> Edit
									</button>
								</a>

							</div>
						</div>
					</div>
					<!-- /block -->
				</div>
			</div>
		</div>
		<hr>
		<footer>
			<p>&copy; Vincent Gabriel 2013</p>
		</footer>
	</div>
	<!--/.fluid-container-->

<!--         <script src="vendors/jquery-1.9.1.js"></script> -->
<!--         <script src="bootstrap/js/bootstrap.min.js"></script> -->
<!--         <script src="vendors/datatables/js/jquery.dataTables.min.js"></script> -->


<!--         <script src="assets/scripts.js"></script> -->
<!--         <script src="assets/DT_bootstrap.js"></script> -->
<!--         <script> -->
<!--          $(function() { -->
            
<!--          }); -->
<!--         </script> -->
        
<!--          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!--   		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
        
<!--     </body> -->

<!-- </html> -->
 <jsp:include page="/WEB-INF/fragments/admin-footer.jsp" />