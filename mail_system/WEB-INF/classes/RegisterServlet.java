import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String num=request.getParameter("mbno");
		long mname=Long.parseLong(num);
		String country=request.getParameter("country");
		int status=0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mailsystem","root","");

			String qry="Insert into user values('"+email+"','"+password+"','"+name+"','"+gender+"',"+mname+",'"+country+"')";
			System.out.println(qry);
			Statement stmt=con.createStatement();
			status=stmt.executeUpdate(qry);

			System.out.println("Status = "+status);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			System.out.println("Exception in GetCon");
		}
		if(status>0)
		{
			String register= "You are Successfully registered";
			request.setAttribute("register",register);
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		else
		{
			String registererror="Sorry,Registration failed. please try later";
			request.setAttribute("registererror",registererror);
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
			rd.include(request, response);
		}
		out.close();
	}

}
