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

											<form action="AddAlbum" method="post"
												class="form-horizontal">
												<fieldset>
													<legend>Form Horizontal</legend>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Title</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="title" value="${album.title}" required> <input
																type="hidden" name="albumID" value="${album.idAlbum}">
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Year</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="year" value="${album.year}" required>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Price</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="price" value="${album.price}" required>
														</div>
													</div>
<!-- 													<div class="control-group"> -->
<!-- 														<label class="control-label" for="focusedInput">Artist</label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input class="input-xlarge focused" type="text" -->
<%-- 																name="name" value="${album.artist.name}" required> --%>
<!-- 														</div> -->
<!-- 													</div> -->

<!-- 													<div class="control-group"> -->
<!-- 														<label class="control-label" for="typeahead">Artist </label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input type="text" class="span6" id="typeahead" -->
<!-- 																data-provide="typeahead" data-items="4" -->
<!-- 																data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'> -->
<!-- 															<p class="help-block">Start typing to activate auto -->
<!-- 																complete!</p> -->
<!-- 														</div> -->
<!-- 													</div> -->

													<div class="control-group">
														<label class="control-label" for="typeahead">Artist </label>
														<div class="controls">
															<input type="text" name="artistname" class="span6" id="typeahead"
																data-provide="typeahead" data-items="4"
																data-source='[
																<c:forEach var="a" items="${artists}">"${a.name}",</c:forEach>
																""]'
																>
															<p class="help-block">Start typing to activate auto complete!</p>
																
														</div>
													</div>

<!-- 													<div class="control-group"> -->
<!-- 														<label class="control-label" for="focusedInput">Editor</label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input class="input-xlarge focused" type="text" -->
<%-- 																name="editor" value="${album.editor.label}" required> --%>
<!-- 														</div> -->
<!-- 													</div> -->

													
													<div class="control-group">
														<label class="control-label" for="typeahead">Editor </label>
														<div class="controls">
															<input type="text" name="editorlabel" class="span6" id="typeahead"
																data-provide="typeahead" data-items="4"
																data-source='[
																<c:forEach var="e" items="${editors}">"${e.label}",</c:forEach>
																""]'
																>
															<p class="help-block">Start typing to activate auto complete!</p>
																
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


<!-- 													<div class="control-group"> -->
<!-- 														<label class="control-label" for="focusedInput">Genre</label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input class="input-xlarge focused" type="text" -->
<%-- 																name="genre" value="${album.genre.label}" required> --%>
<!-- 														</div> -->
<!-- 													</div> -->
													
													
													
													<div class="control-group">
														<label class="control-label" for="fileInput">Image</label>
														<div class="controls">
															<input class="input-file uniform_on" id="fileInput"
																type="file" name="imageURL" value="">
														</div>
													</div>
													
													
<!-- 												ancien input image	 -->
<!-- 													<div class="control-group"> -->
<!-- 														<label class="control-label" for="focusedInput">Image</label> -->
<!-- 														<div class="controls"> -->
<!-- 															<input class="input-xlarge focused" type="text" -->
<%-- 																name="imageURLimg" value="${album.imageURL}" required> --%>
<!-- 														</div> -->
<!-- 													</div> -->


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