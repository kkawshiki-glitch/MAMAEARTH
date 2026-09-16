<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:linear-gradient(to right, #ff9a9e, #fad0c4);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.login-box{
    background:white;
    padding:40px;
    width:380px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.2);
}

.login-box h2{
    text-align:center;
    color:#ff4081;
    margin-bottom:25px;
    font-size:32px;
}

label{
    font-weight:bold;
    color:#555;
}

input[type="email"],
input[type="password"]{

    width:100%;
    padding:12px;
    margin-top:6px;
    margin-bottom:18px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;

}

input[type="email"]:focus,
input[type="password"]:focus{

    border-color:#ff4081;
    outline:none;

}

input[type="submit"]{

    width:100%;
    padding:12px;
    background:#ff4081;
    color:white;
    border:none;
    border-radius:25px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
    font-weight:bold;

}

input[type="submit"]:hover{

    background:#e91e63;

}

.bottom-text{

    text-align:center;
    margin-top:20px;
    color:#555;

}

.bottom-text a{

    text-decoration:none;
    color:#ff4081;
    font-weight:bold;

}

.bottom-text a:hover{

    text-decoration:underline;

}

</style>

</head>

<body>

<div class="login-box">

    <h2>Login Form</h2>

    <!-- FORM -->

    <form action="Login" method="post">

        <!-- EMAIL -->

        <label for="email">

            Enter Email

        </label>

        <input type="email"
        id="email"
        name="email"
        placeholder="Enter Your Email"
        required>

        <!-- PASSWORD -->

        <label for="password">

            Enter Password

        </label>

        <input type="password"
        id="password"
        name="password"
        placeholder="Enter Your Password"
        required>

        <!-- BUTTON -->

        <input type="submit"
        value="Login">

    </form>

    <!-- REGISTER LINK -->

    <div class="bottom-text">

        Don't have an account?

        <a href="Registration.jsp">

            Sign Up

        </a>

    </div>

</div>

</body>
</html>