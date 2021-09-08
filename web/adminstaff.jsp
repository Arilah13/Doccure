<%@page import="java.util.List"%>
<%@page import="models.GS"%>

<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Doccure - Doctor List Page</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
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
							<li class="active"> 
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
							<div class="col-sm-7 col-auto">
								<h3 class="page-title">List of Staffs</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a >Dashboard</a></li>
									<li class="breadcrumb-item"><a href="javascript:(0);">Users</a></li>
									<li class="breadcrumb-item active">Staff</li>
								</ul>
							</div>
                                                        <div class="col-sm-5 col">
								<a href="#Add_Specialities_details" data-toggle="modal" class="btn btn-primary float-right mt-2">Add</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive">
										<table class="datatable table table-hover table-center mb-0">
											<thead>
												<tr>
													<th class="text-center">Staff Name</th>
													
                                                                                                        <th class="text-center">Username</th>
													
													<th class="text-center">Account Status</th>
                                                                                                        <th class="text-center">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                            <%
                            List<GS> results = (List<GS>)(request.getAttribute("results"));

                            for (int i = 0; i < results.size(); i++)
                            {
                                %>
                                                                                
												<tr>
													<td class="text-center">
														<h2 class="table-avatar">
                                                                                                                    <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/staff/<%=results.get(i).getPiccode()%>.png" alt="Staff Image"></a>
															<a><%=results.get(i).getFname()%></a>
														</h2>
													</td>
													
													
                                                                                                        <td class="text-center"><%=results.get(i).getUname()%></td>
													
													
                                                                                                        <%
                                                                                                            if(results.get(i).getStatus() == 0)
                                                                                                            {
                                                                                                        %>
													<td class="text-center">
                                                                                                            <span class="badge badge-pill bg-success inv-badge">Active</span>
													</td>
                                                                                                        <form action='adminstaffchange' method='post'>
                                                                                                        <td class="text-center">
														<div class="actions">
                                                                                                                    <a data-toggle="modal" href="#edit_invoice_report" id="<%=results.get(i).getSid()%>" class="btn btn-sm bg-success-light mr-2 edit_data">
																<i class="fe fe-pencil"></i> Edit
															</a>
                                                                                                                    <button class="btn btn-sm bg-danger-light" type="submit" name="change" value="cancel">
																<i class="fe fe-trash"></i> Deactivate
															</button>
														</div>
                                                                                                            <input type = 'hidden' name='sid' readonly value='<%=results.get(i).getSid()%>'/>
													</td>
                                                                                                        </form>
                                                                                                        <%
                                                                                                            }
                                                                                                            else if(results.get(i).getStatus() == 1)
                                                                                                            {
                                                                                                        %>
                                                                                                        <td class="text-center">
                                                                                                                <span class="badge badge-pill bg-warning-light inv-badge">Deactive</span>
                                                                                                        </td>    
                                                                                                        <form action='adminstaffchange' method='post'>
                                                                                                            <td class="text-center">
                                                                                                                <input type = 'hidden' name='sid' readonly value='<%=results.get(i).getSid()%>'/>
                                                                                                                <button class="btn btn-sm bg-success-light" type="submit" name="change" value="active">
																<i class="fe fe-play"></i> Activate
															</button>
                                                                                                            </td>
                                                                                                        </form>
                                                                                                        <%
                                                                                                            }
                                                                                                        %>
                                                                                                        
                                                                                                        
												</tr>
                                                                                
                                                                                                                        <%
                                                                                                                            }
                                                                                                                            %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>			
					</div>
					
				</div>			
			</div>
			<!-- /Page Wrapper -->
		<div class="modal fade" id="edit_invoice_report" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Doctor</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action='adminstaffchange' method='post'>
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>User Name</label>
                                                                                        <input type="text" name="username" id="username1" class="form-control" value="">
                                                                                        <input type="hidden" name="sid" id="sid" />
                                                                                        <div style="color:red; position: fixed; margin-left: 10px; font-size: 12px;" id="emaile">
															
												</div>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Password</label>
                                                                                        <input type="password" name="password" class="form-control" value="">
										</div>
									</div>
									
									
								</div>
                                                            <button type="submit" name="change" value="Edit" id="btnedit" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
                        <!-- Add Modal -->
			<div class="modal fade" id="Add_Specialities_details" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Add Staffs</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
                                                    <form method="post" action="staffregister" enctype="multipart/form-data">
                                                        <div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>First Name</label>
											<input required name="fname" type="text" class="form-control">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Last Name</label>
											<input required name="lname" type="text"  class="form-control">
										</div>
									</div>
									
								</div>
                                                                <div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Username</label>
											<input required name="username" id="username2" type="text" class="form-control">
                                                                                        <div style="color:red; position: fixed; margin-left: 10px; font-size: 12px;" id="emaile1">
															
                                                                                        </div>
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Password</label>
											<input required name="password" type="password"  class="form-control">
										</div>
									</div>
									
								</div>
								<div class="row form-row">
									
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Image</label>
											<input required name="pic" type="file"  class="form-control">
										</div>
									</div>
									
								</div>
                                                                
								<button type="submit" id="btnregister" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /ADD Modal -->
        </div>
		<!-- /Main Wrapper -->
                
         <script typr="text/javascript">         
            $(document).ready(function(){
                $("#username2").on("input", function(e){
                    
                    var email = $("#username2").val();
                    console.log(email);
                    if(email !== ""){
                        $.ajax({
                            url: "add/checkstaffusername.jsp",
                            type: "POST",
                            dataType:'JSON',
                            data: {email:email},
                            success: function(data){     
                                console.log(data);
                                if(data.status == 0){
                                    console.log(data.status);
                                    document.getElementById("emaile1").innerHTML = "";  
                                    document.getElementById("btnregister").disabled = false;
                                    
                                }
                                else
                                {
                                    console.log(data.status);
                                    document.getElementById("emaile1").innerHTML = "User Name Already Exists";  
                                    document.getElementById("btnregister").disabled = true;
                                }
                            }
                        });
                    }
                });
            
                var id;
            
                            $(document).on("click",".edit_data", function(){
                                id = $(this).attr("id");
                                $("#username1").on("input", function(e){
                                    var email = $("#username1").val();
                                    console.log(email);
                                    if(email !== ""){
                                        $.ajax({
                                            url: "add/checkstaffusername1.jsp",
                                            type: "POST",
                                            dataType:'JSON',
                                            data: {email:email, id:id},
                                            success: function(data){     
                                            console.log(data);
                                            if(data.status == 0){
                                                console.log(data.status);     
                                                document.getElementById("emaile").innerHTML = "";    
                                                document.getElementById("btnedit").disabled = false;
                                             }
                                            else
                                            {
                                            console.log(data.status);
                                            document.getElementById("emaile").innerHTML = "User Name Already Exists";    
                                            document.getElementById("btnedit").disabled = true;
                                            }
                                            }
                                           });
                                    }
                                });                         
                            });    
            });
            
              
            </script>            
                
	<script>
                $(document).ready(function(){
                            $(document).on("click",".edit_data", function(){
                                var id = $(this).attr("id");
                                $.ajax({
                                    url: "add/getstaff.jsp",
                                    type: "POST",
                                    dataType:'JSON',
                                    data: {id:id},                                    
                                    success: function(data){
                                        console.log(data);
                                        console.log(data.date);
                                        $("#username1").val(data.username);                                                                           
                                        $("#sid").val(data.aid);
                                    }
                                });
                            });
                        });
       </script>  	
       
       <%  
                    String user = null;
                    String user1 = null;
                    String user2 = null;
                    String user3 = null;
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
                    if((String) session.getAttribute("activate") != null)
                    {
                    user3 = (String) session.getAttribute("activate");
                    }
                 %>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    
                    var session1 ="<%out.print(user);%>";
                    var session2 ="<%out.print(user1);%>";
                    var session3 ="<%out.print(user2);%>";
                    var session4 ="<%out.print(user3);%>";
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
                    title: "Staff Added Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session2 == "fail")
                    {
                    swal({
                    title: "Staff Add Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                if(session3 == "success")
                    {
                    swal({
                    title: "Staff Deactivated Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                else if(session3 == "fail")
                    {
                    swal({
                    title: "Staff Deactivate Unsuccessful",
                    //text: "You clicked the button!",
                    icon: "error",
                    button: "Ok"
                    });
                }
                if(session4 == "success")
                    {
                    swal({
                    title: "Staff Activated Successfully",
                    //text: "You clicked the button!",
                    icon: "success",
                    button: "Ok"
                    });
                }
                            <%
                                session.invalidate();
                                %>
                </script>
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

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/doctor-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:51 GMT -->
</html>