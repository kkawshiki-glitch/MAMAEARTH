<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    List<String> cart =
    (List<String>) session.getAttribute("cart");

    if(cart == null){

        cart = new ArrayList<String>();

    }

    double total = 0;

    DecimalFormat df =
    new DecimalFormat("0.00");

    int cartCount = cart.size();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:#fff5f8;
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 60px;
    background:white;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);
}

.logo{
    font-size:32px;
    font-weight:bold;
    color:#ff4f81;
}

.nav-btn{
    background:#ff4f81;
    color:white;
    padding:11px 24px;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
}

/* CONTAINER */

.container{
    width:85%;
    margin:40px auto;
}

h1{
    text-align:center;
    color:#ff4f81;
    margin-bottom:30px;
    font-size:40px;
}

.cart-table{
    width:100%;
    border-collapse:collapse;
    background:white;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
    border-radius:15px;
    overflow:hidden;
}

.cart-table th{
    background:#ff4f81;
    color:white;
    padding:15px;
    font-size:18px;
}

.cart-table td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
    font-size:17px;
}

.remove-btn{
    background:#ff4f81;
    color:white;
    padding:8px 15px;
    border-radius:20px;
    text-decoration:none;
    font-weight:bold;
}

.total-box{
    margin-top:30px;
    text-align:right;
    font-size:28px;
    color:#333;
    font-weight:bold;
}

.checkout-btn{
    display:inline-block;
    margin-top:20px;
    background:#ff4f81;
    color:white;
    padding:12px 25px;
    border-radius:30px;
    text-decoration:none;
    font-size:18px;
    font-weight:bold;
}

.empty{
    text-align:center;
    color:gray;
    margin-top:40px;
    font-size:26px;
}

.footer{
    background:#ff4f81;
    color:white;
    text-align:center;
    padding:18px;
    margin-top:60px;
    font-size:16px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">

        Lumielle

    </div>

    <a href="Homepage.jsp" class="nav-btn">

        Continue Shopping

    </a>

</div>

<!-- CART -->

<div class="container">

<h1>

Your Shopping Cart (<%= cartCount %>)

</h1>

<%
if(cart.size() == 0){
%>

<div class="empty">

    Your Cart is Empty

</div>

<%
}
else{
%>

<table class="cart-table">

<tr>

    <th>Product</th>

    <th>Price</th>

    <th>Action</th>

</tr>

<%
for(String item : cart){

    String[] data = item.split(",");

    String name = data[0];

    double price =
    Double.parseDouble(data[1]);

    total += price;
%>

<tr>

    <td><%= name %></td>

    <td>

        <%= df.format(price) %>

    </td>

    <td>

        <a href="RemoveCartServlet?item=<%= item %>"
        class="remove-btn">

            Remove

        </a>

    </td>

</tr>

<%
}

/* STORE TOTAL IN SESSION */

session.setAttribute(
"cartTotal", total);

%>

</table>

<div class="total-box">

    Total Price :
    <%= df.format(total) %>

    <br>

    <!-- CHECKOUT LINK -->

    <a href="Checkout.jsp"
    class="checkout-btn">

        Proceed To Checkout

    </a>

</div>

<%
}
%>

</div>

<!-- FOOTER -->

<div class="footer">

    © 2026 Lumielle Beauty | Designed With 💖

</div>

</body>
</html>