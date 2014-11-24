<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/toastr.css" rel="stylesheet" type="text/css" />
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <title>Gestione eventi</title>
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
                        <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                        <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                        <li class="active"><a href="listaPrenotazioni.do"><spring:message code="annullaIscrizione" /></a></li>
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /> </a></li>
                    </ul>
                </div> 
                <div class="col-md-9 col-md-offset-3">
                    <c:choose>
                        <c:when test="${msgAnnullaIscrizione != null}">
                            <div class="iscrizionesucc">${msgAnnullaIscrizione}</div>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>  
                    <c:choose>
                        <c:when test="${msgEventiError != null}">
                            <div class="error"><h3>${msgEventiError}</h3></div>                
                                </c:when>
                        <c:when test="${eventi.size()>0}">
                            <h1><spring:message code="listaEventiPrenotati" /></h1>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><spring:message code="giornoEvento" /></th>
                                        <th><spring:message code="titoloEvento" /></th>
                                        <th><spring:message code="relatore" /></th>
                                        <th><spring:message code="noIscrizione" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${eventi}" var="eventi">
                                        <tr>
                                            <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${eventi.dataInizio}"  /></td>
                                            <td>${eventi.titolo}</td>
                                            <td>${eventi.relatore.nome} ${eventi.relatore.cognome}</td>
                                            <td class="centrato">
                                            <a href="annullaIscrizione.do?idEvento=${eventi.idEvento}">
                                                <img src="${pageContext.request.contextPath}/img/delete.png" />
                                            </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <div class="error"><strong><spring:message code="noIscritto" /></strong></div>
                        </c:otherwise>
                    </c:choose>  
                </div>
            </div>
        </div>
        <div class="myfooter">
            <div class="cont-footer"> ©CSPnet - Gruppo corso java - progetto Gestione Eventi </div>     
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/jquery.min.js" ></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/toastr.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastrlogin.js" ></script>
    </body>
</html>
