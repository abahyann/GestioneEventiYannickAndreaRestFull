<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <title>Registrazione relatore</title>
    </head>
    <body>
        <spring:message code="nome" var="Nome"></spring:message>
        <spring:message code="cognome" var="Cognome"></spring:message>
        <spring:message code="titoloStudio" var="TitoloStudio"></spring:message>
        <spring:message code="email" var="Email"></spring:message>
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
                        <li class="active"><a href="#"><spring:message code="censireRelatore" /></a></li>
                        <li><a href="vaiEvento.do"><spring:message code="censireEvento" /></a></li>
                        <li><a href="eventiFuturi.do"><spring:message code="visualizzaEventiFuturi" /></a></li>
                        <li><a href="eventiPassati.do"><spring:message code="visualizzaEventiPassati" /></a></li>          
                        <li class="nav-divider"></li>
                        <li><a id="nero" href="logout.do"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="logout" /> </a></li>
                    </ul>
                </div>
                <div class="col-md-9 col-md-offset-4">
                    <h1><spring:message code="registraRelatore" /></h1>
                    <form:form commandName="relatoreRegistrati" action="crea.do" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="nome" class="col-sm-4 control-label">${Nome}</label>
                            <div class="col-sm-8">
                                <form:input path="nome" class="form-control" placeholder="${Nome}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="cognome" class="col-sm-4 control-label">${Cognome}</label>
                            <div class="col-sm-8">
                                <form:input path="cognome" class="form-control" placeholder="${Cognome}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="titolodistudio" class="col-sm-4 control-label">${TitoloStudio}</label>
                            <div class="col-sm-8">
                                <form:input path="titoloStudio" class="form-control" placeholder="${TitoloStudio}"/>
                            </div>
                        </div>
                        <div class="form-group">   
                            <label for="email" class="col-sm-4 control-label">${Email}</label>
                            <div class="col-sm-8">
                                <form:input path="email" class="form-control" placeholder="${Email}"/>
                            </div>
                        </div>    
                        <div class="form-group">
                            <div class="col-sm-offset-9 col-sm-3">
                                <button type="submit" class="btn btn-info"><spring:message code="crea" /></button>
                            </div>
                        </div>
                    </form:form>
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
