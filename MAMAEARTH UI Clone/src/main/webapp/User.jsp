<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Beauty Store</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right,#ffe4ec,#ffd6e7);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    text-align:center;
    background:white;
    padding:50px;
    width:450px;
    border-radius:20px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.2);
}

.container h1{
    color:#d63384;
    margin-bottom:15px;
}

.container p{
    color:#555;
    margin-bottom:30px;
}

.btn{
    display:block;
    width:80%;
    margin:15px auto;
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

    <h1> Glow Beauty Store</h1>

    <p>Welcome to our Beauty Product Website</p>

    <a href="Registration.jsp" class="btn">Create Account</a>

    <a href="Login.jsp" class="btn">Sign In</a>

</div>

</body>
</html>