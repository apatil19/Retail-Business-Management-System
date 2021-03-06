<!-- Log details page -->
<!--  importing packages -->
<%@page import="Operations.Customer"%>
<%@page import="java.sql.CallableStatement" %>
<%@page import="java.sql.*" %>
<%@page import="oracle.jdbc.internal.OracleTypes" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Linking styles sheets -->
<link href="PageDivision.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Log Details|Gheun Tak</title>

<!-- formatting for information bar -->
<style>
ul {
    list-style-type: none;
    margin-left:10;
    padding: 0;
    overflow: hidden;
}

li {
    float: left;
}

li a {
    display: block;
    color: black;
    text-align: center;
    padding: 10px;
    text-decoration: none;
}
</style>
</head>
<body>

<!-- using div to divide page -->
<div class="page">
<!-- information bar -->
	<div class="info">
		<ul>
            <li><a href="#"><i class="material-icons" style="font-size:12px">&#xe567;</i>Binghamton, NY</a>
            </li>
            <li><a href="#">&#9990;+1(607)245-4353</a>
            </li>
            <li><a href="#">&#x2709;info@gheuntak.in</a>
            </li>
        </ul>
	</div>
	<!-- to insert logo -->	
  <div class="logo">
	<img alt="Logo" src="gheun-tak.png" width=100% height=100%>
  </div>
  
  <div class="left">
  </div>
  <div class="right">
  </div>
  
  <div class="middle">
  
 	<p align="center"> 
 	<br>
 	<center><h1><font size="23" color="#268f9b">LOG DETAILS</font></h1></center>
 	<br>
	<table id="customers" >
        <thead>
            <tr>
                <th>LOG#</th>
                <th>USER_NAME</th>
                <th>OPERATION</th>
                <th>OPTIME</th>
                <th>TABLE_NAME</th>
                <th>T_PKEY</th>
            </tr>
        </thead>
        <tbody>
			<!-- java code to display details -->
            <%
          //connection to database
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@castor.cc.binghamton.edu:1521:acad111";
            Connection conn= DriverManager.getConnection(url, "abora1","akshay97699");
            //Prepare to call stored procedure
            CallableStatement c6 = conn.prepareCall("begin ? := get_details.getlogs(); end;");
            c6.registerOutParameter(1, OracleTypes.CURSOR);
          //exection 
            c6.execute();
            ResultSet rs = (ResultSet)c6.getObject(1);
           
            while (rs.next()) {
             %>
            <tr>
                <%	//variables
                    String LOG = rs.getString(1);
                    String USER_NAME = rs.getString(2);
                    String OPERATION = rs.getString(3);
                    String OPTIME = rs.getString(4);
                    String TABLE_NAME = rs.getString(5);
                    String T_PKEY = rs.getString(6);
                %>
                <!-- table entries -->
                <td><%=LOG %></td>
               <td><%=USER_NAME %></td>
               <td><%=OPERATION%></td>
               <td><%=OPTIME %></td>
               <td><%=TABLE_NAME %></td>
               <td><%=T_PKEY %></td>
            </tr>               

            <%      
                }
            //close connection and statement
            c6.close();
            conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
