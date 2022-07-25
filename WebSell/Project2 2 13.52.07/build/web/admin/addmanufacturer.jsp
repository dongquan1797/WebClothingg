<%-- 
    Document   : manufacturer
    Created on : Dec 15, 2021, 3:47:55 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tin.model.*" %>
<%@page import="com.tin.dao.*" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <h1 class="mt-4">Add New Manufacturer</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Add New Manufacturer</li>
                            </ol>
                            <div class="card mb-4"?>
                                <div class="card-header">
                                    <i class="fas fa-tablet-alt me-2"></i> Manufacturer Information
                                </div>
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/AdminManufacturer?action=0">Back to List</a>
                                <form method="post" action="${pageContext.request.contextPath}/AdminManufacturer">
                                    <input type="hidden" name="action" value="2"/>
                                    <table style="text-align: center">
                                        <tbody>
                                            <tr>
                                                <td> Manufacturer ID </td>
                                                <td>
                                                    <input type="text" name="maId" placeholder="Manufacturer ID Auto" readonly="true" class="form-control"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Manufacturer Name </td>
                                                <td>
                                                    <input type="text" class="form-control" name="maName" placeholder="Manufacturer Name" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Nation Name</td>
                                                <td>                                                    
                                                     <select name="naName" class="form-select">
                                                    <c:forEach var="n" items="${lstNation}">
                                                        <option value="${n.nationId}">${n.nationName}</option>
                                                    </c:forEach>
                                                </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;padding: 5px">
                                                    <input type="submit" value="Add New" class="btn-primary"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
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
