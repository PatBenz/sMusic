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
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">List of Users</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                   <div class="table-toolbar">
                                      
                                      
                                      <div class="btn-group pull-right">
                                         <button data-toggle="dropdown" class="btn dropdown-toggle">Tools <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul>
                                      </div>
                                   </div>
                                   
                                   <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
							        <thead>
							            <tr>
							                <th>ID</th>
							                <th>Username</th>
							                <th>Password</th>
							                <th>First Name</th>
							                <th>Last Name</th>
							                <th>Email</th>							                
							                <th>Phone</th>
							                <th></th>							                							                
							            </tr>
							        </thead>
							        <tfoot>
							            <tr>
							                <th>ID</th>
							                <th>Username</th>
							                <th>Password</th>
							                <th>First Name</th>
							                <th>Last Name</th>
							                <th>Email</th>							                
							                <th>Phone</th>
							                <th></th>	
							            </tr>
							        </tfoot>
							        <tbody>
							        	 <c:forEach var="u" items="${users}" >
								        	<tr>
					          				 <td>${u.userID}</td>
												<td>${u.username}</td>
												<td>${u.password}</td>
												<td>${u.firstName}</td>
												<td>${u.lastName}</td>
												<td>${u.email}</td>
												<td>${u.phoneNumber}</td>
												 <td> 
 	                                               		<div class="btn-group"> 
                                          					<a href="DeleteUser?usrid=${u.userID}"><button class="btn btn-success">Delete<i class="icon-trash icon-white"></i></button></a>
                                       					</div> 
                                      			   </td>
											</tr>
										</c:forEach>
									</tbody>
							        </table>
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
        
  	<jsp:include page="/WEB-INF/fragments/admin-footer.jsp" />      