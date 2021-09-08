<%@page import="models.User"%>
<%@page import="models.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html> 
<html lang="en">
   
<% Cookie ck[] = request.getCookies(); %>
<% DBCon con = new DBCon(); %>
<!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
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
		
		<!-- Fancybox CSS -->
		<link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.min.css">
                <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
		<link rel="stylesheet" href="assets/css/style.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
	    <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
	<script type="text/javascript" 
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script src="js/jquery.autocomplete.js"></script>
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
							<li class="">
								<a href="userhome.jsp">Home</a>
							</li>
							<li class="has-submenu ">
								<a href="#">Appointments <i class="fas fa-chevron-down"></i></a>
								<ul class="submenu">
									<li><a href="searchdoctors.jsp">Book An Appointment</a></li>
									<li><a href="showmyappointment">Appointments</a></li>									
									
								</ul>
							</li>	
								
							<li class="has-submenu active">
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
						
					</ul>
				</nav>
			</header>
			<!-- /Header -->
			
			<!-- Breadcrumb -->
			<div class="breadcrumb-bar">
				<div class="container-fluid">
					<div class="row align-items-center">
						<div class="col-md-8 col-12">
							<nav aria-label="breadcrumb" class="page-breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="userhome.jsp">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Laboratory</li>
								</ol>
							</nav>
							<h2 class="breadcrumb-title">Laboratory Appointment</h2>
							
						</div>
						
					</div>
				</div>
			</div>
			<!-- /Breadcrumb -->
			
			<!-- Page Content -->
                        
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div style="width:800px; margin:0 auto;" class="col-md-12 col-lg-4 col-xl-3 theiaStickySidebar">
						
							<!-- Search Filter -->
                                                        <form method="post" action="laboratoryappointment">
							<div class="card search-filter">
								<div class="card-header">
									<h4 class="card-title mb-0">Search Filter</h4>
								</div>
								<div class="card-body">
								
							    <%
            
               
            try{
                PreparedStatement ps = con.createConnection().prepareStatement("Select * from test ");
                ResultSet rs = ps.executeQuery();
            
               %>
								<div class="filter-widget">
									<div class="">
										<select required name="testname" class="form-control">
											<option value="" selected>Select Test</option>
                                                                                        <% while(rs.next()){ %>
                            <option><%= rs.getString(2)%></option>
                            <% } %>
										</select>
									</div>			
								</div>
                                                                                
                                                                                <div class="filter-widget">
									<div class="">
										<input type="text" name="drname" id="drname" class="form-control" placeholder="Select Doctor">
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
                                
								<div class="filter-widget">
									
										<input type="date" id="date" required name="date" class="form-control" placeholder="Select Date">
																	
								</div>
									<div class="btn-search">
										<button type="submit" class="btn btn-block">Book</button>
									</div>	
								</div>
							</div>
                                                                                <%
            if(request.getAttribute("labid") != null)
            {
                int id = (Integer) request.getAttribute("labid");
                int uid = (Integer) request.getAttribute("uid");
            
        %>
        <input name="labid" type="hidden" value="<%=id%>"/>
        <input name="uid" type="hidden" value="<%=uid%>"/>
        <%
                    }
                else{
                    String cookie = "";
            
               for(int i = 0; i < ck.length; i++){
                    if(ck[i].getName().equals("uid")){
                    cookie = ck[i].getValue();
                    } 
               }
}
                %>  
                <%
                                }
                                catch(Exception e){
                                
                                }
                            %>
                                                                                </form>
							<!-- /Search Filter -->
							
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
                
                <%  
                    String user = null;
                    if((String) session.getAttribute("success") != null)
                    {
                    user = (String) session.getAttribute("success");
                    }
                 %>
                 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>
                    
                    var session1 ="<%out.print(user);%>";
                    if(session1 == "fail")
                    {
                    swal({
                    title: "Enter Future Date",
                    //text: "You clicked the button!",
                    icon: "warning",
                    button: "Ok"
                    });
                     <%
                                session.invalidate();
                                %>
                }
                </script>
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
		
		<!-- Datetimepicker JS -->
		<script src="assets/js/moment.min.js"></script>
		<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Fancybox JS -->
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/script.js"></script>
		
	</body>

<!-- doccure/search.html  30 Nov 2019 04:12:16 GMT -->
</html>