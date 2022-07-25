<%-- 
    Document   : bill
    Created on : Dec 18, 2021, 8:05:46 PM
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
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <div id="layoutSidenav">
            <jsp:include page="menuAdmin.jsp"></jsp:include>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Bill Management</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">List of Bill (Processing)</li>
                            </ol>
                            <div class="container">
                            <c:if test="${empty requestScope.lstBill}">
                                <h1>Bill is empty</h1>
                            </c:if>
                            <c:if test="${not empty requestScope.lstBill}">
                                <h1>Processing Bill</h1>
                                <c:set var="index" value="1"></c:set>
                                    <table class="table">
                                        <tr>
                                            <th> No. </th>
                                            <th> Bill ID </th>
                                            <th> Date </th>
                                            <th> Customer </th>
                                            <th> Staff </th>
                                            <th> Status </th>
                                            <th> Action </th>
                                        </tr>
                                    <c:set var="index" value="1"></c:set>
                                    <c:forEach var="b" items="${requestScope.lstBill}">
                                        <tr>
                                            <td> ${index} </td>
                                            <td> ${b.billId} </td>
                                            <td> ${b.billDate} </td>
                                            <td> ${b.customer.customerName} </td>
                                            <td> ${b.staff.fullName} </td>
                                            <td> ${b.status.statusName} </td>    
                                            <td>
                                                <c:if test="${sessionScope.adminUser.admin==false}">
                                                    <c:if test="${b.status.statusId<4}">
                                                        <a href="${pageContext.request.contextPath}/AdminBill?action=1&id=${b.billId}">
                                                            Process
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${b.status.statusId>3}">
                                                        <a href="${pageContext.request.contextPath}/AdminBill?action=2&id=${b.billId}">
                                                            Details
                                                        </a>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${sessionScope.adminUser.admin}">
                                                    <a href="${pageContext.request.contextPath}/AdminBill?action=1&id=${b.billId}" style="text-decoration: none">
                                                        Process 
                                                        <span style="color: #000">|</span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/AdminBill?action=4&id=${b.billId}" style="text-decoration: none" onclick="return confirm('Do you want to delete?')">
                                                        Delete
                                                    </a> 
                                                </c:if>
                                            </td>
                                        </tr>
                                        <c:set var="index" value="${index+1}"></c:set>
                                    </c:forEach> 
                                </table>
                            </c:if>
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
