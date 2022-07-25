<%-- 
    Document   : register
    Created on : Dec 5, 2021, 11:04:10 PM
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
        <link href="CSS/register.css" rel="stylesheet" type="text/css"/>

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

    </head>
    <body>
        <div id="wrapper">
            <!--HEADER-->
            <jsp:include page="header.jsp"></jsp:include>
                <div class="container">
                    <div class="title">Registration</div>
                    <div style="color: #ff084e">
                    <c:if test="${not empty requestScope.errorMessages}">
                        ${requestScope.errorMessages}
                    </c:if>
                    </div>
                    <form method="post" action="RegisterServlet" onsubmit="return CheckData()">
                        <div class="user-details">
                            <div class="input-box">
                                <span class="details">Full Name</span>
                                <input type="text" name="CustomerName" id="CustomerName" placeholder="Enter your name" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Date of Birth</span>
                                <input type="date" name="DateOfBirth" id="DateOfBirth" placeholder="Enter your date" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Phone Number</span>
                                <input type="text" name="Phone" id="Phone" placeholder="Enter your phone" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Address</span>
                                <input type="text" name="Address" id="Address" placeholder="Enter your address" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Email</span>
                                <input type="text" name="Email" id="Email" placeholder="Enter your email" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Username</span>
                                <input type="text" name="UserName" id="UserName" placeholder="Enter your username" required>
                            </div>
                            <div class="input-box">
                                <span class="details">Password</span>
                                <input type="password" name="PassWord" id="PassWord" placeholder="Enter your password" required>
                            </div>
                            <!--Confirm password-->
                            <div class="input-box">
                                <span class="details">Confirm Password</span>
                                <input type="password" name="cpass" id="cpass" placeholder="Confirm your password" required>
                            </div>
                        </div>
                        <div class="button">
                            <input type="submit" value="Register" onClick="return CheckData()">
                        </div>
                    </form>
                </div>
                <!--FOOTER-->
            <%--<jsp:include page="footer.jsp"></jsp:include>--%>
        </div>
    </body>
</html>
