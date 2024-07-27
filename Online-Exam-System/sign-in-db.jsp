<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, javax.servlet.http.HttpSession.*
 "
%>
<%
	String email=request.getParameter("email"); 
	String password=request.getParameter("password"); 
	
   	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/loginsystem","root",""); 
	Statement statement=connection.createStatement();
   
	ResultSet rs=statement.executeQuery("select * from student where email='"+email+"' and password='"+password+"'"); 
	try
		{
			rs.next();
		    if(rs.getString("password").equals(password)&&rs.getString("email").equals(email)) 
		    	{ 
		    	  //HttpSession session = request.getSession();
		    	session.setAttribute("email", email);
		    	
		        	 %>
					 <script>
		           		alert("Login Succesfull");
		           		
		           		window.location.replace('index.jsp');
		             </script>
		             	 <a href="logout.jsp">Log Out</a><br><br>
					 <%
					 //out.println("welcome	"+email);
				
				} 
			else
				{
					 %>
						 <script>
			           		alert("Login Failed,Invalid password or username");
			           		window.location.replace('sign-in.jsp');
			             </script>
					 <%
			    }
		}
	catch (Exception e) 
		{
			e.printStackTrace();
		}
%>