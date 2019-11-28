<%-- 
    Document   : dashboardClienteHistory
    Created on : 10/09/2018, 15:22:39
    Author     : gabriel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/styleDashboard.css"/>
        <link rel="stylesheet" type="text/css" href="/LoCare/Resources/css/sb-admin.css"/>
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/Resources/css/all.min.css"/>">

        <title>Área do Contratante</title>
    </head>
    <body>
        <header>
            <!-- Implementação NAVBAR -->
            <nav class="navbar navbar-expand navbar-light bg-light static-top">
                <a class="navbar-brand mr-1" href="<c:url value="/dashboardCliente"/>">Painel de Controle</a>

                <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Navbar Search -->
                <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
<!--                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Pesquise por cidade" aria-label="Pesquisar" aria-describedby="basic-addon2" name="cidade">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>-->
                </div>

                <!-- Navbar -->
                <ul class="navbar-nav ml-auto ml-md-0">
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bell fa-fw"></i>
                            <!-- <span class="badge badge-danger">9+</span> -->
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                            <a class="dropdown-item" href="#">Notificação 1</a>
                            <a class="dropdown-item" href="#">Notificação 2</a>
                            <a class="dropdown-item" href="#">Notificação 3</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link" href="<c:url value="/dashboardClienteChat"/>" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-comments"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle fa-fw"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="<c:url value="/dashboardClienteProfile"/>">Perfil</a>
                            <a class="dropdown-item" href="#">Configurações</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #0277bd;">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardCliente"/>">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteOrcamento"/>">
                        <i class="fas fa-tasks"></i> Orçamentos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteAvaliar"/>">
                        <i class="far fa-star"></i> Avalie
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteProfile"/>">
                        <i class="fas fa-user"></i> &nbspPerfil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteCalendar"/>">
                        <i class="fas fa-calendar-alt"></i> Datas
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-history"></i> Histórico
                    </a>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteChat"/>">
                        <i class="fas fa-comments"></i> Chat
                    </a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteDuvidas"/>">
                        <i class="fas fa-question-circle"></i> Dúvidas
                    </a>
                </li>
            </ul>
                        
            <!-- Implemantação de Conteúdo -->
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="<c:url value="/dashboardCliente"/>">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Histórico</li>
                    </ol>
                        
                    <div class="card">
                        <h5 class="card-header">Seu Histórico</h5>
                        <div id="card-body" class="card-body"></div>
                    </div>
                </div> <!-- Container Fluid -->
                
                <!-- Modal -->
                <form action="<c:url value="/logout"/>" method="post">
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Deseja sair?</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Selecione <span id="confirm-label" class="badge badge-warning">Sair</span> logo abaixo caso queira realmente encerrar sua sessão atual.
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secundary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" id="btn-confirm" class="btn btn-warning">Sair</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                
                <!-- Rodapé -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Lo Care 2018</span>
                        </div>
                    </div>
                </footer>
            </div> <!-- Fim de Conteúdo -->
        </div>
        
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
        <script>
            var historico = [];
            
            $.ajax({
                url: '<c:url value="/getHistorico"/>',
                type: 'GET',
                success: function(dataHistorico) {
                    for(var i = 0; i < dataHistorico.length; i++){
                        historico.push(dataHistorico[i]);
                    }
                    adicionarHistorico();
                }
            });
            
            function adicionarHistorico(){
                for(var i = 0; i < historico.length; i++){
                    console.log(historico[i]);
                    $('#card-body').append('<div class="card">\n\
                                                <div class="card-header">' + historico[i].profissional.nome + '</div>\n\
                                                <div class="card-body">\n\
                                                    <div class="form-row">\n\
                                                        <div class="form-group col-md-12">\n\
                                                            <input name="id" type="hidden" value="'+ historico[i].id +'"/>\n\
                                                            <label for="recipient-mensagem" class="col-form-label">Descrição:</label>\n\
                                                            <input type="text" id="recipient-mensagem" name="mensagem" class="form-control" value="' + historico[i].descricaoAtendimento + '" readonly />\n\
                                                        </div>\n\
                                                    </div>\n\
                                                    <div class="form-row">\n\
                                                        <div class="form-group col-md-12">\n\
                                                            <label for="recipient-formacao" class="col-form-label">Formação do Profissional:</label>\n\
                                                            <input type="text" id="recipient-formacao" name="formacao" class="form-control" value="' + historico[i].profissional.formacao + '" readonly />\n\
                                                        </div>\n\
                                                    </div>\n\
                                                    <div class="form-row">\n\
                                                        <div class="form-group col-md-3">\n\
                                                            <label for="recipient-data" class="col-form-label">Data do atendimento: </label>\n\
                                                            <input type="text" id="recipient-data" name="dataAtendimento" class="form-control" value="' + historico[i].dataInicioAtendimento + '" readonly />\n\
                                                        </div>\n\
                                                        <div class="form-group col-md-3">\n\
                                                            <label for="recipient-horas" class="col-form-label"> Status Atual: </label>\n\
                                                            <input type="text" id="recipient-horas" name="horas" class="form-control" value="'+ historico[i].statusAtual + '" readonly />\n\
                                                        </div>\n\
                                                        <div class="form-group col-md-3">\n\
                                                            <label for="valorOrcamento" class="col-form-label">Valor do atendimento (R$): </label>\n\
                                                            <input type="number" step="0.01" name="valor_orcamento" class="money form-control" id="valorOrcamento" value="'+ historico[i].valorAtendimento + '" readonly />\n\
                                                        </div>\n\
                                                    </div>\n\
                                                </div>\n\
                                            </div>');
                }
            }
        </script>
    </body>
</html>
