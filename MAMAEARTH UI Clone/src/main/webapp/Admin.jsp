<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right,#fbc2eb,#fad0c4);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:450px;
    background:white;
    padding:50px;
    border-radius:20px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.2);
    text-align:center;
}

.container h1{
    color:#d63384;
    margin-bottom:15px;
}

.container p{
    color:#555;
    margin-bottom:35px;
}

.btn{
    display:block;
    width:80%;
    margin:18px auto;
    padding:14px;
    text-decoration:none;
    background:#d63384;
    color:white;
    border-radius:30px;
    font-size:18px;
    transition:0.3s;
}

.btn:hover{
    background:#c2185b;
}

</style>

</head>
<body>

<div class="container">

    <h1> Admin Panel</h1>

    <p>Manage your Beauty Product Website</p>

    <a href="Adminlogin.jsp" class="btn">
        Admin Login
    </a>

    <a href="NewAdminlogin.jsp" class="btn">
        Create New Admin
    </a>

</div>

</body>
</html>