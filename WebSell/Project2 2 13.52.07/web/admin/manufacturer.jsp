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
        <script src="${pageContext.request.contextPath}/admin/js/myjs.js" type="text/javascript"></script>
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
                            <h1 class="mt-4">Manufacturer Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">List of Manufacturer(AddNew, Update, Delete)</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i> List of Manufacturer
                                </div>
                            </div>
                            <div class="dataTable-dropdown">
                                <form name="myform" method="post">
                                    <input type="hidden" value="${pageContext.request.contextPath}/AdminManufacturer?action=0&id=" id="path"/>
                                <label>
                                    Nation
                                    <select class="dataTable-selector" id="cateId" onchange="sendData();">
                                        <option value="0">No Selected</option>
                                        <c:forEach var="n" items="${lstNation}">
                                            <option value="${n.nationId}" ${param.id==n.nationId?"selected='selected'":""}>
                                                ${n.nationName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>                            
                            </form>
                            <div class="card-body">
                                <a href="${pageContext.request.contextPath}/AdminManufacturer?action=1">Add New Product</a>
                                <table id="datatablesSimple" style="text-align: center">
                                    <thead>
                                        <tr>
                                            <th> No. </th>
                                            <th> Id </th>
                                            <th> Name </th>
                                            <th> Nation </th>
                                            <th> Update </th>
                                            <th> Delete </th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set value="1" var="index"></c:set>
                                        <c:forEach var="m" items="${lstManufacturer}">
                                            <tr>
                                                <td> ${index}</td>
                                                <td> ${m.manufacturerId} </td>                                                
                                                <td> ${m.manufacturerName} </td>
                                                <td> ${m.nation.nationName} </td>                                                
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/AdminManufacturer?action=3&id=${m.manufacturerId}">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/AdminManufacturer?action=5&id=${m.manufacturerId}" onclick="return confirm('Do you want to delete ${m.manufacturerName}?')">
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
