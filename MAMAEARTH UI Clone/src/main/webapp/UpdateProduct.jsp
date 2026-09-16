<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");

String pname = "";
String price = "";
String image = "";
String category = "";
String description = "";

/* DEMO DATA */

if(id != null){

    if(id.equals("1")){

        pname = "Matte Lipstick";
        price = "299";
        image = "https://images.unsplash.com/photo-1586495777744-4413f21062fa?q=80&w=700";
        category = "Makeup";
        description = "Long lasting matte lipstick.";

    }

    else if(id.equals("2")){

        pname = "Face Serum";
        price = "599";
        image = "https://images.unsplash.com/photo-1620916566398-39f1143ab7be?q=80&w=700";
        category = "Skincare";
        description = "Glow boosting face serum.";

    }

    else if(id.equals("3")){

        pname = "Iconic Matte Kajal";
        price = "220";
        image = "https://images.pexels.com/photos/3373736/pexels-photo-3373736.jpeg?auto=compress&cs=tinysrgb&w=600";
        category = "Makeup";
        description = "Smudge proof kajal.";

    }

    else if(id.equals("4")){

        pname = "Facewash";
        price = "320";
        image = "https://images.pexels.com/photos/4465124/pexels-photo-4465124.jpeg?auto=compress&cs=tinysrgb&w=600";
        category = "Skincare";
        description = "Gentle cleansing facewash.";

    }

    else if(id.equals("5")){

        pname = "Nail Polish";
        price = "249";
        image = "https://images.unsplash.com/photo-1522337660859-02fbefca4702?q=80&w=700";
        category = "Makeup";
        description = "Premium glossy nail polish.";

    }

    else if(id.equals("6")){

        pname = "Bodywash";
        price = "499";
        image = "https://images.pexels.com/photos/6621461/pexels-photo-6621461.jpeg?auto=compress&cs=tinysrgb&w=600";
        category = "Bodycare";
        description = "Refreshing luxury bodywash.";

    }

}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>

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
    min-height:100vh;
    padding:40px;
}

.container{
    width:550px;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.container h2{
    text-align:center;
    color:#c2185b;
    margin-bottom:30px;
    font-size:36px;
}

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
.input-box textarea,
.input-box select{

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

.input-box input:focus,
.input-box textarea:focus,
.input-box select:focus{

    border-color:#ff4f81;
    outline:none;

}

.product-image{
    width:100%;
    height:250px;
    object-fit:cover;
    border-radius:15px;
    margin-bottom:25px;
}

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

}

.btn:hover{

    background:#c2185b;

}

.back-btn{

    display:block;
    text-align:center;
    margin-top:18px;
    text-decoration:none;
    color:#c2185b;
    font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

    <h2>Update Product</h2>

    <!-- PRODUCT IMAGE -->

    <img src="<%= image %>"
    class="product-image">

    <!-- FORM -->

    <form action="UpdateProductServlet"
    method="post">

        <!-- HIDDEN ID -->

        <input type="hidden"
        name="id"
        value="<%= id %>">

        <!-- PRODUCT NAME -->

        <div class="input-box">

            <label>Product Name</label>

            <input type="text"
            name="pname"
            value="<%= pname %>"
            required>

        </div>

        <!-- PRICE -->

        <div class="input-box">

            <label>Product Price</label>

            <input type="number"
            name="price"
            value="<%= price %>"
            required>

        </div>

        <!-- CATEGORY -->

        <div class="input-box">

            <label>Category</label>

            <select name="category">

                <option value="<%= category %>">

                    <%= category %>

                </option>

                <option value="Makeup">
                    Makeup
                </option>

                <option value="Skincare">
                    Skincare
                </option>

                <option value="Haircare">
                    Haircare
                </option>

                <option value="Bodycare">
                    Bodycare
                </option>

            </select>

        </div>

        <!-- IMAGE URL -->

        <div class="input-box">

            <label>Product Image URL</label>

            <input type="text"
            name="image"
            value="<%= image %>"
            required>

        </div>

        <!-- DESCRIPTION -->

        <div class="input-box">

            <label>Description</label>

            <textarea
            name="description"
            required><%= description %></textarea>

        </div>

        <!-- BUTTON -->

        <input type="submit"
        value="Update Product"
        class="btn">

    </form>

    <!-- BACK -->

    <a href="EditProduct.jsp"
    class="back-btn">

        ← Back To Products

    </a>

</div>

</body>
</html>