<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: Arial, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: linear-gradient(135deg, #ff9a9e, #fecfef, #fcb69f);
}

.container{
    width:420px;
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0 8px 25px rgba(255,105,180,0.3);
    text-align:center;
}

.container h1{
    margin-bottom:12px;
    color:#d63384;
    font-size:32px;
}

.container p{
    color:#777;
    margin-bottom:35px;
    font-size:16px;
}

.btn{
    display:block;
    width:100%;
    padding:15px;
    margin:18px 0;
    text-decoration:none;
    font-size:18px;
    font-weight:bold;
    border-radius:12px;
    transition:0.3s;
    color:white;
    letter-spacing:0.5px;
}

/* Pink Product Button */

.product-btn{
    background:linear-gradient(to right,#ff4b91,#ff85a2);
}

.product-btn:hover{
    background:linear-gradient(to right,#e91e63,#ff5c8a);
    transform:scale(1.04);
}

/* Purple Pink User Button */

.user-btn{
    background:linear-gradient(to right,#d63384,#c850c0);
}

.user-btn:hover{
    background:linear-gradient(to right,#b5179e,#9d4edd);
    transform:scale(1.04);
}

.footer{
    margin-top:25px;
    font-size:15px;
    color:#d63384;
    font-weight:bold;
}

/* Heart Icon Style */

.heart{
    font-size:45px;
    margin-bottom:15px;
}

</style>

</head>

<body>

<div class="container">


    <h1>Admin Dashboard</h1>

    <p>Manage Your Beauty Store with Style</p>

    <a href="Admin.jsp" class="btn product-btn">
         Add Admin
    </a>

    <a href="User.jsp" class="btn user-btn">
         Add User
    </a>

    <div class="footer">
         Welcome Admin 
    </div>

</div>

</body>
</html>