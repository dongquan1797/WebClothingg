<%-- 
    Document   : billdetail
    Created on : Dec 10, 2021, 12:22:25 AM
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
            /* Google font */

            @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap');
            body {
                margin: 0;
                padding: 0;
                font-size: 16px;
                font-weight: 300;
                width: 100%;
                background: rgb(204, 204, 204);
                font-family: 'Roboto Condensed', sans-serif;
            }

            h2,
            h4,
            p {
                margin: 0;
            }

            .page {
                background: #fff;
                display: block;
                margin: 3rem auto 3rem auto;
                position: relative;
                box-shadow: 0 0 0.5px rgba(0, 0, 0, 0.1);
            }

            .page[size="A4"] {
                width: 21cm;
                height: 19.7cm;
                overflow-x: hidden;
            }
            /* Top Section */

            .top-section {
                color: #fff;
                padding: 20px;
                height: 115px;
                background-color: #ff084e;
            }

            .top-section h2 {
                font-size: 42px;
                margin-bottom: 10px;
                font-weight: 400;
            }

            .top-section .contact,
            .top-section .address {
                width: 50%;
                height: 100%;
                float: left;
            }

            .top-section .address-content {
                max-width: 275px;
            }

            .contact .contact-content {
                max-width: 220px;
                float: right;
                margin-top: 32px;
            }

            .contact-content .email,
            .contact-content .number {
                display: block;
            }

            .contact-content .email span,
            .contact-content .number span {
                float: right;
                margin-left: 30px;
            }
            /* Billing Invoice */

            .billing-invoice {
                padding: 20px;
                font-size: 20px;
                margin-bottom: 15px;
            }

            .billing-invoice .title {
                font-weight: 400;
                float: left;
            }

            .billing-invoice .des {
                font-weight: 400;
                float: right;
            }

            .billing-invoice .code {
                font-weight: 700;
                text-align: right;
            }

            .billing-invoice .issue {
                text-align: right;
                font-size: 15px;
            }
            /* Billing to */

            .billing-to {
                padding: 20px;
                margin-top: 40px;
            }

            .billing-to .title {
                font-weight: 400;
                font-size: 20px;
                margin-bottom: 7px;
            }

            .billing-to .billed-sec {
                width: 50%;
                float: left;
                font-size: 18px;
                margin-bottom: 25px;
            }

            .billing-to .sub-title,
            .billing-to .name {
                font-weight: 400;
                font-size: 18px;
                margin-bottom: 5px;
            }

            .billing-to .ship-add {
                max-width: 300px;
            }
            /* Invoice Table */

            .table {
                padding: 0 20px;
            }

            .table table {
                width: 100%;
            }

            .table table,
            th,
            td {
                padding: 5px;
                text-align: center;
                border: 1px solid #616161;
                border-collapse: collapse;
            }

            .table tr th {
                font-size: 18px;
                font-weight: 400;
            }

            .table table tr:first-child {
                color: #fff;
                background-color: #ff084e;
            }

            .table tr th:nth-child(2),
            .table tr td:nth-child(2) {
                text-align: left;
                width: 230px;
            }
            /* <!-- Bottom  Section--> */

            .bottom-section {
                margin-top: 15px;
                padding: 20px;
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
            }

            .bottom-section .tnx {
                text-align: center;
            }

            .bottom-section .status-content h4 {
                font-size: 22px;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .bottom-section .status.free::before .bottom-section .status.paid::before {
                padding: 5px 10px;
                border-radius: 5px;
                margin-bottom: 8px;
                display: inline-block;
                text-transform: uppercase;
            }

            .bottom-section .status.free::before {
                content: "Unpaid";
                color: #fff;
                background-color: #ff084e;
            }

            .bottom-section .status.paid::before {
                content: "Paid";
                background-color: #ff084e;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div class="tab-content">
                <div class="container">
                    <jsp:include page="header.jsp"></jsp:include>
                    <c:if test="${empty requestScope.bill}">
                        <h1 style="color: #ff084e; text-align: center">The bill is empty</h1>
                    </c:if>
                    <c:if test="${not empty requestScope.bill}">
                        <h1 style="color: #ff084e; text-align: center">Bill Detail</h1>
                        Bill Id: ${bill.billId} <br>
                        Date:${bill.billDate} <br>
                        Customer: ${bill.customer.customerName} <br>
                        Staff: ${bill.staff.fullName} <br>
                        Status: ${bill.status.statusName} <br>
                        <c:set var="index" value="1"></c:set>
                            <table class="table" style="text-align: center">
                                <tr style="background: #ff084e; color: #fff">
                                    <th>#</th>
                                    <th>Id Product</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total (VND)</th>
                                </tr>
                            <c:set var="total" value="0"></c:set>
                            <c:forEach var="item" items="${bill.lstBillDetail}">
                                <tr>
                                    <td>${index}</td>
                                    <td>${item.product.productId}</td>                                
                                    <td><img src="Images/${item.product.images}" width="70px"></td>
                                    <td>${item.product.productName}</td>
                                    <td>${String.format("%,d",item.product.price)}</td>
                                    <td>${item.quantity}</td>
                                    <td>${String.format("%,d",item.product.price*item.quantity)}</td>
                                </tr>
                                <c:set var="total" value="${total+item.product.price*item.quantity}"></c:set>
                                <c:set var="index" value="${index+1}"></c:set>
                            </c:forEach>
                            <tr>
                                <td colspan="5" style="text-align: right">Total Money</td>
                                <td colspan="2" style="text-align: left; color: red">
                                    <strong>
                                        ${String.format("%,d",total)}
                                    </strong>
                                </td>
                            </tr>
                        </table>
                    </c:if>  
                </div>
            </div>  
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
