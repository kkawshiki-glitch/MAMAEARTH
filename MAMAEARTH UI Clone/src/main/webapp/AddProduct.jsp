<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#fff5f8;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{
    width:500px;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.container h2{
    text-align:center;
    color:#d63384;
    margin-bottom:25px;
    font-size:34px;
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

    border-color:#d63384;
    outline:none;

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
    color:#d63384;
    font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

    <h2>Add Product</h2>

    <form action="AddProductServlet" method="post">

        <!-- PRODUCT NAME -->

        <div class="input-box">

            <label>Product Name</label>

            <input type="text"
            name="pname"
            placeholder="Enter Product Name"
            required>

        </div>

        <!-- PRODUCT PRICE -->

        <div class="input-box">

            <label>Product Price</label>

            <input type="text"
            name="price"
            placeholder="Enter Product Price"
            required>

        </div>

        <!-- PRODUCT CATEGORY -->

        <div class="input-box">

            <label>Category</label>

            <select name="category" required>

                <option value="">
                    Select Category
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

        <!-- PRODUCT IMAGE -->

        <div class="input-box">

            <label>Product Image URL</label>

            <input type="text"
            name="image"
            placeholder="Paste Image URL"
            required>

        </div>

        <!-- PRODUCT DESCRIPTION -->

        <div class="input-box">

            <label>Product Description</label>

            <textarea
            name="description"
            placeholder="Enter Product Description"
            required></textarea>

        </div>

        <!-- SUBMIT BUTTON -->

        <input type="submit"
        value="Add Product"
        class="btn">

    </form>

    <!-- BACK -->

    <a href="Product.jsp"
    class="back-btn">

        ← Back To Dashboard

    </a>

</div>

</body>
</html>