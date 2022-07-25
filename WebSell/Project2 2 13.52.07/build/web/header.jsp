<%-- 
    Document   : header.jsp
    Created on : Nov 30, 2021, 1:25:23 PM
    Author     : Tin
--%>

<%@page import="com.tin.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
            .badge {
                padding-left: 9px;
                padding-right: 9px;
                -webkit-border-radius: 9px;
                -moz-border-radius: 9px;
                border-radius: 9px;
            }

            .label-warning[href],
            .badge-warning[href] {
                background-color: #c67605;
            }
            #lblCartCount {
                font-size: 12px;
                background: #ff0000;
                color: #fff;
                padding: 0 5px;
                vertical-align: top;
                margin-left: -10px; 
            }
        </style>
    </head>

    <body>        
        <header class="header_area1">
            <!-- Top Header Area Start -->
            <div class="top_header_area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-end">

                        <div class="col-12 col-lg-7">
                            <div class="top_single_area d-flex align-items-center">
                                <!-- Logo Area -->
                                <div class="top_logo">
                                    <a href="#"><img src="Images/core-img/logo.png" alt=""></a>
                                </div>
                                <!-- Cart & Menu Area -->
                                <div class="header-cart-menu d-flex align-items-center ml-auto">
                                    <!-- Cart Area -->
                                    <div class="cart">
                                        <%

                                            int numItems = 0;
                                            if (((ArrayList<Integer>) request.getSession().getAttribute("listItem")) != null) {
                                                numItems = ((ArrayList<Integer>) request.getSession().getAttribute("listItem")).size();
                                            }
                                        %>
                                        <a href="cart.jsp" id="header-cart-btn" style="text-decoration: none; color: #000"><i class="fas fa-shopping-bag"></i>
                                            <span class='badge badge-warning' id='lblCartCount'> <%=numItems%> </span> 
                                            Your Cart
                                        </a>

                                        <!--<i class="fa" style="font-size:24px">&#xf07a;</i>-->

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Top Header Area End -->
            <jsp:include page="/MenuServlet"></jsp:include>
        </header>
        <!-- jQuery (Necessary for All JavaScript Plugins) -->
        <script src="JS/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="JS/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="JS/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="JS/plugins.js"></script>
        <!-- Active js -->
        <script src="JS/active.js"></script>

    </body>

</html>
