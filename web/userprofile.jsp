<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html> 
<html lang="en">
    
<% Cookie ck[] = request.getCookies(); %>	
<!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
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
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="assets/css/style.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<a href="" class="navbar-brand logo">
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
							<li class="has-submenu">
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
									<li class="breadcrumb-item"><a href="index-2.html">Home</a></li>
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
					
						<!-- Profile Sidebar -->
						
						<!-- /Profile Sidebar -->
						
						<div class="col-md-12 col-lg-12 col-xl-12">
							<div class="card">
								<div class="card-body">
									
									<!-- Profile Settings Form -->
                                                                        <form action="userprofileupdate" method="post" enctype="multipart/form-data">
										<div class="row form-row">
											<div class="col-12 col-md-12">
												<div class="form-group">
													<div class="change-avatar">
														<div class="profile-img">
															
                                                                                                                         <%
                                                                                if(pic != null)
                                                                                {
                                                                            %>                                                                                        
										<img src="assets/img/patients/<%=pic%>.png" alt="User Image">
                                                                                <%
                                                                                    }
                                                                                else if(pic == null)
                                                                                {
                                                                                %>
                                                                                <img src="assets/img/patients/download.png" alt="User Image">
                                                                                <%
                                                                                 }
                                                                                 %>
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
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>First Name</label><span class="text-danger">*</span>
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
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Last Name</label><span class="text-danger">*</span>
                                                                                                        <%
                                                                                                    if(results.get(0).getLname() == null)
                                                                                                    {
                                                                                                        %>
													<input required name="lname" type="text" class="form-control" >
                                                                                                        <%
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                %>
                                                                                                <input required name="lname" type="text" class="form-control" value="<%=results.get(0).getLname()%>">
                                                                                                <%
                                                                                                    }
                                                                                                %>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Date of Birth</label><span class="text-danger">*</span>
                                                                                                        <%
                                                                                                    if(results.get(0).getDate() == null)
                                                                                                    {
                                                                                                        %>
													
														<input required name="dob" type="date" class="form-control" >
                                                                                                                
                                                                                                                <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                    
                                                                                                    <input required name="dob" type="date" class="form-control" value="<%=results.get(0).getDate()%>">
                                                                                                    
                                                                                                    <%
                                                                                                        }
                                                                                                        %>
													
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Blood Group</label><span class="text-danger">*</span>
                                                                                                        
													<select required name="blood" class="form-control select">
                                                                                                            <%
                                                                                                            if(results.get(0).getBlood() == null)
                                                                                                            {
                                                                                                                %>
                                                                                                            <option value="A-">A-</option>
														<option value="A+">A+</option>
														<option value="B-">B-</option>
														<option value="B+">B+</option>
                                                                                                                <option value="AB-">AB-</option>
														<option value="AB+">AB+</option>
                                                                                                                <option value="O-">O-</option>
														<option value="O+">O+</option>
                                                                                                                <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                                <option value="<%=results.get(0).getBlood()%>"><%=results.get(0).getBlood()%></option>
                                                                                                                <option value="A-">A-</option>
														<option value="A+">A+</option>
														<option value="B-">B-</option>
														<option value="B+">B+</option>
                                                                                                                <option value="AB-">AB-</option>
														<option value="AB+">AB+</option>
                                                                                                                <option value="O-">O-</option>
														<option value="O+">O+</option>
                                                                                                                 <%
                                                                                                        }
                                                                                                        %>
													</select>
                                                                                                        
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Email ID</label><span class="text-danger">*</span>
                                                                                                        
                                                                                                        <%
                                                                                                    if(results.get(0).getEmail() == null)
                                                                                                    {
                                                                                                        %>
													<input required name="email" id="email1" type="email" class="form-control" >
                                                                                                        <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                    <input required name="email" id="email1" type="email" class="form-control" value="<%=results.get(0).getEmail()%>">
                                                                                                    <%
                                                                                                        }
                                                                                                        %>
                                                                                                        <div style="color:red; position: absolute; margin-left: 10px; font-size: 12px;" id="emaile">
															
												</div>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Mobile</label><span class="text-danger">*</span>
                                                                                                        <%
                                                                                                    if(results.get(0).getMobilenumber() == null)
                                                                                                    {
                                                                                                        %>
													<input required name="mobilenumber" type="text" class="form-control">
                                                                                                        <%
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                    %>
                                                                                                    <input required name="mobilenumber" type="text" class="form-control" value="<%=results.get(0).getMobilenumber()%>">
                                                                                                    <%
                                                                                                        }
                                                                                                        %>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label>Password</label>
                                                                                                        
                                                                                                    <input name="password" type="password" class="form-control" >
                                                                                                    
												</div>
											</div>
										</div>
                                                                                                
											
										</div>
										<div class="submit-section">
											<button type="submit" id="btnregister" class="btn btn-primary submit-btn">Save Changes</button>
										</div>
									</form>
                                                                                                        <%
                                                                                                            }
                                                                                                        %>
									<!-- /Profile Settings Form -->
									
								</div>
							</div>
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
	  <script typr="text/javascript">
            
           
            
            var cookie = <%=cookie11%>;
            console.log(cookie);
            $(document).ready(function(){
                $("#email1").on("input", function(e){
                    
                    var email = $("#email1").val();
                    console.log(email);                   
                    if(email !== ""){
                        $.ajax({
                            url: "add/checkemail1.jsp",
                            type: "POST",
                            dataType:'JSON',
                            data: {email:email, cookie:cookie},
                            success: function(data){     
                                console.log(data);
                                if(data.status == 0){
                                    console.log(data.status);
                                    document.getElementById("btnregister").disabled = false; 
                                    document.getElementById("emaile").innerHTML = "";
                                    
                                }
                                else
                                {
                                    console.log(data.status);
                                    document.getElementById("emaile").innerHTML = "Email Already Exists";  
                                    document.getElementById("btnregister").disabled = true;
                                }
                            }
                        });
                    }
                });
            });
            
              
            </script>
		<!-- jQuery -->
		<script src="assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="assets/plugins/select2/js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/profile-settings.html  30 Nov 2019 04:12:18 GMT -->
</html>