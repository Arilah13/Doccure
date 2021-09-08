<%@page import="java.util.List"%>
<%@page import="models.GS"%>
<!DOCTYPE html>

<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:20 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Dashboard</title>
	<link rel="stylesheet" href="admin/assets/plugins/datatables/datatables.min.css">	
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
        
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">
		
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
	<%      int Doctors = (Integer) request.getAttribute("Doctors"); 
                int Patients = (Integer) request.getAttribute("Patients"); 
                int Appointments = (Integer) request.getAttribute("Appointments");
                int staff = (Integer) request.getAttribute("staff"); 
                int appointmentearning = (Integer) request.getAttribute("appointmentearning"); 
                int labearnings = (Integer) request.getAttribute("labearnings"); 
                int nolab = (Integer) request.getAttribute("nolab");
                
                int doctors = Doctors*3;
                int patients = Patients*3;
                int appointments = Appointments*3;
                int totalstaff = staff*3;
                int totalappointmentearning = appointmentearning/1000;
                int totallabearnings = labearnings/1000;
                int totalno = nolab*3;
        %>
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
							<li class="active"> 
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
							<div class="col-sm-12">
								<h3 class="page-title">Welcome Admin!</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item active">Dashboard</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->

					<div class="row">
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-primary border-primary">
											<i class="fe fe-users"></i>
										</span>
										<div class="dash-count">
											<h3><%=Doctors%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										<h6 class="text-muted">Doctors</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-primary" style="width: <%=doctors%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-success">
											<i class="fe fe-credit-card"></i>
										</span>
										<div class="dash-count">
											<h3><%=Patients%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Patients</h6>
										<div class="progress progress-sm">
                                                                                    <div class="progress-bar bg-success" style="width: <%=patients%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-secondary border-secondary">
											<i class="fe fe-pencil"></i>
										</span>
										<div class="dash-count">
											<h3><%=staff%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Staffs</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-secondary" style="width: <%=totalstaff%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
                                                <div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-danger border-danger">
											<i class="fe fe-money"></i>
										</span>
										<div class="dash-count">
											<h3><%=Appointments%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Appointments</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-danger" style="width: <%=appointments%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-danger border-danger">
											<i class="fe fe-money"></i>
										</span>
										<div class="dash-count">
											<h3><%=nolab%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Lab Appointments</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-danger" style="width: <%=totalno%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
                                                <div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-dark border-dark">
											<i class="fe fe-folder"></i>
										</span>
										<div class="dash-count">
											<h3>Rs. <%=appointmentearning%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Appointment Earnings</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-dark" style="width: <%=totalappointmentearning%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
                                                                                <div class="col-xl-3 col-sm-6 col-12">
							<div class="card">
								<div class="card-body">
									<div class="dash-widget-header">
										<span class="dash-widget-icon text-warning border-warning">
											<i class="fe fe-folder"></i>
										</span>
										<div class="dash-count">
											<h3>Rs. <%=labearnings%></h3>
										</div>
									</div>
									<div class="dash-widget-info">
										
										<h6 class="text-muted">Lab Earnings</h6>
										<div class="progress progress-sm">
											<div class="progress-bar bg-warning" style="width: <%=totallabearnings%>%"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-lg-6">
						
							<!-- Sales Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">Status</h4>
								</div>
								<div class="card-body">
									<div id="mysecondchart" style="height: 250px;"></div>
								</div>
							</div>
							<!-- /Sales Chart -->
							
						</div>
						<div class="col-md-12 col-lg-6">
						
							<!-- Invoice Chart -->
							<div class="card card-chart">
								<div class="card-header">
									<h4 class="card-title">Revenue</h4>
								</div>
								<div class="card-body">
									<div id="myfirstchart" style="height: 250px;"></div>
								</div>
							</div>
							<!-- /Invoice Chart -->
							
						</div>	
					</div>
					<div class="row">
						<div class="col-md-6 d-flex">
						
							<!-- Recent Orders -->
							<div class="card card-table flex-fill">
								<div class="card-header">
									<h4 class="card-title">Doctors List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Speciality</th>
													<th>Earned</th>													
												</tr>
											</thead>
											<tbody>
                                                                                            <%
                                                                                                List<GS> results1 = (List<GS>)(request.getAttribute("results1"));

                                                                                                for (int i = 0; i < results1.size(); i++)
                                                                                                {   
                                                                                                
                                                                                            %>
												<tr>
													<td>
														<h2 class="table-avatar">
                                                                                                                    <a  class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results1.get(i).getPiccode()%>.png" alt="Doctor Image"></a>
															<a >Dr.<%=results1.get(i).getDrname()%></a>
														</h2>
													</td>
													<td><%=results1.get(i).getDrspeciality()%></td>
													<td>Rs. <%=results1.get(i).getEarnings()%></td>
													
												</tr>
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
						<div class="col-md-6 d-flex">
						
							<!-- Feed Activity -->
							<div class="card  card-table flex-fill">
								<div class="card-header">
									<h4 class="card-title">Patients List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>													
													<th>Patient Name</th>
													<th>Phone</th>
													<th>Last Visit</th>
																										
												</tr>
											</thead>
											<tbody>
                                                                                            <%
                                                                                                List<GS> results2 = (List<GS>)(request.getAttribute("results2"));

                                                                                                for (int i = 0; i < results2.size(); i++)
                                                                                                {   
                                                                                                
                                                                                            %>
												<tr>
													<td>
														<h2 class="table-avatar">
															<a  class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/<%=results2.get(i).getPiccode()%>.png" alt="User Image"></a>
															<a ><%=results2.get(i).getFname()%> </a>
														</h2>
													</td>
													<td><%=results2.get(i).getMobilenumber()%></td>
                                                                                                        <td><%=results2.get(i).getDate()%></td>
													
												</tr>
												<%
                                                                                                    }
                                                                                                %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- /Feed Activity -->
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						
							<!-- Recent Orders -->
							<div class="card card-table">
								<div class="card-header">
									<h4 class="card-title">Appointment List</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-hover table-center mb-0">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Speciality</th>
													<th>Patient Name</th>
													<th>Apointment Time</th>
													<th>Status</th>
													<th class="text-right">Amount</th>
												</tr>
											</thead>
											<tbody>
                                                                                            <%
                                                                                                List<GS> results3 = (List<GS>)(request.getAttribute("results3"));

                                                                                                for (int i = 0; i < results3.size(); i++)
                                                                                                {   
                                                                                                
                                                                                            %>
												<tr>
													<td>
														<h2 class="table-avatar">
															<a  class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results3.get(i).getPiccode1()%>.png" alt="Doctor Image"></a>
															<a >Dr.<%=results3.get(i).getName()%></a>
														</h2>
													</td>
													<td><%=results3.get(i).getSpeciality()%></td>
													<td>
														<h2 class="table-avatar">
															<a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/patients/<%=results3.get(i).getPiccode()%>.png" alt="User Image"></a>
															<a href="profile.html"><%=results3.get(i).getUname()%></a>
														</h2>
													</td>
													<td><%=results3.get(i).getDate()%> <span class="text-primary d-block"><%=results3.get(i).getTime()%></span></td>
                                                                                                        <%
                                                                                                                if(results3.get(i).getStatus()==0)
                                                                                                                    {
                                                                                                        %>
													<td >
														<span class="badge badge-pill bg-success inv-badge">Confirm</span>
													</td>
                                                                                                        <%
                                                                                                                    }
                                                                                                                else if(results3.get(i).getStatus()==1)
                                                                                                                    {
                                                                                                        %>                                                                                                                                                                                                                                                
                                                                                                        <td class="text-left">
                                                                                                                <span class="badge badge-pill bg-warning-light inv-badge">Cancel</span>
                                                                                                        </td>
                                                                                                        <%
                                                                                                                    }
                                                                                                        %>
													<td class="text-right">
														Rs. <%=results3.get(i).getEarnings()%>
													</td>
												</tr>
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
                <script>
                    $(document).ready(function(){
                        
                        var v0,v1,v2,v3,v4;
                        
                        var a0,a1,a2,a3,a4;
                        
                        var l0,l1,l2,l3,l4;
                        
                        var d0,d1,d2,d3,d4;
                        
                        var p0,p1,p2,p3,p4;
                        
                        var d0,d1,d2,d3,d4;
                        
                        var s0,s1,s2,s3,s4;
                       
                        function test(str1, callback){
                        $.ajax({
                            url: "add/germorrison.jsp",
                            type: "POST",
                            dataType:'JSON',                                    
                            success: function(data){
                              console.log(data);
                                callback(data);
                               
                            }                                                                                                        
                        });
                    }
                    
                    test("str", function(url){
                        v0 = url.date[0];
                        v1 = url.date[1];
                        v2 = url.date[2];
                        v3 = url.date[3];
                        v4 = url.date[4];
                        
                        a0 = url.appointment[0];
                        a1 = url.appointment[1];
                        a2 = url.appointment[2];
                        a3 = url.appointment[3];
                        a4 = url.appointment[4];
                        
                        l0 = url.lab[0];
                        l1 = url.lab[1];
                        l2 = url.lab[2];
                        l3 = url.lab[3];
                        l4 = url.lab[4];
                                                                             
                    new Morris.Line({
                    // ID of the element in which to draw the chart.
                    element: 'myfirstchart',
                    // Chart data records -- each entry in this array corresponds to a point on
                    // the chart.
                    data: [
                    { date: v0, value: a0, value1: l0 },
                    { date: v1, value: a1, value1: l1 },
                    { date: v2, value: a2, value1: l2 },
                    { date: v3, value: a3, value1: l3 },
                    { date: v4, value: a4, value1: l4 }
                    ],
                    
                    
                    xkey: 'date',
                    
                    ykeys: ['value','value1'],
                   
                    labels: ['Appointment Earning Rs.', 'Lab Earning Rs.'],
                    resize: true
                    });
                    });
                    
                    function test1(str1, callback){
                        $.ajax({
                            url: "add/getmorrison.jsp",
                            type: "POST",
                            dataType:'JSON',                                    
                            success: function(data){
                              
                                callback(data);
                               
                            }                                                                                                        
                        });
                    }
                    test1("str", function(url){
                        
                        d0 = url.date[0];
                        d1 = url.date[1];
                        d2 = url.date[2];
                        d3 = url.date[3];
                        
                        
                        s0 = url.staff[0];
                        s1 = url.staff[1];
                        s2 = url.staff[2];
                        s3 = url.staff[3];
                        
                        
                        p0 = url.patient[0];
                        p1 = url.patient[1];
                        p2 = url.patient[2];
                        p3 = url.patient[3];
                        
                        
                        dd0 = url.doctor[0];
                        dd1 = url.doctor[1];
                        dd2 = url.doctor[2];
                        dd3 = url.doctor[3];
                        
                        console.log(url.staff);
                    new Morris.Line({
                       
                    element: 'mysecondchart',
                    
                    data: [
                    { date: d0, value: s0, value1: p0, value2: dd0 },
                    { date: d1, value: s1, value1: p1, value2: dd1 },
                    { date: d2, value: s2, value1: p2, value2: dd2 },
                    { date: d3, value: s3, value1: p3, value2: dd3 }
                    
                    ],
                    
                    xkey: 'date',
                    
                    ykeys: ['value','value1','value2'],
                    
                    labels: ['Staff', 'Patient', 'Doctor'],
                    
                    resize: true
                    });
                });
                });
                    
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

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:34 GMT -->
</html>