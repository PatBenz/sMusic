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
                        <li><a href="SearchByGenre">Genre</a></li>
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
						<h2>${album.title}</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- Page Content -->
    <div class="container">
    	<div class="row">
    		<div class="col-md-12">
			
				<div class="player">
				    <div class="pl"></div>
				    <div class="title"></div>
				    <div class="artist"></div>
				    <div class="cover"></div>
				    <div class="controls">
				        <div class="play"></div>
				        <div class="pause"></div>
				        <div class="rew"></div>
				        <div class="fwd"></div>
				    </div>
				    <div class="volume"></div>
				    <div class="tracker"></div>
				</div>
				<ul class="playlist">
				    <li audio url="01.mp3" cover="cover1.jpg" artist="Artist 1">01.mp3</li>
				    <li audio url="02.mp3" cover="cover2.jpg" artist="Artist 2">02.mp3</li>
				    <li audio url="03.mp3" cover="cover3.jpg" artist="Artist 3">03.mp3</li>
				    <li audio url="04.mp3" cover="cover4.jpg" artist="Artist 4">04.mp3</li>
				    <li audio url="05.mp3" cover="cover5.jpg" artist="Artist 5">05.mp3</li>
				    <li audio url="06.mp3" cover="cover6.jpg" artist="Artist 6">06.mp3</li>
				    <li audio url="07.mp3" cover="cover7.jpg" artist="Artist 7">07.mp3</li>
				</ul>
	 		</div> 
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