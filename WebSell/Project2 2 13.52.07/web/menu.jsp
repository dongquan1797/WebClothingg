<%-- 
    Document   : menu.jsp
    Created on : Dec 1, 2021, 1:18:29 PM
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
/*            .navbar-expand-lg .navbar-nav .nav-link:hover{
                 transition: all 500ms ease 0s;
                 color: #ff084e;
            }*/
            .help-line a:hover{
                 text-decoration: none;
                 color: #FFF;
                 background:#ff084e;
             }
        </style>
    </head>
        
    <body>
        <div class="main_header_area">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-12 d-md-flex justify-content-between">
                        <!-- Header Social Area -->
                        <div class="header-social-area">
                            <a href="#"><span class="karl-level">Share</span> <i class="fab fa-pinterest" aria-hidden="true" style="color: black"></i></a>
                            <a href="#"><i class="fab fa-facebook-f" aria-hidden="true" style="color: black"></i></a>
                            <a href="#"><i class="fab fa-twitter" aria-hidden="true" style="color: black"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in" aria-hidden="true" style="color: black"></i></a>
                        </div>
                        <!-- Menu Area -->
                        <div class="main-menu-area">
                            <nav class="navbar navbar-expand-lg align-items-start">

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav animated" id="nav">
                                        <li class="nav-item active"><a class="nav-link" href="index.jsp" style="color: #000">Home</a></li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" style="color: #000" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Product                                                
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <%
                                                    ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("models");
                                                    for (Category item : list) {
                                                        String link = "";
                                                        link += "<a class='dropdown-item' role='button' style='color: #000;' href='index.jsp?cat=" + String.valueOf(item.getCategoryID()) + "'>";
                                                        link += item.getCategoryName() + "</a>";                                                       
                                                        out.print(link);
                                                    }
                                                %>
                                            </div> 
                                        </li>

                                        <li class="nav-item"><a class="nav-link" href="contact.jsp" style="color: #000">Contact</a></li>
                                        

                                        <c:if test="${empty sessionScope.user}">
                                            <li class="nav-item"><a class="nav-link" href="login.jsp" style='color: #000'>Login</a></li>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.user}">
                                            <li class="nav-item"><a class="nav-link" href="LogoutServlet" style='color: #000'>Logout (Hi: ${sessionScope.user})</a></li>
                                            </c:if>
                                            <c:if test="${not empty sessionScope.user}">
                                            <li class="nav-item">
                                                <a class="nav-link" href="PurchaseHistory" style='color: #000'>Purchase History</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <!-- Help Line -->
                        <div class="help-line">
                            <a href="tel:+346573556778"><i class="fas fa-headphones"></i> +34 657 3556 778</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
