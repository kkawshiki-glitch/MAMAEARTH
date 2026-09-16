<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String orderId =
(String) session.getAttribute("orderId");

String fullname =
(String) session.getAttribute("fullname");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

/* BOX */

.box{
    width:500px;
    background:white;
    padding:50px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

/* ICON */

.icon{
    font-size:80px;
    color:#ff4f81;
    margin-bottom:20px;
}

/* TITLE */

h1{
    color:#d63384;
    margin-bottom:20px;
    font-size:36px;
}

/* TEXT */

p{
    color:#555;
    font-size:18px;
    margin-bottom:15px;
    line-height:1.6;
}

/* ORDER ID */

.order-id{
    color:#c2185b;
    font-size:22px;
    font-weight:bold;
    margin-top:10px;
}

/* BUTTONS */

.btn{
    display:inline-block;
    margin-top:25px;
    margin-right:10px;
    background:#ff4f81;
    color:white;
    padding:12px 25px;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}

.btn:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<div class="box">

    <!-- SUCCESS ICON -->

    <div class="icon">

        <i class="fa-solid fa-circle-check"></i>

    </div>

    <!-- TITLE -->

    <h1>

        Order Placed Successfully 🎉

    </h1>

    <!-- USER MESSAGE -->

    <p>

        Thank You
        <strong>

            <%= fullname %>

        </strong>

        for shopping with Lumielle 💖

    </p>

    <!-- ORDER ID -->

    <p class="order-id">

        Transaction ID :
        <%= orderId %>

    </p>

    <!-- EXTRA MESSAGE -->

    <p>

        Your order has been confirmed successfully.

    </p>

    <!-- BUTTONS -->

    <a href="MyOrders.jsp"
    class="btn">

        View My Orders

    </a>

    <a href="Homepage.jsp"
    class="btn">

        Continue Shopping

    </a>

</div>

</body>
</html>