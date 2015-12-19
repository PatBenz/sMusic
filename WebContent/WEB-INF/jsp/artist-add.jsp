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

											<form action="AddArtist" method="post"
												class="form-horizontal">
												<fieldset>
													<legend>Form Horizontal</legend>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Name</label>
														<div class="controls">
															<input class="input-xlarge focused" type="text"
																name="name" value="" required>
															<%--                                              <c:forEach var="u" items="${arttypes}" > --%>
															<input type="hidden" name="artistID" value="">
															<%--                                              </c:forEach> --%>

														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="focusedInput">Select Type</label>
														<div class="controls">

<!-- 															<div class="control-group success"> -->
<!-- 																<label class="control-label" for="selectError">Select -->
<!-- 																	with success</label> -->
<!-- 																<div class="controls"> -->
																	<select name="label" id="selectError">
																	<c:forEach var="u" items="${arttypes}" >
																		<option value="${u.idArtistType}">${u.label}</option>
																	</c:forEach>

																	</select> 
<!-- 																</div> -->
<!-- 															</div> -->

															<!-- 															<input class="input-xlarge focused" type="text" -->
<%-- 																name="label" value="" data-source='[${arttypes.label}]' --%>
<!-- 																required> -->
														</div>
													</div>
													<!--                                          <div class="control-group"> -->
													<!--                                           <label class="control-label" for="focusedInput">Track Number</label> -->
													<!--                                           <div class="controls"> -->
													<%--                                             <input class="input-xlarge focused" type="text" name="trackNumber" value="${song.trackNumber}" required> --%>
													<!--                                           </div> -->
													<!--                                         </div> -->
													<!--                                         <div class="control-group"> -->
													<!--                                           <label class="control-label" for="focusedInput">Duration</label> -->
													<!--                                           <div class="controls"> -->
													<%--                                             <input class="input-xlarge focused" type="text" name="duration" value="${song.duration}" required> --%>
													<!--                                           </div> -->
													<!--                                         </div> -->
													<!--                                         <div class="control-group"> -->
													<!--                                           <label class="control-label" for="focusedInput">Price</label> -->
													<!--                                           <div class="controls"> -->
													<%--                                             <input class="input-xlarge focused" type="text" name="songPrice" value="${song.songPrice}" required> --%>
													<!--                                           </div> -->
													<!--                                         </div> -->
													<!--                                         <div class="control-group"> -->
													<!--                                           <label class="control-label" for="focusedInput">Url</label> -->
													<!--                                           <div class="controls"> -->
													<%--                                             <input class="input-xlarge focused" type="text" name="songURL" value="${song.songURL}"> --%>
													<!--                                           </div> -->
													<!--                                         </div> -->


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