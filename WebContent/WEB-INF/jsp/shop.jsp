<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/fragments/head.jsp"/>
  <body>
   
    <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    <!-- End header area -->
    
    <jsp:include page="/WEB-INF/fragments/brandingarea.jsp"/>
    <!-- End site branding area -->
    
    <jsp:include page="/WEB-INF/fragments/mainmenu.jsp"/>
     <!-- End mainmenu area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
       
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
           
            <c:forEach var="l" items="${lalbums}" >
            <!-- one product -->
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="product-upper">
                            <img src="img/product-2.jpg" alt="">
                        </div>
                        <h2><a href="">${l.name}</a></h2>
                        <div class="product-carousel-price">
                            <ins>$${l.price}</ins> <del>$999.00</del>
                        </div>  
                        
                        <div class="product-option-shop">
                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
                        </div>                       
                    </div>
                </div>
            <!-- end one product -->
            </c:forEach>
              
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-1.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->


<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->


<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-4.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->


<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-2.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-1.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-4.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-2.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-1.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="single-shop-product"> -->
<!--                         <div class="product-upper"> -->
<!--                             <img src="img/product-4.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <h2><a href="">Apple new mac book 2015 March :P</a></h2> -->
<!--                         <div class="product-carousel-price"> -->
<!--                             <ins>$899.00</ins> <del>$999.00</del> -->
<!--                         </div>   -->
                        
<!--                         <div class="product-option-shop"> -->
<!--                             <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a> -->
<!--                         </div>                        -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                          <ul class="pagination">
                            <li>
                              <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                              <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                          </ul>
                        </nav>                        
                    </div>
                </div>
            </div>
        </div>
    </div>

  	<jsp:include page="/WEB-INF/fragments/footertop.jsp"/>
   	<!-- End footer top area -->
    <jsp:include page="/WEB-INF/fragments/footerbottom.jsp"/>
 	<!-- End footer bottom area -->
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>