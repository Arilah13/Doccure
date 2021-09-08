<%@page import="models.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html> 
<html lang="en">
<html lang="en">
    
<% Cookie ck[] = request.getCookies(); %>	
<% DBCon con = new DBCon(); %>
<!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:14 GMT -->
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
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css">
		
		<link rel="stylesheet" href="assets/plugins/dropzone/dropzone.min.css">
		
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
                                                            String cookie = "";
                                                            for(int i = 0; i < ck.length; i++){                   
                                                            if(ck[i].getName().equals("didhm")){
                                                            cookie = ck[i].getValue();
                                                            }
                             
                                                            }
                                                            Doctor a = new Doctor();
                                                            int id = Integer.parseInt(cookie);
                                                            String pic = a.getpic(id);
                                                            String name = a.getname(id);
                                                            String specilaity = a.getspeciality(id);
                                                            
                                                            List<GS> results = (List<GS>)(request.getAttribute("results"));
                                                            for (int i = 0; i < 1; i++)
                                                            {  
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
							<a href="" class="menu-logo">
								<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
							</a>
							<a id="menu_close" class="menu-close" href="javascript:void(0);">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<ul class="main-nav">
							
						
						<!-- User Menu -->
						<li class="nav-item dropdown has-arrow logged-item">
							<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<span class="user-img">
									<img class="rounded-circle" src="assets/img/doctors/<%=pic%>.png" width="31" alt="<%=name%>">
								</span>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="user-header">
									<div class="avatar avatar-sm">
										<img src="assets/img/doctors/<%=pic%>.png" alt="Doctor Image" class="avatar-img rounded-circle">
									</div>
									<div class="user-text">
										<h6><%=name%></h6>
										<p class="text-muted mb-0"><%=specilaity%></p>
									</div>
								</div>
								<a class="dropdown-item" href="doctorindex">Dashboard</a>
								<a class="dropdown-item" href="doctorprofile">Profile Settings</a>
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
									<li class="breadcrumb-item"><a href="">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Profile Settings</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Profile Settings</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Profile Sidebar -->
							<div class="profile-sidebar">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="#" class="booking-doc-img">
											<img src="assets/img/doctors/<%=pic%>.png" alt="Doctor Image">
										</a>
										<div class="profile-det-info">
											<h3><%=name%></h3>
											
											<div class="patient-details">
												<h5 class="mb-0"><%=specilaity%></h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li>
												<a href="doctorindex">
													<i class="fas fa-columns"></i>
													<span>Dashboard</span>
												</a>
											</li>
											<li>
												<a href="doctorappointments">
													<i class="fas fa-hourglass-start"></i>
													<span>Schedule Timings</span>
												</a>
											</li>
											<li >
												<a href="doctorlab">
													<i class="fa fa-flask"></i>
													<span>Lab Reports</span>
												</a>
											</li>
											
											
											<li>
												<a href="indexx.jsp">
													<i class="fas fa-comments"></i>
													<span>Chat</span>
													
												</a>
											</li>
											
											
											
											<li>
												<a href="logout">
													<i class="fas fa-sign-out-alt"></i>
													<span>Logout</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
							<!-- /Profile Sidebar -->
							
						</div>
						<div class="col-md-7 col-lg-8 col-xl-9">
						
							<!-- Basic Information -->
                                                                                                                   
                                                        <form action="doctorprofileupdate" method="post" enctype="multipart/form-data">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Basic Information</h4>
									<div class="row form-row">
										<div class="col-md-12">
											<div class="form-group">
												<div class="change-avatar">
													<div class="profile-img">                                                                                                               
														<img src="assets/img/doctors/<%=pic%>.png" alt="Doctor Image">
													</div>
													<div class="upload-img">
														<div class="change-photo-btn">
															<span><i class="fa fa-upload"></i> Upload Photo</span>
															<input required name="pic" type="file" class="upload">
														</div>
														<small class="form-text text-muted">Allowed JPG or PNG. Max size of 2MB</small>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Username </label>
                                                                                                <%
                                                                                                    if(results.get(0).getUname() == null)
                                                                                                    {
                                                                                                        %>
                                                                                                <input type="text" class="form-control" readonly >
                                                                                                <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <input type="text" class="form-control" readonly value="<%=results.get(0).getUname()%>">
                                                                                                <%
                                                                                                    }
                                                                                                %>
                                                                                                    
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Email <span class="text-danger">*</span></label>
                                                                                                <%
                                                                                                    if(results.get(0).getEmail() == null)
                                                                                                    {
                                                                                                        %>
												<input type="email" name="email" class="form-control" readonly >
                                                                                                <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <input type="text" name="email" class="form-control" value="<%=results.get(0).getEmail()%>">
                                                                                                <%
                                                                                                    }
                                                                                                %>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Name <span class="text-danger">*</span></label>
                                                                                                <%
                                                                                                    if(results.get(0).getFname() == null)
                                                                                                    {
                                                                                                        %>
												<input required name="fname" type="text" class="form-control" >
                                                                                                <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <input required name="fname" type="text" class="form-control" value="<%=results.get(0).getFname()%>">
                                                                                                <%
                                                                                                    }
                                                                                                %>
											</div>
										</div>
                                                                                        <%    
                try{
                PreparedStatement ps = con.createConnection().prepareStatement("Select * from doctorspeciality ");
                ResultSet rs = ps.executeQuery();
            
               %> 
										<div class="col-md-6">
											<div class="form-group">
												<label>Speciality <span class="text-danger">*</span></label>
                                                                                                <%
                                                                                                    if(results.get(0).getDrspeciality() == null)
                                                                                                    {
                                                                                                        %>
												<select required name="speciality" class="form-control">
											<option value="" style="color: 'grey';" selected>Select Specialization</option>
                                                                                        <% while(rs.next()){ %>
                            <option><%=rs.getString(2)%></option>
                            <% } %>
										</select>
                                                                                                <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <select name="speciality" class="form-control">
                                                                                                    <option value="<%=results.get(0).getDrspeciality()%>" style="color: 'grey';" selected><%=results.get(0).getDrspeciality()%></option>
                                                                                        <% while(rs.next()){ %>
                            <option><%= rs.getString(2)%></option>
                            <% } %>
										</select>
                                                                                                <%
                                                                                                    }
                                                                                                %>
											</div>
										</div>
                                                                                        <%
                                }
                                catch(Exception e){
                                
                                }
                            %>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone Number<span class="text-danger">*</span></label>
                                                                                                <%
                                                                                                    if(results.get(0).getMobilenumber() == null)
                                                                                                    {
                                                                                                        %>
												<input name="mobilenumber" type="text" class="form-control" >
                                                                                                <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <input name="mobilenumber" type="text" class="form-control" value="<%=results.get(0).getMobilenumber()%>">
                                                                                                <%
                                                                                                    }
                                                                                                %>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Gender<span class="text-danger">*</span></label>
												<select name="gender" class="form-control select">
                                                                                                    <%
                                                                                                        if(results.get(0).getGender() == null)
                                                                                                        {
                                                                                                            %>
													<option value="">Select</option>
                                                                                                        <option value="Male">Male</option>
                                                                                                        <option value="Female">Female</option>
                                                                                                    <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                    <option value="<%=results.get(0).getGender()%>"><%=results.get(0).getGender()%></option>
                                                                                                    <option value="Male">Male</option>
                                                                                                        <option value="Female">Female</option>
                                                                                                    <%
                                                                                                        }
                                                                                                        %>
													
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group mb-0">
												<label>Date of Birth<span class="text-danger">*</span></label>
                                                                                                <%
                                                                                                    if(results.get(0).getDate() == null)
                                                                                                    {
                                                                                                        %>
                                                                                                        
												<input name="dob" type="date" class="form-control" >
                                                                                                <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                 <input name="dob" type="date" class="form-control" value="<%=results.get(0).getDate()%>">   
                                                                                                    <%
                                                                                                        }
                                                                                                        %>
											
										</div>
									</div>
                                                                                                        <div class="col-md-6">
											<div class="form-group">
												<label>Password </label>
                                                                                                
												<input name="password" type="password" class="form-control" >
                                                                                                
											</div>
										</div>
								</div>
							</div>
                                                        
                                                                                                                <%
                                                                                                                    }
%>
							<!-- /Basic Information -->
							
							
							
							<div class="submit-section submit-btn-bottom">
								<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
							</div>
                                                        </form>
							
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
		
		<!-- Dropzone JS -->
		<script src="assets/plugins/dropzone/dropzone.min.js"></script>
		
		<!-- Bootstrap Tagsinput JS -->
		<script src="assets/plugins/bootstrap-tagsinput/js/bootstrap-tagsinput.js"></script>
		
		<!-- Profile Settings JS -->
		<script src="assets/js/profile-settings.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/doctor-profile-settings.html  30 Nov 2019 04:12:15 GMT -->
</html>