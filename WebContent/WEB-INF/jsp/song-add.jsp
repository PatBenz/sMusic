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
                                           
                    <!-- block -->
                    <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">Form Example</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                
<!--                                 <form method="post" action="AddSong" enctype="multipart/form-data" class="form-horizontal" > -->
                                 <form method="post" action="UploadServlet" enctype="multipart/form-data" class="form-horizontal" >
									<fieldset>
										<legend>Form Horizontal</legend>
                                        
<!--                                         <div class="control-group"> -->
<!--                                           <label class="control-label" for="focusedInput">Title</label>                                     -->
<!--                                           <div class="controls"> -->
<!--                                             <input class="input-xlarge focused" type="text" name="title" value="" required> -->
<!--                                              <input type="hidden" name="songID" value=""> -->
<!--                                           </div> -->
<!--                                         </div> -->
                                
<!--                                      <form action="AddSong" method="post"  class="form-horizontal" enctype="multipart/form-data"> -->
<!--                                       <fieldset> -->
<!--                                         <legend>Form Horizontal</legend> -->
                                        
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Title</label>                                    
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="title" value="" required>
                                             <input type="hidden" name="songID" value="">
                                          </div>
                                        </div>
                                        
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Year</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="year" value="" required>
                                          </div>
                                        </div>
<!-- <!--                                          <div class="control-group">  -->
<!-- <!--                                           <label class="control-label" for="focusedInput">Track Number</label>  -->
<!-- <!--                                           <div class="controls">  -->
<!-- <!--                                             <input class="input-xlarge focused" type="text" name="trackNumber" value="" required>  -->
<!-- <!--                                           </div> -->
<!-- <!--                                         </div>  -->
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Duration</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="duration" value="" required>
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Price</label>
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="songPrice" value="2.99" required>
                                          </div>
                                        </div>
                                        
                                        <div class="control-group">
											<label class="control-label" for="focusedInput">Genre</label>
											<div class="controls">
												<select name="genre" id="selectError">
													<c:forEach var="u" items="${genres}">
														<option value="${u.idGenre}">${u.label}</option>
													</c:forEach>
												</select>
											</div>
										</div>
                                        
<!--                                         <div class="control-group"> -->
<!-- 														<label class="control-label" for="typeahead">Artist </label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input type="text" name="artistname" class="span6" id="typeahead" -->
<!-- 																data-provide="typeahead" data-items="4" -->
<%-- 																data-source='[ --%>
<%-- 																<c:forEach var="a" items="${artists}">"${a.name}",</c:forEach> --%>
<%-- 																""]' --%>
<!-- 																> -->
<!-- 															<p class="help-block">Start typing to activate auto complete!</p> -->
																
<!-- 														</div> -->
<!-- 										</div> -->
                                        


										Select file to upload: <input type="file" name="file" size="60" /><br />
										<div class="form-actions">
										<br/> <input type="submit" class="btn btn-primary" value="Add New Song" />
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
