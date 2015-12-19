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
                                <div class="muted pull-left">List of Songs</div>
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
                                                <th>Title</th>
                                     
                                                
                                             
                                                
												<th>Artist(s)</th>
                                                <th>Album(s)</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>                                          
                                        <tbody>
	                                       <c:forEach var="s" items="${songs}" >                                                                   	
	                                           <tr class="odd gradeX">
	                                           	   <td>${s.idSong}</td>
	                                           	   <td>${s.title}</td>
	                                           	  
	                                           	   
	                                              
												   	<td>
												   		<c:forEach var="sa" items="${songartists}" > 
												   			<c:if test="${s.idSong == sa.song.idSong}">
   																${sa.artist.name}<br>
															</c:if>
														</c:forEach>
														 
													</td>
													<td>
												   		<c:forEach var="sab" items="${songalbums}" > 
												   			<c:if test="${s.idSong == sab.song.idSong}">
   																${sab.album.title}<br>
															</c:if>
														</c:forEach>
														 
													</td>
	                                               
	                                               <td>
	                                               		<div class="btn-group">
                                         					<a href="NewAssociations?songID=${s.idSong}"><button class="btn btn-primary"><i class="icon-plus icon-white"></i></button></a>
                                      					</div>
                                      			   </td>
	                                               <td>
	                                               		<div class="btn-group">
                                         					<a href="DeleteSong?songID=${s.idSong}"><button class="btn btn-danger"><i class="icon-trash icon-white"></i></button></a>
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
                        <!-- block -->
                        <div class="block">
									<div class="navbar navbar-inner block-header">
										<div class="muted pull-left">Form Example</div>
									</div>
									<div class="block-content collapse in">
										<div class="span12">

											<form action="NewAssociations" method="post" class="form-horizontal">
												<fieldset>
													<legend>Editing "${song.title}"</legend>
																																																							
												<div class="control-group">
														<label class="control-label" for="typeahead">New Artist </label>
														<div class="controls">
															<input type="text" name="artistname" class="span6" id="typeahead"
																data-provide="typeahead" data-items="4"
																data-source='[
 																<c:forEach var="art" items="${artists}">"${art.name}",</c:forEach> 
 																""]'
																>
															<p class="help-block">Start typing to activate auto complete!</p>
															<input type="hidden" name="songID" value="${song.idSong}">
															<input type="hidden" name="songID" value="${song.idSong}">	
														</div>
													</div>
													
													<div class="control-group">
														<label class="control-label" for="typeahead">New Album </label>
														<div class="controls">
															<input type="text" name="albumtitle" class="span6" id=""
																data-provide="typeahead" data-items="4"
																data-source='[
																<c:forEach var="alb" items="${albums}">"${alb.title}",</c:forEach>
																""]'
																>
															<p class="help-block">Start typing to activate auto complete!</p>
																												
														</div>
														<div class="controls">
																<label class="control-label" for="typeahead">TrackNumber &nbsp;</label>
																<select name="tracknumber" id="selectError">
<%-- 																	<c:forEach var="t" items="${genres}"> --%>
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																		<option value="6">6</option>
																		<option value="7">7</option>
																		<option value="8">8</option>
																		<option value="9">9</option>
																		<option value="10">10</option>
																		<option value="11">11</option>
																		<option value="12">12</option>
																		<option value="13">13</option>
																		<option value="14">14</option>
																		<option value="15">15</option>
																		<option value="16">16</option>
																		<option value="17">17</option>
																		<option value="18">18</option>
																		<option value="19">19</option>
																		<option value="20">20</option>
																		<option value="21">21</option>
																		<option value="22">22</option>
																		<option value="23">23</option>
																		<option value="24">24</option>
																		<option value="25">25</option>
																		<option value="26">26</option>
																		<option value="27">27</option>
																		<option value="28">28</option>
																		<option value="29">29</option>
																		<option value="30">30</option>
																		
																		
<%-- 																	</c:forEach> --%>
																</select>
															</div>
													</div>
													

													<div class="form-actions">
														<button type="submit" class="btn btn-primary">Save
															changes</button>
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
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013</p>
            </footer>
        </div>
        <!--/.fluid-container-->
        
  	<jsp:include page="/WEB-INF/fragments/admin-footer.jsp" />      