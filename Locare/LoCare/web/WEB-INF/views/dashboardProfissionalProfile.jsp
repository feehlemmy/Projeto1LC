<%-- 
    Document   : dashboardProfissionalProfile
    Created on : 10/09/2018, 22:30:48
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
                        <a class="nav-link dropdown-toggle" href="<c:url value="/dashboardProfissional"/>" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/dashboardProfissional"/>">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">
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
                            <a href="<c:url value="/dashboardProfissional"/>">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Perfil</li>
                    </ol>
                    <div class="card">
                        <h5 class="card-header">Atualize suas informações</h5>
                        <div class="card-body">
                            <form method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-3">
                                        <label for="inputCPF">CPF</label>
                                        <input type="text" class="cpf form-control " id="inputCPF" placeholder="CPF" required="true" name="cpf" value="${profissional.cpf}" >
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputTelefone">Telefone</label>
                                        <input type="text" class="telefone form-control" id="inputTelefone" placeholder="Telefone" required="true" name="telefone" value="${profissional.telefone}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputDataNascimento">Data de Nascimento</label>
                                        <input type="date" class="form-control" id="inputEmail4" placeholder="13/11/1994" required="true" name="dataNascimento" value="${profissional.dataNascimento}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputAddress">Endereço</label>
                                    <input type="text" class="form-control" id="inputAddress" placeholder="Seu Endereço, 1234, Seu Bairro" required="true" name="endereco" value="${profissional.endereco}" >
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="estado">Estado</label>
                                        <select id="estado" class="form-control" name="estado" value="${profissional.estado}" onchange="buscaCidades(this.value)">
                                            <option value="" selected>Escolha</option>
                                            <option value="AC">Acre - AC</option>
                                            <option value="AL">Alagoas - AL</option>
                                            <option value="AP">Amapá - AP</option>
                                            <option value="AM">Amazonas - AM</option>
                                            <option value="BA">Bahia - BA</option>"
                                            <option value="CE">Ceará - CE</option>
                                            <option value="DF">Distrito Federal - DF</option>
                                            <option value="ES">Espírito Santo - ES</option>
                                            <option value="GO">Goiás - GO</option>
                                            <option value="MA">Maranhão - MA</option>
                                            <option value="MT">Mato Grosso - MT</option>
                                            <option value="MS">Mato Grosso do Sul - MS</option>
                                            <option value="MG">Minas Gerais - MG</option>
                                            <option value="PA">Pará - PA</option>
                                            <option value="PB">Paraíba - PB</option>
                                            <option value="PR">Paraná - PR</option>
                                            <option value="PE">Pernambuco - PE</option>
                                            <option value="PI">Piauí - PI</option>
                                            <option value="RJ">Rio de Janeiro - RJ</option>
                                            <option value="RN">Rio Grande do Norte - RN</option>
                                            <option value="RS">Rio Grande do Sul - RS</option>
                                            <option value="RO">Rondônia - RO</option>
                                            <option value="RR">Roraima - RR</option>
                                            <option value="SC">Santa Catarina - SC</option>
                                            <option value="SP">São Paulo - SP</option>
                                            <option value="SE">Segipe - SE</option>
                                            <option value="TO">Tocantins - TO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="cidade">Cidade</label>
                                        <select id="cidade" name="cidade" class="form-control"></select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="inputCEP">CEP</label>
                                        <input type="text" class="cep form-control" id="inputCEP" required="true" name="cep" value="${profissional.cep}">
                                    </div>
                                     <div class="form-group col-md-6">
                                        <label for="inputCidade">Número de Registro</label>
                                        <input type="text" class="form-control" id="inputCidade" required="true" name="numeroRegistro" value="${profissional.numeroRegistro}">
                                    </div>
                                     <div class="form-group col-md-6">
                                        <label for="inputDataFormacao">Data Formação</label>
                                        <input type="date" class="form-control" id="inputDataFormacao" required="true" name="dataRegistro" value="${profissional.dataRegistro}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputState">Estado do Registro</label>
                                        <select id="inputState" class="form-control" name="ufRegistro" value="${profissional.ufRegistro}">
                                            <option value="" selected>Escolha</option>
                                            <option value="AC">Acre - AC</option>
                                            <option value="AL">Alagoas - AL</option>
                                            <option value="AP">Amapá - AP</option>
                                            <option value="AM">Amazonas - AM</option>
                                            <option value="BA">Bahia - BA</option>"
                                            <option value="CE">Ceará - CE</option>
                                            <option value="DF">Distrito Federal - DF</option>
                                            <option value="ES">Espírito Santo - ES</option>
                                            <option value="GO">Goiás - GO</option>
                                            <option value="MA">Maranhão - MA</option>
                                            <option value="MT">Mato Grosso - MT</option>
                                            <option value="MS">Mato Grosso do Sul - MS</option>
                                            <option value="MG">Minas Gerais - MG</option>
                                            <option value="PA">Pará - PA</option>
                                            <option value="PB">Paraíba - PB</option>
                                            <option value="PR">Paraná - PR</option>
                                            <option value="PE">Pernambuco - PE</option>
                                            <option value="PI">Piauí - PI</option>
                                            <option value="RJ">Rio de Janeiro - RJ</option>
                                            <option value="RN">Rio Grande do Norte - RN</option>
                                            <option value="RS">Rio Grande do Sul - RS</option>
                                            <option value="RO">Rondônia - RO</option>
                                            <option value="RR">Roraima - RR</option>
                                            <option value="SC">Santa Catarina - SC</option>
                                            <option value="SP">São Paulo - SP</option>
                                            <option value="SE">Segipe - SE</option>
                                            <option value="TO">Tocantins - TO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputFormacao">Formação</label>
                                        <select id="inpuinputFormacaotState" class="form-control" name="formacao" value="${profissional.formacao}">
                                            <option selected>Escolha</option>
                                            <option>Enfermagem</option>
                                            <option>Técnico em Enfermagem</option>
                                            <option>Fisioterapeuta</option>
                                            <option>Nutricionista</option>
                                        </select>
                                    </div>
                                    
                                </div>
                                <button class="btn btn-primary" type="submit">Confirmar</button>
                            </form> 
                            
                            <br/>
                            <button class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Deletar Perfil</button>
                            
                            <br> <br> 
                            <button class="btn btn-warning"  data-toggle="modal" data-target="#updateSenha">Alterar Senha</button>
                        </div>
                    </div>
                </div> <!-- Container Fluid -->
                
                
                <form action="<c:url value="/updateSenhaProfissional"/>" method="post">
                <div class="modal fade" id="updateSenha" tabindex="-1" role="dialog" aria-labelledby="updateSenha" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Digite sua nova senha</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                  <div class="form-group">
                                <input type="password" name="senha" id="password" value="${profissional.senha}" class="form-control input-lg" placeholder="Senha" tabindex="3" required>
                            </div>
                            <div class="form-group">
                                <input type="password" name="senha_confirmacao"  id="confirm_password" class="form-control input-lg" placeholder="Confirme sua senha" tabindex="4" required>
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secundary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" id="btn-confirm" class="btn btn-warning">Confirmar</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                
                <!-- Modal Deletar Perfil-->
                <form action="<c:url value="/deleteProfissional"/>" method="post">
                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deseja realmente deletar seu perfil?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Clicando em <span id="confirm-label" class="badge badge-danger">Deletar</span>, todos os seus dados serão apagados e você será redirecionado para fora do LoCARE.
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-secundary" data-dismiss="modal">Cancelar</button>
                                    <button type="submit" id="btn-confirm-2" class="btn btn-danger">Deletar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                            
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
            </div>
        </div>
        
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
        <script src="<c:url value="Resources/js/CidadesAPI.js"/>"></script>
        <script>
            $(document).ready(function () {
                $('.cpf').mask('000.000.000-00');
                $('.telefone').mask('(00) 00000-0000');
                $('.cep').mask('00.000-000');
            }); 
            var password = document.getElementById("password"), 
                confirm_password = document.getElementById("confirm_password");

            function validatePassword(){
                if(password.value !== confirm_password.value) {
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
