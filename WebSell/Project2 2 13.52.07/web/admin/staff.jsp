<%-- 
    Document   : staff
    Created on : Dec 16, 2021, 11:23:12 PM
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
                            <h1 class="mt-4">Staff Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">List of Staff</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i> List of Staff
                                </div>
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/admin/addstaff.jsp">Add New Staff</a>
                                <table id="datatablesSimple" style="text-align: center">                            
                                    <thead>
                                        <tr>
                                            <th> No. </th>
                                            <th> Id </th>
                                            <th> Name </th>
                                            <th> Date of Birth </th>
                                            <th> Gender </th>
                                            <th> Address </th>
                                            <th> Phone </th>
                                            <th> User </th>
                                            <th> Password </th>
                                            <th> Admin </th>
                                            <th> Update </th>
                                            <th> Delete </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="index" value="1"></c:set>
                                        <c:forEach var="s" items="${lstStaff}">
                                            <tr>
                                                <td> ${index} </td>
                                                <td> ${s.staffId} </td>
                                                <td> ${s.fullName} </td>
                                                <td> ${s.dateOfBirth} </td>
                                                <td> 
                                                <c:choose>
                                                        <c:when test="${s.gender==true}">
                                                             Male
                                                        </c:when>    
                                                        <c:otherwise>
                                                            Female
                                                        </c:otherwise>
                                                </c:choose>
                                                </td>
                                                <td> ${s.address} </td>
                                                <td> ${s.phone} </td>
                                                <td> ${s.userName} </td>
                                                <td> ${s.passWord} </td>
                                                <td> ${s.admin} </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/AdminStaff?action=2&id=${s.staffId}">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/AdminStaff?action=3&id=${s.staffId}" onclick="return confirm('Are you want to delete ${s.fullName}?')">
                                                        <i class="far fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                                <c:set var="index" value="${index+1}"></c:set>
                                                </tr>
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
<!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>-->
    </body>
</html>
