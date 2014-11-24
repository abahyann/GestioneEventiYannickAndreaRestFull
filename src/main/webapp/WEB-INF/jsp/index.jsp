<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/toastr.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/mystyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <spring:message code="username" var="Username"></spring:message>
        <spring:message code="password" var="Password"></spring:message>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="myheader">
                        <img src="img/logo.png" alt="logo" class="img-logo"/>
                        <div class="flags">
                        <a href="?language=it"><img class="flag" src="${pageContext.request.contextPath}/img/it.png" /></a>
                        <a href="?language=en"><img class="flag" src="${pageContext.request.contextPath}/img/en.jpg" /></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7">
                    <h1><spring:message code="creato" /></h1>
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="img/slides/marco.jpg" alt="slide1">
                            </div>
                            <div class="item">
                                <img src="img/slides/nausicaa.jpg" alt="slide2">
                            </div>
                            <div class="item">
                                <img src="img/slides/andrea.jpg" alt="slide3">
                            </div>
                            <div class="item">
                                <img src="img/slides/cristian.jpg" alt="slide4">
                            </div>
                            <div class="item">
                                <img src="img/slides/nicola.jpg" alt="slide5">
                            </div>
                            <div class="item">
                                <img src="img/slides/ilaria.jpg" alt="slide6">
                            </div>
                            <div class="item">
                                <img src="img/slides/yannick.jpg" alt="slide7">
                            </div>
                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>     
                <div class="col-md-5">
                    <h1><spring:message code="login" /></h1>
                    <form:form cssClass="form-horizontal" commandName="logInUtente" action="login.do">
                        <c:if test="${loginerrormsg != null}">
                            <div class="form-group">
                                <div class="alert alert-danger" role="alert"><strong>${loginerrormsg}</strong></div>
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">${Username}</label>
                            <div class="col-sm-8">
                                <form:input id="user" path="username" cssClass="form-control" placeholder="${Username}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">${Password}</label>
                            <div class="col-sm-8">
                                <form:password id="psw" path="password" cssClass="form-control" placeholder="${Password}"/>
                            </div> 
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-9 col-sm-3">
                                <button type="submit" class="btn btn-info" onclick="return notification.isEmpty();"><spring:message code="login" /></button>
                            </div>    
                        </div>
                    </form:form>
                    <a href="registrazione.do"><h1><spring:message code="messsaggioRegistrati" /></h1></a>
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