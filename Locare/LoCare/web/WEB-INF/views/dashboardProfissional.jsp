<%-- 
    Document   : dashboardProfissional
    Created on : 10/09/2018, 22:03:42
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
        <!-- Scripts necessários para as máscaras -->
        <script src="<c:url value="Resources/js/jquery.js"/>"></script>
        <script src="<c:url value="Resources/js/jquery.mask.js"/>"></script>
        
        <title>Area do Profissional</title>
    </head>
    <body>
        <header>
            <!-- Implementação NAVBAR -->
            <nav class="navbar navbar-expand navbar-light bg-light static-top">
                <a class="navbar-brand mr-1" href="#">Painel de Controle</a>

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
                        <a class="nav-link" href="<c:url value="/dashboardProfissionalChat"/>" id="messagesDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-comments"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle fa-fw"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="<c:url value="/dashboardProfissionalProfile"/>">Perfil</a>
                            <a class="dropdown-item" href="#">Configurações</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
                            
        <!-- Implementação da sessão de conteúdo -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #00897b;">
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalProfile"/>">
                        <i class="fas fa-user"></i> &nbspPerfil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalCalendar"/>">
                        <i class="fas fa-calendar-alt"></i> Datas
                    </a>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalCharts"/>">
                        <i class="fas fa-chart-bar"></i> Gráficos
                    </a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalHistory"/>">
                        <i class="fas fa-history"></i> Histórico
                    </a>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalChat"/>">
                        <i class="fas fa-comments"></i> Chat
                    </a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissionalDuvidas"/>">
                        <i class="fas fa-question-circle"></i> Dúvidas
                    </a>
                </li>
            </ul>
                        
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Geral</li>
                    </ol>
                    <div class="card">
                        <h5 class="card-header">Solicitações de atuação</h5>
                        <div class="card-body" id="card-body">
                            
                        </div>
                    </div>
                </div> <!-- Container Fluid -->

  
                <!-- Modal Logout-->
                    <form action="<c:url value="/logoutProfissional"/>" method="post">
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
            </div>
        </div>
        
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
        <script  type="text/javascript" charset="UTF-8" >
            var orcamentos = [];
            
            $.ajax({
                url: '<c:url value="/getOrcamentoProfissional"/>',
                type: 'GET',
                success: function(dataOrcamento) {
                    for(var i = 0; i < dataOrcamento.length; i++){
                        orcamentos.push(dataOrcamento[i]);
                    }
                    adicionarOrcamentos();
                }
            });
            
            function adicionarOrcamentos(){
                for(var i = 0; i < orcamentos.length; i++){
                    //console.log(orcamentos[i]);
                    $('#card-body').append('<div class="card">\n\
                                                <div class="card-header name="nomeCliente">' + orcamentos[i].contrantante.nome + '</div>\n\
                                                <div class="card-body">\n\
                                                    <form action="<c:url value="/responderOrcamento"/>" method="post">\n\
                                                        <div class="form-row">\n\
                                                            <div class="form-group col-md-12">\n\
                                                                <input name="id_cliente" type="hidden" value="'+ orcamentos[i].contrantante.id +'"/>\n\
                                                                <input name="id" type="hidden" value="'+ orcamentos[i].id +'"/>\n\
                                                                <label for="recipient-mensagem" class="col-form-label">Mensagem:</label>\n\
                                                                <input type="text" id="recipient-mensagem" name="mensagem" class="form-control" value="' + orcamentos[i].descricaoAtendimento + '" readonly />\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        <div class="form-row">\n\
                                                            <div class="form-group col-md-12">\n\
                                                                <label for="recipient-endereco" class="col-form-label">Endereço do cliente:</label>\n\
                                                                <input type="text" id="recipient-endereco" name="endereco" class="form-control" value="' + orcamentos[i].contrantante.endereco + '" readonly />\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        <div class="form-row">\n\
                                                            <div class="form-group col-md-3">\n\
                                                                <label for="recipient-data" class="col-form-label">Data para o atendimento: </label>\n\
                                                                <input type="text" id="recipient-data" name="dataAtendimento" class="form-control" value="' + orcamentos[i].dataInicioAtendimento + '" readonly />\n\
                                                            </div>\n\
                                                            <div class="form-group col-md-3">\n\
                                                                <label for="recipient-horas" class="col-form-label">Tempo de atendimento: </label>\n\
                                                                <input type="text" id="recipient-horas" name="horas" class="form-control" value="'+ orcamentos[i].tempoAtendimento + '" readonly />\n\
                                                            </div>\n\
                                                            <div class="form-group col-md-3">\n\
                                                                <label for="recipient-horaInicial" class="col-form-label">Horário do atendimento: </label>\n\
                                                                <input type="text" id="recipient-horaInicial" name="horaInicial" class="form-control" value="'+ orcamentos[i].horaInicioAtendimento + '" readonly />\n\
                                                            </div>\n\
                                                            <div class="form-group col-md-3">\n\
                                                                <label for="valorOrcamento" class="col-form-label">Valor do atendimento: </label>\n\
                                                                <input type="text" name="valor_orcamento" class="money form-control" id="money" required />\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        <div class="form-row">\n\
                                                            <div class="form-group col-md-6">\n\
                                                                <div class="input-group-prepend">\n\
                                                                    <fieldset id="radioGroup" class="input-group-text">\n\
                                                                        <label for="radioGroup">Aceitar solicitação?</label>\n\
                                                                        <div><label for="radioSim">Sim</label>\n\
                                                                        <input type="radio" id="radioSim" name="orcamentoAprovado" value="sim" required/></div>\n\
                                                                        <div><label for="radioNao">Não</label>\n\
                                                                        <input type="radio" id="radioNao" name="orcamentoAprovado" value="nao"/></div>\n\
                                                                    </fieldset>\n\
                                                                </div>\n\
                                                            </div>\n\
                                                        </div>\n\
                                                        <div class="form-row">\n\
                                                            <div class="form-group col-md-6">\n\
                                                                <button type="submit" class="btn btn-primary"> Responder </button>\n\
                                                            </div>\n\
                                                        </div>\n\
                                                    </form>\n\
                                                </div>\n\
                                            </div>');
                    mascara();
                }
            }
            
            function mascara(){
                $('.money').mask("#.##0,00", {reverse: true});
            }
        </script>
    </body>
</html>
