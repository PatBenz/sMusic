   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
<!--                         <h1><a href="index.html">e<span>Electronics</span></a></h1> -->
                         <h1><a href="index.html">s<span>Music</span></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
                    <div class="shopping-item">
           		         	<c:if test="${not empty cart}">
								<a href="CartServlet?usrid=${user.userID}">Cart - <span class="cart-amunt">$ ${cart.total} </span> <i class="fa fa-shopping-cart"></i> <span class="product-count">${cart.numberOfItems}</span></a>
							</c:if>
							<c:if test="${empty cart}">
								<a href="CartServlet?usrid=${user.userID}">Cart - <span class="cart-amunt">$0 </span> <i class="fa fa-shopping-cart"></i> <span class="product-count">0</span></a>
							</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>