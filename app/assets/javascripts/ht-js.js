(function($) {
	"use strict";
	var HAINTHEMES = HAINTHEMES || {};

	$.fn.exists = function(callback) {
		var args = [].slice.call(arguments, 1);
		if (this.length) {
			callback.call(this, args);
		}
		return this;
	};

	HAINTHEMES.preload = function() {
		/* P r e l o a d */
		$('#preload').fadeOut(200, function(){
			$(this).remove();
		});
	};

	HAINTHEMES.callJcarousel = function() {
		function callJcarousel(object,a,b,c){
			object.on('jcarousel:create jcarousel:reload', function() {
				var element = $(this),
				width = element.innerWidth();
				if (width >= 768) {
					width = width / a;
				} else if (width >= 480) {
					width = width / b;
				} else {
					width = width / c;
				}
				element.jcarousel('items').css('width', width + 'px');
			})
			.jcarousel({
				wrap: 'circular'
			});
			object.parent().find('.jcarousel-control-prev').jcarouselControl({
				target: '-=1'
			});
			object.parent().find('.jcarousel-control-next').jcarouselControl({
				target: '+=1'
			});
		}

		/*special menu home page*/
		callJcarousel($('#ht-special-menu .jcarousel'),4,2,1);
		/* testimonial services page */
		callJcarousel($('#ht-testimonial .jcarousel'),1,1,1);
		/* gallery history page */
		callJcarousel($('#ht-history .gallery .jcarousel'),3,3,3);
		/* menu-detail page */
		callJcarousel($('#ht-menu-detail .gallery .jcarousel'),4,4,4);
		callJcarousel($('#ht-menu-detail .recommended .jcarousel'),4,2,1);
	};


	HAINTHEMES.callIsotope = function() {
		function callIsotope($filterContainer,$child,type) {
			$filterContainer.isotope({
				itemSelector : $child,
				layoutMode : type
			});
			// filter items when filter link is clicked
			$('#filter-controller a').click(function(){
				var selector = $(this).attr('data-filter');
				$filterContainer.isotope({
					filter: selector
				});
				return false;
			});
		}
		/* I s o t o p e   F i l t e r i n g  */
		callIsotope($('#ht-menu.grid #filter-container'),'.dish','fitRows');
		callIsotope($('#ht-menu.set #filter-container'),'.a-set','fitRows');
		callIsotope($('#ht-menu.list #filter-container'),'.dish','fitRows');
		callIsotope($('#ht-gallery.grid #filter-container'),'.frame','fitRows');
		callIsotope($('#ht-gallery.masonry #filter-container'),'.frame','masonry');
		$(window).resize(function(){
			callIsotope($('#ht-gallery.masonry #filter-container'),'.frame','masonry');
		})
	};


	HAINTHEMES.pagiPreview = function() {
		function pagiPreview(object) {
			var width = object.outerWidth(true) + 30;
			object.mouseenter(function(){
				var target = $(this).attr('data-target');
				if (target === "#prev-post") {
					var position = "right";
				} else if (target === "#next-post") {
					var position = "left";
				}
				$(this).parent().find(target).addClass('animated-05s bounceIn').css('display','block').css(position,width);
				// console.log(width);
			});
			object.mouseleave(function(){
				var target = $(this).attr('data-target');
				$(this).parent().find(target).removeClass('animated-05s bounceIn').css('display','none');
			});
		}

		pagiPreview($('.ht-page-control a.prev'));
		pagiPreview($('.ht-page-control a.next'));
	};

	HAINTHEMES.navBar = function() {
		function hoverMenu(object) {
			object.bind('mouseleave mouseenter');
			object.mouseenter(function(){
				$(this).parent().parent().find('.link-list').addClass('animated-025s slideInUp').removeClass('hidden').css('display','block');
				$('#ht-main-nav li.nav').mouseleave(function(){
					$(this).children('.link-list').removeClass('animated-025s slideInUp').addClass('hidden').css('display','none');
				});
			});
		};
		/*  Hover function */
		hoverMenu($('#ht-main-nav li.nav a.nav i.fa'));
		hoverMenu($('#ht-main-nav li.nav a.nav .text'));
		/* M a i n   N a v  */
		/*  Add and remove class hidden for link-list; unbind mouse event when on mobile screen size */
		$(window).on("load resize", function(){
			var width = $(window).outerWidth() + 17; // Still don't know why???
			// console.log(width + 17);
			if ( width >= (768)) {
				$('#ht-main-nav .link-list').addClass('hidden');
				// console.log("hide");
			} else {
				$('#ht-main-nav .link-list').removeClass('hidden');
				$('#ht-main-nav li.nav').unbind('mouseleave');
				// console.log("show");
			}
		});
		/*  Click fucntion */
		$('#ht-main-nav li.nav').click(function(){
			$(this).parents().find('.link-list').slideUp('fast');
			var state = $(this).find('.link-list').css('display');
			if (state === "block") {
				$(this).find('.link-list').slideUp('fast');
			} else if (state != "block") {
				$(this).find('.link-list').slideDown('fast');
			}
		});
		/*  Main Nav Toggle Button */
		$('.ht-navbar-toggle').click(function(){
			var state = $('#ht-main-nav').css('display');
			if (state === "block") {
				$('#ht-main-nav').fadeOut(300);
			} else if (state != "block"){
				$('#ht-main-nav').addClass('animated-05s slideInUp').css('display','block');
			}
		});
	};

	HAINTHEMES.parallaxGen = function() {
		/* Parallax Generator */
		// $('[data-ht-parallax]').each(function() {
		// 	var parallaxHeight = $(this).innerHeight();
		// 	var parallaxOffsetTop = $(this).offset().top;
		// 	var dataAttrFrom = "";
		// 	if($(this).is('#ht-header')) {
		// 		dataAttrFrom = "data-" + parallaxOffsetTop;
		// 	} else {
		// 		dataAttrFrom = "data-" + (parallaxOffsetTop - parallaxHeight);
		// 	}
		// 	var dataAttrTo = "data-" + (parallaxOffsetTop + parallaxHeight);
		// 	var dataMove = $(this).attr("data-ht-parallax");
		// 	var dataFrom = "background-position:0px 0px";
		// 	var dataTo = "background-position:0px " + dataMove + "px";
		// 	$(this).attr(dataAttrFrom,dataFrom).attr(dataAttrTo,dataTo);
		// })
		$('[data-ht-parallax]').exists(function(){
			$('[data-ht-parallax]').each(function() {
				var dataMove = $(this).attr("data-ht-parallax");
				var dataAttrFrom, dataFrom, dataAttrTo, dataTo;
				if($(this).is('#ht-header')) {
					var height = $(this).outerHeight();
					dataAttrFrom = 'data-0';
					dataFrom = 'background-position:0px 0px';
					dataAttrTo = 'data-' + height;
					dataTo = 'background-position: 0px ' + dataMove + 'px';
					// dataAttrFrom = 'data-bottom';
					// dataFrom = 'background-position: 0px -' + dataMove + 'px';
					// dataAttrTo = 'data-top';
					// dataTo = 'background-position:0px 0px';
				} else {
					dataAttrFrom = 'data-bottom-top';
					dataFrom = 'background-position: 0px -' + dataMove + 'px';
					dataAttrTo = 'data-top-bottom';
					dataTo = 'background-position:0px 0px';
				}
				$(this).attr(dataAttrFrom,dataFrom).attr(dataAttrTo,dataTo);
			});
		});
	};

	HAINTHEMES.parallaxInit = function() {
		var iOS = ( navigator.userAgent.match(/(iPad|iPhone|iPod)/g) ? true : false );
		console.log(iOS);
		if (!iOS) {
			var vW = $(window).width();
			if( vW >= 768) {
				var s = skrollr.init({
					forceHeight: false,
					smoothScrolling: false
				});
			} else {
				var s = skrollr.init();
				s.destroy();
			}
			if(Modernizr.touch) {
				var s = skrollr.init();
				s.destroy();
			}
		}
	};

	HAINTHEMES.jcarouselGallery = function() {
		/* J - C a r o u s e l  G a l l e r y */
		/* auto find the first image in gallery navigation and get its src*/
		var src = $('.gallery .navigation ul li:first-child img').attr('src');
		$('.gallery .navigation ul li:first-child img').parents().find('.main-img img').attr('src',src).fadeIn();
		$('.gallery .navigation ul li:first-child img').parents().find('.main-img .hover-overlay').attr('href',src).fadeIn();

		/* Hide the grayscale filter of the first image */
		$('.gallery .navigation li:first-child .BWFilter').addClass('hidden');
		$('.gallery .navigation li:first-child .BWfade').addClass('hidden');
		/* change image when click */
		$('.gallery .navigation li').click(function(){
			var src = $(this).children('img.img-responsive').attr('src');
			$(this).parents().find('.main-img img').fadeOut(300, function(){
				$(this).attr('src',src).fadeIn(300);
			});
			$(this).parents().find('.main-img .hover-overlay').attr('href',src);
			$(this).parents().find('.main-img .shadow').fadeOut(300).fadeIn(300);
			$(this).parent().find('.BWFilter').removeClass('hidden');
			$(this).children('.BWFilter').addClass('hidden');
			$(this).parent().find('.BWfade').removeClass('hidden');
			$(this).children('.BWfade').addClass('hidden');
		});
	};

	HAINTHEMES.mediaContainer = function() {
		/* M e d i a   C o n t a i n e r   M o d u l e   */
		$('.media-container').on({
			mouseenter: function() {
				$(this).find('.icon').addClass('animated-05s bounceInUp');
				$(this).find('.price').addClass('animated-025s slideInDown');
				$(this).find('.saleoff').addClass('animated-025s slideInUp');

				var prcMarLeft = -(($(this).find('.price-wrapper').outerWidth()) / 2);
				var prcMarTop = -(($(this).find('.price-wrapper').outerHeight()) / 2);
				$(this).find('.price-wrapper').css({
					'margin-left': prcMarLeft,
					'margin-top': prcMarTop,
					'left': '50%',
					'top': '50%',
				});
				var icoMarLeft = -(($(this).find('.icon').outerWidth()) / 2);
				var icoMarTop = -(($(this).find('.icon').outerHeight()) / 2);
				$(this).find('.icon').css({
					'margin-left': icoMarLeft,
					'margin-top': icoMarTop,
					'left': '50%',
					'top': '50%',
				});
			},
			mouseleave: function() {
				$(this).find('.icon').removeClass('animated-05s bounceInUp');
				$(this).find('.price').removeClass('animated-025s slideInDown');
				$(this).find('.saleoff').removeClass('animated-025s slideInUp');
			}
		})
	};

	HAINTHEMES.htMap = function() {
		$('.ht-map').exists(function(){
			var mapCounter = 1;
			$('.ht-map').each(function(){
				$(this).attr('id','ht-map-'+ mapCounter);
				mapCounter++;
				var coor = $(this).data('coor');
				var id = $(this).attr('id');
				var zooming = $(this).data('zoom');
				var mapType = $(this).data('map-type');
				var controlUI = $(this).data('control-ui') ? false : true;
				var scrollWheel = $(this).data('scroll-wheel');
				var marker = $(this).data('marker');

				$(this).css('height',$(this).data('height'));

				function initialize() {
					var map_canvas = document.getElementById(id);
					var myLatlng = new google.maps.LatLng(coor[0],coor[1]);
					var map_options = {
						center: myLatlng,
						zoom: zooming,
						mapTypeId: mapType,
						disableDefaultUI: controlUI,
						scrollwheel: scrollWheel
					}
					var map = new google.maps.Map(map_canvas, map_options);
					var marker = new google.maps.Marker({
						position: myLatlng,
						map: map,
						title: marker
					});
				}
				google.maps.event.addDomListener(window, 'load', initialize);
			});
		});
		/* A d d r e s s   P a n e l   I n   M a p */
		$(".map-wrapper .contact").hover(function(){
			$(this).toggleClass('opacity-0');
			$(".map-wrapper .toggle.fa-times").toggleClass('opacity-0');
		});
		$(".map-wrapper .toggle.fa-times").click(function(){
			$(this).fadeOut('fast',function(){
				$(this).remove();
			});
			$(".map-wrapper .contact").fadeOut('slow',function(){
				$(this).remove();
			});
		});
	};

	HAINTHEMES.sideBar = function() {
		/* S i d e b a r   C o l l a p s e   L i s t */
		$("ul#ht-collapsed-list i.fa.level-1").click(function(){
			$(this).parent().find('ul.level-2').toggle('fast');
			$(this).toggleClass('fa-caret-right fa-caret-down');
		});
		$("ul#ht-collapsed-list i.fa.level-2").click(function(){
			$(this).parent().find('ul.level-3').toggle('fast');
			$(this).toggleClass('fa-caret-right fa-caret-down');
		});
	};

	HAINTHEMES.animationOnscreen = function() {
		/* A n i m a t e d   O n S c r e e n   */
		if($(window).width() >= 768) {
			/* HOMEPAGE */
			// $('#ht-ultility').addClass('invisible');
			$('#ht-ultility .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-ultility').find('.foods').parent().addClass('animated bounceInLeft');
					$('#ht-ultility').find('.openning').parent().addClass('animated bounceInUp');
					$('#ht-ultility').find('.reservation').parent().addClass('animated bounceInRight');
					$('#ht-ultility').removeClass('invisible');
				},
			});
			// $('#ht-special-menu').addClass('invisible');
			$('#ht-special-menu .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-special-menu .item').addClass('animated slideInUp');
					$('#ht-special-menu').removeClass('invisible');
				},
			});
			/* SERVICES */
			// $('#ht-services .onscreen-marker').parent().addClass('invisible');
			$('#ht-services .onscreen-marker').onScreen({
				doIn: function() {
					$(this).parent('.srv-1').addClass('animated bounceInLeft');
					$(this).parent('.srv-2').addClass('animated bounceIn');
					$(this).parent('.srv-3').addClass('animated bounceInRight');
					$(this).parent().removeClass('invisible');
				},
			});
			// $('#ht-testimonial').addClass('invisible');
			$('#ht-testimonial .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-testimonial').addClass('animated bounceInUp');
					$('#ht-testimonial').removeClass('invisible');
				},
			});
			/* BLOG */
			// $('#ht-blog').addClass('invisible');
			$('#ht-blog .an-article.onscreen-marker-b').onScreen({
				doIn: function() {
					$(this).find('.media-container').addClass('animated slideInLeft');
					$(this).find('.article-info').addClass('animated slideInRight');
					$('#ht-blog .article-detail').addClass('animated fadeIn');
					$('#ht-blog .sidebar').addClass('animated slideInUp');
					$('#ht-blog').removeClass('invisible');
				},
			});
			/* BLOG DETAIL */
			$('#ht-blog .onscreen-marker-bd').onScreen({
				doIn: function() {
					$('#ht-blog .media-container').addClass('animated slideInLeft');
					$('#ht-blog .article-info').addClass('animated slideInRight');
					$('#ht-blog .article-detail').addClass('animated fadeIn');
					$('#ht-blog .sidebar').addClass('animated slideInUp');
					$('#ht-blog').removeClass('invisible');
				},
			});
			/* CONTACT */
			// $('#ht-social').addClass('invisible');
			$('#ht-social .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-social').addClass('animated slideInLeft');
					$('#ht-social').removeClass('invisible');
				},
			});
			// $('#ht-map').addClass('invisible');
			$('#ht-map .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-map').addClass('animated slideInRight');
					$('#ht-map').removeClass('invisible');
				},
			});
			// $('#ht-feedback').addClass('invisible');
			$('#ht-feedback .onscreen-marker').onScreen({
				doIn: function() {
					$('#ht-feedback').addClass('animated slideInDown');
					$('#ht-feedback').removeClass('invisible');
				},
			})
			/* MENU SET */
			// $('#ht-menu.set .onscreen-marker').addClass('invisible');
			$('#ht-menu.set .onscreen-marker .content').onScreen({
				doIn: function() {
					$(this).parent().find('.media-container').addClass('animated slideInLeft');
					$(this).addClass('animated slideInRight');
					$(this).parent().removeClass('invisible');
				},
			})
			$('#ht-menu.set .total-price.onscreen-marker').onScreen({
				doIn: function() {
					$(this).addClass('animated slideInDown');
					$(this).removeClass('invisible');
				},
			})

			/* MENU SINGLE GRID */
			// $('#ht-menu.grid .onscreen-marker').addClass('invisible');
			$('#ht-menu.grid .onscreen-marker .content').onScreen({
				doIn: function() {
					$(this).parent().find('.media-container').addClass('animated slideInDown');
					$(this).addClass('animated slideInUp');
					$(this).parent().removeClass('invisible');
				},
			})

			/* MENU SINGLE LIST */
			// $('#ht-menu.list .onscreen-marker').addClass('invisible');
			$('#ht-menu.list .onscreen-marker .social').onScreen({
				doIn: function() {
					$(this).parent().parent().find('.media-container').addClass('animated slideInLeft');
					$(this).parent().parent().find('.content').addClass('animated slideInRight');
					$(this).parent().parent().removeClass('invisible');
				},
			})

			/* MENU-DETAIL */
			// $('#ht-menu-detail .onscreen-marker').addClass('invisible');
			$('#ht-menu-detail .onscreen-marker').onScreen({
				doIn: function() {
					$(this).parent().find('.gallery').addClass('animated slideInLeft');
					$(this).parent().find('.dish').addClass('animated slideInRight');
					$(this).parent().find('.item').addClass('animated bounceIn');
					$(this).removeClass('invisible');
				},
			})

			/* RESERVATION */
			// $('#ht-reservation .onscreen-marker').addClass('invisible');
			$('#ht-reservation .onscreen-marker').onScreen({
				doIn: function() {
					$(this).addClass('animated bounceIn');
					$(this).removeClass('invisible');
				},
			})
			/* ABOUT */
			$('#ht-history .gallery .main-img').onScreen({
				doIn: function() {
					$(this).addClass('animated bounceInRight');
				},
			})
			$('#ht-history .gallery .navigation ul li').onScreen({
				doIn: function() {
					$(this).addClass('animated-05s slideInUp');
				},
				doOut: function() {
					$(this).removeClass('animated bounceIn');
				}
			})
			$('#ht-team .onscreen-marker').onScreen({
				doIn: function() {
					$(this).addClass('animated bounceInDown');
				},
			})
		}
	};

	HAINTHEMES.commentReply = function() {
		/* R e p l y   c o m m e n t   A c c o r d i o n  A c t i o n */
		$('.comment a.reply').click(function(){
			$('.comment a.reply').html('Reply');
			$(this).parents().find('.reply-comment').slideUp('fast');
			var state = $(this).parent().parent().find('.reply-comment').css('display');
			if (state === "block") {
				$(this).parent().parent().find('.reply-comment').slideUp('fast');
				$(this).html('Reply');
			} else if (state != "block"){
				$(this).parent().parent().find('.reply-comment').slideDown('fast');
				$(this).html('Cancel');
			}
		});
	};

	HAINTHEMES.starRating = function() {
		$('.ht-rating').each(function(){
			if($(this).hasClass('rated')) {
				$(this).find('.rating-input').click(false);
				$(this).find('input:eq(' + (5 - $(this).data("rated")) + ')').attr('checked','');
			}
		});
		$('.ht-rating .rating-input').on('click', function(){
			$(this)
				.parent().find('.rating-input').click(false)
				.parent().addClass('rated');
		});
	};

	HAINTHEMES.slider = function() {
		$('#ht-header').each(function(){
			var $this = $(this);
			$this.find('.ht-flexslider').flexslider({
				animation		:	$this.data('effect'),
				direction		:	$this.data('direction'),
				controlNav		:	$this.data('pager'),
				directionNav	:	$this.data('navi'),
				slideshow		:	$this.data('auto'),
				easing			:  "easeInOutExpo",
				useCSS			:  false,
				pauseOnHover	:	true,
				animationSpeed	:	1000,
				slideshowSpeed	:	5000,
				smoothHeight	:	true,
				prevText		:	'<span class ="glyphicon glyphicon-chevron-left"></span>',
				nextText		:	'<span class ="glyphicon glyphicon-chevron-right"></span>',
			});
		});
		$('.ht-flexslider.basic').exists(function(){
			$('.ht-flexslider.basic').each(function(){
				var $this = $(this);
				$this.flexslider({
					animation		:	$this.data('effect'),
					direction		:	$this.data('direction'),
					easing			:  "easeInOutExpo",
					useCSS			:  false,
					pauseOnHover	:	true,
					animationSpeed	:	800,
					slideshowSpeed	:	5000,
					controlNav		:	$this.data('pager'),
					directionNav	:	$this.data('navi'),
					slideshow		:	$this.data('auto'),
					smoothHeight	:	true,
					prevText		:	'<span class ="glyphicon glyphicon-chevron-left"></span>',
					nextText		:	'<span class ="glyphicon glyphicon-chevron-right"></span>',
				});
			});
		});

		$('.ht-flexslider-carousel').exists(function(){
			$('.ht-flexslider-carousel').each(function(){
				var $slider = $(this).find('#slider');
				var $carousel = $(this).find('#carousel');
				// Carousel must be initialize before slider
				$carousel.flexslider({
					asNavFor			:  '#slider',
					animation		:	"slide",
					directionNav	:	$carousel.data('navi'),
					itemWidth		:  $carousel.data('item-width'),
					controlNav		:	false,
					animationLoop	:  false,
					itemMargin		:  0,
					prevText		:	'<span class ="glyphicon glyphicon-chevron-left"></span>',
					nextText		:	'<span class ="glyphicon glyphicon-chevron-right"></span>',
				});
				$slider.flexslider({
					sync				: 	'#carousel',
					animation		:	$slider.data('effect'),
					controlNav		:	$slider.data('pager'),
					directionNav	:	$slider.data('navi'),
					slideshow		:	$slider.data('auto'),
					animationLoop	:  false,
					easing			:  "easeInOutExpo",
					useCSS			:  false,
					pauseOnHover	:	true,
					animationSpeed	:	800,
					slideshowSpeed	:	5000,
					smoothHeight	:	true,
					prevText		:	'<span class ="glyphicon glyphicon-chevron-left"></span>',
					nextText		:	'<span class ="glyphicon glyphicon-chevron-right"></span>',
				});
			});
		});
	};

	HAINTHEMES.otherPlugin = function() {
		$('img').addClass('img-responsive');
		/* G r a y   S c a l e */
		$('.bw-wrapper').BlackAndWhite({
			hoverEffect : true,
			webworkerPath : false,
			responsive: true,
			invertHoverEffect: false,
			intensity:1,
			speed: {
				fadeIn: 200,
				fadeOut: 200
			},
			onImageReady:function(img) {}
		});
		/* N i v o   L i g h t b o x */
		$('a.nivo-lightbox').nivoLightbox({
			effect: 'fadeScale',
			theme: 'default',
			keyboardNav: true,
			clickOverlayToClose: true,
			onInit: function(){},
			beforeShowLightbox: function(){},
			afterShowLightbox: function(lightbox){},
			beforeHideLightbox: function(){},
			afterHideLightbox: function(){},
			onPrev: function(element){},
			onNext: function(element){},
			errorMessage: 'The requested content cannot be loaded. Please try again later.'
		});

		/* D a t e   T i m e   P i c k e r */
		$("#dtBox").DateTimePicker();

		/*  Set Active On Click For Tab Nav */
		$('.ht-tab-nav ul li a').click(function(){
			$('.ht-tab-nav ul li a').removeClass('active');
			$(this).addClass('active');
		});

		/* Column-count */
		$('.ht-column-count').each(function(){
			var col = $(this).attr('data-column');
			$(this).columnize({ columns: col });
		});
	}

	HAINTHEMES.styleSwitcher = function() {
		/* S t y l e   s w i t c h e r  */
		$('#ht-style-switcher .toggle').on('click', function(){
			$(this).toggleClass('active');
			$('#ht-style-switcher').toggleClass('active');
		});
		$('#ht-style-switcher .change-color li').on('click', function(){
			var href = $(this).attr('data-href');
			$('#theme').attr('href',href);
		});
		$('#ht-style-switcher .change-nav li').on('click', function(){
			var href = $(this).attr('data-href');
			$('#ht-main-nav ul.main-nav').removeClass('nav-icon nav-text').addClass(href);
		});
		$('#ht-style-switcher .change-color li').tooltip();
	}

	/* Init Functions
	-------------------------------------------------------------------------*/
	$(document).ready(function() {
		HAINTHEMES.callIsotope();
		HAINTHEMES.callJcarousel();
		HAINTHEMES.pagiPreview();
		HAINTHEMES.navBar();
		HAINTHEMES.parallaxGen();
		HAINTHEMES.jcarouselGallery();
		HAINTHEMES.mediaContainer();
		HAINTHEMES.htMap();
		HAINTHEMES.sideBar();
		HAINTHEMES.animationOnscreen()
		HAINTHEMES.commentReply();
		HAINTHEMES.otherPlugin();
		HAINTHEMES.slider();
		HAINTHEMES.starRating();
		HAINTHEMES.styleSwitcher();
	});

	$(window).load(function(){
		setTimeout(HAINTHEMES.parallaxInit, 100);
		HAINTHEMES.preload();
	});

	$(window).on('resize', function(){
		HAINTHEMES.parallaxInit();
	});

})(jQuery); // EOF