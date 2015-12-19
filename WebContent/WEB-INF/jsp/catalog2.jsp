<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<link rel="stylesheet" href="./content/css/catalog.css">
<jsp:include page="/WEB-INF/fragments/head.jsp" />
<script type="text/javascript">
		$(document).ready(function() {
		    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
		    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
		});	
		</script>
<body>
	<c:if test="${logged == false}">
		<jsp:include page="/WEB-INF/fragments/header.jsp" />
	</c:if>

	<c:if test="${logged == true}"> 
		<jsp:include page="/WEB-INF/fragments/logged-header.jsp" />
	</c:if>
<%-- 	<jsp:include page="/WEB-INF/fragments/header.jsp" /> --%>
	<!-- End header area -->

	<jsp:include page="/WEB-INF/fragments/brandingarea.jsp" />
	<!-- End site branding area -->

	<!-- main menu -->
	
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
                        <li class="active"><a href="Catalog">Catalog</a></li>
                        <li><a href="SearchByGenre">Genres</a></li>
                        <li><a href="SearchByArtist">Artists</a></li>
                        <li><a href="CartServlet?usrid=${user.userID}">Cart</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
	
	<!-- /main menu -->
	<!-- End mainmenu area -->

	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Catalog</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

		
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="product-pagination text-center">
					<nav>
						<ul class="pagination">
							<li><a href="Catalog?letter=BA" aria-label="Previous">Browse All</a></li>
							<li><a href="Catalog?letter=A">A</a></li>
							<li><a href="Catalog?letter=B">B</a></li>
							<li><a href="Catalog?letter=C">C</a></li>
							<li><a href="Catalog?letter=D">D</a></li>
							<li><a href="Catalog?letter=E">E</a></li>
							<li><a href="Catalog?letter=F">F</a></li>
							<li><a href="Catalog?letter=G">G</a></li>
							<li><a href="Catalog?letter=H">H</a></li>
							<li><a href="Catalog?letter=I">I</a></li>
							<li><a href="Catalog?letter=J">J</a></li>
							<li><a href="Catalog?letter=K">K</a></li>
							<li><a href="Catalog?letter=L">L</a></li>
							<li><a href="Catalog?letter=M">M</a></li>
							<li><a href="Catalog?letter=N">N</a></li>
							<li><a href="Catalog?letter=O">O</a></li>
							<li><a href="Catalog?letter=P">P</a></li>
							<li><a href="Catalog?letter=Q">Q</a></li>
							<li><a href="Catalog?letter=R">R</a></li>
							<li><a href="Catalog?letter=S">S</a></li>
							<li><a href="Catalog?letter=T">T</a></li>
							<li><a href="Catalog?letter=U">U</a></li>
							<li><a href="Catalog?letter=V">V</a></li>
							<li><a href="Catalog?letter=W">W</a></li>
							<li><a href="Catalog?letter=X">X</a></li>
							<li><a href="Catalog?letter=Y">Y</a></li>
							<li><a href="Catalog?letter=Z">Z</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		
		
		
	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
<%-- 						<c:forEach var="l" items="${lalbums}"> --%>

				<c:forEach var="l" begin="${((num-1)*8)}" end="${((num-1)*8)+7}">
					<c:if test="${not empty lalbums[l]}">
						
							<div class=" col-md-3 col-sm-6 album">
									<div class="single-shop-product">
										<div class="product-upper">
										<a href="AlbumSongs?idAlbum=${lalbums[l].idAlbum}">
											<img src="${lalbums[l].imageURL}"/></a>
										</div>
										<h2>
											<a href="AlbumSongs?idAlbum=${lalbums[l].idAlbum}">${lalbums[l].title}</a>
										</h2>
										<div class="product-carousel-price">
											<ins>Artist: </ins>${lalbums[l].artist.name}</br>
											<ins>Genre: </ins>${lalbums[l].genre.label}</br>
											<ins>Year:</ins>${lalbums[l].year}</br>
											<ins>Price:</ins>
											$${lalbums[l].price}
											
										</div>
										<form action="CartServlet" method="post">
												<input type="hidden" name="imageURL" value="${lalbums[l].imageURL}">
												<input type="hidden" name="name" value="${lalbums[l].title}">
												<input type="hidden" name="price" value="${lalbums[l].price}">
												<input class="add_to_cart_button" type="submit" value="Add to cart">
											</form>
									
<!-- 									<div class="product-option-shop"> -->
<!-- 											<a class="add_to_cart_button" data-quantity="1" -->
<!-- 												data-product_sku="" data-product_id="70" rel="nofollow" -->
<%-- 												href="CartServlet?name=${lalbums[l].title}&price=${lalbums[l].price}">Add to cart</a> --%>
<!-- 										</div> -->
									</div>
								</div>
					

						</c:if>
						</c:forEach>		

<%-- 					</c:forEach> --%>
				</div>

<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<div class="product-pagination text-center"> -->
<!-- 							<nav> -->
<!-- 								<ul class="pagination"> -->
<%-- 									<li><a href="Catalog?letter=${letter}&num=${num-1}" aria-label="Previous"> <span --%>
<!-- 											aria-hidden="true">&laquo;</span> -->
<!-- 									</a></li> -->
<%-- 									<li><a href="Catalog?letter=${letter}&num=1">1</a></li> --%>
<%-- 									<li><a href="Catalog?letter=${letter}&num=2">2</a></li> --%>
<%-- 									<li><a href="Catalog?letter=${letter}&num=3">3</a></li> --%>
<%-- 									<li><a href="Catalog?letter=${letter}&num=4">4</a></li> --%>
<%-- 									<li><a href="Catalog?letter=${letter}&num=5">5</a></li> --%>
<%-- 									<li><a href="Catalog?letter=${letter}&num=${num+1}" aria-label="Next"> <span --%>
<!-- 											aria-hidden="true">&raquo;</span> -->
<!-- 									</a></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li>
						<a href="Catalog?letter=${letter}&num=${num-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
					</li>
						<c:forEach var="l" begin="1" end="${max}">
							<li><span><a href="Catalog?letter=${letter}&num=${l}">${l}</a></span></li>
						</c:forEach>
					<li>
						<a href="Catalog?letter=${letter}&num=${num+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a>
					</li>
				</ul>
			 </div>
		 </div>




			</div>
		</div>
			


	<jsp:include page="/WEB-INF/fragments/footertop.jsp" />
	<!-- End footer top area -->
	<jsp:include page="/WEB-INF/fragments/footerbottom.jsp" />
	<!-- End footer bottom area -->

	<!-- Latest jQuery form server -->
	<script src="https://code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>
</body>


</html>