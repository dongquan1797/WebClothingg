<%-- 
    Document   : addproduct
    Created on : Dec 16, 2021, 4:25:34 PM
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
        <script src="${pageContext.request.contextPath}/admin/ckeditor/ckeditor.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <!--Awesome-->       
        <link href="Awesome/Font-Awesome-master/css/all.css" rel="stylesheet" type="text/css"/>
        <link href="Awesome/Font-Awesome-master/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div id="layoutSidenav">
            <jsp:include page="menuAdmin.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">AddNew Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Add New Product</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-tablet-alt me-2"></i> Product Information
                                </div>
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/AdminProduct?action=0">Back to List</a>
                                <form action="${pageContext.request.contextPath}/AdminProduct" method="post" enctype="multipart/form-data">
                                    <input type="hidden" value="2" name="action"/>
                                    <table>
                                        <tr>
                                            <td> Product ID </td>
                                            <td>
                                                <input type="text" name="ProductID" id="ProductID" placeholder="ID Auto" class="form-control" readonly="true"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Name </td>
                                            <td>
                                                <input type="text" name="ProductName" id="ProductName" placeholder="Product Name" class="form-control"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Description </td>
                                            <td>
                                                <textarea rows="10" cols="70" name="Description" id="ckeditor" placeholder="Description" class="form-control"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Date of Manufacturer</td>
                                            <td>
                                                <input type="date" name="DateOfManufacturer" class="form-control"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Category </td>
                                            <td>
                                                <select name="cateID" class="form-select">
                                                    <c:forEach var="c" items="${lstCategory}">
                                                        <option value="${c.categoryID}">${c.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Manufacturer</td>
                                            <td>
                                                <select name="manuID" class="form-select">
                                                    <c:forEach var="m" items="${lstManufacturer}">
                                                        <option value="${m.manufacturerId}">${m.manufacturerName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Price </td>
                                            <td>
                                                <input type="text" name="Price" class="form-control" placeholder="Price"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> Images </td>
                                            <td>
                                                <input type="file" name="Images" class="form-control"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center; padding: 5px">
                                                <input type="submit" value="Add New" class="btn-primary"/>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="footerAdmin.jsp"></jsp:include>
            </div>
        </div>
        <script>
            CKEDITOR.replace('ckeditor');
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
