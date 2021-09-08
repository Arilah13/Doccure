<%@page import="models.User"%>
<%@page import="models.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<% DBCon con = new DBCon(); %>
<!DOCTYPE html> 
<html lang="en">
   
<% Cookie ck[] = request.getCookies(); %>	
<!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
<head>
		<meta charset="utf-8">
		<title>Doccure</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
		
		<!-- Fancybox CSS -->
		<link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="assets/css/style.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	
	</head>
	<body>
            <%
                                                            String cookie11 = "";
                                                            
                                                            for(int i = 0; i < ck.length; i++){                   
                                                            if(ck[i].getName().equals("uid")){
                                                            cookie11 = ck[i].getValue();
                                                            }
                                                            
                                                            }
                                                            User a = new User();
                                                            String pic = a.getpic(Integer.parseInt(cookie11));
                                                            String name = a.getname(Integer.parseInt(cookie11));
                                                            if(name == null)
                                                            {
                                                                name = "patient";
                                                            }
                                                            %>
		<!-- Main Wrapper -->
		<div class="main-wrapper">
		
			<!-- Header -->
			<header class="header">
				<nav class="navbar navbar-expand-lg header-nav">
					<div class="navbar-header">
						<a id="mobile_btn" href="javascript:void(0);">
							<span class="bar-icon">
								<span></span>
								<span></span>
								<span></span>
							</span>
						</a>
						<a href="index-2.html" class="navbar-brand logo">
							<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
						</a>
					</div>
					<div class="main-menu-wrapper">
						<div class="menu-header">
							<a href="index-2.html" class="menu-logo">
								<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
							</a>
							<a id="menu_close" class="menu-close" href="javascript:void(0);">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<ul class="main-nav">
							<li >
								<a href="userhome.jsp">Home</a>
							</li>
							<li class="has-submenu active">
								<a href="#">Appointments <i class="fas fa-chevron-down"></i></a>
								<ul class="submenu">
									<li><a href="searchdoctors.jsp">Book An Appointment</a></li>
									<li><a href="showmyappointment">Appointments</a></li>									
									
								</ul>
							</li>	
							<li class="has-submenu">
								<a href="#">Laboratory <i class="fas fa-chevron-down"></i></a>
								<ul class="submenu">
									<li><a href="laboratoryappointment.jsp">Booking</a></li>
                                                                        <li><a href="showmylabappointment">Lab Appointments</a></li>
									<li><a href="retrievefile">See Lab File</a></li>																
								</ul>
							</li>	
							
							
							
						</ul>		 
					</div>		 
					
                                    <ul class="nav header-navbar-rht">
						
						
						<!-- User Menu -->
						<li class="nav-item dropdown has-arrow logged-item">
							<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<span class="user-img">
									<%
                                                                                if(pic != null)
                                                                                {
                                                                            %>                                                                                        
										<img src="assets/img/patients/<%=pic%>.png" alt="User Image" width="31" >
                                                                                <%
                                                                                    }
                                                                                else if(pic == null)
                                                                                {
                                                                                %>
                                                                                <img src="assets/img/patients/download.png" alt="User Image" width="31" >
                                                                                <%
                                                                                 }
                                                                                 %>
								</span>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="user-header">
									<div class="avatar avatar-sm">
										<%
                                                                                if(pic != null)
                                                                                {
                                                                            %>                                                                                        
										<img src="assets/img/patients/<%=pic%>.png" alt="User Image" class="avatar-img rounded-circle">
                                                                                <%
                                                                                    }
                                                                                else if(pic == null)
                                                                                {
                                                                                %>
                                                                                <img src="assets/img/patients/download.png" alt="User Image" class="avatar-img rounded-circle">
                                                                                <%
                                                                                 }
                                                                                 %>
									</div>
									<div class="user-text">
										<h6><%=name%></h6>
										<p class="text-muted mb-0">Patient</p>
									</div>
								</div>
								<a class="dropdown-item" href="userprofile">Profile Settings</a>
								<a class="dropdown-item" href="logout">Logout</a>
							</div>
						</li>
						<!-- /User Menu -->
						
					</ul>
				</nav>
			</header>
			<!-- /Header -->
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-8 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="userhome.jsp">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Appointment</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Search Doctors</h2>
							</nav>
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Search Filter -->
							<form name="myform" method="post" action="searchdoctors1" onsubmit="check();">
							<div class="card search-filter">
								<div class="card-header">
									<h4 class="card-title mb-0">Search Filter</h4>
								</div>
								<div class="card-body">
								<div class="filter-widget">
									<div class="">
										<input type="text" name="drname" id="drname" class="form-control" placeholder="Select Doctor">
                                                                                <script>
                            $("#drname").autocomplete("getdata.jsp");
                            </script>
									</div>			
								</div>
							    <%    
                try{
                PreparedStatement ps = con.createConnection().prepareStatement("Select * from doctorspeciality ");
                ResultSet rs = ps.executeQuery();
            
               %> 
								<div class="filter-widget">
									<div class="">
										<select name="specialization" class="form-control">
											<option value="" style="color: 'grey';" selected>Select Specialization</option>
                                                                                        <% while(rs.next()){ %>
                            <option><%= rs.getString(2)%></option>
                            <% } %>
										</select>
									</div>			
								</div>
                                
								<div class="filter-widget">
									
										<input type="date" name="date" class="form-control" placeholder="Select Date">
																
								</div>
									<div class="btn-search">
										<button type="submit" class="btn btn-block">Search</button>
									</div>	
								</div>
							</div>
                                                                                 <%
                                }
                                catch(Exception e){
                                
                                }
                            %>
                                                                                </form>
							<!-- /Search Filter -->
							
						</div>
						
                            
						<div class="col-md-12 col-lg-8 col-xl-9">

							<!-- Doctor Widget -->
                                                        <%
                            String date;
                            int uid;
                            List<GS> results = (List<GS>)(request.getAttribute("results"));
                            
                            if(request.getAttribute("date").equals("") || request.getAttribute("date") == null)
                            {
                                date = "";
                            }
                            else{
                                date =(request.getAttribute("date")).toString();
                            }
                            
                            if(results.size() == 0)
                            {
                                %>
                                <br><br><br><br><br><br><br>
                                <center><strong style="font-size: 35px;">No Doctors Available</strong></center>
                                
                                <%   
                            }
                            
                            for (int i = 0; i < results.size(); i++)
                            {
                                %>
                                <form action='searchdoctors' method='post'>
							<div class="card">
								<div class="card-body">
									<div class="doctor-widget">
										<div class="doc-info-left">
											<div class="doctor-img">
												<a >
													<a>
                                                                                                            <img src="assets/img/doctors/<%=results.get(i).getPiccode()%>.png" class="img-fluid" alt="Doctor Image">
												</a>
												</a>
											</div>
											<div class="doc-info-cont">
												<h4 class="doc-name"><a href="">Dr <%=results.get(i).getName()%></a></h4>
												<input name='drname' type='hidden' readonly value='<%=results.get(i).getName()%>'/>
                                                                                                <input name='specialization' type='hidden' readonly value='<%=results.get(i).getSpeciality()%>'/>
                                                                                                <input name='date' type='hidden' readonly value='<%=  date %>'/>
                                                                                                
												<h5 class="doc-department"><%=results.get(i).getSpeciality()%></h5>
                                                                                                <%
                                                                                                    if(request.getAttribute("uid") != null)
                                {
                                    uid = (Integer) request.getAttribute("uid");
                                    out.print("<td> <input name='uid' type='hidden' readonly value='" +  uid +  "'/>");
                                }
                                                                                                    %>
												
												
											</div>
										</div>
										<div class="doc-info-right">
											
											<div class="clinic-booking">
												<a class="view-pro-btn" href="">View Profile</a>
                                                                                                <br>
                                                                                                <div class="btn-search">
												<button class="btn btn-block" type="submit">Book Appointment</button>
                                                                                                </div>
											</div>
										</div>
									</div>
								</div>
							</div>
                                                                                                    </form>
                                                                                                <%
                                                                                                    
                                                                                                    }
%>
							<!-- /Doctor Widget -->

							

							
						</div>
					</div>

				</div>

			</div>		
			<!-- /Page Content -->
   
			<!-- Footer -->
			<footer class="footer">
				
				<!-- Footer Top -->
				<div class="footer-top">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-about">
									<div class="footer-logo">
										<img src="assets/img/footer-logo.png" alt="logo">
									</div>
									<div class="footer-about-content">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
										<div class="social-icon">
											<ul>
												<li>
													<a href="#" target="_blank"><i class="fab fa-facebook-f"></i> </a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-twitter"></i> </a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
												</li>
												<li>
													<a href="#" target="_blank"><i class="fab fa-dribbble"></i> </a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-menu">
									<h2 class="footer-title">For Patients</h2>
									<ul>
										<li><a href="search.html"><i class="fas fa-angle-double-right"></i> Search for Doctors</a></li>
										<li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
										<li><a href="register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
										<li><a href="booking.html"><i class="fas fa-angle-double-right"></i> Booking</a></li>
										<li><a href="patient-dashboard.html"><i class="fas fa-angle-double-right"></i> Patient Dashboard</a></li>
									</ul>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-menu">
									<h2 class="footer-title">For Doctors</h2>
									<ul>
										<li><a href="appointments.html"><i class="fas fa-angle-double-right"></i> Appointments</a></li>
										<li><a href="chat.html"><i class="fas fa-angle-double-right"></i> Chat</a></li>
										<li><a href="login.html"><i class="fas fa-angle-double-right"></i> Login</a></li>
										<li><a href="doctor-register.html"><i class="fas fa-angle-double-right"></i> Register</a></li>
										<li><a href="doctor-dashboard.html"><i class="fas fa-angle-double-right"></i> Doctor Dashboard</a></li>
									</ul>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
							<div class="col-lg-3 col-md-6">
							
								<!-- Footer Widget -->
								<div class="footer-widget footer-contact">
									<h2 class="footer-title">Contact Us</h2>
									<div class="footer-contact-info">
										<div class="footer-address">
											<span><i class="fas fa-map-marker-alt"></i></span>
											<p> 3556  Beech Street, San Francisco,<br> California, CA 94108 </p>
										</div>
										<p>
											<i class="fas fa-phone-alt"></i>
											+1 315 369 5943
										</p>
										<p class="mb-0">
											<i class="fas fa-envelope"></i>
											doccure@example.com
										</p>
									</div>
								</div>
								<!-- /Footer Widget -->
								
							</div>
							
						</div>
					</div>
				</div>
				<!-- /Footer Top -->
				
				<!-- Footer Bottom -->
                <div class="footer-bottom">
					<div class="container-fluid">
					
						<!-- Copyright -->
						<div class="copyright">
							<div class="row">
								<div class="col-md-6 col-lg-6">
									<div class="copyright-text">
										<p class="mb-0"><a href="templateshub.net">Templates Hub</a></p>
									</div>
								</div>
								<div class="col-md-6 col-lg-6">
								
									<!-- Copyright Menu -->
									<div class="copyright-menu">
										<ul class="policy-menu">
											<li><a href="term-condition.html">Terms and Conditions</a></li>
											<li><a href="privacy-policy.html">Policy</a></li>
										</ul>
									</div>
									<!-- /Copyright Menu -->
									
								</div>
							</div>
						</div>
						<!-- /Copyright -->
						
					</div>
				</div>
				<!-- /Footer Bottom -->
				
			</footer>
			<!-- /Footer -->

		</div>
		<!-- /Main Wrapper -->
	  
		<!-- jQuery -->
		<script src="assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Select2 JS -->
		<script src="assets/plugins/select2/js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Fancybox JS -->
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
</html>