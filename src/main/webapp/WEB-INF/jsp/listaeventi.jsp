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
        <title>
            <c:choose>
                <c:when test="${listaEventiFuturi != null}">
                    <spring:message code="eventiFuturi" />
                </c:when>
                <c:otherwise>
                    <spring:message code="eventiPassati" />
                </c:otherwise>
            </c:choose>
        </title>
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
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span> <spring:message code="home" /></a></li>
                            <c:choose>
                                <c:when test="${user.profilo eq 'admin'}">
                                <li><a href="creaRelatore.do"><spring:message code="censireRelatore" /></a></li>
                                <li><a href="vaiEvento.do"><spring:message code="censireEvento" /></a></li>
                                <c:choose>
                                        <c:when test="${listaEventiFuturi != null}">
                                            <li class="active"><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                                            <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                                            <li class="active"><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                                        </c:otherwise>
                                </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${listaEventiFuturi != null}">
                                            <li class="active"><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                                            <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                                            <li class="active"><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li><a href="listaPrenotazioni.do"><spring:message code="annullaIscrizione" /></a></li>
                                </c:otherwise>
                            </c:choose>
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /> </a></li>
                    </ul>
                </div>                
                <div class="col-md-9 col-md-offset-3"> 
                    <c:choose>
                        <c:when test="${msgEventiError != null}">
                            <h3>${msgEventiError}</h3>                
                        </c:when>
                        <c:when test="${listaEventiFuturi != null && listaEventiFuturi.size() == 0}">
                            <div class="error"><strong><spring:message code="noEventiProg" /></strong></div>                
                        </c:when>
                        <c:when test="${listaEventiPassati != null && listaEventiPassati.size() == 0}">
                            <div class="error"><strong><spring:message code="noEventiPassati" /></strong></div>                
                        </c:when>
                        <c:when test="${listaEventiFuturi.size() > 0}">
                            <h1><spring:message code="listaEventiFuturi" /></h1>
                            <table class="table table-bordered">
                                <thead class="centrato">
                                    <tr>
                                        <th><spring:message code="titolo" /></th>
                                        <th><spring:message code="descrizione" /></th>
                                        <th><spring:message code="location" /></th>
                                        <th><spring:message code="dataInizio" /></th>
                                        <th><spring:message code="dataFine" /></th>
                                        <th><spring:message code="relatore" /></th>
                                        <c:if test="${user.profilo eq 'user'}">
                                            <th><spring:message code="iscriviti" /></th>
                                        </c:if>
                                        <c:if test="${user.profilo eq 'admin'}">
                                            <th><spring:message code="visualizzaPartecipanti" /></th>
                                        </c:if>
                                    </tr>
                                </thead>    
                                <c:forEach items="${listaEventiFuturi}" var="eventiFuturi">
                                    <tr>
                                        <td>${eventiFuturi.titolo}</td>
                                        <td>${eventiFuturi.descrizione}</td>
                                        <td>${eventiFuturi.location}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${eventiFuturi.dataInizio}" /></td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${eventiFuturi.dataFine}" /></td>
                                        <td>${eventiFuturi.relatore.nome} ${eventiFuturi.relatore.cognome}</td>
                                        <c:if test="${user.profilo eq 'user'}">
                                            <td class="centrato">
                                                <a href="${pageContext.request.contextPath}/iscrizione.do?idEvento=${eventiFuturi.idEvento}">
                                                    <img src="${pageContext.request.contextPath}/img/iscriviti.png" />
                                                </a>
                                            </td>
                                        </c:if>
                                        <c:if test="${user.profilo eq 'admin'}">
                                            <td class="centrato">
                                                <a href="${pageContext.request.contextPath}/visualizzaPartecipanti.do?idEvento=${eventiFuturi.idEvento}">
                                                    <img class="lista" src="${pageContext.request.contextPath}/img/lista.png" />
                                                </a>
                                            </td>
                                        </c:if>
                                    </tr> 
                                </c:forEach>
                            </table>
                            <c:choose>
                                <c:when test="${messaggioIscrizione != null}">
                                    <div class="iscrizionesucc">${messaggioIscrizione}</div>
                                </c:when>
                                <c:otherwise></c:otherwise>
                            </c:choose>   
                        </c:when>
                        <c:otherwise>
                            <h1><spring:message code="listaEventiPassati" /></h1>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><spring:message code="titolo" /></th>
                                        <th><spring:message code="descrizione" /></th>
                                        <th><spring:message code="location" /></th>
                                        <th><spring:message code="dataInizio" /></th>
                                        <th><spring:message code="dataFine" /></th>
                                        <th><spring:message code="relatore" /></th>
                                            <c:if test="${user.profilo eq 'admin'}">
                                            <th><spring:message code="visualizzaPartecipanti" /></th>
                                            </c:if>
                                    </tr>
                                </thead>
                                <c:forEach items="${listaEventiPassati}" var="eventiPassati">   
                                    <tr>
                                        <td>${eventiPassati.titolo}</td>
                                        <td>${eventiPassati.descrizione}</td>
                                        <td>${eventiPassati.location}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${eventiPassati.dataInizio}" /></td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${eventiPassati.dataFine}" /></td>
                                        <td>${eventiPassati.relatore.nome} ${eventiPassati.relatore.cognome}</td>
                                        <c:if test="${user.profilo eq 'admin'}">
                                            <td class="centrato">
                                                <a href="${pageContext.request.contextPath}/visualizzaPartecipanti.do?idEvento=${eventiPassati.idEvento}">
                                                    <img class="lista" src="${pageContext.request.contextPath}/img/lista.png" />
                                                </a>
                                            </td>
                                        </c:if>
                                    </tr>   
                                </c:forEach>
                            </table>
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
