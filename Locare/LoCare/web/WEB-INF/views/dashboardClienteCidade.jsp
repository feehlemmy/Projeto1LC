<%-- 
    Document   : dashboardClienteCidade
    Created on : 24/10/2018, 12:07:45
    Author     : gabrielmartins
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
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

    <body id="page-top">   

        <header>
            <!-- Implementação NAVBAR -->
            <nav class="navbar navbar-expand navbar-light bg-light static-top">
                <a class="navbar-brand mr-1" href="#">Painel de Controle</a>

                <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Navbar Search -->
                <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" action="<c:url value="/pesquisarCidade"/>" method="post">
                    <div>
                        <div class="input-group">
                            <div class="form-group">
                                <select id="estado" class="form-control" name="estado" value="${pessoa.estado}" onchange="buscaCidades(this.value)">
                                    <option value="" selected>Estado</option>
                                    <option value="AC">AC</option>
                                    <option value="AL">AL</option>
                                    <option value="AP">AP</option>
                                    <option value="AM">AM</option>
                                    <option value="BA">BA</option>
                                    <option value="CE">CE</option>
                                    <option value="DF">DF</option>
                                    <option value="ES">ES</option>
                                    <option value="GO">GO</option>
                                    <option value="MA">MA</option>
                                    <option value="MT">MT</option>
                                    <option value="MS">MS</option>
                                    <option value="MG">MG</option>
                                    <option value="PA">PA</option>
                                    <option value="PB">PB</option>
                                    <option value="PR">PR</option>
                                    <option value="PE">PE</option>
                                    <option value="PI">PI</option>
                                    <option value="RJ">RJ</option>
                                    <option value="RN">RN</option>
                                    <option value="RS">RS</option>
                                    <option value="RO">RO</option>
                                    <option value="RR">RR</option>
                                    <option value="SC">SC</option>
                                    <option value="SP">SP</option>
                                    <option value="SE">SE</option>
                                    <option value="TO">TO</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select id="cidade" name="cidade" class="form-control"></select>
                            </div>
                            <div class="input-group-append">
                                <button id="submit" type="submit" class="btn btn-primary">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
               
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
        
        <!-- Implementação da sessão de conteúdo -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #0277bd;">
                <li class="nav-item active">
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

            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="<c:url value="/dashboardCliente"/>">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Geral</li>
                    </ol>
                    
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="type">Filtre por especialidade:</label>
                        </div>
                        <select class="custom-select" id="type" onchange="filterMarkers(this.value);">
                            <option selected>Escolha ...</option>
                            <option value="tecnico">Técnico(a) em Enfermagem</option>
                            <option value="enfermeiro">Enfermeiro(a)</option>
                            <option value="fisioterapeuta">Fisioterapeuta</option>
                            <option value="nutricionista">Nutricionista</option>
                        </select>
                    </div>

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-map-marked-alt"></i>
                            Profissionais próximos a você
                        </div>
                        <div class="card-body" style="padding: 0;">
                            <div id="map" style="width: 100%; height: 400px; background: grey"></div>
                        </div>
                        <div class="card-footer small text-muted">Resultados com base em sua localização.</div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
                <!-- Modal Logoff -->
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
                <!-- Modal -->
                <div class="modal fade" tabindex="-1" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Peça um orçamento</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form action="<c:url value="/enviarMensagem"/>" method="post">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="recipient-id-profissional" name="profissional_id" readonly />
                                        <input type="hidden" class="form-control" id="recipient-email" name="profissional" readonly />
                                        <label for="recipient-name" class="col-form-label">Para:</label>
                                        <input type="text" class="form-control" id="recipient-nome" name="nome" readonly />
                                        <label for="recipient-formacao" class="col-form-label">Formação:</label>
                                        <input type="text" class="form-control" id="recipient-formacao" name="formacao" readonly />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDataNascimento">Data do Atendimento</label>
                                        <input type="Date" class="form-control" id="inputEmail4" placeholder="Insira a data para atendimento" required="true" name="dataAtendimento">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                              <label class="input-group-text" for="selectInitialHora">Hora Inicial</label>
                                            </div>
                                            <select class="custom-select" id="selectInitialHora" name="horaInicial" >
                                                <option selected value="00:00">00:00</option>
                                                <option value="01:00">01:00</option>
                                                <option value="02:00">02:00</option>
                                                <option value="03:00">03:00</option>
                                                <option value="04:00">04:00</option>
                                                <option value="05:00">05:00</option>
                                                <option value="06:00">06:00</option>
                                                <option value="07:00">07:00</option>
                                                <option value="08:00">08:00</option>   
                                                <option value="09:00">09:00</option>
                                                <option value="10:00">10:00</option>
                                                <option value="11:00">11:00</option>
                                                <option value="12:00">12:00</option>
                                                <option value="13:00">13:00</option>
                                                <option value="14:00">14:00</option>
                                                <option value="15:00">15:00</option>
                                                <option value="16:00">16:00</option>
                                                <option value="17:00">17:00</option>
                                                <option value="18:00">18:00</option>
                                                <option value="19:00">19:00</option>
                                                <option value="20:00">20:00</option>
                                                <option value="21:00">21:00</option>
                                                <option value="22:00">22:00</option>
                                                <option value="23:00">23:00</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                              <label class="input-group-text" for="selectHoras">Atendimento de</label>
                                            </div>
                                            <select class="custom-select" id="selectHoras" name="horas">
                                                <option selected>Escolha ...</option>
                                                <option value="1 hora">1 hora</option>
                                                <option value="2 horas">2 horas</option>
                                                <option value="3 horas">3 horas</option>
                                                <option value="4 horas">4 horas</option>
                                                <option value="5 horas">5 horas</option>
                                                <option value="6 horas">6 horas</option>
                                                <option value="7 horas">7 horas</option>
                                                <option value="8 horas">8 horas</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label" required>Mensagem:</label>
                                        <textarea class="form-control" id="message-text" placeholder="Descreva um pouco do atendimento que você precisa" name="mensagem"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-secundary" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-success">Enviar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Rodapé -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Lo Care 2018</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- Fim da Sessão de Conteúdo -->

        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
        <script src="<c:url value="Resources/js/sb-admin.js"/>"></script>
        <script src="<c:url value="Resources/js/CidadesAPI.js"/>"></script>
        
        <!-- Integração Google Maps -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCMrMkXdLc410eCLxYRScugtjFlaAnRMtk" async defer></script>
        <script type="text/javascript" charset="UTF-8" >
            var map;
            var markers = [];
            var profissionais = [];
            var emails = [];
            var profissoes = [];
            var j = 0;
            var cidades = [];
            var cidade;
            
            $.ajax({
                url: '<c:url value="/getCidadeSession"/>',
                type: 'GET',
                success: function (dataCidade) {
                    cidade = dataCidade;
                    //console.log(cidade);
                    findCidade();
                }
            })
            
            function findCidade(){
                $.ajax({
                    url: '<c:url value="/getProfissionalCidade"/>',
                    type: 'GET',
                    success: function (dataProfissional) {
                        for(var i = 0; i < dataProfissional.length; i++){
                            profissionais.push(dataProfissional[i]);
                            emails.push(dataProfissional[i].email);
                            profissoes.push(dataProfissional[i].formacao);
                            cidades.push(dataProfissional[i].cidade);
                        }
                        initMap();
                    }
                });
            }

            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 15,
                    center: {lat: -22.249520, lng: -45.706080},
                    streetViewControl: false,
                    fullscreenControl: false,
                    mapTypeControl: false
                });
                var geocoder = new google.maps.Geocoder();
                console.log(cidade);
                geocodeAddress(geocoder, map);
            }
            
            function geocodeAddress(geocoder, resultsMap) {
                var address = cidade;
                
                geocoder.geocode({'address': address}, function(results, status) {
                    
                    if (status === 'OK') {
                        resultsMap.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                            map: resultsMap,
                            position: results[0].geometry.location
                        });
                        console.log(results[0].geometry.location);
                        //createMarkers(lat, lng, resultsMap, j);

                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }
            
            function createMarkers(latitude, longitude, resultsMap, position){
                if(profissoes[position] === "Fisioterapeuta"){
                    var marker = new google.maps.Marker({
                        position: {lat: latitude, lng: longitude},
                        map: resultsMap,
                        title: 'Fisioterapeuta',
                        icon: '<c:url value="/Resources/img/icons8-fisioterapia-32.png"/>'
                    });

                    marker.addListener('click', function(){
                        $("#recipient-id-profissional").val(profissionais[position].id);
                        $("#recipient-email").val(profissionais[position].email);
                        $("#recipient-nome").val(profissionais[position].nome);
                        $("#recipient-formacao").val(profissionais[position].formacao);
                        $('#myModal').modal('show');
                    });
                    
                    markers.push(marker);
                } else if(profissoes[position] === "Nutricionista"){
                    var marker = new google.maps.Marker({
                        position: {lat: latitude, lng: longitude},
                        map: resultsMap,
                        title: 'Nutricionista',
                        icon: '<c:url value="/Resources/img/icons8-leaf-32.png"/>'
                    });

                    marker.addListener('click', function(){
                        $("#recipient-id-profissional").val(profissionais[position].id);
                        $("#recipient-email").val(profissionais[position].email);
                        $("#recipient-nome").val(profissionais[position].nome);
                        $("#recipient-formacao").val(profissionais[position].formacao);
                        $('#myModal').modal('show');
                    });
                    
                    markers.push(marker);
                } else if(profissoes[position] === "Enfermagem"){
                    var marker = new google.maps.Marker({
                        position: {lat: latitude, lng: longitude},
                        map: resultsMap,
                        title: 'Enfermeiro',
                        icon: '<c:url value="/Resources/img/icons8-nurse-32.png"/>'
                    });

                    marker.addListener('click', function(){
                        $("#recipient-id-profissional").val(profissionais[position].id);
                        $("#recipient-email").val(profissionais[position].email);
                        $("#recipient-nome").val(profissionais[position].nome);
                        $("#recipient-formacao").val(profissionais[position].formacao);
                        $('#myModal').modal('show');
                    });
                    console.log(profissionais[position].id);
                    markers.push(marker);
                } else {
                    var marker = new google.maps.Marker({
                        position: {lat: latitude, lng: longitude},
                        map: resultsMap,
                        title: 'Tecnico',
                        icon: '<c:url value="/Resources/img/icons8-medical-doctor-32.png"/>'
                    });

                    marker.addListener('click', function(){
                        $("#recipient-id-profissional").val(profissionais[position].id);
                        $("#recipient-email").val(profissionais[position].email);
                        $("#recipient-nome").val(profissionais[position].nome);
                        $("#recipient-formacao").val(profissionais[position].formacao);
                        $('#myModal').modal('show');
                    });
                    
                    markers.push(marker);
                }
            }
            
            filterMarkers = function (category) {
                for (var i = 0; i < profissionais.length; i++) {
                    var marker = markers[i];
                    console.log(marker.title);
                    // If is same category or category not picked
                    if (marker.title === category || category.length === 0) {
                        marker.setVisible(true);
                    }
                    // Categories don't match 
                    else {
                        marker.setVisible(false);
                    }
                }
            }
        </script>
    </body>
</html>
