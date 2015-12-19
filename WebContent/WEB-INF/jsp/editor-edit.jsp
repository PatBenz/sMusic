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
                                
                                     <form action="EditorEdit" method="post" class="form-horizontal">
                                      <fieldset>
                                        <legend>Form Horizontal</legend>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">Enter Label</label>                                    
                                          <div class="controls">
                                            <input class="input-xlarge focused" type="text" name="label" value="${editor.label}" required>
                                             <input type="hidden" name="editorID" value="${editor.idEditor}">
                                          </div>
                                        </div>

<!-- 										<div class="control-group"> -->
<!-- 											<label class="control-label" for="focusedInput">Type</label> -->
<!-- 												<div class="controls"> -->
<!-- 													<select name="label" id="selectError"> -->
<%-- 														<c:forEach var="u" items="${arttypes}"> --%>
<%-- 															<option value="${u.idArtistType}">${u.label}</option> --%>
<%-- 														</c:forEach>	 --%>
<!-- 													</select> -->
<!-- 												</div> -->
<!-- 										</div> -->


                                                                                    
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