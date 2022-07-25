<%-- 
    Document   : detailproduct
    Created on : Dec 4, 2021, 11:10:50 PM
    Author     : Tin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tin.model.*" %>
<%@page import="com.tin.dao.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
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
            /*****************globals*************/
            body {
                font-family: 'open sans';
                overflow-x: hidden; }

            img {
                max-width: 100%; }

            .preview {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }
            @media screen and (max-width: 996px) {
                .preview {
                    margin-bottom: 20px; } }

            .preview-pic {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .preview-thumbnail.nav-tabs {
                border: none;
                margin-top: 15px; }
            .preview-thumbnail.nav-tabs li {
                width: 18%;
                margin-right: 2.5%; }
            .preview-thumbnail.nav-tabs li img {
                max-width: 100%;
                display: block; }
            .preview-thumbnail.nav-tabs li a {
                padding: 0;
                margin: 0; }
            .preview-thumbnail.nav-tabs li:last-of-type {
                margin-right: 0; }

            .tab-content {
                overflow: hidden; }
            .tab-content img {
                width: 100%;
                -webkit-animation-name: opacity;
                animation-name: opacity;
                -webkit-animation-duration: .3s;
                animation-duration: .3s; }

            .card {
                margin-top: -18px;
                background: #eee;
                padding: 3em;
                line-height: 1.5em; }

            @media screen and (min-width: 997px) {
                .wrapper {
                    display: -webkit-box;
                    display: -webkit-flex;
                    display: -ms-flexbox;
                    display: flex; } }

            .details {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column; }

            .colors {
                -webkit-box-flex: 1;
                -webkit-flex-grow: 1;
                -ms-flex-positive: 1;
                flex-grow: 1; }

            .product-title, .price, .sizes, .colors {
                font-weight: bold; }
            
            .product-title{
                text-transform: UPPERCASE;
            }

            .checked, .price span {
                color: #ff9f1a; }

            .product-title, .rating, .product-description, .price, .vote, .sizes {
                margin-bottom: 10px; }

            .product-title {
                margin-top: 0; }

            .size {
                margin-right: 10px; }
            .size:first-of-type {
                margin-left: 40px; }

            .color {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
                height: 2em;
                width: 2em;
                border-radius: 2px; }
            .color:first-of-type {
                margin-left: 20px; }

            .add-to-cart, .like {
                background: #ff9f1a;
                padding: 1.2em 1.5em;
                border: none;
                border-radius: 25px;
                text-transform: UPPERCASE;
                font-weight: bold;
                color: #fff;
                -webkit-transition: background .3s ease;
                transition: background .3s ease; }
            .add-to-cart:hover, .like:hover {
                transition-duration: 0.25s;
                transition-timing-function: linear;
                background: #ff084e;
                color: #fff; }

            .not-available {
                text-align: center;
                line-height: 2em; }
            .not-available:before {
                font-family: fontawesome;
                content: "\f00d";
                color: #fff; }

            .orange {
                background: #ff9f1a; }

            .green {
                background: #85ad00; }

            .blue {
                background: #0076ad; }

            .tooltip-inner {
                padding: 1.3em; }

            @-webkit-keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            @keyframes opacity {
                0% {
                    opacity: 0;
                    -webkit-transform: scale(3);
                    transform: scale(3); }
                100% {
                    opacity: 1;
                    -webkit-transform: scale(1);
                    transform: scale(1); } }

            /*# sourceMappingURL=style.css.map */
        </style>

    </head>
    <body>
        
        <div id="wrapper">
                <jsp:include page="header.jsp"></jsp:include>
                <div class="container">
                    <div class="container">
                    <%
                        Product item = (Product) request.getAttribute("model");
                    %>
                    <div class="container">
                        <div class="card">
                            <div class="container-fliud">
                                <div class="wrapper row">
                                    <div class="preview col-md-6">
                                        <div class="preview-pic tab-content">
                                            <div class="tab-pane active" id="pic-1"><img src="Images/<%=item.getImages()%>" /></div>                                            
                                        </div>
                                    </div>
                                    <div class="details col-md-6">
                                        <h3 class="product-title" style="color: #ff084e"><%=item.getProductName()%></h3>
                                        <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
                                        <p class="product-description">
                                            <%=item.getDescription()%>
                                        </p>
                                        <h5 class="sizes">Date of Manufacture:
                                            <a style="text-decoration: none;
                                               color: #000">
                                                <%=item.getDateOfManufacturer()%>                                            
                                            </a>
                                        </h5>
                                        <h5 class="sizes">Manufacture:
                                            <a style="text-decoration: none;
                                               color: #000">
                                                <%=item.getManufacturer().getManufacturerName()%>                                            
                                            </a>
                                        </h5>
                                        <h5 class="sizes">Category:
                                            <a style="text-decoration: none;
                                               color: #000">
                                                <%=item.getCategory().getCategoryName()%>                                            
                                            </a>
                                        </h5>
                                        <h5 class="price">Current price: <span><%=String.format("%,d",item.getPrice())%> VND</span></h5>                                        
                                        <div class="rating">
                                            <div class="stars">
                                                <span class="fas fa-star checked"></span>
                                                <span class="fas fa-star checked"></span>
                                                <span class="fas fa-star checked"></span>
                                                <span class="fas fa-star checked"></span>
                                                <span class="fas fa-star"></span>
                                            </div>
                                            <span class="review-no"> 41 reviews</span>
                                        </div>
                                        <div class="action">
                                            <button class="add-to-cart btn btn-default" type="button">
                                                <a class="nav-link" href="AddCartServlet?id=<%=item.getProductId()%>" style="text-decoration: none;
                                                   color: #eee;
                                                   background: #ff084e;
                                                   style:"border-radius: 125px">Add to cart</a>
                                            </button>                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>

            </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
