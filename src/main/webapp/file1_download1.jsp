<%@ page import="java.sql.*, javax.sql.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%@ page import="java.sql.*,java.io.*"  %>
<%@ page import="java.text.ParseException.*"%>
<%@page import="java.sql.*,java.text.SimpleDateFormat,java.util.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>







	
	<%
	String fid=request.getQueryString();
	String fid1=(String)session.getAttribute("fid");

	
	String fname=null;
	
	
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("select fname from fileupload where fid ='"+fid1+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{

fname=rs.getString("fname");


session.setAttribute("fname",fname);



}

}
catch(Exception e)
{
out.println(e.getMessage());
}
	
	/*
	String fname=null;
	try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("select fname from fileupload where fid ='"+fid+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{

fname=rs.getString("fname");


session.setAttribute("fname",fname);



}

}
catch(Exception e)
{
out.println(e.getMessage());
}


	try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("select au from fileupload where fname ='"+fname+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{

fname=rs.getString("fname");


session.setAttribute("fname",fname);



}

}
catch(Exception e)
{
out.println(e.getMessage());
}






	String auser1=null;
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("select auser from alert where fname ='"+fname+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{

auser1=rs.getString("auser");

  int i = Integer.parseInt( auser1 );
  int r=i+1;
    String inc = Integer.toString(r);

session.setAttribute("inc",inc);


}

}
catch(Exception e)
{
out.println(e.getMessage());
}
	
	
	try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("update alert set auser='"+inc+"' where fname='"+fname+"' ");
ps.executeUpdate();


}
catch(Exception e)
{
out.println(e.getMessage());
}
	*/
	Blob file= null;
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
	 sql = "select file from fileupload where fid ='"+fid1+"'";
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
		file = rs.getBlob(1);
		
		session.setAttribute("resumeBlob",file);
	}
	catch(Exception e)
	{
	out.println("Exception :"+e);
	}
	finally
	{
		if(con != null)
			con.close();
		if(ps != null)
			ps.close();
		if(rs != null)
			rs.close();
			 

	}
	response.sendRedirect("count.jsp");
	%>

</body>
</html>
