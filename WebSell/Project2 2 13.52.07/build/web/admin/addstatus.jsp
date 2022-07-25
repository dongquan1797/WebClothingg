<%-- 
    Document   : addstatus
    Created on : Dec 17, 2021, 12:43:36 PM
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
                    <h1 class="mt-4">Add New Status</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Add New Status</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-tablet-alt me-2"></i> Status Information
                        </div>
                        <div class="card-body">
                            <a href="${pageContext.request.contextPath}/AdminStatus?action=0">Back to list</a>
                        <form method="post" action="${pageContext.request.contextPath}/AdminStatus">
                            <input type="hidden" value="1" name="action"/>
                            <table>
                                <tbody>
                                    <tr>
                                        <td> Status ID </td>
                                        <td>
                                            <input type="text" name="staID" class="form-control" readonly="true" placeholder="Status ID Auto"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Status Name </td>
                                        <td>
                                            <input type="text" name="staName" class="form-control" placeholder="Status Name"/>
                                        </td>
                                    </tr>
                                    <tr>                                        
                                        <td colspan="2" style="text-align: center">
                                            <input type="submit" class="btn-primary" value="Add New"/>
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
