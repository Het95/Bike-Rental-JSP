<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <!-- DataBase -->
	 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/bikers_portal_db"  
     user="root"  password=""/>
     
     <c:if test="${ param.eid ne null }">
     	<sql:update dataSource = "${db}" var = "result">
        	    						UPDATE tblbooking SET Status=2 WHERE  id='${param.eid}';
     	    						</sql:update>
	         				<script>alert("Updated")</script>
     </c:if>
     <c:if test="${ param.aeid ne null }">
     	<sql:update dataSource = "${db}" var = "result">
        	    						UPDATE tblbooking SET Status=1 WHERE  id='${param.aeid}';
     	    						</sql:update>
	         				<script>alert("Updated")</script>
     </c:if>
     <!-- /DataBase -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><title>Bike Rental Portal | Admin Dashboard</title>

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
</head>
<body>

	
	<div class="brand clearfix">
	<a href="dashboard.jsp" style="font-size: 20px;">Bike Rental Portal | Admin Panel</a>  
		<span class="menu-btn"><i class="fa fa-bars"></i></span>
		<ul class="ts-profile-nav">

			<li class="ts-account">
				<a href="#"><img src="img/ts-avatar.jpg" class="ts-avatar hidden-side" alt=""> Account <i class="fa fa-angle-down hidden-side"></i></a>
				<ul>
					<li><a href="change-password.jsp">Change Password</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="ts-main-content">
		<nav class="ts-sidebar">
			<ul class="ts-sidebar-menu">
			
				<li class="ts-label">Main</li>
				<li><a href="dashboard.jsp"><i class="fa fa-dashboard"></i> Post A Bike</a></li>
				<li><a href="manage-booking.jsp"><i class="fa fa-users"></i> Manage Booking</a></li>
			</ul>
			</nav>	
			<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">
<h2 class="page-title">Manage Bookings</h2>

						<!-- Zero Configuration Table -->
						<div class="panel panel-default">
							<div class="panel-heading">Bookings Info</div>
							<div class="panel-body">
							<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
											<th>Name</th>
											<th>Vehicle</th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Message</th>
											<th>Status</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
										<th>Name</th>
											<th>Vehicle</th>
											<th>From Date</th>
											<th>To Date</th>
											<th>Message</th>
											<th>Status</th>
											<th>Posting date</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
									
									<sql:query dataSource = "${db}" var = "result">
        	    						SELECT tblusers.FullName,tblbrands.BrandName,tblvehicles.VehiclesTitle,tblbooking.FromDate,tblbooking.ToDate,tblbooking.message,tblbooking.VehicleId as vid,tblbooking.Status,tblbooking.PostingDate,tblbooking.id  from tblbooking join tblvehicles on tblvehicles.id=tblbooking.VehicleId join tblusers on tblusers.EmailId=tblbooking.userEmail join tblbrands on tblvehicles.VehiclesBrand=tblbrands.id
     	    						</sql:query>
	        					<c:set var="count" value="1" scope="session"/> 
	         <c:forEach var = "row" items = "${result.rows}">
								<tr>
											<td>${sessionScope.count}</td>
											<td>${ row.FullName }</td>
											<td><a href="edit-vehicle.jsp?id=${row.vid }">${ row.BrandName } , ${ row.VehiclesTitle }</td>
											<td>${row.FromDate }</td>
											<td>${row.ToDate }</td>
											<td>${ row.message }</td>
											<td>
											<c:choose>
												<c:when test="${row.Status eq 0 }"> Not Confirmed Yet</c:when>
												<c:when test="${row.Status eq 1 }"> Confirmed</c:when>
												<c:otherwise > Cancled</c:otherwise>							
											</c:choose>
											</td>
											<td>${row.PostingDate }</td>
										<td><a href="manage-booking.jsp?aeid=${row.id }" onclick="return confirm('Do you really want to Confirm this booking')"> Confirm</a> /
<a href="manage-booking.jsp?eid=${ row.id }" onclick="return confirm('Do you really want to Cancel this Booking')"> Cancel</a>
</td>

										</tr>
							<c:set var="count" value="${ sessionScope.count + 1 }" scope="session"/>	
				</c:forEach>

<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>

</body>
</html>