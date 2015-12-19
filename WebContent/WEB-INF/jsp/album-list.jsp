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
                                <div class="muted pull-left">List of Albums</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                	<div class="btn-group">
                                        <a href="AddAlbum"><button class="btn btn-success"><i class="icon-plus icon-white"></i> Add New</button></a>
                                    </div>	
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
                                                <th>Year</th>
                                                <th>Price</th>
                                                <th>Artist</th>
                                                <th>Editor</th>
                                                <th>Genre</th>
                                                <th>Image</th>
<!--                                                 <th>Track Number</th> -->
<!--                                                 <th>Year</th> -->
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>                                          
                                        <tbody>
	                                       <c:forEach var="u" items="${albums}" >
	                                           <tr class="odd gradeX">
	                                           	   <td>${u.idAlbum}</td>
	                                           	   <td>${u.title}</td>
	                                           	   <td>${u.year}</td>
	                                           	   <td>${u.price}</td>
	                                           	   <td>${u.artist.name}</td>
	                                           	   <td>${u.editor.label}</td>
	                                           	   <td>${u.genre.label}</td>
	                                           	   <td>${u.imageURL}</td>
<%-- 	                                           	   <td>${u.albumtype.label}</td> --%>
<%-- 	                                           	   <td>${u.songPrice}</td> --%>
<%-- 	                                           	   <td>${u.songURL}</td> --%>
<%-- 	                                               <td>${u.trackNumber}</td> --%>
<%-- 	                                               <td>${u.year}</td> --%>
	                                               <td>
	                                               		<div class="btn-group">
                                         					<a href="AlbumEdit?albumID=${u.idAlbum}"><button class="btn btn-primary"><i class="icon-pencil icon-white"></i></button></a>
                                      					</div>
                                      			   </td>
	                                               <td>
	                                               		<div class="btn-group">
                                         					<a href="DeleteAlbum?albumID=${u.idAlbum}"><button class="btn btn-danger"><i class="icon-trash icon-white"></i></button></a>
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