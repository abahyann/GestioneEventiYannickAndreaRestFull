<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <title>Home</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="myheader">
                        <img src="img/logo.png" alt="logo" class="img-logo"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 sidebar" id="menulaterale">
                    <ul class="nav nav-sidebar" id="opzionimenu">
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> <spring:message code="home" /></a></li>
                    <c:choose>
                        <c:when test="${user.profilo eq 'admin'}">
                            <li><a href="creaRelatore.do"><spring:message code="censireRelatore" /></a></li>
                            <li><a href="vaiEvento.do"><spring:message code="censireEvento" /></a></li>
                            <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                            <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>          
                        </c:when>
                        <c:otherwise>
                        <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                            <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>          
                            <li><a href="listaPrenotazioni.do"><spring:message code="annullaIscrizione" /></a></li>
                          </c:otherwise>
                    </c:choose>
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /></a></li>
                    </ul>
                </div>
            </div> 
        </div>
        <div class="myfooter">
            <div class="cont-footer"> ©CSPnet - Gruppo corso java - progetto Gestione Eventi </div>     
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery.min.js" ></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/toastr.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js" ></script>
    </body>
</html>
