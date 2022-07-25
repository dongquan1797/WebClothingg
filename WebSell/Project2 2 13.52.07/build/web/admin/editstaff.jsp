<%-- 
    Document   : editstaff
    Created on : Dec 17, 2021, 12:18:54 AM
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
                            <h1 class="mt-4">Edit Staff</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Edit Staff</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-tablet-alt me-2"></i> Staff Information
                                </div>
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/admin/AdminStaff?action=0">Back to List</a>
                                <form action="${pageContext.request.contextPath}/admin/AdminStaff">
                                    <input type="hidden" name="action" value="4"/>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td> Staff ID </td>
                                                <td>
                                                    <input type="text" name="staffID" readonly="true" value="${staff.staffId}" class="form-control" placeholder="Staff ID Auto"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Name </td>
                                                <td>
                                                    <input type="text" name="staffName" value="${staff.fullName}" class="form-control" placeholder="Staff Name"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Date of Birth </td>
                                                <td>
                                                    <input type="date" name="dates" value="${staff.dateOfBirth}" class="form-control" placeholder="Date"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Gender </td>
                                                <td>
                                                    <!--<input type="text" name="gender" value="${staff.gender}" class="form-control" placeholder="Gender"/>-->
                                                    <select name="gender" >
                                                            <option value="true"  <c:if test="${staff.gender == true}"> selected </c:if>>Male</option>
                                                            <option value="false"  <c:if test="${staff.gender == false}"> selected </c:if>>Female</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Address </td>
                                                <td>
                                                    <input type="text" name="address" value="${staff.address}" class="form-control" placeholder="Address"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Phone </td>
                                                <td>
                                                    <input type="text" name="phone" value="${staff.phone}" class="form-control" placeholder="Phone"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> User </td>
                                                <td>
                                                    <input type="text" name="user" value="${staff.userName}" class="form-control" placeholder="Username"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Password </td>
                                                <td>
                                                    <input type="text" name="pass" value="${staff.passWord}" class="form-control" placeholder="Password"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> Admin </td>
                                                <td>
                                                    <input type="text" name="admin" value="${staff.admin}" class="form-control" placeholder="Admin"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center; padding: 5px">
                                                    <input type="submit" value="Update" class="btn-primary"/>
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

