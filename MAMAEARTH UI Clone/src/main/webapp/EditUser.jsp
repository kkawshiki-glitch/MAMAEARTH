<%@ page import="java.sql.*" %>

<%
String id =
request.getParameter("id");

String fname = "";
String lname = "";
String email = "";
String phone = "";
String gender = "";

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

    PreparedStatement ps =
    con.prepareStatement(

    "select * from users where id=?"

    );

    ps.setInt(1,
    Integer.parseInt(id));

    ResultSet rs =
    ps.executeQuery();

    if(rs.next()){

        fname =
        rs.getString("fname");

        lname =
        rs.getString("lname");

        email =
        rs.getString("email");

        phone =
        rs.getString("phone");

        gender =
        rs.getString("gender");

    }

    con.close();

}

catch(Exception e){

    out.println(e);

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#fff5f8;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{
    width:500px;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

.container h2{
    text-align:center;
    color:#c2185b;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:20px;
}

.input-box label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
}

.input-box input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:10px;
}

.btn{
    width:100%;
    padding:14px;
    background:#ff4f81;
    color:white;
    border:none;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
}

.btn:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit User</h2>

<form action="UpdateUserServlet"
method="post">

<!-- HIDDEN ID -->

<input type="hidden"
name="id"
value="<%= id %>">

<!-- FIRST NAME -->

<div class="input-box">

<label>First Name</label>

<input type="text"
name="fname"
value="<%= fname %>"
required>

</div>

<!-- LAST NAME -->

<div class="input-box">

<label>Last Name</label>

<input type="text"
name="lname"
value="<%= lname %>"
required>

</div>

<!-- EMAIL -->

<div class="input-box">

<label>Email</label>

<input type="email"
name="email"
value="<%= email %>"
required>

</div>

<!-- PHONE -->

<div class="input-box">

<label>Phone</label>

<input type="text"
name="phone"
value="<%= phone %>"
required>

</div>

<!-- GENDER -->

<div class="input-box">

<label>Gender</label>

<input type="text"
name="gender"
value="<%= gender %>"
required>

</div>

<!-- BUTTON -->

<input type="submit"
value="Update User"
class="btn">

</form>

</div>

</body>
</html>