<%-- 
    Document   : cart
    Created on : Dec 7, 2021, 10:24:26 PM
    Author     : Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tin.model.*" %>
<%@page import="com.tin.dao.*" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--Awesome-->       
        <link href="Awesome/Font-Awesome-master/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="Awesome/Font-Awesome-master/css/all.min.css" rel="stylesheet" type="text/css"/>
        <!-- Core Style CSS -->
        <link href="CSS/animate.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/core-style.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/magnific-popup.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/nouislider.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/responsive.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/themify-icons.css" rel="stylesheet" type="text/css"/>

        <!--Fonts-->
        <link rel="stylesheet" href="Fonts/FontAwesome.otf">
        <link rel="stylesheet" href="Fonts/fontawesome-webfont.eot">
        <link rel="stylesheet" href="Fonts/fontawesome-webfont.svg">
        <link rel="stylesheet" href="Fonts/fontawesome-webfont.ttf">
        <link rel="stylesheet" href="Fonts/fontawesome-webfont.woff">
        <link rel="stylesheet" href="Fonts/fontawesome-webfont.woff2">
        <link rel="stylesheet" href="Fonts/themify.eot">
        <link rel="stylesheet" href="Fonts/themify.svg">
        <link rel="stylesheet" href="Fonts/themify.ttf">
        <link rel="stylesheet" href="Fonts/themify.woff">

        <!-- Image-->
        <!--Image-bg-->
        <link rel="icon" href="Images/bg-img/bg-1.jpg">
        <link rel="icon" href="Images/bg-img/bg-2.jpg">
        <link rel="icon" href="Images/bg-img/bg-3.jpg">
        <link rel="icon" href="Images/bg-img/bg-4.jpg">
        <link rel="icon" href="Images/bg-img/bg-5.jpg">
        <link rel="icon" href="Images/bg-img/tes-1.jpg">
        <!--Image-core-img-->                 
        <link rel="icon" href="Images/core-img/favicon.ico">
        <link rel="icon" href="Images/core-img/logo.png">
        <!--Image-product-img-->    
        <link rel="icon" href="Images/product-img/product-1.jpg">
        <link rel="icon" href="Images/product-img/product-2.jpg">     
        <link rel="icon" href="Images/product-img/product-3.jpg">     
        <link rel="icon" href="Images/product-img/product-4.jpg">     
        <link rel="icon" href="Images/product-img/product-5.jpg">     
        <link rel="icon" href="Images/product-img/product-6.jpg">     
        <link rel="icon" href="Images/product-img/product-7.jpg">     
        <link rel="icon" href="Images/product-img/product-8.jpg">     
        <link rel="icon" href="Images/product-img/product-9.jpg">     
        <link rel="icon" href="Images/product-img/product-10.jpg">     
        <link rel="icon" href="Images/product-img/product-11.jpg">     
        <link rel="icon" href="Images/product-img/product-12.jpg">     


        <!--JS-->
        <script src="JS/jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
        <script src="JS/active.js" type="text/javascript"></script>
        <script src="JS/bootstrap.min.js" type="text/javascript"></script>      
        <script src="JS/myjs.js" type="text/javascript"></script>
        <script src="JS/plugins.js" type="text/javascript"></script>
        <script src="JS/popper.min.js" type="text/javascript"></script>
        <!--Bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <style>
            .card {
                margin-bottom: 30px;
                border: 0;
                -webkit-transition: all .3s ease;
                transition: all .3s ease;
                letter-spacing: .5px;
                border-radius: 8px;
                -webkit-box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05);
                box-shadow: 1px 5px 24px 0 rgba(68, 102, 242, .05);
            }
            .card .card-body {
                padding: 30px;
                background-color: transparent
            }
            .text1{
                color: #000;
                animation: text 1.5s 1;
            }
            @keyframes text {
                0%{
                    color: #ff084e;
                    margin-bottom: 40px;
                }
                30%{
                    letter-spacing: 25px;
                    margin-bottom: 40px;
                }
                85%{
                    letter-spacing: 25px;
                    margin-bottom: 40px;
                }
            }

            .btn-primary,
            .btn-primary.disabled,
            .btn-primary:disabled {
                background-color: #4466f2 !important;
                border-color: #4466f2 !important
            }
            .table{
                border-color: -moz-linear-gradient(bottom, #555555, #111111);
            }
        </style>
    </head>
</head>
<body>
    <div id="wrapper">
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="container">
                <c:if test="${empty sessionScope.listItem}">
                    <div class="container-fluid mt-100">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card border border-dark">                           
                                    <div class="card-body cart">
                                        <div class="col-sm-12 empty-cart-cls text-center"> <i class="far fa-sad-tear fa-3x"></i>
                                            <h3><strong style="color: #ff084e">Your Cart is Empty</strong></h3>
                                            <h4>Add something to make me happy :)</h4> 
                                            <a href="index.jsp" class="btn btn-danger">Continue shopping</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>
                <c:if test="${not empty sessionScope.listItem}">
                    <h1 class="text1" style="text-align: center;">Your Cart!</h1>
                    <c:set var="index" value="1"></c:set>
                        <table class="table" style="border: 1; text-align: center">
                            <tr style="background: #ff084e; color: #ffe6e6">
                                <th style="text-align: center">Ord Number</th>
                                <th>ID Product</th>
                                <th>Image</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Product</th>
                                <th>Action</th>
                            </tr>
                        <c:set var="total" value="0"></c:set>
                        <c:forEach var="item" items="${listItem}">
                            <tr>
                                <td>${index}</td>
                                <td>${item.product.productId}</td>
                                <td><img src="Images/${item.product.images}" width="70px"></td>
                                <td>${item.product.productName}</td>
                                <td>${String.format("%,d",item.product.price)} VND</td>
                                <td style="color: #000">
                                    <c:if test="${item.quantity==1}">
                                        <strong>-</strong>
                                    </c:if>
                                    <c:if test="${item.quantity>1}">
                                        <strong>
                                            <a href="UpdateItemCart?id=${item.product.productId}&quantity=${item.quantity-1}" style="color: #ff084e">
                                                -
                                            </a>
                                        </strong>
                                    </c:if>
                                    ${item.quantity}
                                    <strong>
                                        <a href="UpdateItemCart?id=${item.product.productId}&quantity=${item.quantity+1}" style="color: #ff084e">
                                            +
                                        </a>
                                    </strong>
                                </td>
                                <td>
                                    ${String.format("%,d", item.product.price*item.quantity)} VND
                                </td>
                                <td>
                                    <a href="DeleteItemCart?id=${item.product.productId}">
                                        <i class="far fa-trash-alt" style="color: #000"></i>
                                    </a>
                                </td>
                            </tr>
                            <c:set var="total" value="${total+item.product.price*item.quantity}"></c:set>
                            <c:set var="index" value="${index+1}"></c:set>
                        </c:forEach>
                        <tr>
                            <td colspan="5" style="text-align: right">Total Money</td>
                            <td colspan="2" style="color: red">
                                <strong>${String.format("%,d",total)}VND</strong>
                            </td>
                            <td>
                                <a href="OrderServlet">Order</a>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
