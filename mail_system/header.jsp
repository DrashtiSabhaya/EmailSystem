<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="shortcut icon" href="images/logo-2.png">
	<title>Mail Service</title>
	<meta name="viewport" content="width=device-width, intial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
<div class="container">
	<div id="logo">
		<img src="images/logo.png">
	</div>
	<% 
	if(session.getAttribute("username")!=null)
	{
		String username=(String)session.getAttribute("username");		
		out.print("<font style='color:navy'>Welcome "+username+"</font>");
	%>		
	<nav>
		<ul>
			<li class="current"><a href="index.jsp">HOME</a></li>
			<li><a href="LogoutServlet">LOGOUT</a></li>
			<li><a href="compose.jsp">COMPOSE</a></li>
			<li><a href="inbox.jsp">INBOX</a></li>
			<li><a href="contact.jsp">CONTACT US</a></li>
		</ul>
	</nav>
	<% }
	else
	{%>
	<nav>
			<ul>
				<li class="current"><a href="index.jsp">HOME</a></li>
				<li><a href="login.jsp">LOGIN</a></li>
				<li><a href="register.jsp">SIGN IN</a></li>
				<li><a href="contact.jsp">CONTACT US</a></li>
			</ul>
		</nav>
	<% } %>
	
</div>	
</header>