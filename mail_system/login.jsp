<jsp:include page="header.jsp"></jsp:include>
<% 
	if(request.getAttribute("Error")!=null)
	{
		String Error=(String)request.getAttribute("Error");
		out.print("<font style='color:red'>"+Error+"</font>");
	}
						
	if(request.getAttribute("Error1")!=null)
	{
		System.out.print(request.getAttribute("Error1"));
		String Error1=(String)request.getAttribute("Error1");
		out.print("<font style='color:red'>"+Error1+"</font>");							
	}
	
	if(request.getAttribute("register")!=null)
	{
		System.out.print(request.getAttribute("register"));
		String register=(String)request.getAttribute("register");
		out.print("<font style='color:navy'>"+register+"</font>");
	}
	
	if(request.getAttribute("logout")!=null)
	{
		System.out.print(request.getAttribute("logout"));
		String logout=(String)request.getAttribute("logout");
		out.print("<font style='color:navy'>"+logout+"</font>");
	}
%>
<section id="login">
	<div class="container">
		<h1><span class="highlight">LOG</span> IN</h1>
			<form action="LoginServlet" method="POST">
			<input type="email" name="email" placeholder="Enter Email" required="Username is required"><br><br>
			<input type="password" name="password" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must Contain Alpha numeric Characters">
			<br><br>
			<button type="submit" class="button1" name="Submit">Login</button>
			<button type="reset" class="button1" name="reset">Clear</button>
		</form>
	</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>