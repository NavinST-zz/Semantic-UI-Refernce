<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.ibm.xtq.ast.nodes.ForEach"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String locale = request.getLocale().getDisplayLanguage();
	
	response.setContentType("text/html;charset=UTF-8");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "";
	String username = "";
	String password = "";
	Connection conn = null;
	oracle.jdbc.OraclePreparedStatement pStmt= null ;  
	try{
	conn = DriverManager.getConnection(url, username, password);

 	pStmt =(oracle.jdbc.OraclePreparedStatement) conn.prepareStatement("select LANG,MESSAGE,NLSMESSAGE from  nlstest");
 	ResultSet rs = pStmt.executeQuery();
 	while (rs.next()){
 	out.print(rs.getString("NLSMESSAGE")+"<br/>");
 	}
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
