<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrazione</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/toastr.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/mystyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="myheader">
                        <img src="img/logo.png" alt="logo" class="img-logo"/>
                        <div class="home-logout">
                            <a href="index.do"><span><spring:message code="returnLogin" /></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1><spring:message code="messsaggioRegistrati" /></h1>
                    <form:form commandName="utenteRegistrati" action="registrati.do" class="form-horizontal">
                        <c:if test="${registrazioneErrorMsg != null}">
                            <div class="form-group">
                                <div class="alert alert-danger" role="alert"><strong>${registrazioneErrorMsg}</strong></div>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><spring:message code="username" /></label>
                            <div class="col-sm-8">
                                <form:input id="user" path="username" cssClass="form-control" placeholder="username"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><spring:message code="password" /></label>
                            <div class="col-sm-8">
                                <form:password id="psw" path="password" cssClass="form-control" placeholder="password"/>
                            </div> 
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-8 col-sm-4">
                                <button type="submit" class="btn btn-info" onclick="return notification.isEmpty();"><spring:message code="messsaggioRegistrati" /></button>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/toastrAuth.js" ></script>
    </body>
</html>
