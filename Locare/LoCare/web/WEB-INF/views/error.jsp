<%-- 
    Document   : error
    Created on : 08/09/2018, 19:16:39
    Author     : felipeleme
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/styleError.css"/>
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>"/>
        <title>Ops</title>
    </head>
    <body>
        <div class="first_text">
        <h1>Desculpe o transtorno</h1>
        </div>
        <div class="second_text">
        <h2 > Não conte pra ninguém, mas estamos com problemas!</h2>
        </div>
        <div class="button_Home">
            <a class="btn btn-outline-primary" href="<c:url value="/"/>">Home</a>
        </div>
        
        <script src="<c:url value="/Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/bootstrap.min.js"/>"></script>
        
    </body>
</html>
