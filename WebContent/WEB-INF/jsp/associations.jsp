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
                                                <th>TrackNumber</th>
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
												   		<c:forEach var="sab" items="${songalbums}" > 
												   			<c:if test="${s.idSong == sab.song.idSong}">
   																${sab.trackNumber}<br>
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
                                         					<a href="DeleteAssociations?songID=${s.idSong}"><button class="btn btn-danger"><i class="icon-trash icon-white"></i></button></a>
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