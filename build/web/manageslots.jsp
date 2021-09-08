<%@page import="models.Staff"%>
<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html> 
<html lang="en">
   
<% Cookie ck[] = request.getCookies(); %>	
<!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
<head>
		<meta charset="utf-8">
		<title>Doccure</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
		
                <style>
                    ul.mystyle{
                        background-color: #eee;
                        cursor: default;
                        list-style-type: none;
                        
                        list-style-position: outside;                      
                        width: 290px;
                        position: relative;
                        
                        margin: 0;
                        display: inline-block;
                        
                        z-index:4000;
                    }
                    
                    li.mystyle{          
                        
                                             
                        display: inline-block;
                        z-index:4000;                                             
                    }
                    
                    .countryList{
                        position: absolute;
                    }
                    
                </style>
                
		<!-- Favicons -->
		<link href="assets/img/favicon.png" rel="icon">
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
		
		<!-- Fontawesome CSS -->
		<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
		<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
		
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
							<a href="index-2.html" class="menu-logo">
								<img src="assets/img/logo.png" class="img-fluid" alt="Logo">
							</a>
							<a id="menu_close" class="menu-close" href="javascript:void(0);">
								<i class="fas fa-times"></i>
							</a>
						</div>
						
					</div>		 
					<ul class="nav header-navbar-rht">
						<li class="nav-item contact-item">
							
							
						</li>
						
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
										<img src="assets/img/staff/<%=pic%>.png" alt="User Image" class="avatar-img rounded-circle">
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
									<li class="breadcrumb-item active" aria-current="page">Schedule Timings</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Schedule Timings</h2>
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
											<li class="">
												<a href="todayappointment">
													<i class="fas fa-columns"></i>
													<span>Dashboard</span>
												</a>
											</li>

											<li class="active">
												<a href="manageslots">
													<i class="fas fa-hourglass-start"></i>
													<span>Schedule Timings</span>
												</a>
											</li>
											
											<li>
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
						
						<div class="col-md-7 col-lg-8 col-xl-9">
						 
							<div class="row">
								<div class="col-sm-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">Schedule Timings</h4>
											<div class="profile-box">
												<div class="row">

													

												</div>     
												<div class="row">
													<div class="col-md-12">
														<div class="card schedule-widget mb-0">
														
															<!-- Schedule Header -->
															<div class="schedule-header">
															
																<!-- Schedule Nav -->

																<div class="schedule-nav">
																	<table class="table table-hover table-center mb-0">
																		<thead>
																		<tr>
																			<th>Doctor Name</th>
																			
																			<th>Appt Date</th>
																			<th>Appt Time</th>								
																			<th>Slots</th>
																			<th>Status</th>
                                                                                                                                                        <th>Doctor Arrive</th>
                                                                                                                                                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Actions</th>
																		</tr>
																		</thead>
																		<tbody>
                                                                                                                                                    
                                                                                                                                                    <%                                                                             
                                List<GS> results = (List<GS>)(request.getAttribute("results"));                          
                                if(results.size() == 0)
                                                                                                                                             {
                                                                                                                                                 %>
                                                                                                                                <td colspan="6" class="text-center"><span class="d-block text-info">No Appointment Available</span></td>
                                                                                                                                                 
                                                                                                                                                 <%
                                                                                                                                             }
            
           
                                for(int i = 0; i<results.size(); i++){
                                    %>
                                
																			<tr>
																	<td><h2 class="table-avatar">
																			<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results.get(i).getPiccode()%>.png" alt="Doctor Image"></a>
																			<a href="doctor-profile.html">Dr <%= results.get(i).getDrname()%><span><%=results.get(i).getDrspeciality()%></span></a>
																		</h2>
                                                                                                                                        </td>
																	
																	<td><%= results.get(i).getDate()%><span class="d-block text-info"><%=results.get(i).getDay()%></span></td>
                                                                                                                                        <td class="text-left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= results.get(i).getTime()%></td>
																	<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= results.get(i).getSlot()%></td>
																	<%
                                                                                                                                            if(results.get(i).getStatus()==0)
                                                                                                                                            {
                                                                                                                                                %>
                                                                                                                                            
																	<td><span class="badge badge-pill bg-success-light">Confirm</span></td>
                                                                                                                                        <td>
                                                                                                                                            <div class="table-action">
                                                                                                                                                    <form action="sendtext" method="post">    
                                                                                                                                                    <input name="sms" readonly type="hidden" value="<%=results.get(i).getAid()%>"/>
                                                                                                                                                    <input name="smsdrname" readonly type="hidden" value="Dr.<%= results.get(i).getDrname()%>"/>
                                                                                                                                                    <input name="smsspeciality" readonly type="hidden" value="<%=results.get(i).getDrspeciality()%>"/>
                                                                                                                                                    <input name="smsday" readonly type="hidden" value="<%=results.get(i).getDay()%>"/>
                                                                                                                                                    <input name="smstime" readonly type="hidden" value="<%= results.get(i).getTime()%>"/>
                                                                                                                                                    <input name="smsdate" readonly type="hidden" value="<%= results.get(i).getDate()%>"/>
                                                                                                                                                    &nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-sm bg-success-light">Send Text</button>
                                                                                                                                                    </form>
                                                                                                                                            </div>
                                                                                                                                        </td>
                                                                                                                                        <td class="text-left">
                                                                                                                                            
																		<div class="table-action">
                                                                                                                                                    
                                                                                                                                                            <button type="button" class="btn btn-sm bg-success-light edit_data" id="<%=results.get(i).getAid()%>" data-toggle="modal" href="#edit_specialities_details">
                                                                                                                                                            <i class="far fa-edit"></i> Edit
                                                                                                                                                            </button>
                                                                                                                                                            <a  data-toggle="modal" href="#delete_modal" id="<%=results.get(i).getAid()%>" class="btn btn-sm bg-danger-light delete_data">
                                                                                                                                                                <i class="far fa-trash-alt"></i> Cancel
                                                                                                                                                            </a>																
                                                                                                                                                            
																			
																		</div>
                                                                                                                                            
																	</td>
                                                                                                                                        <%
                                                                                                                                            }
                                                                                                                                            else if(results.get(i).getStatus()==1)
                                                                                                                                            {
                                                                                                                                         %>
                                                                                                                                         
                                                                                                                                         <td><span class="badge badge-pill badge-danger">Cancel</span></td>
                                                                                                                                         <td></td>
                                                                                                                                         <td></td>
                                                                                                                                         <%
                                                                                                                                             }
                                                                                                                                         %>
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
															<!-- /Schedule Header -->
															
															<!-- Schedule Content -->
															<div class="tab-content schedule-cont">
															
																<!-- Sunday Slot -->
																
																<!-- /Sunday Slot -->

																<!-- Monday Slot -->
																<div id="slot_monday" class="tab-pane fade show active">
																	<h4 class="card-title d-flex justify-content-between">
																		<span></span> 
																		<a class="edit-link" data-toggle="modal" href="#edit_time_slot"><i class="fa fa-plus mr-1"></i>Add</a>
																	</h4>
																	
																	<!-- Slot List -->
																	
																	<!-- /Slot List -->
																	
																</div>
																

															</div>
															<!-- /Schedule Content -->
															
														</div>
													</div>
												</div>
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
		
		<!-- Add Time Slot Modal -->
		
		<!-- /Add Time Slot Modal -->
		
		<!-- Edit Time Slot Modal -->
		<div class="modal fade custom-modal" id="edit_time_slot" >
			<div class="modal-dialog modal-dialog-centered" >
				<div class="modal-content" style="width: 750px;">
					<div class="modal-header">
						<h5 class="modal-title">Add Time Slots</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>                                   
					<div class="modal-body" style="width: 750px;">
                                            <form action="appointmentslot" method="POST">
                                                    <div>
                                                        <div class="row form-row hours-cont">
                                                                <div class="col-12 col-md-8">                                                                  
                                                                    <div class="row form-row">
                                                                        <div class="col-12 col-md-8">
                                                                            <div class="form-group">                                                        													
                                                                                    <input type="text" id="drname" name="drname" class="form-control" placeholder="Select Doctor">
                                                                                    <div id="countryList" class="countryList">
                                                                                </div>
                                                                                <script>
                                                                                    $(document).ready(function(){
                                                                                        $('#drname').keyup(function(){
                                                                                            var query = $(this).val();
                                                                                            if(query != '')
                                                                                            {
                                                                                                $.ajax({
                                                                                                    url: "add/checknameandspeciality.jsp",
                                                                                                    type:"POST",
                                                                                                    data:{query:query},
                                                                                                    success:function(data)
                                                                                                    {
                                                                                                        $('#countryList').fadeIn();
                                                                                                        $('#countryList').html(data);
                                                                                                    }
                                                                                                });
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                $('#countryList').fadeOut();
                                                                                                $('#countryList').html("");
                                                                                            }
                                                                                        });
                                                                                        $(document).on('click', 'li', function(){
                                                                                            $('#drname').val($(this).text());
                                                                                            $('#countryList').fadeOut();
                                                                                        });
                                                                                    }); 
                            
                                                                                </script>
                                                                            </div> 
                                                                        </div>
                                                                        
                                                                    </div>
                                                                </div>
                                                        </div> 
                                                        
                                                        <div class="row form-row hours-cont">
                                                            <div class="col-12 col-md-10">
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                    
                                                                                <input type="date" name="date" class="form-control" placeholder="Select Date">                                                                                                                                                                                                                            
                                                                        </div> 
                                                                    </div>
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                                                
                                                                                <input type="time" name="time" class="form-control" placeholder="Select Time">                                                                                                                                                                                                                        
                                                                        </div> 
                                                                    </div>
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                                                
                                                                                <input type="text" name="slot" class="form-control" placeholder="Enter Slot">                                                                                                                                                                                                                         
                                                                         </div> 
                                                                    </div>                                                          
                                                                </div>  
                                                            </div>
                                                               
                                                        </div> 
                                                    </div>
                                                        
                                                        <div style="display: inline;" class="hours-info">  
                                                                                                                                                                                                                                          
                                                        </div>
							<div class="add-more mb-3">
								<a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                                                                
							</div>
							<div class="submit-section text-center">
								<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>
                </div>
                    <!-- Edit Details Modal -->
                                    <div class="modal fade custom-modal" id="edit_specialities_details" >
			<div class="modal-dialog modal-dialog-centered" >
				<div class="modal-content" style="width: 650px;">
					<div class="modal-header">
						<h5 class="modal-title">Edit Time Slot</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>                                   
					<div class="modal-body" style="width: 650px;">
                                            <form action="appointmentupdate" method="POST">
                                                    <div>
                                                         
                                                        
                                                        <div class="row form-row hours-cont">
                                                            <div class="col-12 col-md-10">
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                    
                                                                            <input type="date" id="date11" name="date" class="form-control" value="" />                                                                                                                                                                                                                            
                                                                        </div> 
                                                                    </div>
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                                                
                                                                                <input type="time" id="time11" name="time" class="form-control" value="" />   
                                                                                <input type="hidden" name="aid" value="" id="aid">
                                                                        </div> 
                                                                    </div>
                                                                    <div class="col-12 col-md-4">
                                                                        <div class="form-group">                                                                                                                                
                                                                                <input type="text"  name="slot" value="" class="form-control" id="slot11" />                                                                                                                                                                                                                         
                                                                         </div> 
                                                                        
                                                                    </div>                                                          
                                                                </div>  
                                                            </div>
                                                               
                                                        </div> 
                                                    </div>
                                                        
                                                        
							<div class="submit-section text-center">
								<button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>                                                                                                                                         			
		</div>
                    
                    <!-- Delete Modal -->
			<div class="modal fade custom-modal" id="delete_modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">                                      
						<form action="staffslotchange" method="POST">
						<div class="modal-body">
							<div class="form-content p-2">
								<h4 class="modal-title">Cancel</h4>
								<p class="mb-4">Are you sure want to cancel?</p>
                                                                <input name='uid' type = 'hidden' readonly value='<%=cookie%>'/>
                                                                <input name='aid' id='aid1' type = 'hidden' readonly value=''/>
                                                                
                                                                <button type="submit" name="change" value="Cancel" class="btn btn-danger">Cancel </button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
                                        </form>
                                                                
					</div>
				</div>
			</div>
                        
                        <!-- / --> 
                    
                    <script>
                            $(document).ready(function(){
                            $(document).on("click",".edit_data", function(){
                                var id = $(this).attr("id");
                                $.ajax({
                                    url: "add/getmodal.jsp",
                                    type: "POST",
                                    dataType:'JSON',
                                    data: {id:id},                                    
                                    success: function(data){
                                        console.log(data);
                                        console.log(data.date);
                                        $("#date11").val(data.date);                                    
                                        $("#time11").val(data.time);
                                        $("#slot11").val(data.slot);
                                        $("#aid").val(data.aid);
                                    }
                                });
                            });
                        });
                        </script>
		<!-- /Edit Time Slot Modal -->
                <%  
                    String user = null;
                    String user1 = null;
                    String user2 = null;
                    if((String) session.getAttribute("update") != null)
                    {
                    user = (String) session.getAttribute("update");
                    }
                    if((String) session.getAttribute("add") != null)
                    {
                    user1 = (String) session.getAttribute("add");
                    }
                    if((String) session.getAttribute("cancel") != null)
                    {
                    user2 = (String) session.getAttribute("cancel");
                    }
                 %>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    
                    var session1 ="<%out.print(user);%>";
                    var session2 ="<%out.print(user1);%>";
                    var session3 ="<%out.print(user2);%>";
                    console.log(session3);
                    if(session1 == "success")
                    {
                    swal({
                    title: "Updated Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session1 == "fail")
                    {
                    swal({
                    title: "Update Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                if(session2 == "success")
                    {
                    swal({
                    title: "Appointment Added Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session2 == "fail")
                    {
                    swal({
                    title: "Appointment Add Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                if(session3 == "success")
                    {
                    swal({
                    title: "Appointment Cancelled Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session3 == "fail")
                    {
                    swal({
                    title: "Appointment Cancel Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
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
                                url: "add/getslot.jsp",
                                type: "POST",
                                dataType:'JSON',
                                data: {id:id},                                    
                                success: function(data){
                                    console.log(data);
                                    
                                                                        
                                        $("#aid1").val(data.id);                                      
                                }
                            });
                    });
                });
                    
                </script>
             
                <!-- -->
                	
                <!-- -->
	  
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
		
		<!-- Custom JS -->
		<script src="js/script.js"></script>
		
	</body>

<!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
</html>