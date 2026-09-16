<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right,#fbc2eb,#fcd5ce);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:380px;
    background:white;
    padding:40px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.2);
}

.container h2{
    text-align:center;
    color:#d63384;
    margin-bottom:30px;
}

.input-box{
    margin-bottom:20px;
}

.input-box label{
    display:block;
    margin-bottom:6px;
    font-weight:bold;
    color:#555;
}

.input-box input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

.input-box input:focus{
    border-color:#d63384;
    outline:none;
}

.btn{
    width:100%;
    padding:12px;
    background:#d63384;
    color:white;
    border:none;
    border-radius:25px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#c2185b;
}

</style>

</head>
<body>

<div class="container">

    <h2> Admin Login</h2>

    <form action="Adminlogin" method="post">

        <div class="input-box">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="input-box">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" value="Login" class="btn">

    </form>

</div>

</body>
</html>