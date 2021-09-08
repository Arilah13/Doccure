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
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="admin/assets/css/style.css">
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
                                                        <li class="active"> 
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
							<div class="col-sm-7 col-auto">
								<h3 class="page-title">Appointments</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active">Appointments</li>
								</ul>
							</div>
                                                    <div class="col-sm-5 col">
								<a href="#edit_time_slot" data-toggle="modal" class="btn btn-primary float-right mt-2">Add</a>
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
													
													<th>Appt Date</th>
                                                                                                        <th>Appt Time</th>
                                                                                                        <th>Appt Slots</th>
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
                                                                                                                    <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/doctors/<%=results.get(i).getPiccode()%>.png" alt="Doctor Image"></a>
															<a><%=results.get(i).getDrname()%></a>
														</h2>
													</td>
													<td><%=results.get(i).getDrspeciality()%></td>
													
													<td><%=results.get(i).getDate()%> <span class="text-primary d-block"><%=results.get(i).getDay()%></span></td>
                                                                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=results.get(i).getTime()%> </td>
                                                                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=results.get(i).getSlot()%></td>
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
                                                                                                                if(results.get(i).getStatus()==0)
                                                                                                                    {
                                                                                                        %>
                                                                                                        <form method='post' action='adminslotupdate'>
													<td class="text-center">
														<div class="actions">
                                                                                                                    <input name='sid1' type = 'hidden' readonly value='<%=results.get(i).getAid()%>'/>
															<a class="btn btn-sm bg-success-light edit_data" id="<%=results.get(i).getAid()%>" data-toggle="modal" href="#edit_specialities_details">
																<i class="fe fe-pencil"></i> Edit
															</a>
                                                                                                                    <a  data-toggle="modal" href="#delete_modal" id="<%=results.get(i).getAid()%>" class="btn btn-sm bg-danger-light delete_data">
                                                                                                                                                                <i class="far fa-trash-alt"></i> Cancel
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
							<!-- /Recent Orders -->
							
						</div>
					</div>
				</div>			
			</div>
			<!-- /Page Wrapper -->
                        
                        <!-- Add -->
                        
                        <div class="modal fade" id="edit_time_slot" aria-hidden="true" role="dialog">
			<div class="modal-dialog modal-dialog-centered" >
				<div class="modal-content" style="width: 750px;">
					<div class="modal-header">
						<h5 class="modal-title">Add Slots</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>                                   
					<div class="modal-body" style="width: 750px;">
                                            <form action="adminslotupdate" method="POST">
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
                                                        
                                                        <div class="hours-info">  
                                                                                                                                                                                                                                          
                                                        </div>
							<div class="add-more mb-3">
								<a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                                                                
							</div>
							<div class="submit-section text-center">
                                                            <button type="submit" name="change" value="save" class="btn btn-primary btn-block">Save Changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>
                </div>
                        
                        <!--/Add-->
                        <!-- Add Modal -->
			<div class="modal fade" id="edit_specialities_details" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Slots</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
                                                    <form action="adminslotupdate" method="POST">
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Appt Date</label>
                                                                                        <input required name="apptdate" id="apptdate" type="date" class="form-control">
										</div>
									</div>
                                                                    <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Appt Time</label>
                                                                                        <input required name="appttime" id="appttime" type="time" class="form-control">
                                                                                        <input type="hidden" name="aid" value="" id="aid">
										</div>
									</div>
                                                                    <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Appt Slots</label>
                                                                                        <input required name="apptslots" id="apptslots" type="text" class="form-control">
										</div>
									</div>
									
									
								</div>
                                                        <button type="submit" name="change" value="update" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /ADD Modal -->
		
        </div>
                                                                                                            
               <!-- Delete Modal -->
			<div class="modal fade custom-modal" id="delete_modal">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">                                      
						<form action="adminslotupdate" method="POST">
						<div class="modal-body">
							<div class="form-content p-2">
								<h4 class="modal-title">Cancel</h4>
								<p class="mb-4">Are you sure want to cancel?</p>
                                                                
                                                                <input name='sid1' id='aid1' type = 'hidden' readonly value=''/>
                                                                
                                                                <button type="submit" name="change" value="cancel" class="btn btn-danger">Cancel </button>
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
                                        </form>
                                                                
					</div>
				</div>
			</div>
                        
                        <!-- / -->                                                                                              
                                                                                                            
		<!-- /Main Wrapper -->
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
                                        $("#apptdate").val(data.date);                                    
                                        $("#appttime").val(data.time);
                                        $("#apptslots").val(data.slot);
                                        $("#aid").val(data.aid);
                                    }
                                });
                            });
                        });
       </script>            
        
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



 
                
                
                
                
                
                