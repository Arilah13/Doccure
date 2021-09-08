<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html> 
<html lang="en">
   
<% Cookie ck[] = request.getCookies(); %>		
<!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
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
						<div class="col-md-12 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="userhome.jsp">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Booking</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Booking</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container">
				
					<div class="row">
						<div class="col-12">
                                                    <%
                                                        String drname = (String) request.getAttribute("drname");
                                                        
                                                        %>
                                                        <%
                            List<GS> results = (List<GS>)(request.getAttribute("results"));
                            int uid;   
                            if (results.size() == 0)
                            {
                                %>
                                <br>
                                <br>
                                <br>
                                <center><h4>No Appointment Available</h4></center>
                                <%
                            }
                            else{
                            for (int i = 0; i < 1; i++)
                            {   
                                %>
							<div class="card">
								<div class="card-body">
									<div class="booking-doc-info">
										<a class="booking-doc-img">
											<img src="assets/img/doctors/<%=results.get(0).getPiccode()%>.png" alt="Doctor Image">
										</a>
										<div class="booking-info">
											<h4><a href="doctor-profile.html">Dr <%=drname%></a></h4>
											
											
										</div>
									</div>
								</div>
							</div>
						<%
                            }
                            for (int i = 0; i < results.size(); i++)
                            {   
                                %>	
							<!-- Schedule Widget -->
                                                        
							<div class="card booking-schedule schedule-widget">
							
								<!-- Schedule Header -->
                                                                <form action='payment' method='post'>
								<div class="schedule-header">
									<div class="row">
										<div class="col-md-12">
										&nbsp;
											<!-- Day Slot -->
											<div class="day-slot">

												<ul>
													
													<li>
														<span><%=results.get(i).getDay()%></span>
														<span class="slot-date"><%=results.get(i).getDate()%></span>
													</li>
										            
													<div class="time-slot">
												
													<li style="display: inline; padding-left: 86px;">
                                                                                                                
														<a class="timing" href="#">
															<span><%=results.get(i).getTime()%></span>
														</a>
													</li>
												    </div>
                                                                                                                        
                                                                                                                            
												    <li style="display: inline; padding-left: 97px;">												
														<span>Slot</span>
														<span class="slot-date"><%=results.get(i).getSlot()%></span>
													</li>
                                                                                                        
                                                                                                            
                                                                                                          
                                                                                                        <input type='hidden' name='dateappointment' readonly value='<%=results.get(i).getDate() %>'/>
                                                                                                        <input type='hidden' name='dayappointment' readonly value='<%=results.get(i).getDay() %>'/>
                                                                                                        <input type='hidden' name='timeappointment' readonly value='<%=results.get(i).getTime() %>'/>
                                                                                                        <input type='hidden' name='activeappointment' readonly value='<%=results.get(i).getSlot() %>'/>
                                                                                                        <input type='hidden' name='aid' readonly value='<%=results.get(i).getAid()%>'/>
                                                                                                        <input type='hidden' name='slot' id='slot'  readonly value='<%=results.get(i).getAslot() %>'/>
                                                                                                        <input type='hidden' name='drname'   readonly value='<%=drname %>'/>
                                                                                                        <input type='hidden' name='did' readonly value='<%=results.get(i).getDid()%>'/>
                                                                                                        <input type='hidden' name='piccode' readonly value='<%=results.get(i).getPiccode()%>'/>
                                                                                                        <%
                                                                                                            if(request.getAttribute("uid") != null)
                            {
                               uid = (Integer) request.getAttribute("uid");
                               out.print("<td> <input name='uid' type='hidden' readonly value='" +  uid +  "'/>");
                            }
                                                                                                            
                                                                                                                            if(results.get(i).getStatus() == 1)
                                                                                                                            {                                                                                                                               
                                                                                                            %>
													<div class="container bg-light">
                                                                                                        <div class="col-md-12 text-center">
										         <button type="submit" class="btn btn-primary">Proceed to Pay</button>
									                                </div>	
                                                                                                        </div>
                                                                                                            <%
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                             %>
                                                                                                             <div class="container bg-light">
                                                                                                        <div class="col-md-12 text-center">
                                                                                                            <button disabled class="btn btn-primary">Full</button>
									                                </div>	
                                                                                                        </div>
                                                                                                             <%
                                                                                                                 }
                                                                                                                 %>
								                         
												
											        
												</ul>
											</div>
											<!-- /Day Slot -->
											
										</div>
									</div>
								</div>
                                                                </form>
								<!-- /Schedule Header -->
								
								
								
							</div>
                                <%
                                    }
}
%>
							<!-- /Schedule Widget -->
							
							<!-- Submit Section -->
							
							<!-- /Submit Section -->
							
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
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/booking.html  30 Nov 2019 04:12:16 GMT -->
</html>