<!--
Author: W3layouts
Author URL: http://w3layouts.com
-->
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Farm Friendly Chat Bot</title>
  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css2?family=Poppins:wght@300;600;700&display=swap" rel="stylesheet">
  <!-- google fonts -->
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <!-- Template CSS -->
</head>

<body>
  <!--header-->
  <%@include file="header.jsp" %>
  <!-- //header -->
  <!-- main-slider -->
  <section class="w3l-main-slider" id="home">
    <div class="companies20-content">
      <div class="owl-one owl-carousel owl-theme">
        <div class="item">
          <li>
            <div class="slider-info banner-view bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg text-left">
                    <p>Good Food</p>
                    <h5>Experience Them Real Agricultural</h5>
                    <!--<a href="about.html" class="btn btn-white">Read More</a>-->
                  </div>
                </div>
              </div>
              <div class="banhny-w3grids">
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner1.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Organic Fertilizers</a></h4>
                </div>
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner2.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Expert & Professional Farm</a></h4>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info  banner-view banner-top1 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg text-left">
                    <p>Good Food</p>
                    <h5>Healthy Food for Good Health</h5>
                    <a href="about.jsp" class="btn btn-white">Read More</a>
                  </div>
                </div>
              </div>
              <div class="banhny-w3grids">
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner3.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Agricultural Products</a></h4>
                </div>
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner4.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Fresh Dairy Products</a></h4>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info banner-view banner-top2 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg text-left">
                    <p>Good Food</p>
                    <h5>Healthy Milk for Good Health</h5>
                    <a href="about.jsp" class="btn btn-white">Read More</a>
                  </div>
                </div>
              </div>
              <div class="banhny-w3grids">
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner1.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Organic Fertilizers</a></h4>
                </div>
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner2.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Expert & Professional Farm</a></h4>
                </div>
              </div>
            </div>
          </li>
        </div>
        <div class="item">
          <li>
            <div class="slider-info banner-view banner-top3 bg bg2">
              <div class="banner-info">
                <div class="container">
                  <div class="banner-info-bg text-left">
                    <p>Good Food</p>
                    <h5>Experience Them Real Agricultural</h5>
                    <!--<a href="about.html" class="btn btn-white">Read More</a>-->
                  </div>
                </div>
              </div>
              <div class="banhny-w3grids">
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner3.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Organic Fertilizers</a></h4>
                </div>
                <div class="banhny-w3grids-1">
                  <img src="assets/images/banner4.jpg" class="img-curve img-fluid" alt="" />
                  <h4><a href="#" class="hnys-title">Expert & Professional Farm</a></h4>
                </div>
              </div>
            </div>
          </li>
        </div>
      </div>
    </div>
  </section>
  <!-- /main-slider -->
  <!--/grids-->

  <!--//grids-->
  <!--/services-->

  <!--//services-->
  <!--/grids-->
 
  <!--//grids-->
  <!--/grids2-->

  <!--//grids2-->
  <!-- stats -->
 
  <!-- //stats -->
  <!--/w3l-bottom-->
 
  <!--//w3l-bottom-->
  <!-- testimonials -->

  <!-- //testimonials -->

  <!--/w3l-footer-29-main-->
 

  <%@include file="footer.jsp" %>
  <!-- //footer-29 block -->
  <!-- disable body scroll which navbar is in active -->
  <script>
    $(function () {
      $('.navbar-toggler').click(function () {
        $('body').toggleClass('noscroll');
      })
    });
  </script>
  <!-- disable body scroll which navbar is in active -->

  <!-- Template JavaScript -->
  <script src="assets/js/jquery-3.3.1.min.js"></script>
  <script src="assets/js/theme-change.js"></script>
  <script src="assets/js/owl.carousel.js"></script>
  <!-- script for banner slider-->
  <script>
    $(document).ready(function () {
      $('.owl-one').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        responsiveClass: true,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplaySpeed: 1000,
        autoplayHoverPause: false,
        responsive: {
          0: {
            items: 1,
            nav: false
          },
          480: {
            items: 1,
            nav: false
          },
          667: {
            items: 1,
            nav: true
          },
          1000: {
            items: 1,
            nav: true
          }
        }
      })
    })
  </script>
  <!-- //script -->
  <!-- script for tesimonials carousel slider -->
  <script>
    $(document).ready(function () {
      $("#owl-demo1").owlCarousel({
        loop: true,
        margin: 20,
        nav: false,
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: false
          },
          736: {
            items: 2,
            nav: false
          },
          1000: {
            items: 3,
            nav: false,
            loop: true
          }
        }
      })
    })
  </script>
  <!-- //script for tesimonials carousel slider -->
  <!-- stats number counter-->
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/jquery.countup.js"></script>
  <script>
    $('.counter').countUp();
  </script>
  <!-- //stats number counter -->
  <!--/MENU-JS-->
  <script>
    $(window).on("scroll", function () {
      var scroll = $(window).scrollTop();

      if (scroll >= 80) {
        $("#site-header").addClass("nav-fixed");
      } else {
        $("#site-header").removeClass("nav-fixed");
      }
    });

    //Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function () {
      $("header").toggleClass("active");
    });
    $(document).on("ready", function () {
      if ($(window).width() > 991) {
        $("header").removeClass("active");
      }
      $(window).on("resize", function () {
        if ($(window).width() > 991) {
          $("header").removeClass("active");
        }
      });
    });
  </script>
  <!--//MENU-JS-->

  <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>