<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
Double total =
(Double) session.getAttribute("cartTotal");

if(total == null){

    total = 0.0;

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Page</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#fff5f8;
    padding:40px;
}

/* CONTAINER */

.container{
    width:80%;
    margin:auto;
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:30px;
}

/* LEFT SIDE */

.checkout-box{
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
}

.checkout-box h2{
    color:#d63384;
    margin-bottom:25px;
}

/* INPUTS */

.input-box{
    margin-bottom:20px;
}

.input-box label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#555;
}

.input-box input,
.input-box textarea{

    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:10px;
    font-size:15px;

}

textarea{
    resize:none;
    height:100px;
}

/* BUTTON */

.place-btn{

    width:100%;
    padding:15px;
    background:#ff4f81;
    color:white;
    border:none;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;

}

.place-btn:hover{

    background:#c2185b;

}

/* RIGHT SIDE */

.summary-box{
    background:white;
    padding:30px;
    border-radius:18px;
    height:fit-content;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
}

.summary-box h2{
    color:#d63384;
    margin-bottom:20px;
}

.summary-item{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    color:#555;
    font-size:18px;
}

.total{
    font-size:28px;
    font-weight:bold;
    color:#d63384;
    margin-top:20px;
    border-top:1px solid #eee;
    padding-top:20px;
}

/* TITLE */

.page-title{
    text-align:center;
    margin-bottom:40px;
    color:#d63384;
    font-size:42px;
}

</style>

</head>

<body>

<h1 class="page-title">

    Secure Checkout

</h1>

<div class="container">

<!-- LEFT SIDE -->

<div class="checkout-box">

    <h2>Shipping Address</h2>

    <form action="Payment.jsp" method="post">

        <!-- FULL NAME -->

        <div class="input-box">

            <label>Full Name</label>

            <input type="text"
            name="fullname"
            placeholder="Enter Full Name"
            required>

        </div>

        <!-- PHONE -->

        <div class="input-box">

            <label>Phone Number</label>

            <input type="text"
            name="phone"
            placeholder="Enter Phone Number"
            required>

        </div>

        <!-- ADDRESS -->

        <div class="input-box">

            <label>Full Address</label>

            <textarea
            name="address"
            placeholder="Enter Full Address"
            required></textarea>

        </div>

        <!-- CITY -->

        <div class="input-box">

            <label>City</label>

            <input type="text"
            name="city"
            placeholder="Enter City"
            required>

        </div>

        <!-- STATE -->

        <div class="input-box">

            <label>State</label>

            <input type="text"
            name="state"
            placeholder="Enter State"
            required>

        </div>

        <!-- PINCODE -->

        <div class="input-box">

            <label>Pincode</label>

            <input type="text"
            name="pincode"
            placeholder="Enter Pincode"
            required>

        </div>

        <!-- BUTTON -->

        <input type="submit"
        value="Proceed To Payment"
        class="place-btn">

    </form>

</div>

<!-- RIGHT SIDE -->

<div class="summary-box">

    <h2>Order Summary</h2>

    <div class="summary-item">

        <span>Cart Total</span>

        <span><%= total %></span>

    </div>

    <div class="summary-item">

        <span>Shipping</span>

        <span>Free</span>

    </div>

    <div class="summary-item total">

        <span>Total</span>

        <span><%= total %></span>

    </div>

</div>

</div>

</body>
</html>