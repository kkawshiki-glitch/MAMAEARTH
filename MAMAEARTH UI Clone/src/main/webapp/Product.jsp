<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- FONT AWESOME -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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

/* SECTION */

.section{
    margin-bottom:50px;
}

.section h2{
    color:#c2185b;
    margin-bottom:20px;
    border-bottom:2px solid #ffd6e5;
    padding-bottom:10px;
}

/* CARD CONTAINER */

.card-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

/* CARD */

.card{
    background:white;
    padding:35px;
    border-radius:18px;
    text-align:center;
    text-decoration:none;
    color:#444;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
    transition:0.3s;
    border:1px solid #ffe1ec;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 8px 18px rgba(0,0,0,0.15);
}

/* ICON */

.card i{
    font-size:42px;
    margin-bottom:20px;
    color:#ff4f81;
}

/* TEXT */

.card h3{
    font-size:22px;
    margin-bottom:10px;
    color:#c2185b;
}

.card p{
    font-size:14px;
    color:gray;
}

/* LOGOUT */

.logout{
    position:absolute;
    top:30px;
    right:40px;
}

.logout a{
    text-decoration:none;
    background:#ff4f81;
    color:white;
    padding:10px 22px;
    border-radius:30px;
    font-weight:bold;
}

.logout a:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<!-- LOGOUT -->

<div class="logout">

    <a href="Login.jsp">

        Logout

    </a>

</div>

<!-- TITLE -->

<h1 class="title">

    Admin Dashboard

</h1>

<!-- USER MANAGEMENT -->

<div class="section">

    <h2>User Management</h2>

    <div class="card-container">

        <!-- ADD ADMIN -->

        <a href="NewAdminlogin.jsp"
        class="card">

            <i class="fa-solid fa-user-plus"></i>

            <h3>Add New Admin</h3>

            <p>Create a new admin account</p>

        </a>

        <!-- ADD USER -->

        <a href="Registration.jsp"
        class="card">

            <i class="fa-solid fa-user"></i>

            <h3>Add New User</h3>

            <p>Register a new customer</p>

        </a>

        <!-- VIEW USERS -->

        <a href="ViewUsers.jsp"
        class="card">

            <i class="fa-solid fa-users"></i>

            <h3>View Users</h3>

            <p>See all registered users</p>

        </a>

        <!-- DELETE & EDIT USERS -->

        <a href="ManageUsers.jsp"
        class="card">

            <i class="fa-solid fa-pen"></i>

            <h3>Delete & Edit</h3>

            <p>Edit or remove users</p>

        </a>

    </div>

</div>

<!-- PRODUCT MANAGEMENT -->

<div class="section">

    <h2>Product Management</h2>

    <div class="card-container">

        <!-- ADD PRODUCT -->

        <a href="AddProduct.jsp"
        class="card">

            <i class="fa-solid fa-bag-shopping"></i>

            <h3>Add Product</h3>

            <p>Add new beauty products</p>

        </a>

        <!-- EDIT PRODUCT -->

        <a href="EditProduct.jsp"
        class="card">

            <i class="fa-solid fa-pen-to-square"></i>

            <h3>Edit Product</h3>

            <p>Update product details</p>

        </a>

        <!-- DELETE PRODUCT -->

        <a href="EditProduct.jsp"
        class="card">

            <i class="fa-solid fa-trash"></i>

            <h3>Delete Product</h3>

            <p>Remove products from store</p>

        </a>

        <!-- VIEW PRODUCTS -->

        <a href="ViewProducts.jsp"
        class="card">

            <i class="fa-solid fa-eye"></i>

            <h3>View Products</h3>

            <p>See all available products</p>

        </a>

        <!-- VIEW ORDERS -->

        <a href="AllOrders.jsp"
        class="card">

            <i class="fa-solid fa-box"></i>

            <h3>View Orders</h3>

            <p>See all customer orders</p>

        </a>

    </div>

</div>

</body>
</html>