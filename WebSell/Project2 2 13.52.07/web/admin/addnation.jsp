<%-- 
    Document   : addnation
    Created on : Dec 14, 2021, 5:03:01 PM
    Author     : Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        meta charset="utf-8" />
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
                            <h1 class="mt-4">Add New Nation</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Add New Nation</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-tablet-alt me-2"></i> Nation Information
                                </div>
                                <div class="card-body">
                                    <a href="${pageContext.request.contextPath}/AdminNation?action=0">Back to List</a>
                                <form action="${pageContext.request.contextPath}/AdminNation" method="post">
                                    <input type="hidden" name="action" value="1"/>
                                    <table>
                                        <tr>
                                            <td> Nation ID</td>
                                            <td>
                                                <input type="text" name="nationid" placeholder="Nation Id Auto" readonly="true" class="form-control"/>
                                            </td>                                                                    
                                        </tr>
                                        <tr>
                                            <td> Nation Name</td>
                                            <td>
                                                <input type="text" name="nationname" placeholder="Nation Name" class="form-control"/>
                                            </td>   
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center;padding: 5px">
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
            <script src="assets/demo/chart-area-demo.js"></script>
            <script src="assets/demo/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
