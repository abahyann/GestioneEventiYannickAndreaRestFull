<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <title>Lista partecipanti</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
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
                        <li><a href="home.do"><span class="glyphicon glyphicon-home"></span> <spring:message code="home" /></a></li>
                        <li><a href="creaRelatore.do"><spring:message code="censireRelatore" /></a></li>
                        <li><a href="vaiEvento.do"><spring:message code="censireEvento" /></a></li>
                        <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                        <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /> </a></li>
                    </ul>
                </div>                
                <div class="col-md-9 col-md-offset-3">    
                    <c:choose>
                        <c:when test="${utentiPartecipanti.size() > 0}">
                            <h1><spring:message code="listaPartecipanti"/></h1>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><spring:message code="username"/></th>
                                        <th><spring:message code="profilo"/></th>
                                    </tr>
                                </thead>    
                                <c:forEach items="${utentiPartecipanti}" var="utentiPartecipanti">
                                    <tr>
                                        <td>${utentiPartecipanti.username}</td>
                                        <td>${utentiPartecipanti.profilo}</td>
                                    </tr> 
                                </c:forEach>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <div class="errorlungo"><spring:message code="noPartecipantievento"/></div>
                        </c:otherwise>    
                    </c:choose>
                </div>
            </div>    
        </div>
        <div class="myfooter">
            <div class="cont-footer"> ©CSPnet - Gruppo corso java - progetto Gestione Eventi </div>     
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery.min.js" ></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js" ></script>
    </body>
</html>
