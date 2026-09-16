<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#ffe4ec;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    width:500px;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.2);
}

.container h2{
    text-align:center;
    color:#d63384;
    margin-bottom:25px;
    font-size:32px;
}

.row{
    display:flex;
    gap:15px;
}

.input-box{
    width:100%;
    margin-bottom:18px;
}

.input-box label{
    display:block;
    margin-bottom:5px;
    font-weight:bold;
    color:#555;
}

.input-box input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:14px;
}

.input-box input:focus{
    border-color:#d63384;
    outline:none;
}

.gender{
    margin-bottom:20px;
}

.gender label{
    font-weight:bold;
    color:#555;
}

.gender input{
    margin-left:10px;
}

/* BUTTONS */

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
    font-weight:bold;
}

.btn:hover{
    background:#c2185b;
}

/* ADMIN BUTTON */

.admin-btn{
    display:block;
    width:100%;
    padding:12px;
    background:#222;
    color:white;
    text-align:center;
    text-decoration:none;
    border-radius:25px;
    font-size:16px;
    font-weight:bold;
    margin-top:15px;
    transition:0.3s;
}

.admin-btn:hover{
    background:#000;
}

/* BOTTOM TEXT */

.bottom-text{
    text-align:center;
    margin-top:20px;
    color:#555;
}

.bottom-text a{
    text-decoration:none;
    color:#d63384;
    font-weight:bold;
}

.bottom-text a:hover{
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

    <h2>Create Your Account</h2>

    <!-- FORM -->

    <form action="RegistrationServlet" method="post">

        <!-- FIRST ROW -->

        <div class="row">

            <div class="input-box">

                <label>First Name</label>

                <input type="text"
                name="fname"
                placeholder="Enter First Name"
                required>

            </div>

            <div class="input-box">

                <label>Last Name</label>

                <input type="text"
                name="lname"
                placeholder="Enter Last Name"
                required>

            </div>

        </div>

        <!-- SECOND ROW -->

        <div class="row">

            <div class="input-box">

                <label>Email Address</label>

                <input type="email"
                name="email"
                placeholder="Enter Email"
                required>

            </div>

            <div class="input-box">

                <label>Phone Number</label>

                <input type="text"
                name="phone"
                placeholder="Enter Phone Number"
                required>

            </div>

        </div>

        <!-- PASSWORD -->

        <div class="input-box">

            <label>Password</label>

            <input type="password"
            name="password"
            placeholder="Enter Password"
            required>

        </div>

        <!-- GENDER -->

        <div class="gender">

            <label>Gender</label>

            <br><br>

            <input type="radio"
            name="gender"
            value="Male">

            Male

            <input type="radio"
            name="gender"
            value="Female">

            Female

        </div>

        <!-- REGISTER BUTTON -->

        <input type="submit"
        value="Register Now"
        class="btn">

    </form>

    <!-- ADMIN LOGIN BUTTON -->

    <a href="NewAdminlogin.jsp"
    class="admin-btn">

        Admin Login

    </a>

    <!-- LOGIN LINK -->

    <div class="bottom-text">

        Already have an account?

        <a href="Login.jsp">

            Sign In

        </a>

    </div>

</div>

</body>
</html>