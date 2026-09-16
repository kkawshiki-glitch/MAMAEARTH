<%@ page import="java.sql.*" %>

<%
String email =
(String)session.getAttribute("email");

if(email == null){

    response.sendRedirect("Login.jsp");
    return;

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#fff5f8;
    padding:40px;
}

.title{
    text-align:center;
    color:#c2185b;
    margin-bottom:40px;
    font-size:50px;
}

.table-container{
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#ff4f81;
    color:white;
    padding:18px;
}

table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
}

.no-orders{
    text-align:center;
    color:gray;
    font-size:20px;
    padding:30px;
}

.back-btn{
    display:inline-block;
    margin-top:30px;
    text-decoration:none;
    background:#ff4f81;
    color:white;
    padding:12px 25px;
    border-radius:30px;
    font-weight:bold;
}

.back-btn:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<h1 class="title">

    My Orders

</h1>

<div class="table-container">

<table>

<tr>

<th>Order ID</th>

<th>Transaction ID</th>

<th>Name</th>

<th>Product</th>

<th>Price</th>

<th>Payment</th>

<th>Address</th>

<th>Details</th>

<th>Date</th>

</tr>

<%

boolean hasOrders = false;

try{

    Class.forName(
    "com.mysql.cj.jdbc.Driver");

    Connection con =
    DriverManager.getConnection(

    "jdbc:mysql://localhost:3306/beautycare",
    "root",
    "password"

    );

    PreparedStatement ps =
    con.prepareStatement(

    "select * from orders where useremail=? order by orderid desc"

    );

    ps.setString(1,email);

    ResultSet rs =
    ps.executeQuery();

    while(rs.next()){

        hasOrders = true;

%>

<tr>

<td>

<%= rs.getInt("orderid") %>

</td>

<td>

<%= rs.getString("transactionid") %>

</td>

<td>

<%= rs.getString("name") %>

</td>

<td>

<%= rs.getString("productname") %>

</td>

<td>

<%= rs.getInt("price") %>

</td>

<td>

<%= rs.getString("paymentmethod") %>

</td>

<td>

<%= rs.getString("address") %>

</td>

<td>

<%= rs.getString("details") %>

</td>

<td>

<%= rs.getTimestamp("orderdate") %>

</td>

</tr>

<%
    }

    if(!hasOrders){
%>

<tr>

<td colspan="9"
class="no-orders">

    No Orders Found

</td>

</tr>

<%
    }

    rs.close();
    ps.close();
    con.close();

}
catch(Exception e){

    out.println(
    "<tr><td colspan='9'>"
    + e.getMessage()
    + "</td></tr>");

}
%>

</table>

</div>

<br>

<a href="Homepage.jsp"
class="back-btn">

    Back To Home

</a>

</body>
</html>