<%@ page import="java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>

<%
    List<String> cart =
    (List<String>) session.getAttribute("cart");

    if(cart == null){

        cart = new ArrayList<String>();

    }

    double total = 0;

    StringBuilder products =
    new StringBuilder();

    for(String item : cart){

        String[] data =
        item.split(",");

        products.append(data[0])
        .append(", ");

        total +=
        Double.parseDouble(data[1]);

    }

    DecimalFormat df =
    new DecimalFormat("0.00");

    // GET DETAILS FROM CHECKOUT PAGE

    String fullname =
    request.getParameter("fullname");

    String address =
    request.getParameter("address");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>

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

/* CONTAINER */

.container{
    width:90%;
    margin:auto;
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:40px;
}

/* BOX */

.box{
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 4px 12px rgba(0,0,0,0.1);
}

/* TITLE */

h2{
    color:#d63384;
    margin-bottom:25px;
    font-size:34px;
}

/* PAYMENT METHODS */

.payment-method{
    margin-top:20px;
}

.payment-method label{
    font-weight:bold;
    color:#444;
}

/* CARD BOX */

.card-box{
    margin-top:20px;
}

.card-box input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:10px;
    margin-bottom:15px;
    font-size:15px;
}

/* BUTTON */

.btn{
    width:100%;
    padding:14px;
    background:#ff4f81;
    color:white;
    border:none;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
    margin-top:25px;
}

.btn:hover{
    background:#d63384;
}

/* SUMMARY */

.summary-row{
    margin-bottom:18px;
    font-size:18px;
    color:#444;
}

.summary-row strong{
    color:#c2185b;
}

.products-box{
    background:#fff5f8;
    padding:15px;
    border-radius:12px;
    margin-top:20px;
    line-height:1.8;
    color:#555;
}

.total{
    margin-top:25px;
    font-size:30px;
    font-weight:bold;
    color:#d63384;
}

</style>

<script>

function showPaymentFields(){

    var payment =
    document.querySelector(
    'input[name="paymentmethod"]:checked'
    ).value;

    document.getElementById(
    "cardFields"
    ).style.display = "none";

    document.getElementById(
    "upiFields"
    ).style.display = "none";

    if(payment == "Card"){

        document.getElementById(
        "cardFields"
        ).style.display = "block";

    }

    else if(payment == "UPI"){

        document.getElementById(
        "upiFields"
        ).style.display = "block";

    }
}

</script>

</head>

<body>

<div class="container">

    <!-- LEFT SIDE -->

    <div class="box">

        <h2>Payment Method</h2>

        <form action="PaymentServlet"
        method="post">

            <!-- HIDDEN VALUES -->

            <input type="hidden"
            name="fullname"
            value="<%= fullname %>">

            <input type="hidden"
            name="address"
            value="<%= address %>">

            <input type="hidden"
            name="productname"
            value="<%= products.toString() %>">

            <input type="hidden"
            name="price"
            value="<%= (int)total %>">

            <input type="hidden"
            name="details"
            value="Order From Lumielle">

            <!-- PAYMENT OPTIONS -->

            <div class="payment-method">

                <label>

                    <input type="radio"
                    name="paymentmethod"
                    value="Cash On Delivery"
                    onclick="showPaymentFields()"
                    required>

                    Cash On Delivery

                </label>

                <br><br>

                <label>

                    <input type="radio"
                    name="paymentmethod"
                    value="UPI"
                    onclick="showPaymentFields()">

                    UPI

                </label>

                <br><br>

                <label>

                    <input type="radio"
                    name="paymentmethod"
                    value="Card"
                    onclick="showPaymentFields()">

                    Card

                </label>

            </div>

            <!-- UPI -->

            <div id="upiFields"
            class="card-box"
            style="display:none;">

                <input type="text"
                placeholder="Enter UPI ID">

            </div>

            <!-- CARD -->

            <div id="cardFields"
            class="card-box"
            style="display:none;">

                <input type="text"
                placeholder="Card Number">

                <input type="text"
                placeholder="Card Holder Name">

                <input type="password"
                placeholder="CVV">

            </div>

            <!-- BUTTON -->

            <input type="submit"
            value="Proceed Order"
            class="btn">

        </form>

    </div>

    <!-- RIGHT SIDE -->

    <div class="box">

        <h2>Order Summary</h2>

        <!-- CUSTOMER DETAILS -->

        <div class="summary-row">

            <strong>Name:</strong>

            <br>

            <%= fullname %>

        </div>

        <div class="summary-row">

            <strong>Address:</strong>

            <br>

            <%= address %>

        </div>

        <!-- PRODUCTS -->

        <div class="products-box">

            <strong>Products:</strong>

            <br><br>

            <%= products.toString() %>

        </div>

        <!-- TOTAL -->

        <div class="total">

            Total :
            <%= df.format(total) %>

        </div>

    </div>

</div>

</body>
</html>