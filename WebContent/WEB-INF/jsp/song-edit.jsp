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

								<!-- block -->
								<div class="block">
									<div class="navbar navbar-inner block-header">
										<div class="muted pull-left">Form Example</div>
									</div>
									<div class="block-content collapse in">
										<div class="span12">

											<form action="SongEdit" method="post" class="form-horizontal">
												<fieldset>
													<legend>Form Horizontal</legend>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Title</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="title" value="${song.title}" required> 
																<input type="hidden" name="songID" value="${song.idSong}">
																<input type="hidden" name="saID" value="${song.idSong}">
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Year</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="year" value="${song.year}" required>
														</div>
													</div>
													<!--                                          <div class="control-group"> -->
													<!--                                           <label class="control-label" for="focusedInput">Genre</label> -->
													<!--                                           <div class="controls"> -->
													<%--                                             <input class="input-xlarge focused" type="text" name="genre" value="${song.genre.label}" required> --%>
													<!--                                           </div> -->
													<!--                                         </div> -->


													<div class="control-group">
														<label class="control-label" for="focusedInput">Duration</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="duration" value="${song.duration}" required>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Price</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="songPrice" value="${song.songPrice}" required>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Genre</label>
														<div class="controls">
															<select name="genre" id="selectError">
																<c:forEach var="g" items="${genres}">
																	<option value="${g.idGenre}">${g.label}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="control-group"> 
														<label class="control-label" for="typeahead">Artist</label>
														 <div class="controls">

															<table>
																<tbody>
																	
																		<c:forEach var="sa" items="${songartists}">
																			<c:if test="${song.idSong == sa.song.idSong}">
																			<tr>
																				<td>${sa.artist.name}</td>
																			</tr>
																				
																			</c:if>
																		</c:forEach>
																	
																</tbody>
															</table>
															<a href="Associations" >Manage Song/Artist associations</a>

														</div>
														</div>
													


													<div class="control-group">
														<label class="control-label" for="fileInput">File
															URL</label>
														<div class="controls">
															<input class="input-file uniform_on" id="fileInput"
																type="file" name="songURL" value="" required>
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