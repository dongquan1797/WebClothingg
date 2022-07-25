<%-- 
    Document   : detailsbill
    Created on : Dec 19, 2021, 12:23:31 PM
    Author     : Quan
--%>

<%@page import="com.tin.model.Bill" %>
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
                        <div class="container">
                        <c:if test="${empty requestScope.bill}">
                            <h1>The Bill is empty</h1>
                        </c:if>
                        <c:if test="${not empty requestScope.bill}">
                            <h1>Bill Detail</h1>
                            Bill ID: ${bill.billId}<br/>
                            Bill Date: ${bill.billDate}<br/>
                            Customer: ${bill.customer.customerName}<br/>
                            Staff: ${bill.staff.fullName}<br/>
                            Status: ${bill.status.statusName}<br/>
                            <c:set var="index" value="1"></c:set>
                                <table class="table">
                                    <tr>
                                        <th> No. </th>
                                        <th> Product ID </th>
                                        <th> Image </th>
                                        <th> Name </th>
                                        <th> Price(VND)</th>
                                        <th> Quantity </th>
                                        <th> Total </th>
                                    </tr>
                                <c:set var="total" value="0"></c:set>
                                <c:forEach var="b" items="${bill.lstBillDetail}">
                                    <tr>
                                        <td> ${index} </td>
                                        <td> ${b.product.productId} </td>
                                        <td> <img src="Images/${b.product.images}" width="70px"/> </td>
                                        <td> ${b.product.productName} </td>
                                        <td> ${String.format("%,d",b.product.price)} </td>
                                        <td> ${b.quantity} </td>
                                        <td> ${String.format("%,d",b.product.price*b.quantity)} </td>
                                    </tr>
                                    <c:set var="index" value="${index+1}"></c:set>
                                    <c:set var="total" value="${total+b.product.price*b.quantity}"></c:set>                        
                                </c:forEach>
                                <tr>
                                    <td colspan="5" style="text-align: right">Total Money</td>
                                    <td colspan="2" style="text-align: left; color: red">
                                        <strong>
                                            ${String.format("%,d",total)}
                                        </strong>
                                    </td>
                                </tr>
                            </table>
                        </c:if>
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
