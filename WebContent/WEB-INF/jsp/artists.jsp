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

	<jsp:include page="/WEB-INF/fragments/header.jsp" />
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
                        <li><a href="Catalog">Catalog</a></li>
                        <li><a href="SearchByGenre">Genres</a></li>
                        <li class="active"><a href="SearchByArtist">Artists</a></li>
                        <li><a href="CartServlet?usrid=${user.userID}">Cart</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
	
	<!-- /main menu -->
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
		
		
		
	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<c:forEach var="l" begin="${((num-1)*8)}" end="${((num-1)*8)+7}">
					<c:if test="${not empty listeartistes[l]}">
						
							<div class=" col-md-3 col-sm-6 album">
									<div class="single-shop-product">
										<div class="product-upper">
										<a href="CatalogByArtist?artistID=${listeartistes[l].idArtist}">
												<img alt="" src="http://placehold.it/700x300"></a>
										</div>
										<h2>
											<a href="CatalogByArtist?artistID=${listeartistes[l].idArtist}">${listeartistes[l].name}</a>
										</h2>
										<div class="product-carousel-price">
											<ins>Artist: </ins>${listeartistes[l].name}</br>
											<ins>Type: </ins>${listeartistes[l].artisttype.label}</br>

										</div>

<!-- 										<div class="product-option-shop"> -->
<!-- 											<a class="add_to_cart_button" data-quantity="1" -->
<!-- 												data-product_sku="" data-product_id="70" rel="nofollow" -->
<!-- 												href="Cart?add-to-cart=70">Add to cart</a> -->
<!-- 										</div> -->
									</div>
								</div>
					

						</c:if>
						</c:forEach>		
				</div>


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