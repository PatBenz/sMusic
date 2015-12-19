<!--  view-source:http://jonhall.info/examples/html5_audio_playlist_example.html  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<!-- "no-cache" dire au browser de pas garder la page en cache... pr résoudre le probleme du boutton back lors du logout -->
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0">

<!--     <meta charset="utf-8"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Album Songs</title>

<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="./content/css/owl.carousel.css">
<link rel="stylesheet" href="./content/style.css">
<link rel="stylesheet" href="./content/css/responsive.css">

<link rel="stylesheet" href="./content/css/player.css" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="./content/js/player.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/fragments/header.jsp" />
	<!-- End header area -->

	<jsp:include page="/WEB-INF/fragments/brandingarea.jsp" />
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
                        <li  class="active"><a href="Catalog">Catalog</a></li>
                        <li><a href="SearchByGenre">Genres</a></li>
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
						<h2>${album.title}</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="container">
		<div id="content" role="main">
			<div id="cwrap">
				<div id="nowPlay" class="is-audio">

				
					<!-- 					<div class="plHead"> -->
					<div>
<%-- 						<div class="plHeadTitle">${album.title}</div> --%>
						
						<div class="product-option-shop">
						
						
							
						
						
<!-- 										<a class="add_album_button" data-quantity="1" -->
<!-- 											data-product_sku="" data-product_id="70" rel="nofollow" -->
<!-- 											href="Cart?add-to-cart=70">Buy Album  <i class="fa fa-cart-plus"></i></a> -->
											
											
										
						</div>
					</div>
					
					
				</div>
				<div id="plwrap" class="is-audio">
					<div id="cover-art">
						<img id="cover-art" src="${album.imageURL}">
					</div>

					
					<div id="playlist">
						<h4>${album.title} <i>by</i> ${album.artist.name} </h4>
						<form action="CartServlet" method="post">
												<input type="hidden" name="imageURL" value="">
												<input type="hidden" name="name" value="${album.title}">
												<input type="hidden" name="price" value="${album.price}">
												<input class="add_to_cart_button" type="submit" value="Buy Album!">
											</form>	
						<div class="clear"></div>
						<ul id="plUL">
							<c:forEach var="s" items="${asongs}">
								<li class="plItem">
									<div class="plNum">${s.trackNumber}</div>
									<div class="plTitle">${s.song.title}</div>
									<div class="plLength">${s.song.duration}</div>    
									<div id="songPrice"><i class="fa fa-eur"></i>${s.song.songPrice}</div>
									<div class="product-option-shop">
									
									<form action="CartServlet" method="post">
												<input type="hidden" name="imageURL" value="">
												<input type="hidden" name="name" value="${s.song.title}">
												<input type="hidden" name="price" value="${s.song.songPrice}">
												<input class="fa fa-cart-plus" type="submit" value="Add to cart">
											</form>
<!-- 										<a href="" class="add_to_cart_button">   -->
<!-- 											<i class="fa fa-cart-plus"></i></a> -->
											
											
									</div>
								</li>

							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
				
			<div id="audiowrap">
						<h3 id="npAction">Paused:</h3>
						<div id="npTitle"></div>
						<div id="audio0">
							<audio id="audio1" controls="controls">
							</audio>
						</div>
						<noscript>Your browser does not support JavaScript or
							JavaScript has been disabled. You will need to enable JavaScript
							for this page.</noscript>
						<div id="extraControls" class="is-audio">
							<button id="btnPrev" class="ctrlbtn btn btn-track">
								<i class="fa fa-fast-backward"></i>
							</button>
							<button id="btnNext" class="ctrlbtn btn btn-track">
								<i class="fa fa-fast-forward"></i>
							</button>
						</div>
					</div>
				<br>
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

	<script type="text/javascript"
		src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-1.8.0.min.js"><\/script>');
	</script>
	<script type="text/javascript">
		jQuery(function($) {
			var supportsAudio = !!document.createElement('audio').canPlayType;
			if (supportsAudio) {
				var index = 0, playing = false;
						mediaPath = './music/',
						extension = '',
						tracks = [ 
						          
						<c:forEach var="s" items="${asongs}" varStatus="vs">
							<c:choose>
								<c:when test="${fn:length(asongs)==(vs.index+1)}">
									{
										"track" : "<c:out value="${vs.index + 1}"/>",
										"name" : "<c:out value="${s.song.title}"/>",
										"length" : "<c:out value="${s.song.duration}" />" ,
										"file" : "<c:out value="${s.song.songURL}" />"
									}
								</c:when>
								<c:otherwise>
									{
										"track" : "<c:out value="${vs.index + 1}"/>",
										"name" : "<c:out value="${s.song.title}"/>",
										"length" : "<c:out value="${s.song.duration}" />" ,
										"file" : "<c:out value="${s.song.songURL}" />"
									},
								</c:otherwise>
							</c:choose>								
							</c:forEach>
								
								],
						trackCount = tracks.length,
						npAction = $('#npAction'),
						npTitle = $('#npTitle'),
						audio = $('#audio1').bind('play', function() {
							playing = true;
							npAction.text('Now Playing:');
						}).bind('pause', function() {
							playing = false;
							npAction.text('Paused:');
						}).bind('ended', function() {
							npAction.text('Paused:');
							if ((index + 1) < trackCount) {
								index++;
								loadTrack(index);
								audio.play();
							} else {
								audio.pause();
								index = 0;
								loadTrack(index);
							}
						}).get(0),
						btnPrev = $('#btnPrev').click(function() {
							if ((index - 1) > -1) {
								index--;
								loadTrack(index);
								if (playing) {
									audio.play();
								}
							} else {
								audio.pause();
								index = 0;
								loadTrack(index);
							}
						}),
						btnNext = $('#btnNext').click(function() {
							if ((index + 1) < trackCount) {
								index++;
								loadTrack(index);
								if (playing) {
									audio.play();
								}
							} else {
								audio.pause();
								index = 0;
								loadTrack(index);
							}
						}),
						li = $('#plUL li').click(function() {
							var id = parseInt($(this).index());
							if (id !== index) {
								playTrack(id);
							}
						}),
						loadTrack = function(id) {
							$('.plSel').removeClass('plSel');
							$('#plUL li:eq(' + id + ')').addClass('plSel');
							npTitle.text(tracks[id].name);
							index = id;
							audio.src = mediaPath + tracks[id].file + extension;
						}, playTrack = function(id) {
							loadTrack(id);
							audio.play();
						};

				extension = audio.canPlayType('audio/mpeg') ? '' : audio
						.canPlayType('audio/ogg') ? '.ogg' : '';

				loadTrack(index);
			}

			$('#useLegend')
					.click(
							function(e) {
								e.preventDefault();
								$('#use')
										.slideToggle(
												300,
												function() {
													$('#useSpanSpan')
															.text(
																	($('#use')
																			.css(
																					'display') == 'none' ? 'show'
																			: 'hide'));
												});
							});
		});
	</script>
</body>
</html>