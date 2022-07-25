<%-- 
    Document   : product
    Created on : Dec 16, 2021, 3:04:03 PM
    Author     : Quan
--%>

<%@page import="com.tin.model.Product" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Administrator</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/admin/js/myjs.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <!--Awesome-->       
        <link href="Awesome/Font-Awesome-master/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="Awesome/Font-Awesome-master/css/all.min.css" rel="stylesheet" type="text/css"/>
        <style>
            th {
                border: 1px solid #000;
                border-collapse: collapse;
            }
            td {
                border: 1px solid #000;
                border-collapse: collapse;
                padding: 2px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div id="layoutSidenav">
            <jsp:include page="menuAdmin.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Product Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">List of Product(AddNew, Update, Delete)</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i> List of Product
                                </div>
                            </div>
                            <div class="dataTable-dropdown">
                                <form name="myform" method="post">
                                    <input type="hidden" value="${pageContext.request.contextPath}/AdminProduct?action=0&id=" id="path"/>
                                <label>
                                    Category
                                    <select class="dataTable-selector" id="cateId" onchange="sendData();">
                                        <option value="0">No Selected</option>
                                        <c:forEach var="cate" items="${lstCategory}">
                                            <option value="${cate.categoryID}" ${param.id==cate.categoryID?"selected='selected'":""}>
                                                ${cate.categoryName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>                            
                            </form>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/AdminProduct?action=1">Add New Product</a>
                                <table id="datatablesSimple" style="text-align: center">
                                    <thead>
                                        <tr>
                                            <th> No. </th>
                                            <th> ProID </th>
                                            <th> Image </th>
                                            <th> Name </th>
                                            <th> Date of Manufacturer</th>
                                            <th> Category </th>
                                            <th> Manufacturer </th>
                                            <th> Price(VND) </th>
                                            <th> Update </th>
                                            <th> Delete </th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="index" value="1"></c:set>
                                        <c:forEach var="p" items="${lstProduct}">
                                            <tr>
                                                <td> ${index}</td>
                                                <td> ${p.productId} </td>
                                                <td> <img src="${pageContext.request.contextPath}/Images/${p.images}" width="50px"> </td>
                                                <td> ${p.productName} </td>
                                                <td> ${p.dateOfManufacturer} </td>
                                                <td> ${p.category.categoryName} </td>
                                                <td> ${p.manufacturer.manufacturerName} </td>
                                                <td> ${String.format("%,d",p.price)} </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/AdminProduct?action=3&proid=${p.productId}">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/AdminProduct?action=5&proid=${p.productId}" onclick="return confirm('Do you want to delete ${p.productName}?')">
                                                        <i class="far fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <c:set var="index" value="${index+1}"></c:set>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="footerAdmin.jsp"></jsp:include>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
