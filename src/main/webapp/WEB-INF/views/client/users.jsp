<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
    <jsp:include page="/WEB-INF/views/client/includes/headerIncludes.jsp" flush="false" />
</head>
<body class="">
<jsp:include page="/WEB-INF/views/client/includes/topNavInclude.jsp" flush="true" >
    <jsp:param name="firstLast" value="${firstLast}" />
    <jsp:param name="accountName" value="${accountName}" />
    <jsp:param name="accountType" value="${accountType}" />
    <jsp:param name="accountCreated" value="${accountCreated}" />
</jsp:include>
<!-- BEGIN CONTENT -->
<div class="page-container row-fluid">
    <jsp:include page="/WEB-INF/views/client/includes/sideMenuInclude.jsp" flush="false" />
    <!-- BEGIN PAGE CONTAINER-->
    <div class="page-content">
        <div class="content">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <c:if test="${not empty message}">
                    <div class="alert alert-success">
                        <c:out value="${message}" />
                    </div>
                </c:if>
                <h3>Users</h3>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="grid simple ">
                        <div class="grid-body">
                            <table class="table table-striped" >
                                <thead>
                                <tr>
                                    <th>Email / User Name</th>
                                    <th>Name</th>
                                    <th>Status</th>
                                    <th>Role(s)</th>
                                    <th>Created</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="clientUserItemObject" items="${clientUserItemObjects}">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${isAccountAdmin}">
                                                <td><a href="/client/editUser?uId=${clientUserItemObject.uId}"><c:out value="${clientUserItemObject.email}" /></a></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><c:out value="${clientUserItemObject.email}" /></td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td><c:out value="${clientUserItemObject.name}" /></td>
                                        <td><c:out value="${clientUserItemObject.status}" /></td>
                                        <td><c:out value="${clientUserItemObject.roles}" /></td>
                                        <td><fmt:formatDate value="${clientUserItemObject.created}" pattern="dd MMM yyyy"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${isAccountAdmin}" >
                                <div>
                                    <br>
                                    <a href="/client/addUser"><button type="button" class="btn btn-primary btn-xs btn-mini">Add New User</button></a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END PAGE CONTAINER -->
</div>
<!-- END CONTENT -->
<jsp:include page="/WEB-INF/views/client/includes/footerIncludes.jsp" flush="false" />
</body>
</html>