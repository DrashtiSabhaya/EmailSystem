<jsp:include page="header.jsp"></jsp:include>
<% 
	if(request.getAttribute("registererror")!=null)
	{
		String msg=(String)request.getAttribute("registererror");
		out.print("<font style='color:red'>"+msg);
		out.print("</font><br/>");
	}
%>									
<section id="login">
	<div class="container">
		<h1><span class="highlight">SIGN</span> IN</h1>
			<form action="RegisterServlet" method="POST">
			<input type="text" name="name" placeholder="Enter Name"><br><br>
			<input type="text" name="email" placeholder="Enter Email"><br><br>
			<input type="password" name="password" placeholder="Enter Password"><br><br>
			<input type="text" name="mbno" placeholder="Enter Contact No."><br><br>
			<input type="text" name="country" placeholder="Enter Country"><br><br>
			Male<input type="radio" name="gender" value="male">Female<input type="radio" name="gender" value="female"/><br><br>
			<button type="submit" class="button1" name="submit">Sign In</button>
			<button type="reset" class="button1" name="reset">Clear</button>
		</form>
	</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
