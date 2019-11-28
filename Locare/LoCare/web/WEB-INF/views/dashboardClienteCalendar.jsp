<%-- 
    Document   : dashboardClienteCharts
    Created on : 10/09/2018, 15:37:32
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

        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>

        <!-- Dependências DayPilot Calendar -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/daypilot-all.min.js"/>"></script>

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
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-calendar-alt"></i> Datas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardClienteHistory"/>">
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
                        <li class="breadcrumb-item active">Calendário</li>
                    </ol>

                    <div class="card">
                        <h5 class="card-header">Seus agendamentos</h5>
                        <div class="card-body">
                            <div id="dp"></div>
                        </div>
                        <div class="card-footer small text-muted">Resultados com base em suas contratações.</div>
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

        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
        <script>
            var servicos = [];
            var dp = new DayPilot.Month("dp");
            dp.locale = "pt-br";
            
            $('document').ready(function (){
               $.ajax({
                    url: '<c:url value="/getServicos"/>',
                    type: 'GET',
                    success: function (dataServicos) {
                        for (var i = 0; i < dataServicos.length; i++) {
                            servicos.push(dataServicos[i]);
                        }
                        adicionarOrcamentos();
                    }
                });
            
                function adicionarOrcamentos(){
                    for (var i = 0; i < servicos.length; i++) {
                        var servico = servicos[i];
                        console.log(servico);
                        var e = new DayPilot.Event({
                            id: servicos[i].id,
                            start: servicos[i].solicitacaoOrcamento.dataInicioAtendimento,
                            end: servicos[i].solicitacaoOrcamento.dataInicioAtendimento,
                            text: '' + servicos[i].solicitacaoOrcamento.profissional.nome + ' - ' + servicos[i].solicitacaoOrcamento.profissional.formacao + ''
                        });
                        dp.events.add(e);
                        dp.onEventClick = function(args){
                            console.log("servico");
                            alert(args.e.data.text);
                        };
                    }
                } 
            });
            
            dp.init();
        </script>
    </body>
</html>
