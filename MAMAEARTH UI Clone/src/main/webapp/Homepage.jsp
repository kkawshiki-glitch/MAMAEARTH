<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    List<String> cart =
    (List<String>) session.getAttribute("cart");

    int cartCount = 0;

    if(cart != null){

        cartCount = cart.size();

    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lumielle Beauty</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    background:#fff8fb;
}

/* TOPBAR */

.topbar{
    background:linear-gradient(to right,#ff4f81,#ff85a2);
    color:white;
    text-align:center;
    padding:12px;
    font-size:15px;
    font-weight:bold;
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

.menu a{
    text-decoration:none;
    margin:0 18px;
    color:#444;
    font-weight:600;
}

.menu a:hover{
    color:#ff4f81;
}

.right-section{
    display:flex;
    align-items:center;
    gap:15px;
}

.auth-btn{
    background:#222;
    color:white;
    padding:10px 18px;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
}

.nav-btn{
    background:#ff4f81;
    color:white;
    padding:11px 24px;
    border-radius:30px;
    text-decoration:none;
    font-weight:bold;
}

.nav-btn:hover{
    background:#d63384;
}

/* HERO */

.hero{
    height:520px;
    background:url('https://images.unsplash.com/photo-1515377905703-c4788e51af15?q=80&w=1400') center/cover;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    position:relative;
}

.hero::before{
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background:rgba(255,255,255,0.45);
}

.hero-content{
    position:relative;
    z-index:2;
}

.hero h1{
    font-size:60px;
    color:#222;
    margin-bottom:15px;
}

.hero p{
    font-size:22px;
    color:#444;
    margin-bottom:30px;
}

.hero-btn{
    text-decoration:none;
    background:#ff4f81;
    color:white;
    padding:14px 35px;
    border-radius:35px;
    font-size:18px;
    font-weight:bold;
}

/* PRODUCTS */

.products{
    padding:60px;
}

.products h2{
    margin-bottom:35px;
    color:#333;
    font-size:35px;
}

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:35px;
}

.product-card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    transition:0.3s;
}

.product-card:hover{
    transform:translateY(-8px);
}

.product-card img{
    width:100%;
    height:260px;
    object-fit:cover;
}

.product-info{
    padding:20px;
}

.product-info h3{
    margin-bottom:10px;
    color:#c2185b;
}

.price{
    color:#ff4f81;
    font-size:22px;
    font-weight:bold;
    margin-bottom:15px;
}

.category{
    color:gray;
    margin-bottom:15px;
}

/* BUTTONS */

.btn-group{
    display:flex;
    gap:10px;
}

.buy-btn{
    background:#ff4f81;
    color:white;
    padding:10px 18px;
    border:none;
    border-radius:30px;
    font-weight:bold;
    cursor:pointer;
}

.buy-now-btn{
    background:#222;
    color:white;
    padding:10px 18px;
    border:none;
    border-radius:30px;
    font-weight:bold;
    cursor:pointer;
}

.buy-btn:hover{
    background:#d63384;
}

.buy-now-btn:hover{
    background:black;
}

/* FOOTER */

.footer{
    background:#ff4f81;
    color:white;
    text-align:center;
    padding:22px;
    margin-top:50px;
}

</style>

</head>

<body>

<!-- TOPBAR -->

<div class="topbar">

✨ LUMIELLE GLOW FEST | Flat 40% Off on Premium Beauty Picks ✨

</div>

<!-- NAVBAR -->

<div class="navbar">

    <!-- LOGO -->

    <div class="logo">

        Lumielle

    </div>

    <!-- MENU -->

    <div class="menu">

        <a href="#">Cosmetics</a>
        <a href="#">Glow Care</a>
        <a href="#">Hair Essentials</a>
        <a href="#">Luxury Kits</a>

    </div>

    <!-- RIGHT SECTION -->

    <div class="right-section">

        <!-- MY ORDERS -->

        <a href="MyOrders.jsp"
        class="nav-btn">

            My Orders

        </a>

        <!-- LOGIN -->

        <a href="Login.jsp"
        class="auth-btn">

            Login

        </a>

        <!-- SIGNUP -->

        <a href="Registration.jsp"
        class="auth-btn">

            Signup

        </a>

        <!-- CART -->

        <a href="cart.jsp"
        class="nav-btn">

            Cart (<%= cartCount %>)

        </a>

    </div>

</div>

<!-- HERO -->

<div class="hero">

    <div class="hero-content">

        <h1>UNLEASH YOUR GLOW</h1>

        <p>

            Discover Trendy Beauty Essentials Crafted For You

        </p>

        <a href="Registration.jsp"
        class="hero-btn">

            Join Now

        </a>

    </div>

</div>

<!-- PRODUCTS -->

<div class="products">

<h2>Trending Collections</h2>

<div class="product-grid">

<%
try{

    // DRIVER

    Class.forName(
    "com.mysql.cj.jdbc.Driver");

    // CONNECTION

    Connection con =
    DriverManager.getConnection(

    "jdbc:mysql://localhost:3306/beautycare",
    "root",
    "password"

    );

    // QUERY

    Statement st =
    con.createStatement();

    ResultSet rs =
    st.executeQuery(

    "select * from products"

    );

    // LOOP

    while(rs.next()){

%>

<!-- PRODUCT CARD -->

<div class="product-card">

    <!-- IMAGE -->

    <img src="<%= rs.getString("image") %>">

    <!-- INFO -->

    <div class="product-info">

        <!-- PRODUCT NAME -->

        <h3>

            <%= rs.getString("pname") %>

        </h3>

        <!-- PRICE -->

        <div class="price">

            <%= rs.getInt("price") %>

        </div>

        <!-- CATEGORY -->

        <div class="category">

            <%= rs.getString("category") %>

        </div>

        <!-- BUTTONS -->

        <div class="btn-group">

            <!-- ADD TO CART -->

            <button onclick="window.location.href='AddToCartServlet?name=<%= rs.getString("pname") %>&price=<%= rs.getInt("price") %>'"
            class="buy-btn">

                Add To Cart

            </button>

            <!-- BUY NOW -->

            <button onclick="window.location.href='BuyNowServlet?name=<%= rs.getString("pname") %>&price=<%= rs.getInt("price") %>'"
            class="buy-now-btn">

                Buy Now

            </button>

        </div>

    </div>

</div>

<%
    }

    con.close();

}

catch(Exception e){

    out.println(e);

}
%>

</div>

</div>

<!-- FOOTER -->

<div class="footer">

© 2026 Lumielle Beauty | Designed With 💖

</div>

</body>
</html>