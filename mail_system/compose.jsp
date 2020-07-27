<jsp:include page="header.jsp"></jsp:include>

<% 
	if(session.getAttribute("username")!=null)
	{
		String username=(String)session.getAttribute("username");		
		out.print("<font style='color:navy'>Welcome "+username+"</font>");
	}
	else
	{
		request.setAttribute("Error1","Plz Do login First");
	%>
	<jsp:forward page="login.jsp"></jsp:forward>
<%}%>
<% 
	if(request.getAttribute("compose")!=null)
	{
		String compose= (String)request.getAttribute("compose");
		out.print("<font style='color:navy'>"+compose+"</font>");
	}
	if(request.getAttribute("composeerr")!=null)
	{
		String composeerr= (String)request.getAttribute("composeerr");
		out.print("<font style='color:navy'>"+composeerr+"</font>");
	}
%>

<section id="login">
	<div class="container">
		<h1><span class="highlight">COMPOSE</span> MAIL</h1>
			<form action="ComposeServlet" method="POST">
			<label>To:</label><br>
			<input type="email" name="reciever_id" placeholder="Enter Name" required="" minlength="4"><br><br>
			<label>Message:</label><br>
			<textarea name="message" cols="43" rows="10" style="padding: 17px;" placeholder="Message..." required=""></textarea><br><br>
			<button type="submit" class="button1" name="submit">Submit</button>
			<button type="reset" class="button1" name="reset">Clear</button>
		</form>
	</div>
</section>


<jsp:include page="footer.jsp"></jsp:include>