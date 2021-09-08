<!DOCTYPE html>

<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Profile</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">	
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="admin/assets/css/style.css">
		
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
	
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			<!-- Header -->
            <div class="header">
			
				<!-- Logo -->
                <div class="header-left">
                    <a href="index.html" class="logo">
						<img src="assets/img/logo.png" alt="Logo">
					</a>
					<a href="index.html" class="logo logo-small">
						<img src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
					</a>
                </div>
				<!-- /Logo -->
				
				<a href="javascript:void(0);" id="toggle_btn">
					<i class="fe fe-text-align-left"></i>
				</a>
				
				
				
				<!-- Mobile Menu Toggle -->
				<a class="mobile_btn" id="mobile_btn">
					<i class="fa fa-bars"></i>
				</a>
				<!-- /Mobile Menu Toggle -->
				
				<!-- Header Right Menu -->
				<ul class="nav user-menu">

					<!-- Notifications -->
					
					<!-- /Notifications -->
					
					<!-- User Menu -->
					<li class="nav-item dropdown has-arrow">
						<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
							
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								
								<div class="user-text">
									<h6>Admin</h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="adminprofile.jsp">My Profile</a>
							
							<a class="dropdown-item" href="logout">Logout</a>
						</div>
					</li>
					<!-- /User Menu -->
					
				</ul>
				<!-- /Header Right Menu -->
				
            </div>
			<!-- /Header -->
			<!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
					<div id="sidebar-menu" class="sidebar-menu">
						<ul>
							<li class="menu-title"> 
								<span>Main</span>
							</li>
							<li > 
								<a href="adminindex"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li > 
								<a href="adminappointments"><i class="fe fe-layout"></i> <span>Appointments</span></a>
							</li>
                                                        <li> 
								<a href="adminlabappointments"><i class="fe fe-layout"></i> <span>Lab Appointments</span></a>
							</li>
                                                        <li> 
								<a href="adminslots"><i class="fas fa-hourglass-start"></i> <span>Schedule Timings</span></a>
							</li>
							<li> 
								<a href="adminspecialities"><i class="fe fe-users"></i> <span>Specialities</span></a>
							</li>
							<li> 
								<a href="adminlabtest"><i class="fa fa-flask"></i> <span>Lab Tests</span></a>
							</li>
							<li > 
								<a href="admindoctors"><i class="fa fa-user-md"></i> <span>Doctors</span></a>
							</li>
							<li> 
								<a href="adminstaff"><i class="fe fe-user-plus"></i> <span>Staff</span></a>
							</li>
							<li > 
								<a href="adminmembers"><i class="fe fe-user"></i> <span>Patients</span></a>
							</li>
							
							<li > 
								<a href="pharmacist"><i class="fe fe-plus"></i> <span>Pharmacists</span></a>
							</li>
							
							
							
						
							
							
							
							
						</ul>
					</div>
                </div>
            </div>
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content container-fluid">
					
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col">
								<h3 class="page-title">Profile</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Profile</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						
							
							
							
									<!-- /Personal Details -->

								
								<!-- /Personal Details Tab -->
								
								<!-- Change Password Tab -->
								<div class="col-md-6">
								<div id="password_tab" class="tab-pane fade show active">
								
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">Change Password</h5>
											<div class="row">
												<div class="col-md-12">
                                                                                                    <form method="post" action="adminpass">

														<div class="form-group">
															<label>New Password</label>
															<input type="password" id="pass" class="form-control">
														</div>
														<div class="form-group">
															<label>Confirm Password</label>
															<input type="password" id="cpass" name="password" class="form-control">
														</div>
														<button class="btn btn-primary" type="submit">Save Changes</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /Change Password Tab -->
								
							</div>
						</div>
					</div>
				</div>
				</div>			
			
			<!-- /Page Wrapper -->
		
        
		<!-- /Main Wrapper -->
	<%  
                    String user = null;
                    if((String) session.getAttribute("activate") != null)
                    {
                    user = (String) session.getAttribute("activate");
                    }
                     %>
                      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    var session1 ="<%out.print(user);%>";
                    if(session1 == "success")
                    {
                    swal({
                    title: "Password Changed Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session1 == "fail")
                    {
                    swal({
                    title: "Password Change Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                
                </script>
		<!-- jQuery -->
        <script src="admin/assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="admin/assets/js/popper.min.js"></script>
        <script src="admin/assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="admin/assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
</html>