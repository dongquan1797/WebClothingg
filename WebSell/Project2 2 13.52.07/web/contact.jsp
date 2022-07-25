<%-- 
    Document   : contact
    Created on : Dec 11, 2021, 6:52:22 PM
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

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <style>
            body{
                padding: 0;
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
                color: rgb(48, 46, 46);
                background-color: rgba(224, 217, 217, 0.863);
            }
            .container{
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 25px;
            }
            hr{
                width: 80%;
            }
            h2{
                font-size: 20px;
            }
            .contact-items{
                display: flex;
                margin: 30px auto;
                flex-wrap: wrap;
                align-items: center;

            }
            .customer-care,.write-us,.sales-market{
                display: flex;
                flex-direction: column;
                align-items: center;
                width: 28%;
                margin: 30px auto;
                padding: 35px 15px;
                border-radius: 15px;
                text-align: center;
                min-width: 250px;

            }
            .customer-care{
                height: 250px;
                box-shadow: 0 15px 15px green;
                border: 1px solid green;
            }
            .write-us{
                height: 250px;
                box-shadow: 0 15px 15px red;
                border: 1px solid red;
            }
            .sales-market{
                height: 250px;
                box-shadow: 0 15px 15px blue;
                border: 1px solid blue;
            }
            p{
                font-size: 15px;
            }
            button{
                padding: 8px 16px;
                font-size: 17px;
                border-radius: 25px;
                border: none;
                margin: 15px auto;
                cursor: pointer;
                color: rgb(255, 255, 255);
            }
            button:hover{
                color: gray;
            }
            #cust-care{
                background: green;

                box-shadow: 0 0 5px black;
            }
            #write{
                background: rgb(187, 15, 15);

                box-shadow: 0 0 5px black;
            }
            #sales{
                background: blue;
                box-shadow: 0 0 5px black;
            }
            a{
                font-size: 16px;
            }
            .customer-care a{
                color: green;
                text-shadow: 0 0 2px rgba(73, 129, 80, 0.637);
            }
            .sales-market a{
                color: blue;
                text-shadow: 0 0 2px rgba(76, 62, 158, 0.637);
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <!--        <div class="container">
                <h1>Contact Us</h1>
                <hr>
                <h2>Have any questions? We'd love to hear from you</h2>
                <div class="contact-items">
                    <div class="customer-care">
                        <h3>Customer Care</h3>
                        <p>Our Support team is spread all over the world to give you fast response</p>
                        <button id="cust-care"> Submit a Request</button>
                        <a href="#"> Frequently asked Questions</a>
                    </div>
                    <div class="write-us">
                        <h3>Write Us</h3>
                        <p> You can write us if you have any queries</p>
                       <a href="#"> <button id="write">Write</button></a>
                   <a href="./contact-form.html"> <button id="write">Write</button></a>  u
                    </div>
                    <div class="sales-market">
                        <h3> Sales and Marketing</h3>
                        <p>Get in touch with our sales and marketing team</p>
                        <button id="sales">Contact Sales</button>
                        <a href="#">View Plans</a>
        
                    </div>
                </div>
            </div>-->
        <div class="container" style="margin-top: 10px;">
            <div class="row"
                 style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                <div class="col-sm-12">
                    <h2 class="myclass">Information</h2>
                    <form action="/send" method="post">
                        <div class="form-group">
                            <label>To:</label> 
                            <input type="text"
                                   class="form-control" name="to" placeholder="Enter Email">
                        </div>
                        <div class="form-group">
                            <label>Subject:</label> 
                            <input type="text"
                                   class="form-control" name="subject" placeholder="Enter Subject">
                        </div>
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <textarea class="form-control" rows="3"  name="content"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send</button>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
