<%@page import="models.Staff"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html> 
<html lang="en">
    
<% Cookie ck[] = request.getCookies(); %>	
<!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
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
                                                            String cookie = "";
                                                            String cookie1 = "";
                                                            for(int i = 0; i < ck.length; i++){                   
                                                            if(ck[i].getName().equals("sidhm")){
                                                            cookie = ck[i].getValue();
                                                            }
                                                            if(ck[i].getName().equals("name"))
                                                            {
                                                            cookie1 = ck[i].getValue();
                                                            }
                                                            }
                                                            int id = Integer.parseInt(cookie);
                                                            Staff a = new Staff();
                                                            String pic = a.getpic(id);
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
						 
					</div>		 
					<ul class="nav header-navbar-rht">
						
						
						<!-- User Menu -->
						<li class="nav-item dropdown has-arrow logged-item">
							<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
								<span class="user-img">
									<img class="rounded-circle" src="assets/img/staff/<%=pic%>.png" width="31" alt="<%=cookie1%>">
								</span>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="user-header">
									<div class="avatar avatar-sm">
										<img class="rounded-circle" src="assets/img/staff/<%=pic%>.png" width="31" alt="<%=cookie1%>">
									</div>
									<div class="user-text">
										<h6><%=cookie1%></h6>
										<p class="text-muted mb-0">Staff</p>
									</div>
								</div>
								<a class="dropdown-item" href="todayappointment">Dashboard</a>
								<a class="dropdown-item" href="staffprofile">Profile Settings</a>
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
									<li class="breadcrumb-item active" aria-current="page">Lab Reports</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Lab reports</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-5 col-lg-4 col-xl-2 theiaStickySidebar">
						
							<!-- Profile Sidebar -->
							<div class="profile-sidebar">
								<div class="widget-profile pro-widget-content">
									<div class="profile-info-widget">
										<a href="#" class="booking-doc-img">
											<img src="assets/img/staff/<%=pic%>.png" alt="User Image">
										</a>
										<div class="profile-det-info">
											<h3><%=cookie1%></h3>
											
											<div class="patient-details">
												<h5 class="mb-0">Staff</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="dashboard-widget">
									<nav class="dashboard-menu">
										<ul>
											<li >
												<a href="todayappointment">
													<i class="fas fa-columns"></i>
													<span>Dashboard</span>
												</a>
											</li>
											<li>
												<a href="manageslots">
													<i class="fas fa-hourglass-start"></i>
													<span>Schedule Timings</span>
												</a>
											</li>
											<li class="active">
												<a href="labfiles">
													<i class="fa fa-flask"></i>
													<span>Lab Reports</span>
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
						
						<div class="col-md-7 col-lg-8 col-xl-10">
							<div class="row">
								<div class="col-sm-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">Lab Reports</h4>
											<div class="profile-box">
												<div class="row">

													

												</div>     
												<div class="row">
													<div class="col-md-12">
														<div class="card schedule-widget mb-0">
														
															<!-- Schedule Header -->
															<div class="schedule-header">
							
								<!-- Appointment List -->
								<div class="schedule-nav">
																	<table class="table table-hover table-center mb-0">
																		<thead>
																		<tr>
																			
																			<th>Test Name</th>	
                                                                                                                                                        <th>Patient Name</th>
																			<th>Test Date</th>
																			<th>Test Time</th>
																			<th>Test File</th>
                                                                                                                                                        <th>Report Status</th>
                                                                                                                                                        <th>Actions</th>
																		</tr>
																		</thead>
																		<tbody>
																			
																	<%
                            List<GS> results = (List<GS>)(request.getAttribute("results"));
                            
                            if(results.size() == 0)
                                                                                                                                             {
                                                                                                                                                 %>
                                                                                                                                <td colspan="6" class="text-center"><span class="d-block text-info">No Lab Reports Available</span></td>
                                                                                                                                                 
                                                                                                                                                 <%
                                                                                                                                             }
                            
                            for (int i = 0; i < results.size(); i++)
                            {  
                                %>
                                                                                                                                        <tr>
                                                                                                                                        <form action='uploadlabreport' method='post' enctype='multipart/form-data'>
																	
																	<td><span class="d-block text-info"><%=results.get(i).getTestname()%></span></td>
                                                                                                                                        <td><span class="d-block text-info"><%=results.get(i).getFname()%></span></td>
																	<td class="text-left"><span class="d-block text-info"><%=results.get(i).getTestdate()%></span></td>
                                                                                                                                        <td><span class="d-block text-info">&nbsp;&nbsp;&nbsp;<%=results.get(i).getTesttime()%></span></td>
                                                                                                                                        <input type='hidden' name='lid'  readonly value='<%=results.get(i).getTestid()%>'/>
                                                                                                                                        <%
                                                                                                                                            if(results.get(i).getStatus()==0)
                                                                                                                                            {
                                                                                                                                                %>
																	<td >
																		<div class="table-action" >
                                                                                                                                                    <input class="btn btn-sm bg-info-light" required name="file" type="file"/>																			                                                                                                                                                   															
																		</div>
																	</td>
                                                                                                                                        <td><span class="badge badge-pill bg-warning-light">Not Uploaded</span></td>
                                                                                                                                        <td class="text-left">
                                                                                                                                            <button type="submit" class="btn btn-sm bg-info-light" name="change" value="upload"><i class="fas fa-upload"></i> Upload </button>
                                                                                                                                        </td>
                                                                                                                                        
                                                                                                                                        <%
                                                                                                                                            }
                                                                                                                                            else if(results.get(i).getStatus()==1)
                                                                                                                                            {
                                                                                                                                         %>
                                                                                                                                         
                                                                                                                                         <td></td>
                                                                                                                                         <td class="text-left">&nbsp;&nbsp;&nbsp;<span class="badge badge-pill bg-success-light">Uploaded</span></td>
                                                                                                                                         
                                                                                                                                         <td>
                                                                                                                                             <input type='hidden' name='lid'  readonly value='<%=results.get(i).getTestid()%>'/>
                                                                                                                                             <button class="btn btn-sm bg-danger-light" type="submit" name="change" value="remove">
                                                                                                                                                <i class="fas fa-trash-alt"></i> Remove File
                                                                                                                                             </button>
                                                                                                                                         </td>
                                                                                                                                         
                                                                                                                                         <%
                                                                                                                                             }
                                                                                                                                             %>
                                                                                                                                        </form>
                                                                                                                                        </tr>   
                                                                                                                                        <%
                                                                                                                                            }
                                                                                                                                        %>
                                                                                                                                        
															</tbody>
																	</table>
																	<ul class="nav nav-tabs nav-justified">
																		
																		
																	</ul>
																</div>
																<!-- /Schedule Nav -->
																
															</div>
								<!-- /Appointment List -->
								
							</div>
						</div>
					</div>

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
		
		<!-- Appointment Details Modal -->
		<div class="modal fade custom-modal" id="appt_details">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Appointment Details</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<ul class="info-details">
							<li>
								<div class="details-header">
									<div class="row">
										<div class="col-md-6">
											<span class="title">#APT0001</span>
											<span class="text">21 Oct 2019 10:00 AM</span>
										</div>
										<div class="col-md-6">
											<div class="text-right">
												<button type="button" class="btn bg-success-light btn-sm" id="topup_status">Completed</button>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<span class="title">Status:</span>
								<span class="text">Completed</span>
							</li>
							<li>
								<span class="title">Confirm Date:</span>
								<span class="text">29 Jun 2019</span>
							</li>
							<li>
								<span class="title">Paid Amount</span>
								<span class="text">$450</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /Appointment Details Modal -->
                <%  
                    String user = null;
                    if((String) session.getAttribute("upload") != null)
                    {
                    user = (String) session.getAttribute("upload");
                    }
                 %>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    
                    var session1 ="<%out.print(user);%>";
                    console.log(session1);
                    if(session1 == "success")
                    {
                    swal({
                    title: "Lab File Uploaded Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                    }
                    else if(session1 == "fail")
                    {
                    swal({
                    title: "Lab File Upload Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                            <%
                                session.invalidate();
                                %>
                </script>
                
		<!-- jQuery -->
		<script src="assets/js/jquery.min.js"></script>
		
		<!-- Bootstrap Core JS -->
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/appointments.html  30 Nov 2019 04:12:09 GMT -->
</html>