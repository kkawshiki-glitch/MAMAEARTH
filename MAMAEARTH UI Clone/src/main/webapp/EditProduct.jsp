<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Products</title>

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
    font-size:42px;
    margin-bottom:40px;
    font-weight:bold;
}

/* GRID */

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
    gap:30px;
}

/* CARD */

.card{
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 4px 12px rgba(0,0,0,0.08);
    transition:0.3s;
}

.card:hover{
    transform:translateY(-8px);
}

/* IMAGE */

.card img{
    width:100%;
    height:250px;
    object-fit:cover;
}

/* BODY */

.card-body{
    padding:20px;
}

.card-body h3{
    color:#c2185b;
    margin-bottom:10px;
    font-size:24px;
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

.edit-btn{
    flex:1;
    background:#ff4f81;
    color:white;
    text-decoration:none;
    text-align:center;
    padding:12px;
    border-radius:30px;
    font-weight:bold;
}

.delete-btn{
    flex:1;
    background:#222;
    color:white;
    text-decoration:none;
    text-align:center;
    padding:12px;
    border-radius:30px;
    font-weight:bold;
}

.edit-btn:hover{
    background:#c2185b;
}

.delete-btn:hover{
    background:black;
}

/* BACK BUTTON */

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

.back-btn:hover{
    background:#c2185b;
}

</style>

</head>

<body>

<h1 class="title">

    Edit Products

</h1>

<div class="product-grid">

<%
try{

    // LOAD DRIVER

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

<div class="card">

    <!-- IMAGE -->

    <img src="<%= rs.getString("image") %>">

    <!-- BODY -->

    <div class="card-body">

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

            <!-- EDIT -->

            <a href="UpdateProduct.jsp?id=<%= rs.getInt("id") %>"
            class="edit-btn">

                Edit

            </a>

            <!-- DELETE -->

            <a href="DeleteProductServlet?id=<%= rs.getInt("id") %>"
            class="delete-btn">

                Delete

            </a>

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

    ← Back To Dashboard

</a>

</body>
</html>