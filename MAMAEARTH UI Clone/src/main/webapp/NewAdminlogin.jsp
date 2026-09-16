<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Admin</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#ffe4ec;
}

.container{
    width:420px;
    background:white;
    padding:40px;
    border-radius:18px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

.container h2{
    text-align:center;
    color:#d63384;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:18px;
}

.input-box input{
    width:100%;
    padding:13px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:15px;
    outline:none;
}

.input-box input:focus{
    border-color:#ff4d88;
}

.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    background:#ff4d88;
    color:white;
    font-size:17px;
    cursor:pointer;
    transition:0.3s;
    margin-top:10px;
}

.btn:hover{
    background:#e63973;
}

.bottom-text{
    text-align:center;
    margin-top:20px;
    font-size:14px;
}

.bottom-text a{
    text-decoration:none;
    color:#d63384;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

    <h2> Create Your Account</h2>

    <form action="NewAdminlogin" method="post">

        <div class="input-box">
            <input type="text" name="name" placeholder="Name" required>
        </div>

        <div class="input-box">
            <input type="email" name="email" placeholder="Email" required>
        </div>

        <div class="input-box">
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <input type="submit" value="Register Now" class="btn">

    </form>

    <div class="bottom-text">
        Already have an account?
        <a href="Adminlogin.jsp">Sign In</a>
    </div>

</div>

</body>
</html>