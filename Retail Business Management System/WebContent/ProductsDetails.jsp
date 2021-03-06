<!-- products details page -->
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
<title>Products Details|Gheun Tak</title>
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
  	<br>
 	<center><h1><font size="23" color="#268f9b">PRODUCTS DETAILS</font></h1></center>
 	<br>
	<table id="customers" >
	<thead>
            <tr>
                <th>PID</th>
                <th>NAME</th>
                <th>QOH</th>
                <th>QOH_TH</th>
                <th>ORIG_PRICE</th>
                <th>DISNT_CATEGORY</th>
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
       		CallableStatement c1 = conn.prepareCall("begin ? := get_details.getproducts(); end;");
	       	 
            c1.registerOutParameter(1, OracleTypes.CURSOR);
          //exection
            c1.execute();
            ResultSet rs = (ResultSet)c1.getObject(1);
               
               while(rs.next()){
            %>
            <tr>
                <%
              		//variables
                    String PID = rs.getString(1);
                    String NAME = rs.getString(2);
                    String QOH = rs.getString(3);
                    String QOH_TH = rs.getString(4);
                    String ORIG_PRICE = rs.getString(5);
                    String DISNT_CATEGORY = rs.getString(6);
                %>
                <!-- table entries -->
                <td><%=PID %></td>
               <td><%=NAME %></td>
               <td><%=QOH%></td>
               <td><%=QOH_TH %></td>
               <td><%=ORIG_PRICE %></td>
               <td><%=DISNT_CATEGORY %></td>
            </tr>               

            <%      
                }
             //close connection and statement
               c1.close();
               conn.close();
            %>

        </tbody>
    </table>
  </div>
</div>


</body>
</html>
