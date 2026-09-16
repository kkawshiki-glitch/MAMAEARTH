<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Orders</title>

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
    font-size:42px;
}

/* TABLE */

.table-container{
    background:white;
    padding:25px;
    border-radius:18px;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#ff4f81;
    color:white;
    padding:15px;
}

table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
}

/* BACK BUTTON */

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

</style>

</head>

<body>

<h1 class="title">

    All Orders

</h1>

<div class="table-container">

<table>

<tr>

<th>Order ID</th>

<th>Transaction ID</th>

<th>Name</th>

<th>Email</th>

<th>Product</th>

<th>Price</th>

<th>Payment</th>

<th>Address</th>

<th>Details</th>

<th>Date</th>

</tr>

<%
try{

    // DRIVER

    Class.forName(
    "com.mysql.cj.jdbc.Driver");

    // CONNECTION

    Connection con =
    DriverManager.getConnection(

    "jdbc:mysql://localhost:3306/beautycare",
    "root",
    "password"

    );

    // QUERY

    Statement st =
    con.createStatement();

    ResultSet rs =
    st.executeQuery(

    "select * from orders"

    );

    while(rs.next()){

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

<%= rs.getString("useremail") %>

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

    con.close();

}

catch(Exception e){

    out.println(e);

}
%>

</table>

</div>

<br>

<a href="Product.jsp"
class="back-btn">

    Back To Dashboard

</a>

</body>
</html>