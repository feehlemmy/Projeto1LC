<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-BR">
    <head>
        <title>LoCare</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <link rel="stylesheet" href="<c:url value="Resources/css/bootstrap.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/Resources/css/all.min.css"/>">
        <link rel="stylesheet" type="text/css" href="Resources/css/style.css"/>
    </head>

    <body id="page-top">
        <!-- Menu -->
        <nav class="navbar nav-edit navbar-expand-lg navbar-light fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="Resources/img/logo.png" width="50" height="45" alt="LoCare"></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="btn btn-outline-info" href="<c:url value="/login"/>">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#about">Sobre</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#how-to-work">Como funciona</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#highlights">Destaques</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> <!-- Fim do Menu -->

        <header class="container_principal">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <div class="cards">
                            <div class="wrap">
                                <div class="tile">
                                    <img src='Resources/img/img_card_enfermagem.jpg' alt="Enfermagem"/>
                                    <div class="text">
                                        <h1>Enfermagem</h1>
                                        <h3 class="animate-text">Encontre os melhores profissionais de Enfermagem no LoCare.</h3>
                                    </div>
                                </div>

                                <div class="tile">
                                    <img src='Resources/img/img_card_nutricao.jpg' alt="Nutrição"/>
                                    <div class="text">
                                        <h1>Nutrição</h1>
                                        <h3 class="animate-text">Encontre os melhores profissionais de Nutrição no LoCare.</h3>
                                    </div>
                                </div>

                                <div class="tile">
                                    <img src='Resources/img/img_card_fisioterapia.jpg' alt="Fisioterapia"/>
                                    <div class="text">
                                        <h1>Fisioterapia</h1>
                                        <h3 class="animate-text">Encontre os melhores profissionais de Fisioterapia no LoCare.</h3>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- Fim da DIV Cards -->
                            
                        <!-- Começo da Div Botoes -->
                        <div class="botoes btn-group" role="group" aria-label="Basic example">
                            <a class="btn btn-secondary btn-contratar" href="<c:url value="/create"/>">Quero contratar</a>
                            <a class="btn btn-secondary btn-trabalhar" href="<c:url value="/profissional/create"/>">Quero trabalhar</a>
                        </div> <!-- Fim da DIV Botoes -->
                    </div>
                </div>
            </div>
        </header>

        <!-- Sessão Sobre -->
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <div id="conference-timeline" class="timeline-content">
                            <div class="timeline-start">Sobre</div>
                            <div class="conference-timeline-content">
                                <!-- Article -->
                                <div class="timeline-article">
                                    <div class="content-left-container">
                                        <div class="content-left">
                                            <p>O que é o LoCare?<span class="article-number">01</span></p>
                                            <p>Somos uma plataforma que visa fazer a integração de pessoas em busca de profissionais da saúde para realizarem um atendimento em Home Care.</p>
                                        </div>
                                        <span class="timeline-author">LoCare</span>
                                    </div>
                                    <div class="content-right-container">
                                        <div class="content-right">
                                            <p>É um profissional?<span class="article-number">02</span></p>
                                            <p>Faça seu cadastro e comece a receber solicitações para prestar um serviço em sua região.</p>
                                        </div>
                                        <span class="timeline-author">LoCare</span>
                                    </div>
                                    <div class="meta-date">
                                        <span class="date"><i class="fas fa-user-md"></i></span>
                                    </div>
                                </div>

                                <div class="timeline-article">
                                    <div class="content-left-container">
                                        <div class="content-left">
                                            <p>Procurando um profissional?<span class="article-number">03</span></p>
                                            <p>Cadastre-se e encontre um profissional capacitado bem próximo de você.</p>
                                        </div>
                                        <span class="timeline-author">LoCare</span>
                                    </div>
                                    <div class="content-right-container">
                                        <div class="content-right">
                                            <p>O que é Home Care?<span class="article-number">04</span></p>
                                            <p>O termo Home Care é de origem inglesa. A palavra ?Home? significa ?lar?, e a palavra ?Care? traduz-se por ?cuidados?. Portanto, a expressão Home Care designa literalmente: cuidados no lar.</p>
                                        </div>
                                        <span class="timeline-author">LoCare</span>
                                    </div>
                                    <div class="meta-date">
                                        <span class="date"><i class="fas fa-user-md"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> <!-- Fim da Sessão Sobre -->

        <!-- Sessão Como Funciona -->
        <section id="how-to-work">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 mx-auto">
                        <div class="col align-self-center carousel-config">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="Resources/img/slide_map.jpg" width="800" height="600" alt="First slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="Resources/img/slide_login.jpg" width="800" height="600" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="Resources/img/slide_chat.jpg" width="800" height="600" alt="Third slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="Resources/img/slide_security.jpg" width="800" height="600" alt="Third slide">
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> <!--  Fim da Sessão Como Funciona -->

        <!-- Rodapé -->
        <!--<footer class="footer">
            <div class="container">
                <p>Copyright &copy; Pinguim Software 2018</p>
            </div>
        </footer>-->

        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/all.min.js"/>"></script>
    </body>
</html>
