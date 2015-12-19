<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/fragments/head.jsp"/>
<body>

 <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    <!-- End header area -->
    
    <jsp:include page="/WEB-INF/fragments/brandingarea.jsp"/>
    <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="Home">Home</a></li>
                        <li><a href="Catalog">Catalog</a></li>
                        <li><a href="SearchByGenre">Genres</a></li>
                        <li  class="active"><a href="SearchByArtist">Artists</a></li>
                        <li><a href="CartServlet?usrid=${user.userID}">Cart</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
     <!-- End mainmenu area -->
     
	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Artists</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- Page Content -->
    <div class="container">



	<!-- Pagination -->
		<div class="row">
			<div class="col-md-12">
				<div class="product-pagination text-center">
					<nav>
						<ul class="pagination">
							<li><a href="SearchByArtist?letter=BA" aria-label="Previous">Browse All</a></li>
							<li><a href="SearchByArtist?letter=A">A</a></li>
							<li><a href="SearchByArtist?letter=B">B</a></li>
							<li><a href="SearchByArtist?letter=C">C</a></li>
							<li><a href="SearchByArtist?letter=D">D</a></li>
							<li><a href="SearchByArtist?letter=E">E</a></li>
							<li><a href="SearchByArtist?letter=F">F</a></li>
							<li><a href="SearchByArtist?letter=G">G</a></li>
							<li><a href="SearchByArtist?letter=H">H</a></li>
							<li><a href="SearchByArtist?letter=I">I</a></li>
							<li><a href="SearchByArtist?letter=J">J</a></li>
							<li><a href="SearchByArtist?letter=K">K</a></li>
							<li><a href="SearchByArtist?letter=L">L</a></li>
							<li><a href="SearchByArtist?letter=M">M</a></li>
							<li><a href="SearchByArtist?letter=N">N</a></li>
							<li><a href="SearchByArtist?letter=O">O</a></li>
							<li><a href="SearchByArtist?letter=P">P</a></li>
							<li><a href="SearchByArtist?letter=Q">Q</a></li>
							<li><a href="SearchByArtist?letter=R">R</a></li>
							<li><a href="SearchByArtist?letter=S">S</a></li>
							<li><a href="SearchByArtist?letter=T">T</a></li>
							<li><a href="SearchByArtist?letter=U">U</a></li>
							<li><a href="SearchByArtist?letter=V">V</a></li>
							<li><a href="SearchByArtist?letter=W">W</a></li>
							<li><a href="SearchByArtist?letter=X">X</a></li>
							<li><a href="SearchByArtist?letter=Y">Y</a></li>
							<li><a href="SearchByArtist?letter=Z">Z</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- /Pagination -->
		
		
	<c:forEach var="l" begin="${((num-1)*5)}" end="${((num-1)*5)+4}">
			<c:if test="${not empty listeartistes[l]}">
<%-- 				<p>${listegenres[l-1]}</p> --%>
			
		
        <!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>${listeartistes[l].name}</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="#">View Albums <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        </c:if>
	</c:forEach>
       
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li>
						<a href="SearchByArtist?letter=${letter}&num=${num-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
					</li>
						<c:forEach var="l" begin="1" end="${max}">
							<li><span><a href="SearchByArtist?letter=${letter}&num=${l}">${l}</a></span></li>
						</c:forEach>
					<li>
						<a href="SearchByArtist?letter=${letter}&num=${num+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
					</li>
				</ul>
			 </div>
		 </div>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>