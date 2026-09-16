<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>

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

.title{
    text-align:center;
    color:#c2185b;
    margin-bottom:40px;
    font-size:42px;
}

/* GRID */

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:30px;
}

/* CARD */

.card{
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
}

.card img{
    width:100%;
    height:250px;
    object-fit:cover;
}

.card-body{
    padding:20px;
}

.card-body h3{
    color:#c2185b;
    margin-bottom:10px;
}

.price{
    color:#ff4f81;
    font-size:22px;
    font-weight:bold;
    margin-bottom:10px;
}

.category{
    color:gray;
    margin-bottom:10px;
}

.desc{
    color:#555;
    line-height:1.5;
}

/* BUTTON */

.back-btn{
    display:inline-block;
    margin-top:40px;
    text-decoration:none;
    background:#ff4f81;
    color:white;
    padding:12px 25px;
    border-radius:30px;
    font-weight:bold;
}

</style>

</head>

<body>

<h1 class="title">

    All Products

</h1>

<div class="product-grid">

<%
try{

    Class.forName(
    "com.mysql.cj.jdbc.Driver");

    Connection con =
    DriverManager.getConnection(

    "jdbc:mysql://localhost:3306/beautycare",
    "root",
    "password"

    );

    Statement st =
    con.createStatement();

    ResultSet rs =
    st.executeQuery(

    "select * from products"

    );

    while(rs.next()){

%>

<!-- CARD -->

<div class="card">

    <!-- IMAGE -->

    <img src="<%= rs.getString("image") %>">

    <!-- BODY -->

    <div class="card-body">

        <h3>

            <%= rs.getString("pname") %>

        </h3>

        <div class="price">

            <%= rs.getInt("price") %>

        </div>

        <div class="category">

            Category :
            <%= rs.getString("category") %>

        </div>

        <div class="desc">

            <%= rs.getString("description") %>

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

<br>

<a href="Product.jsp"
class="back-btn">

    &#8592; Back To Dashboard

</a>

</body>
</html>