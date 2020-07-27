import java.sql.*;
public class RegisterUser
{
	static int status=0;
	public static int register(String email,String password,String name,String gender,Double mname, String country)
	{
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		try
		{
			ps = con.prepareStatement("Insert into user values(?,?,?,?,?,?)");
			ps.setString(1,email);
			ps.setString(2,password);
			ps.setString(3,name);
			ps.setString(4,gender);
			ps.setDouble(5,mname);
			ps.setString(6,country);
			status=ps.executeUpdate();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	return status;
	}
}
