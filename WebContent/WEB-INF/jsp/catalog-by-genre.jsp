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

	<jsp:include page="/WEB-INF/fragments/mainmenu.jsp" />
	<!-- End mainmenu area -->

	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>${genre.label} Catalog</h2>
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
							<li><a href="CatalogByGenre?letter=BA&genreID=${genreID}" aria-label="Previous">Browse All</a></li>
							<li><a href="CatalogByGenre?letter=A&genreID=${genreID}">A</a></li>
							<li><a href="CatalogByGenre?letter=B&genreID=${genreID}">B</a></li>
							<li><a href="CatalogByGenre?letter=C&genreID=${genreID}">C</a></li>
							<li><a href="CatalogByGenre?letter=D&genreID=${genreID}">D</a></li>
							<li><a href="CatalogByGenre?letter=E&genreID=${genreID}">E</a></li>
							<li><a href="CatalogByGenre?letter=F&genreID=${genreID}">F</a></li>
							<li><a href="CatalogByGenre?letter=G&genreID=${genreID}">G</a></li>
							<li><a href="CatalogByGenre?letter=H&genreID=${genreID}">H</a></li>
							<li><a href="CatalogByGenre?letter=I&genreID=${genreID}">I</a></li>
							<li><a href="CatalogByGenre?letter=J&genreID=${genreID}">J</a></li>
							<li><a href="CatalogByGenre?letter=K&genreID=${genreID}">K</a></li>
							<li><a href="CatalogByGenre?letter=L&genreID=${genreID}">L</a></li>
							<li><a href="CatalogByGenre?letter=M&genreID=${genreID}">M</a></li>
							<li><a href="CatalogByGenre?letter=N&genreID=${genreID}">N</a></li>
							<li><a href="CatalogByGenre?letter=O&genreID=${genreID}">O</a></li>
							<li><a href="CatalogByGenre?letter=P&genreID=${genreID}">P</a></li>
							<li><a href="CatalogByGenre?letter=Q&genreID=${genreID}">Q</a></li>
							<li><a href="CatalogByGenre?letter=R&genreID=${genreID}">R</a></li>
							<li><a href="CatalogByGenre?letter=S&genreID=${genreID}">S</a></li>
							<li><a href="CatalogByGenre?letter=T&genreID=${genreID}">T</a></li>
							<li><a href="CatalogByGenre?letter=U&genreID=${genreID}">U</a></li>
							<li><a href="CatalogByGenre?letter=V&genreID=${genreID}">V</a></li>
							<li><a href="CatalogByGenre?letter=W&genreID=${genreID}">W</a></li>
							<li><a href="CatalogByGenre?letter=X&genreID=${genreID}">X</a></li>
							<li><a href="CatalogByGenre?letter=Y&genreID=${genreID}">Y</a></li>
							<li><a href="CatalogByGenre?letter=Z&genreID=${genreID}">Z</a></li>
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

									<div class="product-option-shop">
											<a class="add_to_cart_button" data-quantity="1"
												data-product_sku="" data-product_id="70" rel="nofollow"
												href="Cart?add-to-cart=70">Add to cart</a>
										</div>
									</div>
								</div>
					

						</c:if>
						</c:forEach>		

<%-- 					</c:forEach> --%>
				</div>

<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li>
						<a href="CatalogByGenre?letter=${letter}&genreID=${genreID}&num=${num-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a>
					</li>
						<c:forEach var="l" begin="1" end="${max}">
							<li><span><a href="CatalogByGenre?letter=${letter}&genreID=${genreID}&num=${l}">${l}</a></span></li>
						</c:forEach>
					<li>
						<a href="CatalogByGenre?letter=${letter}&genreID=${genreID}&num=${num+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
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