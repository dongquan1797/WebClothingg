<%-- 
    Document   : index
    Created on : Nov 30, 2021, 10:46:35 AM
    Author     : Tin
--%>
<%@page import="java.io.Console"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tin.model.*" %>
<%@page import="com.tin.dao.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>TQ - Shoes Ecommerce | Home</title>

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
    <style>
        /*Search*/
        .search {
            width: 100%;
            position: relative;
            display: flex;
        }

        ::-webkit-input-placeholder {
            text-align: center;
            text-transform: uppercase;
        }

        .searchTerm {
            width: 100%;
            border: 3px solid #ff084e;
            border-top: none;
            border-right: none;
            border-left: none;
            padding: 5px;
            height: 36px;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #bf5226;
        }

        .searchTerm:focus{
            color: #474747;
        }

        .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid #ff084e;
            background: #ff084e;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
        }
        /*Resize the wrap to see the search bar change!*/
        .wrap{
            width: 20%;
            position: absolute;
            top: 1597px;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        /*Card*/
        .containers {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .card {
            width: 300px;
            height: 420px;
            position: relative;
            background-color: #f0f0f0;
        }

        .product-img {
            width: 300px;
            height: 230px;           
            background-repeat: no-repeat;
            background-position: 0 -75px;
            background-size: cover;
        }
        .imgs {
            width: 253px;
            height: 230px;           
            background-repeat: no-repeat;
            background-position: 0 -75px;
            background-size: cover;
        }

        .product-detail {
            width: 254px;
            height: 190px;
            background-color: #fff7fd;
            border-radius: 0 30% 0 0;
            padding: 0.8rem;
            font-family: "Poppins", sans-serif;
            color: #fff;
        }
        .rating {
            font-size: 0.9rem;
            color: #122d48ed;
            user-select: none;
            padding-top: 11px;
        }

        .buttons {
            height: 65px;
            margin-top: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btns {
            position: relative;
            border: none;
            outline: none;
            background-color: #fff7fd;
            color: #fff;
            height: 40px;
            border-radius: 50px;
            font-size: 0.9rem;
            font-family: "Poppins", sans-serif;
            cursor: pointer;
        }

        .cart {
            width: 160px;
        }

        .btns::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #35353f;
            height: 45px;
            transition: 0.3s;
        }

        .cart::before {
            width: 165px;
            border-radius: 50px;
        }

        .favourite::before {
            width: 45px;
            border-radius: 50%;
        }

        .btn:hover::before {
            border-color: #cc0030;
        }
    </style>
    <body>
        <div id="wrapper">
            <!-- HEADER -->
            <jsp:include page="/header.jsp"></jsp:include>
                <section class="welcome_area">
                    <div id="carouselExampleControls" class="carousel slide mb-2" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 600px">
                                <img class="d-block w-100 mh-100" src="Images/bg-img/bg-1.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item" style="height: 600px">
                                <img class="d-block w-100" src="Images/bg-img/IMG33.jpeg" alt="First slide">
                            </div>
                            <div class="carousel-item" style="height: 600px">
                                <img class="d-block w-100" src="Images/bg-img/IMG22.jpg" alt="First slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </section>
                <!-- ****** Welcome Slides Area End ****** -->

                <!-- ****** Top Catagory Area Start ****** -->
                <section class="top_catagory_area d-md-flex clearfix">
                    <!-- Single Catagory -->
                    <div class="single_catagory_area d-flex align-items-center bg-img" id="BG" style="background-image: url(Images/bg-img/960.jpeg);">
                        <div class="catagory-content">
                            <h6>On Accessories</h6>
                            <h2>Sale 30%</h2>
                            <a href="#" class="btn karl-btn">SHOP NOW</a>
                        </div>
                    </div>
                    <!-- Single Catagory -->
                    <div class="single_catagory_area d-flex align-items-center bg-img" style="background-image: url(Images/bg-img/970.png);">
                        <div class="catagory-content">
                            <h6>in Bags excepting the new collection</h6>
                            <h2>Designer bags</h2>
                            <a href="#" class="btn karl-btn">SHOP NOW</a>
                        </div>
                    </div>
                </section>  
                <div class="container mt-2">
                    <div class="container">
                        <div>
                        <c:if test="${empty param.cat}">
                            <form method="post">
                                <div class="wrap">
                                    <div class="search">
                                        <input type="text" class="searchTerm" name="key" placeholder="What are you looking for?" value="${param.key}"/>
                                        <button type="submit" class="searchButton">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                                <!--<input type="submit" value="Search" class="btn-primary" style="width: 200px"/>-->
                            </form>
                        </c:if>
                    </div>
                </div>
                <section class="new_arrivals_area section_padding_100_0 clearfix">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="section_heading text-center">
                                    <h2>New Arrivals</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Start-->

                    <div class="row ">

                        <%
                            //page list
                            ProductDAO proDAO = new ProductDAO();
                            int first = 0, last = 0, pages = 1;
                            int total = 0;
                            int id_catalog = 0;
                            int numPerPage = 4;
                            int currentPage = 1;
                            ArrayList<Product> list;
                            if (request.getParameter("cat") == null) {
                                list = proDAO.getNewProduct(20);

                                String key = request.getParameter("key");
                                if (key != null) {
                                    ArrayList<Product> list1 = proDAO.searchByKey(key);
                                    if (list1.size() == 0) {
                        %>
                        <div style="color: red; text-align: center">
                            No search results found
                        </div>
                        
                        <div class="tab-content"></div>
                        <%
                                        list = proDAO.getNewProduct(15);
                                    } else
                                        list = list1;
                                } else
                                    list = proDAO.getNewProduct(15);

                            } else {
                                id_catalog = Integer.parseInt(request.getParameter("cat"));
                                if (request.getParameter("pages") != null) {
                                    pages = (int) Integer.parseInt(request.getParameter("pages"));
                                    currentPage = pages;
                                }
                                total = total = proDAO.getCount(id_catalog);
                                if (total <= numPerPage) {
                                    first = 0;
                                    last = total;
                                } else {
                                    first = (pages - 1) * numPerPage;
                                    last = numPerPage;
                                }
                                list = proDAO.getByCategory(id_catalog, first, last);
                                int categoryID = Integer.parseInt(request.getParameter("cat"));
                                if (request.getParameter("typeSort") == null) {
                                    list = proDAO.getByCategory(categoryID, first, last);
                                } else {
                                    int typeSort = Integer.parseInt(request.getParameter("typeSort"));
                                    list = proDAO.getByCategories(categoryID, first, last, typeSort);
                                }

                            }
                            for (Product item : list) {


                        %>
                        <div class="col-3 mb-5 justify-content-center">
                            <!--New Card-->
                            <div class="containers">
                                <div class="card">
                                    <div class="product-img">
                                        <a href="ProductDetail?id=<%=item.getProductId()%>">
                                            <img class="imgs" src="Images/<%=item.getImages()%>" alt="" width="300px" height="300px">
                                        </a>
                                    </div>
                                    <div class="product-detail">
                                        <span>
                                            <a href="ProductDetail?id=<%=item.getProductId()%>" style="color: #35353f; text-decoration: none">
                                                <%=item.getProductName()%>
                                            </a>                                            
                                        </span>
                                        <div class="rating">
                                             <%=item.getPrice()%>    
                                        </div>
                                        <div class="buttons">
                                            <!--                                            <div class="prices">50$</div>-->
                                            <button class="cart btns">
                                                <a href="AddCartServlet?id=<%=item.getProductId()%>" 
                                                   onMouseOut="this.style.color='#000'"
                                                   onMouseOver="this.style.color='#ff668a'" style="text-align: center; text-decoration: none">
                                                    Add to cart
                                                </a>                                                
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>

                    </div>
            </div>
            <%
                if (request.getParameter("cat") != null) {
            %>    


            <div class="container-fluid  p-1">
                <nav class="navbar navbar-expand-sm ">
                    <ul class="navbar-nav mx-auto">
                        <%
                            //button previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;
                            } else {
                                back = pages - 1;
                            }
                        %>
                        <li class="nav-item "><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=1"><i>&#60;&#60;</i></a></li>
                        <li class="nav-item "><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=<%=back%>"><i> &#60; </i></a></li>
                            <%
                                //button Number page
                                int loop = 0, num = 0;
                                if ((total / numPerPage) % 2 == 0) {
                                    num = total / numPerPage;
                                } else {
                                    num = (total + 1) / numPerPage;
                                }
                                //if total odd ++1
                                if (total % 2 != 0) {
                                    loop = (total / numPerPage) + 1;
                                } else {
                                    //if total even < fullpage and # fullPage then ++1
                                    if (total < (num * numPerPage) + numPerPage && total != num * 12) {
                                        loop = (total / numPerPage) + 1;
                                    } else {
                                        // if = fullPage then OK
                                        loop = (total / numPerPage);
                                    }
                                }
                                //loop number of pages
                                for (int i = 1; i <= loop; i++) {%>
                            <%
                                if (pages == i) {%>
                        <li class="nav-item rounded" <% if (i == currentPage)
                                    out.print("style='background-color:yellow;'");%>><span><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=<%=i%>"><%=i%></a></span></li>
                                    <%} else {%>
                        <li class="nav-item rounded" <% if (i == currentPage)
                                    out.print("style='background-color:yellow;'");%>><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=<%=i%>"><%=i%></a> </li>
                            <%}
                                }%>
                            <%//button next
                                int next = 0;
                                //if total odd
                                if (total % 2 != 0) {
                                    if (pages == (total / numPerPage) + 1) {
                                        next = pages; //not next
                                    } else {
                                        next = pages + 1;//next   
                                    }
                                } else {
                                    //if total even < fullpage and not fullpage then ++1
                                    if (total < (num * numPerPage) + numPerPage && total != num * 4) {
                                        if (pages == (total / numPerPage) + 1) {
                                            next = pages; //not next 
                                        } else {
                                            next = pages + 1; //next
                                        }
                                    }
                                }

                            %>     
                        <li class="nav-item "><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=<%=next%>${param.typeSort==null?0:param.typeSort}"><i>&#62;</i></a></li>
                        <li class="nav-item "><a class="nav-link" href="index.jsp?cat=<%=id_catalog%>&pages=<%=loop%>"><i>&#62;&#62;</i></a></li>
                    </ul>


                </nav>


            </div>

            <% }%>
            <!--End-->
        </section>
        <!-- ****** New Arrivals Area End ****** -->
        <!--  -->
        <!--  -->
        <!--  -->
        <!-- FOOTER -->
        <!-- ****** Offer Area Start ****** -->
        <section class="offer_area height-700 section_padding_100 bg-img" style="background-image: url(Images/bg-img/bg-es.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-end justify-content-end">
                    <div class="col-12 col-md-8 col-lg-6">
                        <div class="offer-content-area wow fadeInUp" data-wow-delay="1s">
                            <h2> Essentials SS2021 <span class="karl-level">New arrivals</span></h2>
                            <p>* Free shipping until 25 Dec 20</p>
                            <div class="offer-product-price">
                                <h3><span class="regular-price">$115.90</span> $65.90</h3>
                            </div>
                            <a href="#" class="btn karl-btn mt-30">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--  -->
        <!--  -->
        <!--  -->
        <jsp:include page="/footer.jsp"></jsp:include>
    </div>
    <!-- /.wrapper end -->

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
    <!--        <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647">
                <i class="fas fa-angle-up" hidden="true">::before</i>
            </a>-->
</body>

</html>