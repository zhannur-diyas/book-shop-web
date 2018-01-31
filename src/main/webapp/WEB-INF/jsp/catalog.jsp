<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/WEB-INF/css/jumbotron.css"/>
x`
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js">
<fmt:setBundle basename="lang"/>
<c:set var="prefix" value="${pageContext.request.contextPath}"/>
<fmt:message key="catalog.title" var="title"/>

<%--<c:set var="pageCount" value="${pageCount}"/>--%>
<%--<c:set var="bookCount" value="${bookCount}"/>--%>
<%--<c:set var="currentPage" value="${currentPage}"/>--%>
<c:set var="pageCount" value="5"/>
<c:set var="bookCount" value="30"/>
<c:set var="currentPage" value="2"/>

<t:snippet title="${title}">
    <jsp:body>

        <nav aria-label="...">
            <ul class="pagination" style="padding-left: 100px; padding-top: 200px;">
                <c:if test="${pageCount == 1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                </c:if>
                <c:if test="${pageCount != 1}">
                    <li class="page-item">
                        <a class="page-link" href="/do/?action=show-catalog-page&page=${currentPage-1}" tabindex="-1">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${currentPage}" end="${currentPage+2}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li class="page-item active">
                                <a class="page-link" href="/do/?action=show-catalog-page&page=${i}">${i}</a>
                            </li>
                        </c:when> <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="/do/?action=show-catalog-page&page=${i}">${i}</a>
                        </li>
                    </c:otherwise>
                    </c:choose>
                </c:forEach>


                <c:if test="${pageCount == 1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="/do/?action=" tabindex="+1">Next</a>
                    </li>
                </c:if>
                <c:if test="${pageCount != 1}">
                    <li class="page-item">
                        <a class="page-link" href="/do/?action=show-catalog-page&page=${currentPage+1}" tabindex="+1">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </jsp:body>
</t:snippet>

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