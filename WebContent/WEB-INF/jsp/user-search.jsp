<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/fragments/admin-head.jsp" />
    
    <body>
    
      <jsp:include page="/WEB-INF/fragments/admin-header.jsp" />
      
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li>
                            <a href="index.html"><i class="icon-chevron-right"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="calendar.html"><i class="icon-chevron-right"></i> Calendar</a>
                        </li>
                        <li>
                            <a href="stats.html"><i class="icon-chevron-right"></i> Statistics (Charts)</a>
                        </li>
                        <li>
                            <a href="form.html"><i class="icon-chevron-right"></i> Forms</a>
                        </li>
                        <li class="active">
                            <a href="tables.html"><i class="icon-chevron-right"></i> Tables</a>
                        </li>
                        <li>
                            <a href="buttons.html"><i class="icon-chevron-right"></i> Buttons & Icons</a>
                        </li>
                        <li>
                            <a href="interface.html"><i class="icon-chevron-right"></i> UI & Interface</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-success pull-right">731</span> Orders</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-success pull-right">812</span> Invoices</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">27</span> Clients</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">1,234</span> Users</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">2,221</span> Messages</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-info pull-right">11</span> Reports</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-important pull-right">83</span> Errors</a>
                        </li>
                        <li>
                            <a href="#"><span class="badge badge-warning pull-right">4,231</span> Logs</a>
                        </li>
                    </ul>
                </div>
                <!--/span-->
                <div class="span9" id="content">
                     <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Find a user - Enter username</div>
                            </div> 
                            
                            <div class="block-content collapse in">
                            	<div class="span12">
                            	<br>
                            	<br>
                                  <form action="UserList?param=3" method="post" class="form-horizontal">
                                      <div class="control-group">
                                          <label class="control-label" for="typeahead"> Username: </label>
                                          <div class="controls">
<!--                                             <input type="text" name="username" class="span6" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","user5678","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'> -->
                                            <input type="text" name="username" class="span6" id="typeahead"  data-provide="typeahead" data-items="4">
<!--                                             <p class="help-block">Start typing to activate auto complete!</p>--> 
                                          </div>
                                      </div>
                                 </form>
                                 </div>
                             
                            </div>
                            
                            
                                                                                        
                            <div class="block-content collapse in"> 
                                

                                    
                               <c:if test="${count == 1}"> 
                                  
                                <div class="span12">
                                <hr> 
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
                                    

						 
                                    
<!--                          		</div> -->
                                    
                                
<%--    									<p>My salary is: <c:out value="${salary}"/><p> --%>
   									
   									
   									
   								   
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
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
                                        <tbody>
<%-- 	                                       <c:forEach var="u" items="${users}" > --%>
	                                           <tr class="odd gradeX">
	                                           	   <td>${user.userID}</td>
	                                           	   <td>${user.username}</td>
	                                           	   <td>${user.password}</td>
	                                           	   <td>${user.firstName}</td>
	                                               <td>${user.lastName}</td>
	                                               <td>${user.email}</td>
	                                               <td>${user.phoneNumber}</td>
	                                               <td>
	                                               		<div class="btn-group">
                                         					<a href="DeleteUser?usrid=${user.userID}"><button class="btn btn-success">Delete<i class="icon-trash icon-white"></i></button></a>
                                      					</div>
                                      			   </td>
	                                               
	                                        
	                                           </tr>
<%-- 	                                       </c:forEach> --%>
	                                      	
                                        </tbody>
                                    </table>
   								
   									
   									
							  
                              
                                     
										
									</div>    
								</c:if>  	
									       
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