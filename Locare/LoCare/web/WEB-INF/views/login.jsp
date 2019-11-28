<%-- 
    Document   : loginCliente
    Created on : 10/09/2018, 16:21:31
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
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/styleDashboard.css"/>
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/sb-admin.css"/>
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/Resources/css/all.min.css"/>">

        <title>Login Lo Care</title>
    </head>
    <body>
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" class="form-control" name="usuario" placeholder="Email address" required="true" autofocus="autofocus">
                                <label for="inputEmail">E-mail</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-label-group">
                                <input type="password" id="inputPassword" class="form-control" name="senha" placeholder="Password" required="true" minlength="8">
                                <label for="inputPassword">Senha</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="remember-me">
                                    Lembrar senha
                                </label>
                            </div>
                        </div>
                        <div class="input-field col s5">
                            <script>
                                var variaveis = location.search.split("?");
                                var quebra = variaveis[1].split("=");
                                if (quebra[1] == "1") {
                                    document.writeln("<b style='color:red'>Usuário ou senha inválidos.</b>");
                                } else if (quebra[1] == "2") {
                                    document.writeln("<b style='color:red'>Sua sessão expirou.</b>");
                                }
                            </script>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <label style="position: relative; left: 50%; transform: translate(-50%);">Você é:</label>
                            </div>
                            <div class="btn-group btn-group-toggle" data-toggle="buttons" style="position: relative; left: 50%; transform: translate(-50%);">
                                <label class="btn btn-primary active">
                                    <input type="radio" name="options" value="cliente" id="radioCliente" autocomplete="off" required> Contratante
                                </label>
                                <label class="btn btn-success">
                                    <input type="radio" name="options" value="profissional" id="radioProfissional" autocomplete="off"> Profissional
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block ">Entrar</button>

                        </div>
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="<c:url value="/"/>">Home</a>
                        <a class="d-block small" href="#">Esqueceu sua senha?</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
    </body>
</html>
