<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bike Rental Portal | Page details</title>
<!--Bootstrap -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
<!--Custome Style -->
<link rel="stylesheet" href="assets/css/styles.css" type="text/css">
<!--OWL Carousel slider-->
<link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
<!--slick-slider -->
<link href="assets/css/slick.css" rel="stylesheet">
<!--bootstrap-slider -->
<link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
<!--FontAwesome Font Style -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/images/favicon-icon/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/images/favicon-icon/apple-touch-icon-114-precomposed.html">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/images/favicon-icon/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets/images/favicon-icon/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="assets/images/favicon-icon/24x24.png">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
</head>
<body>
 	<!-- DataBase -->
	 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/bikers_portal_db"  
     user="root"  password=""/>
	 <!-- /DataBase -->
	
	<!-- Header -->
	
	<header>
  	<div class="default-header">
    	<div class="container">
      		<div class="row">
        		<div class="col-sm-3 col-md-2">
          			<div class="logo"> <a href="index.jsp"><img src="assets/images/logg2.png" alt="image"/></a> </div>
        		</div>
        		<div class="col-sm-9 col-md-10">
          			<div class="header_info">
            			<div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-envelope" aria-hidden="true"></i> </div>
              <p class="uppercase_text">For Support Mail us : </p>
              <a href="mailto:bikersportal@portal.com">bikersportal@portal.com</a> </div>
            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-phone" aria-hidden="true"></i> </div>
              <p class="uppercase_text">Service Helpline Call Us: </p>
              <a href="tel:+91-98765432100">+91-98765432100</a> </div>
            <div class="social-follow">
              <ul>
                <li><a href="https://www.facebook.com/"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.twitter.com/"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.google.com/"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
              </ul>
            </div>
            
            <c:choose>
            	<c:when test="${ sessionScope.userMail eq null }">
            		<div class="login_btn"> <a href="login.jsp" class="btn btn-xs uppercase" >Login / Register</a> </div>
            	</c:when>
            	<c:otherwise>
            		Welcome To Bike rental portal
            	</c:otherwise>
            </c:choose>
			  </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i>
            <sql:query dataSource="${db}" var="result">SELECT FullName FROM tblusers WHERE EmailId='${sessionScope.userMail }'</sql:query>
            <c:forEach var="row" items="${result.rows}"  >
            	<c:out value="${ row.FullName }"/>
            </c:forEach>		
            <i class="fa fa-angle-down" aria-hidden="true"></i></a>
              <ul class="dropdown-menu">
              	<c:choose>
              		<c:when test="${ sessionScope.userMail eq null }">
              			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Profile Settings</a></li>
              			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Update Password</a></li>
           		 		<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">My Booking</a></li>
            			<li><a href="#loginform"  data-toggle="modal" data-dismiss="modal">Sign Out</a></li>
              		</c:when>
              		<c:otherwise>
              			<li><a href="profile.jsp">Profile Settings</a></li>
          			    <li><a href="update-password.jsp">Update Password</a></li>
            			<li><a href="my-booking.jsp">My Booking</a></li>
            			<li><a href="logout.jsp">Sign Out</a></li>
              		</c:otherwise>
              	</c:choose>
              	
              	</ul>
            </li>
          </ul>
        </div>
        <div class="header_search">
          <div id="search_toggle"><i class="fa fa-search" aria-hidden="true"></i></div>
          <form action="#" method="get" id="header-search-form">
            <input type="text" placeholder="Search..." class="form-control">
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
          </form>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home</a>    </li>

          <li><a href="page.jsp?type=aboutus">About Us</a></li>
          <li><a href="bike-listing.jsp">Bike Listing</a>
          <li><a href="page.jsp?type=faqs">FAQs</a></li>
          <li><a href="contact-us.jsp">Contact Us</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end -->

</header>
              	
	<!-- /Header -->
	<!-- Page -->
	<sql:query dataSource="${db}" var="result">SELECT type,detail,PageName from tblpages where type='${param.type }'</sql:query>
	 <c:forEach var = "row" items = "${result.rows}">
     
     <section class="page-header aboutus_page">
  <div class="container">
    <div class="page-header_wrap">
      <div class="page-heading">
        <h1>${row.PageName }</h1>
      </div>
      <ul class="coustom-breadcrumb">
        <li><a href="#">Home</a></li>
        <li>${row.PageName}</li>
      </ul>
    </div>
  </div>
  <!-- Dark Overlay-->
  <div class="dark-overlay"></div>
</section>
<section class="about_us section-padding">
  <div class="container">
    <div class="section-header text-center">


      <h2>${row.PageName}</h2>
      <p>${row.detail} </p>
    </div>
    
  </div>
</section>
     
     
     </c:forEach>
	 
	<!-- /Page -->
	
	 
<!--Back to top-->
<div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
<!--/Back to top-->
	
	<!-- Footer -->
	<footer>
  <div class="footer-top">
    <div class="container">
      <div class="row">

        <div class="col-md-6">
          <h6>About Us</h6>
          <ul>


          <li><a href="page.jsp?type=aboutus">About Us</a></li>
            <li><a href="page.jsp?type=faqs">FAQs</a></li>
            <li><a href="page.jsp?type=privacy">Privacy</a></li>
          <li><a href="page.jsp?type=terms">Terms of use</a></li>
               <li><a href="admin/">Admin Login</a></li>
          </ul>
        </div>

        <div class="col-md-3 col-sm-6">
          <h6>Subscribe Newsletter</h6>
          <div class="newsletter-form">
            <form method="post">
              <div class="form-group">
                <input type="email" name="subscriberemail" class="form-control newsletter-input" required placeholder="Enter Email Address" />
              </div>
              <button type="submit" name="emailsubscibe" class="btn btn-block">Subscribe <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></button>
            </form>
            <p class="subscribed-text">*We send great deals and latest auto news to our subscribed users very week.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-push-6 text-right">
          <div class="footer_widget">
            <p>Connect with Us:</p>
            <ul>
            <li><a href="https://www.facebook.com/"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.twitter.com/"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.google.com/"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                </ul>
          </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
          <p class="copy-right">Copyright &copy; 2020 Bike Rental Portal. </p>
        </div>
      </div>
    </div>
  </div>
</footer> 
	
	<!-- /Footer -->
	
	<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/interface.js"></script>
<!--bootstrap-slider-JS-->
<script src="assets/js/bootstrap-slider.min.js"></script>
<!--Slider-JS-->
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
 
</body>
</html>