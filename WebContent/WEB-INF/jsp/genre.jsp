<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/fragments/head.jsp"/>
<body>
 	<c:if test="${logged == false}">
		<jsp:include page="/WEB-INF/fragments/header.jsp" />
	</c:if>

	<c:if test="${logged == true}"> 
		<jsp:include page="/WEB-INF/fragments/logged-header.jsp" />
	</c:if>
    <!-- End header area -->
    
    <jsp:include page="/WEB-INF/fragments/brandingarea.jsp"/>
    <!-- End site branding area -->
    
    <!-- mainmenu area -->
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
                        <li class="active"><a href="SearchByGenre">Genres</a></li>
                        <li><a href="SearchByArtist">Artists</a></li>
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
						<h2>Genres</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

<!--     Navigation -->
<!--     <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
<!--         <div class="container"> -->
<!--             Brand and toggle get grouped for better mobile display -->
<!--             <div class="navbar-header"> -->
<!--                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
<!--                     <span class="sr-only">Toggle navigation</span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                     <span class="icon-bar"></span> -->
<!--                 </button> -->
<!--                 <a class="navbar-brand" href="#">Start Bootstrap</a> -->
<!--             </div> -->
<!--             Collect the nav links, forms, and other content for toggling -->
<!--             <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
<!--                 <ul class="nav navbar-nav"> -->
<!--                     <li> -->
<!--                         <a href="#">About</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">Services</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">Contact</a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--             /.navbar-collapse -->
<!--         </div> -->
<!--         /.container -->
<!--     </nav> -->

    <!-- Page Content -->
    <div class="container">

<!--         Page Heading -->
<!--         <div class="row"> -->
<!--             <div class="col-lg-12"> -->
<!--                 <h1 class="page-header">Page Heading -->
<!--                     <small>Secondary Text</small> -->
<!--                 </h1> -->
<!--             </div> -->
<!--         </div> -->
        <!-- /.row -->
		
		 <!-- Pagination -->
			
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li>
						<a href="SearchByGenre?num=${num-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
					</li>
						<c:forEach var="l" begin="1" end="${max}">
							<li><span><a href="SearchByGenre?num=${l}">${l}</a></span></li>
						</c:forEach>
					 <li>
						<a href="SearchByGenre?num=${num+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
					</li>
				</ul>
			 </div>
		 </div>
		 
<!--         <div class="row text-center"> -->
<!--             <div class="col-lg-12"> -->
<!--                 <ul class="pagination"> -->
<!--                     <li> -->
<!--                         <a href="#">&laquo;</a> -->
<!--                     </li> -->
<!--                     <li class="active"> -->
<!--                         <a href="#">1</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">2</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">3</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">4</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">5</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="#">&raquo;</a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
        <!-- /.row -->
		
	<c:forEach var="l" begin="${((num-1)*5)+1}" end="${((num-1)*5)+5}">
			<c:if test="${not empty listegenres[l]}">
<%-- 				<p>${listegenres[l-1]}</p> --%>
			
		
        <!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>${listegenres[l-1].label}</h3>
                <h4>Subheading</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
                <a class="btn btn-primary" href="CatalogByGenre?genreID=${listegenres[l-1].idGenre}">View Albums <span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        </c:if>
	</c:forEach>
       

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