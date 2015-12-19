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
	<!-- End header area -->
	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Checkout</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-4">

					<h3 id="order_review_heading">Your order</h3>

					<div id="order_review" style="position: relative;">
						<table class="shop_table">
							<thead>
								<tr>
									<th class="product-name">Product</th>
									<th class="product-total">Total</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${items}" >
									<tr class="cart_item">
										<td class="product-name">${i.name} <strong
											class="product-quantity">${i.qte}</strong>
										</td>
											<td class="product-total"><span class="amount">${i.qte * i.price}$</span>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>

								<tr class="cart-subtotal">
									<th>Cart Subtotal</th>
									<td><span class="amount">${cart.total}$</span></td>
								</tr>

								<tr class="shipping">
									<th>Shipping and Handling</th>
									<td>Free Shipping <input type="hidden"
										class="shipping_method" value="free_shipping"
										id="shipping_method_0" data-index="0"
										name="shipping_method[0]">
									</td>
								</tr>


								<tr class="order-total">
									<th>Order Total</th>
									<td><strong><span class="amount">${cart.total}$</span></strong></td>
								</tr>

							</tfoot>
						</table>


						<div id="payment">
							<ul class="payment_methods methods">
								<li class="payment_method_bacs"><input type="radio"
									data-order_button_text="" checked="checked" value="bacs"
									name="payment_method" class="input-radio"
									id="payment_method_bacs"> <label
									for="payment_method_bacs">Credit Card</label>
									<div class="payment_box payment_method_bacs">
										<p>Make your payment directly into our bank account.
											Please use your Order ID as the payment reference. Your order
											won’t be shipped until the funds have cleared in our account.</p>
									</div></li>
								
								<li class="payment_method_paypal"><input type="radio"
									data-order_button_text="Proceed to PayPal" value="paypal"
									name="payment_method" class="input-radio"
									id="payment_method_paypal"> <label
									for="payment_method_paypal">PayPal <img
										alt="PayPal Acceptance Mark"
										src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png"><a
										title="What is PayPal?"
										onclick="javascript:window.open('https://www.paypal.com/gb/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"
										class="about_paypal"
										href="https://www.paypal.com/gb/webapps/mpp/paypal-popup">What
											is PayPal?</a>
								</label>
									<div style="display: none;"
										class="payment_box payment_method_paypal">
										<p>Pay via PayPal; you can pay with your credit card if
											you don’t have a PayPal account.</p>
									</div></li>
							</ul>

							<div class="form-row place-order">

								<input type="submit" data-value="Place order"
									value="Place order" id="place_order"
									name="woocommerce_checkout_place_order" class="button alt">


							</div>

							<div class="clear"></div>

						</div>
					</div>
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