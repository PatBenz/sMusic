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
                                <div class="muted pull-left">Bootstrap dataTables with Toolbar</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                   <div class="table-toolbar">
                                      <div class="btn-group">
                                       
                                      </div>
                                      <div class="btn-group pull-right">
                                         
                                         <ul class="dropdown-menu">
                                            <li><a href="#">Print</a></li>
                                            <li><a href="#">Save as PDF</a></li>
                                            <li><a href="#">Export to Excel</a></li>
                                         </ul>
                                      </div>
                                   </div>
                                    
                                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example2">
                                        <thead>
                                            <tr>
                                                <th>id</th>
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
<!--                                      <a href="admin-profile.jsp"> <button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Edit</button></a> -->
                    
                    
                    <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Form Example</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                
                                     <form action="AdminEdit" method="post" class="form-horizontal">
                                      <fieldset>
                                        <legend>Form Horizontal</legend>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Username</label>                                    
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="username" value="${user.username}" required>
                                             <input type="hidden" name="userID" value="${user.userID}">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Password</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="password" value="${user.password}" required>
                                          </div>
                                        </div>
                                         <div class="control-group">
                                          <label class="control-label" for="focusedInput">First Name</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="firstname" value="${user.firstName}" required>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Last Name</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="lastname" value="${user.lastName}" required>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Email</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="email" value="${user.email}" required>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Phone Number</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="phone" value="${user.phoneNumber}">
                                          </div>
                                        </div>
                                        
                                        
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary">Save changes</button>
                                          <button type="reset" class="btn">Cancel</button>
                                        </div>
                                      </fieldset>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!-- /block -->
                        
                        
                        
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



<!-- </html> -->
 <jsp:include page="/WEB-INF/fragments/admin-footer.jsp" />