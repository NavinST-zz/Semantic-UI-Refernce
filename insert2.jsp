<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,oracle.jdbc.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String locale = request.getLocale().getDisplayLanguage();
	String text = (String) request.getParameter("text");
	response.setContentType("text/html;charset=UTF-8");
	out.println("Language is "+ locale + "  Text is :: "+ text);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "";
	String username = "";
	String password = "";
	Connection conn = null;
	OraclePreparedStatement pStmt= null ;  
	try{
	 
	conn = DriverManager.getConnection(url, username, password);
	
 	pStmt = (OraclePreparedStatement)conn.prepareStatement("insert into nlstest(LANG,MESSAGE,NLSMESSAGE) values( 'Hindi',	'Testing', ? )");
 	
 	pStmt.setString(1,text );
 	
 	
 	int cnt = pStmt.executeUpdate();
 	out.println("Executed " +cnt+ "rows <br/>");
 	out.println("<a href=display.jsp > Click to show the Data </a>");
 	
 	}
 	catch(Exception e) {
 	out.println("Exception caught" + e);
 	e.printStackTrace();
 	}
 	finally 
{

pStmt.close();
conn.close();

}
 	
	
 %>
</body>
</html>
