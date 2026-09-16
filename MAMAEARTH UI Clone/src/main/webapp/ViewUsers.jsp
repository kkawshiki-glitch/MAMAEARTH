<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Users</title>

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

/* TITLE */

.title{
    text-align:center;
    color:#c2185b;
    margin-bottom:40px;
    font-size:42px;
    font-weight:bold;
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
    font-size:18px;
}

table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
    color:#444;
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

.back-btn:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<h1 class="title">

    View Users

</h1>

<div class="table-container">

<table>

<tr>

    <th>ID</th>

    <th>First Name</th>

    <th>Last Name</th>

    <th>Email</th>

    <th>Phone</th>

    <th>Gender</th>

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

    "select * from users"

    );

    // LOOP USERS

    while(rs.next()){

%>

<tr>

    <td>

        <%= rs.getInt("id") %>

    </td>

    <td>

        <%= rs.getString("fname") %>

    </td>

    <td>

        <%= rs.getString("lname") %>

    </td>

    <td>

        <%= rs.getString("email") %>

    </td>

    <td>

        <%= rs.getString("phone") %>

    </td>

    <td>

        <%= rs.getString("gender") %>

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

    &#8592; Back To Dashboard

</a>

</body>
</html>