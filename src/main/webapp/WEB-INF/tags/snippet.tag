<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="ctg" uri="customtags" %>

<%@tag description="generic page snippet" pageEncoding="UTF-8" %>

<fmt:setBundle basename="lang"/>

<%@attribute name="title" type="java.lang.String" required="true" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<c:set var="prefix" value="${pageContext.request.contextPath}"/>
<c:set var="role" value="${sessionScope.user.role}"/>
<c:set var="USER" value="USER"/>
<c:set var="MANAGER" value="MANAGER"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
</head>
<body>
<div class="header">
    <jsp:invoke fragment="header"/>
    <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="${prefix}/do/?action=show-home-page">book-shop</a>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${prefix}/do/?action=show-catalog-page"><fmt:message
                            key="catalog.message"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${prefix}/do/?action=show-about-page"><fmt:message
                            key="about.message"/></a>
                </li>

                <c:if test="${not empty sessionScope.user.login}">
                    <li class="nav-item">
                        <a class="nav-link" href="${prefix}/do/?action=show-profile-page"><fmt:message
                                key="profile.message"/> </a>
                    </li>
                </c:if>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a style="text-decoration: none"
                                                                                      href="${prefix}/do/?action=show-login-page">
                    <fmt:message key="signin.message"/></a></button>
            </form>
        </div>
    </nav>
</div>

<div id="content">
    <jsp:doBody/>
</div>

<div class="footer">
    <jsp:invoke fragment="footer"/>
    <div class="container">
        <hr>
        <footer>
            <p>&copy; book-shop-web 2017</p>
        </footer>
    </div>
</div>
</body>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

</html>