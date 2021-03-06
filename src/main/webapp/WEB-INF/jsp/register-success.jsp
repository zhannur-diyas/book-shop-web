<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setBundle basename="lang"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inputform.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/loader.css"/>
<link rel="stylesheet" href="https://getbootstrap.com/docs/3.3/dist/css/bootstrap.min.css">

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="refresh" content="2; url=/do/?action=show-login-page">

    <title><fmt:message key="register.success.title"/></title>
</head>

<body class="text-center">
<div class="cssload-container">
    <h1 class="h3 mb-3 font-weight-normal"><fmt:message key="register.success.message"/></h1>
    <div class="cssload-speeding-wheel"></div>
</div>
</body>
</html>
