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






	
	
String fid=(String)session.getAttribute("fid");
	
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

*/
String au=null;
try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps=con.prepareStatement("select au from fileupload where fid ='"+fid+"' ");
ResultSet rs=ps.executeQuery();
if(rs.next())
{

au=rs.getString("au");
int i = Integer.parseInt( au );
  int r=i+1;
    String inc = Integer.toString(r);
		
	try
{
Class.forName("com.mysql.jdbc.Driver");	
Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/foxcomputing","root","admin");
PreparedStatement ps1=con.prepareStatement("update fileupload set au='"+inc+"' where fid='"+fid+"' ");
ps1.executeUpdate();


}
catch(Exception e)
{
out.println(e.getMessage());
}



}

}
catch(Exception e)
{
out.println(e.getMessage());
}
response.sendRedirect("file1_download2.jsp");
%>



</body>
</html>