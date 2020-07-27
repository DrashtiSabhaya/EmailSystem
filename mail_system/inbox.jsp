<%@page import="java.sql.*" %>

<jsp:include page="header.jsp"></jsp:include>
<script>
	var request;
	function viewAll(name)
	{
		var v=name;
		var url="delete.jsp?val="+v;
		
		if(window.XMLHttpRequest)
		{
			request=new XMLHttpRequest();
		}
		else if(window.ActiveXObject)
		{
			request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		try
		{
			request.onreadystatechange=getAllInfo;
			request.open("GET",url,true);
			request.send();
		}
		catch(e)
		{
			alert("Unable to connect to server");
		}
	}
	function getAllInfo()
	{
		if(request.readyState==4)
		{
			var val=request.responseText;
			document.getElementById('bottom').innerHTML=val;
		}
	}
</script>
<% 
	if(session.getAttribute("username")!=null)
	{
		String username=(String)session.getAttribute("username");		
		out.print("<font style='color:navy'>Welcome "+username+"</font>");
		if(request.getAttribute("delete")!=null)
		{
			String delete=(String)session.getAttribute("username");		
			out.print("<font style='color:navy'>"+delete+"</font>");
		}
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mailsystem","root","");
			PreparedStatement ps=con.prepareStatement("Select * from inbox where reciever=?");
			ps.setString(1,username);
			ResultSet rs=ps.executeQuery();
			out.print("<div id='bottom'></div>");
			out.print("<table border=4 cellspacing='4' cellpadding='5' align='center' width='80%' >");
			out.print("<tr><td>SENDER</td><th>MESSAGE</td><td>DATE OF RECIEVING</td><td>Delete</td></tr>");
			while(rs.next())
			{
				int id=rs.getInt(1);
				System.out.print(id);
				out.print("<tr>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("<td>" + rs.getString(5) + "</td>");
				out.print("<td><a href='delete.jsp?val="+rs.getInt(1)+"'> Delete</a></td>");
				out.print("</tr>");
			}
			out.print("</table>");
			out.print("<table align='right'width='40%'>");
			
			out.print("</table>");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}						
	else
	{
		request.setAttribute("Error1","Plz Do login First");
	%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%
	}
%>
<jsp:include page="footer.jsp"></jsp:include>