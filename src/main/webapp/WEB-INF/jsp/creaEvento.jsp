<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crea Evento</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
        <link href="${pageContext.request.contextPath}/css/toastr.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/mystyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <spring:message code="titolo" var="Titolo"></spring:message>
        <spring:message code="desc" var="Descrizione"></spring:message>
        <spring:message code="loc" var="Location"></spring:message>
        <spring:message code="desc" var="Descrizione"></spring:message>
        <spring:message code="dataIni" var="DataInizio"></spring:message>
        <spring:message code="dataFin" var="DataFine"></spring:message>
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
                        <li class="active"><a href="vaiEvento.do"><spring:message code="censireEvento" /></a></li>
                        <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                        <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /> </a></li>
                    </ul>
                </div> 
                
                <div class="col-md-9 col-md-offset-4">
                    <c:choose>
                        <c:when test="${msgCreaEventoError != null}">
                            <h1>${msgCreaEventoError}</h1>
                        </c:when>
                        <c:when test="${listaRelatori.size() > 0}">
                            <h1><spring:message code="registraEvento" /></h1>
                            <form:form cssClass="form-horizontal" commandName="registraEvento" action="creaEvento.do"> 
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">${Titolo}</label>
                                    <div class="col-sm-8">
                                        <form:input id="titolo" path="titolo" cssClass="form-control" placeholder="${Titolo}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">${Descrizione}</label>
                                    <div class="col-sm-8">
                                        <form:input id="descrizione" path="descrizione" cssClass="form-control" placeholder="${Descrizione}" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">${Location}</label>
                                    <div class="col-sm-8">
                                        <form:input id="location" path="location" cssClass="form-control" placeholder="${Location}" />
                                    </div>   
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">${DataInizio}</label>
                                    <div class="col-sm-8">
                                        <form:input id="dataInizio" path="dataInizio" cssClass="form-control" placeholder="dd-MM-yyyy hh:mm"/>
                                    </div>   
                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">${DataFine}</label>
                                    <div class="col-sm-8">
                                        <form:input id="dataFine" path="dataFine" cssClass="form-control" placeholder="dd-MM-yyyy hh:mm" />
                                    </div>   
                                </div> 
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-11">
                                        <form:select cssClass="form-control" path="relatore.idRelatore" items="${listaRelatori}" />
                                    </div>    
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-8 col-sm-4">
                                        <button type="submit" class="btn btn-info" onclick="return controllo.verificaEvento();">Crea</button>
                                    </div>
                                </div>   
                            </form:form>
                        </c:when>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastrCreaEvento.js" ></script>
    </body>
</html>
