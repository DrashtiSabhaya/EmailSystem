import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("email");
		String password=request.getParameter("password");
		boolean status=false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mailsystem","root","");
			System.out.println("Success");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from user where email='"+uname+"' and password='"+password+"'");
			status=rs.next();
			System.out.println(status);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			System.out.println("Exception in GetCon");
		}

		if(status==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("username",uname);
			out.print("Welcome   " + uname);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else
		{
			String Error="Please check your EMail and Password";
			request.setAttribute("Error", Error);
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		out.close();
	}
}