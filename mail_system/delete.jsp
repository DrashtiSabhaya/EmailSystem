<%@ page language="java" import="java.util.*"%>
<%@ page import="java.sql.*" %>

<%
	String n=request.getParameter("val");
	if(n.length()>0)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mailsystem","root","");			
			PreparedStatement ps=con.prepareStatement("delete  from inbox where id = '"+n+"' ");
			out.print("<br>");
			int s=ps.executeUpdate();
			out.print("Mail has been successfully deleted");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>
<jsp:forward page="inbox.jsp"></jsp:forward>