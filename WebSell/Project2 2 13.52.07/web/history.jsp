<%-- 
    Document   : history
    Created on : Dec 10, 2021, 1:50:39 PM
    Author     : Tin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tin.model.*" %>
<%@page import="com.tin.dao.*"%>
<%@page import="java.util.ArrayList"%>
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

    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="header.jsp"></jsp:include>
                <div class="tab-content">
                    <div class="container">
                    <c:if test="${empty requestScope.listBill}">
                        <h1 style="text-align: center; color: #ff084e">The purchase history is empty</h1>
                    </c:if>
                    <c:if test="${not empty requestScope.listBill}">
                        <h1 style="text-align: center; color: #ff084e">
                            Your Purchase History
                        </h1>
                        <c:set var="index" value="1"></c:set>   
                            <table class="table" style="text-align: center">
                                <tr>
                                    <th>Order Number</th>
                                    <th>Bill ID</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Staff</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            <c:set var="index" value="1"></c:set>
                            <c:forEach var="item" items="${requestScope.listBill}">
                                <tr>
                                    <td>${index}</td>
                                    <td>${item.billId}</td>
                                    <td>${item.billDate}</td>
                                    <td>${item.customer.customerName}</td>
                                    <td>${item.staff.fullName}</td>
                                    <td>${item.status.statusName}</td>
                                    <td>
                                        <a href="DetailOrder?id=${item.billId}">
                                            <i class="fas fa-info-circle" style="color: #000"></i>
                                        </a>
                                    </td>
                                </tr>
                                <c:set var="index" value="${index+1}"></c:set>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
