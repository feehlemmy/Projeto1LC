<%-- 
    Document   : preCadastro
    Created on : 01/10/2018, 16:56:23
    Author     : gabrielsilva
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/StyleConfirmarEmail.css"/>
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>">
        <title>LoCare</title>
    </head>
    
    <body>
        <section>
            <nav class="navbar nav-edit navbar-expand-lg navbar-light bg-light fixed-top" >
                <div class="container-fluid">
                    <a class="navbar-brand js-scroll-trigger" href="<c:url value="/"/>"><img src="/LoCare/Resources/img/logo.png" width="50" height="45" alt="LoCare"></a>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fa fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">   
                            <li class="nav-item">
                                <a class="btn btn-outline-primary" href="<c:url value="/login"/>">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav> <!-- Fim do Menu -->
        </section>
        
        <div class="container align-self-center d-flex justify-content-center">
            <div class="container-fluid" id="box">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-header">Obrigado!</div>
                    <div class="card-body">
                        <h3>Obrigado por se cadastrar no <strong>LoCare</strong>!</h3>
                        <p>Por favor, confirme seu cadastro através do link enviado para o seu e-mail.</p>
                    </div>
                </div>
            </div>
        </div>                   
    
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="/Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>
