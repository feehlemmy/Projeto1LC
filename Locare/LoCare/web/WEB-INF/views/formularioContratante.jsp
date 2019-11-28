<%-- 
    Document   : formulario
    Created on : 20/06/2018, 21:54:52
    Author     : gabriel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/styleCadastro.css"/>
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>">
        <title>Cadastro Contratante</title>
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
                    <div class="card-header">Cadastre-se para contratar</div>
                    <div class="card-body">
                        <form  id="FormCadastro" role="form" method="post">
                            <div class="form-group">
                                <input type="text" name="nome" id="name" class="form-control input-lg" placeholder="Nome Completo" value="${pessoa.nome}" tabindex="1">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email" tabindex="2" value="${pessoa.email}">
                            </div>

                            <div class="form-group">
                                <input type="password" name="senha" id="password" value="${pessoa.senha}" class="form-control input-lg" placeholder="Senha" tabindex="3" required minlength="8">
                            </div>

                            <div class="form-group">
                                <input type="password" name="senha_confirmacao"  id="confirm_password" class="form-control input-lg" placeholder="Confirme sua senha" tabindex="4" required minlength="8">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" tabindex="5">Registar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="/Resources/js/jquery-3.3.1.slim.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/bootstrap.min.js"/>"></script>
        <script>
            var password = document.getElementById("password"), 
                confirm_password = document.getElementById("confirm_password");

            function validatePassword(){
                if(password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("Senhas diferentes");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        </script>
    </body>
</html>
