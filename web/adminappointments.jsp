<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="admin/assets/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="admin/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- Feathericon CSS -->
        <link rel="stylesheet" href="admin/assets/css/feathericon.min.css">
		
		<!-- Datatables CSS -->
		<link rel="stylesheet" href="datatables/datatables.min.css">
		
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
							<li> 
								<a href="adminindex"><i class="fe fe-home"></i> <span>Dashboard</span></a>
							</li>
							<li class="active"> 
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
							<li> 
								<a href="admindoctors"><i class="fa fa-user-md"></i> <span>Doctors</span></a>
							</li>
							<li> 
								<a href="adminstaff"><i class="fe fe-user-plus"></i> <span>Staff</span></a>
							</li>
							<li> 
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
														<span class="badge badge-pill bg-success inv-badge">Confirm</span>
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
                                                                                                        <form method='post' action='adminappointmentchange'>
													<td class="text-center">
														<div class="actions">
                                                                                                                    <input name='paID' type = 'hidden' readonly value='<%=results.get(i).getPaID()%>'/>
                                                                                                        <input name='uid' type = 'hidden' readonly value='<%=results.get(i).getUid()%>'/>
                                                                                                                    
                                                                                                                    <a  data-toggle="modal" href="#delete_modal" id="<%=results.get(i).getPaID()%>" class="btn btn-sm bg-danger-light delete_data">
                                                                                                                                                                <i class="fe fe-trash"></i> Cancel
                                                                                                                                                            </a>
														</div>
													</td>
                                                                                                        </form>
                                                                                                        <%
                                                                                                                    }
                                                                                                                else if(results.get(i).getStatus()==1)
                                                                                                                    {
                                                                                                        %>
                                                                                                        <td>    </td>
                                                                                                        <%
                                                                                                            }
                                                                                                            }
                                                                                                            else if(diff > 0)
                                                                                                            {
                                                                                                        %>
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
							<!-- /Recent Orders -->
							
						</div>
					</div>
				</div>			
			</div>
			<!-- /Page Wrapper -->
		
        </div>
                                                                                                            <!-- Delete Modal -->
			<div class="modal fade" id="delete_modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">                                      
						<form action="adminappointmentchange" method="POST">
						<div class="modal-body">
							<div class="form-content p-2">
								<h4 class="modal-title">Cancel</h4>
								<p class="mb-4">Are you sure want to cancel?</p>
                                                                
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
		<!-- /Main Wrapper -->
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
        <script src="admin/assets/js/jquery-3.2.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="admin/assets/js/popper.min.js"></script>
        <script src="admin/assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
        <script src="admin/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		
		<!-- Datatables JS -->
		<script src="datatables/jquery.dataTables.min.js"></script>
		<script src="datatables/datatables.min.js"></script>
		
		<!-- Custom JS -->
		<script  src="admin/assets/js/script.js"></script>
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/appointment-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:49 GMT -->
</html>



 
                
                
                
                
                
                