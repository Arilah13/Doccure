<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/appointment-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:46 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Appointment List Page</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">
		
		<!-- Datatables CSS -->
		<link rel="stylesheet" href="admin/assets/plugins/datatables/datatables.min.css">
		
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
							<span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Ryan Taylor"></span>
						</a>
						<div class="dropdown-menu">
							<div class="user-header">
								<div class="avatar avatar-sm">
									<img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
								</div>
								<div class="user-text">
									<h6>Ryan Taylor</h6>
									<p class="text-muted mb-0">Administrator</p>
								</div>
							</div>
							<a class="dropdown-item" href="profile.html">My Profile</a>
							<a class="dropdown-item" href="settings.html">Settings</a>
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
							<li> 
								<a href="index.html"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li class="active"> 
								<a href="adminappointments"><i class="fe fe-layout"></i> <span>Appointments</span></a>
							</li>
                                                        <li> 
								<a href=""><i class="fe fe-layout"></i> <span>Lab Appointments</span></a>
							</li>
                                                        <li> 
								<a href=""><i class="fas fa-hourglass-start"></i> <span>Schedule Timings</span></a>
							</li>
							<li> 
								<a href="specialities.html"><i class="fe fe-users"></i> <span>Specialities</span></a>
							</li>
							<li> 
								<a href="specialities.html"><i class="fa fa-flask"></i> <span>Lab Tests</span></a>
							</li>
							<li> 
								<a href="admindoctors"><i class="fa fa-user-md"></i> <span>Doctors</span></a>
							</li>
							<li> 
								<a href="patient-list.html"><i class="fe fe-user-plus"></i> <span>Staff</span></a>
							</li>
							<li> 
								<a href="patient-list.html"><i class="fe fe-user"></i> <span>Patients</span></a>
							</li>
							
							
							
							
							
							<li> 
								<a href="profile.html"><i class="fe fe-user-plus"></i> <span>Profile</span></a>
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
							<div class="col-sm-12">
								<h3 class="page-title">Appointments</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Appointments</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<div class="row">
						<div class="col-md-12">
						
							<!-- Recent Orders -->
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Speciality</th>
													<th>Patient Name</th>
													<th>Apointment Time</th>
                                                                                                        <th>Appointment No</th>
													<th>&nbsp;&nbsp;&nbsp;Status</th>
													<th class="text-center">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                            <%                                                                             
                                List<GS> results = (List<GS>)(request.getAttribute("results"));
                                for(int i = 0; i<results.size(); i++){
                                    %>
                                                                                        <form method='post' action='adminappointmentchange'>
												<tr>
													<td>
														<h2 class="table-avatar">
                                                                                                                    <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results.get(i).getPiccode1()%>.png" alt="Doctor Image"></a>
															<a><%=results.get(i).getName()%></a>
														</h2>
													</td>
													<td><%=results.get(i).getSpeciality()%></td>
													<td>
														<h2 class="table-avatar">
                                                                                                                    <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/<%=results.get(i).getPiccode()%>.png" alt="User Image"></a>
															<a><%=results.get(i).getUname()%> </a>
														</h2>
													</td>
													<td><%=results.get(i).getDate()%> <span class="text-primary d-block"><%=results.get(i).getTime()%></span></td>
                                                                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=results.get(i).getAno()%></td>
                                                                                                        <%
                                                                                                                if(results.get(i).getStatus()==0)
                                                                                                                    {
                                                                                                        %>
													<td class="text-left">
														<span class="badge badge-pill bg-success inv-badge">Paid</span>
													</td>
                                                                                                        <%
                                                                                                                    }
                                                                                                                else if(results.get(i).getStatus()==1)
                                                                                                                    {
                                                                                                        %>                                                                                                                                                                                                                                                
                                                                                                        <td class="text-left">
                                                                                                                <span class="badge badge-pill bg-warning-light inv-badge">Cancel</span>
                                                                                                        </td>                                                                                                                                        
                                                                                                        <%
                                                                                                                    }
                                                                                                        %>
                                                                                                        <input name='paID' type = 'hidden' readonly value='<%=results.get(i).getPaID()%> '/>
                                                                                                        <input name='uid' type = 'hidden' readonly value='<%=results.get(i).getUid()%>'/>
                                                                                                        <%
                                                                                                                if(results.get(i).getStatus()==0)
                                                                                                                    {
                                                                                                        %>
													<td class="text-center">
														<div class="actions">
															
															<a class="btn btn-sm bg-danger-light">
																<i class="fe fe-trash"></i> Cancel
															</a>
														</div>
													</td>
                                                                                                        <%
                                                                                                                    }
                                                                                                                else if(results.get(i).getStatus()==1)
                                                                                                                    {
                                                                                                        %>
                                                                                                        <td>    </td>
                                                                                                        <%
                                                                                                            }
                                                                                                        %>
												</tr>
                                                                                        </form>
                                                                                                        <%
                                                                                                            }
                                                                                                            %>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Recent Orders -->
							
						</div>
					</div>
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
        <script src="admin/assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="admin/assets/js/popper.min.js"></script>
        <script src="admin/assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
		<script src="admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="admin/assets/plugins/datatables/datatables.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="admin/assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/appointment-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:49 GMT -->
</html>



 
                
                
                
                
                
                