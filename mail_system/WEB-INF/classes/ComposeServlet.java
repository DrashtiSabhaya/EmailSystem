import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Calendar;
import java.sql.*;

public class ComposeServlet extends HttpServlet
{
	static int status=0;
	static int d=1;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);
		String sender=(String)session.getAttribute("username");
		String reciever=request.getParameter("reciever_id");
		String msg=request.getParameter("message");

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mailsystem","root","");
			java.util.Date sqdate=Calendar.getInstance().getTime();
			java.sql.Date date =new java.sql.Date(sqdate.getTime());

			PreparedStatement ps=con.prepareStatement("Insert into inbox values(?,?,?,?,?)");
			ps.setString(3,reciever);
			ps.setString(2,sender);
			ps.setString(4,msg);
			ps.setDate(5,date);
			ps.setInt(1,d);
			status=ps.executeUpdate();
			System.out.println(status);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}

		if(status>0)
		{
			out.print("Message Sucessfully Sent");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else
		{
			out.print("Sorry,Message was not sent");
			RequestDispatcher rd=request.getRequestDispatcher("compose.jsp");
			rd.include(request, response);
		}
	}
}
