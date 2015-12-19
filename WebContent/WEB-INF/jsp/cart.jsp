<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/fragments/head.jsp" />
<body>

	<c:if test="${logged == false}">
		<jsp:include page="/WEB-INF/fragments/header.jsp" />
	</c:if>

	<c:if test="${logged == true}"> 
		<jsp:include page="/WEB-INF/fragments/logged-header.jsp" />
	</c:if>
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
                        <li><a href="SearchByArtist">Artists</a></li>
                        <li class="active"><a href="CartServlet?usrid=${user.userID}">Cart</a></li>
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
						<h2>Shopping Cart</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page title area -->


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div class="product-content-right">
						<div class="woocommerce">
							<form method="post" action="#">
								<table cellspacing="0" class="shop_table cart">
									<thead>
										<tr>
<!-- 											<th class="product-remove">&nbsp;</th> -->
<!-- 											<th class="product-thumbnail">&nbsp;</th> -->
											<th class="product-name">Product</th>
											<th class="product-price">Price</th>
											<th class="product-quantity">Quantity</th>
											<th class="product-subtotal">Total</th>
										</tr>
									</thead>
									<tbody>
									 <c:forEach var="i" items="${items}" >
										<tr class="cart_item">
<!-- 											<td class="product-remove"><a title="Remove this item" -->
<!-- 												class="remove" href="#">×</a></td> -->

<!-- 											<td class="product-thumbnail"><a -->
<!-- 												href="single-product.html"><img width="145" height="145" -->
<!-- 													alt="poster_1_up" class="shop_thumbnail"  -->
<!-- 													src=""></a></td> -->
<!-- 													src="img/product-thumb-2.jpg"></a></td> -->

											<td class="product-name"><a href="single-product.html">${i.name}</a></td>

											<td class="product-price"><span class="amount">${i.price}</span>
											</td>

											<td class="product-quantity">
												<div class="quantity buttons_added">
													<input type="number" size="4" class="input-text qty text"
														title="Qty" value="${i.qte}" min="0" step="1">
												</div>
											</td>

											<td class="product-subtotal"><span class="amount">${i.qte * i.price}</span>
											</td>
										</tr>
										</c:forEach>
										<tr>
											<td class="actions" colspan="6">
											<input type="submit"
												value="Update Cart" name="update_cart" class="button">
											<a class="btn btn-default" href="Checkout?usrid=${user.userID}">Checkout</a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
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