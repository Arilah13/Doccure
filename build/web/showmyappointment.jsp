<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="models.User"%>
<%@page import="models.GS"%>
<%@page import="java.util.List"%>
<!DOCTYPE html> 
<html lang="en">
    
<% Cookie ck[] = request.getCookies(); %>		
<!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
<head>
		<meta charset="utf-8">
		<title>Doccure</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
		<!-- Favicons -->
		<link href="assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                <script type="text/javascript">
            <% List<GS> results = (List<GS>)(request.getAttribute("results"));
                int j = results.size(); %>

            
            
            
            
        </script>
	
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
							<li>
								<a href="userhome.jsp">Home</a>
							</li>
							<li class="has-submenu active">
								<a href="#">Appointment <i class="fas fa-chevron-down"></i></a>
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
									<li class="breadcrumb-item active" aria-current="page">Appointment</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">My Appointment</h2>
						</div>
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
                        <div class="page-wrapper">
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						
						<!-- Profile Sidebar -->
						
						<!-- / Profile Sidebar -->
						
						<div class="col-md-7 col-lg-8 col-xl-12">
							<div class="card">
								<div class="card-body pt-0">
								
									<!-- Tab Menu -->
									<nav class="user-tabs mb-4">
										<ul class="nav nav-tabs nav-tabs-bottom nav-justified">
											<li class="nav-item">
												<a class="nav-link active" href="showmyappointment" data-toggle="tab">Appointments</a>
											</li>
											
											
											
										</ul>
									</nav>
									<!-- /Tab Menu -->
									
									<!-- Tab Content -->
									<div class="tab-content pt-0">
										
										<!-- Appointment Tab -->
										<div id="pat_appointments" class="tab-pane fade show active">
											<div class="card card-table mb-0">
												<div class="card-body">
													<div class="table-responsive">
                                                                                                            <%
                                                                                                             
            
        %>    
														<table class="table table-hover table-center mb-0">
															<thead>
																<tr>
																	<th>Doctor</th>
																	<th>Appt Date</th>																	
																	<th>Status</th>
                                                                                                                                        <th class="text-center">Action</th>
																</tr>
															</thead>
															<tbody>
                                                                                                                            <%
                            
                                                                                                                                
                                                                                                                                String cookie = "";
                                                                                                                                for(int i = 0; i < ck.length; i++){
                                                                                                                                if(ck[i].getName().equals("uid")){
                                                                                                                                cookie = ck[i].getValue();
                                                                                                                                }
                                                                                                                                }
                                                                                                                                if(results.size() == 0)
                                                                                                                                             {
                                                                                                                                                 %>
                                                                                                                                <td colspan="4" class="text-center"><span class="d-block text-info">No Appointment Available</span></td>
                                                                                                                                                 
                                                                                                                                                 <%
                                                                                                                                             }
                                                                                                                                for (int i = 0; i < results.size(); i++)
                                                                                                                                {
                                                                                                                                %>
                                                                                                                                
																<tr>
																	<td>
																		<h2 class="table-avatar">
																			<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results.get(i).getPiccode()%>.png" alt="Doctor Image"></a>
																			<a href="">Dr <%=results.get(i).getName()%><span><%=results.get(i).getSpeciality()%></span></a>
																		</h2>
																	</td>
																	<td><%=results.get(i).getDate()%><span class="d-block text-info"><%=results.get(i).getTime()%></span></td>
																	
                                                                                                                                        <%
                                                                                                                                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                                                                                                            LocalDate Date = java.time.LocalDate.now();
                                                                                                                                            LocalDate Date2 = java.time.LocalDate.parse(results.get(i).getDate(), formatter);
                                                                                                                                            int diff = (Date.compareTo(Date2));
                                                                                                                                            if(diff <= 0)
                                                                                                                                            {
                                                                                                                                            if(results.get(i).getStatus()==0)
                                                                                                                                            {
                                                                                                                                                %>
                                                                                                                                            
																	<td><span class="badge badge-pill bg-success-light">Confirm</span></td>
                                                                                                                                        <td class="text-center">
                                                                                                                                            
																		<div class="table-action">
                                                                                                                                                            
                                                                                                                                                             <a  data-toggle="modal" href="#delete_modal" id="<%=results.get(i).getPaID()%>" class="btn btn-sm bg-danger-light delete_data">
                                                                                                                                                                <i class="far fa-trash-alt"></i> Cancel
                                                                                                                                                            </a>
                                                                                                                                                            
																			
																		</div>
																	</td>
                                                                                                                                        <%
                                                                                                                                            }
                                                                                                                                            else if(results.get(i).getStatus()==1)
                                                                                                                                            {
                                                                                                                                         %>
                                                                                                                                         <td ><span class="badge badge-pill badge-danger">Cancel</span></td>
                                                                                                                                         <td class="text-center"></td>
                                                                                                                                         <%
                                                                                                                                             }
                                                                                                                                                }
                                                                                                                                            else if(diff > 0)
                                                                                                                                            {
                                                                                                                                         %>
                                                                                                                                        <td><span class="badge badge-pill badge-light">Finished</span></td>
                                                                                                                                         <td></td> 
																</tr>
                                                                                                                               
                                                                                                                                <%
                                                                                                                                    }
                                                                                                                                    }
 %>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<!-- /Appointment Tab -->
										
										
											
										
										
									</div>
									<!-- Tab Content -->
									
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
                <!-- Delete Modal -->
			<div class="modal fade" id="delete_modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">                                      
						<form action="appointmentchange" method="POST">
						<div class="modal-body">
							<div class="form-content p-2">
								<h4 class="modal-title">Cancel</h4>
								<p class="mb-4">Are you sure want to cancel?</p>
                                                                <input name='uid' type = 'hidden' readonly value='<%=cookie%>'/>
                                                                <input name='paID' id='paID' type = 'hidden' readonly value=''/>
                                                                
                                                                <button type="submit" name="change" value="Cancel" class="btn btn-danger">Cancel </button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
                                        </form>
                                                                
					</div>
				</div>
			</div>
                        
                        <!-- / -->  
                <%  
                    String user = null;
                    if((String) session.getAttribute("fail") != null)
                    {
                    user = (String) session.getAttribute("fail");
                    }
                 %>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    
                    var session1 ="<%out.print(user);%>";
                    console.log(session1);
                    if(session1 == "out")
                    {
                    swal({
                    title: "Cancelled Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                            <%
                                session.invalidate();
                                %>
                </script>
                <script>
                    $(document).ready(function(){
                        $(document).on("click",".delete_data", function(){
                        var id = $(this).attr("id");
                            $.ajax({
                                url: "add/getaid.jsp",
                                type: "POST",
                                dataType:'JSON',
                                data: {id:id},                                    
                                success: function(data){
                                    console.log(data);
                                    
                                                                        
                                        $("#paID").val(data.id);                                      
                                }
                            });
                    });
                });
                    
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

<!-- doccure/patient-dashboard.html  30 Nov 2019 04:12:16 GMT -->
</html>