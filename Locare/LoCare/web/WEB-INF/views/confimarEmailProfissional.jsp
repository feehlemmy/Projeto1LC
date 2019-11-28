<%-- 
    Document   : cadastroCompleto
    Created on : 08/09/2018, 10:49:49
    Author     : felipeleme
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
                                <a class="btn btn-outline-success" href="<c:url value="/login"/>">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav> <!-- Fim do Menu -->
        </section>
                       
        <div class="container align-self-center d-flex justify-content-center">
            <div class="container-fluid" id="box">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-header">Confirme seu e-mail</div>
                    <div class="card-body">
                        <form act method="post">
                            <div class="form-group col-md-10 mb-3">
                                <label for="email_confirmacao">Digite o e-mail a ser confirmado</label>
                                <input id="email_confirmacao" type="email" name="email" id="email" class="form-control input-lg" placeholder="Email" tabindex="1" value="${profissional.email}" required>
                            </div>
                            <div class="form-group col-md-10 mb-3">
                                <label id="lbl_confirmEmail" for="codigo_seguranca">Digite seu código de segurança</label>
                                <input name="securityKey2" value="${securityKey2}" class="form-control" placeholder="Ex: NGsq3!2W" maxlength="8" tabindex="2" required/>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="gridCheck1" tabindex="3" required>
                                        <label class="form-check-label" for="gridCheck1">
                                            Aceito os <a id="aTermos" href="#modalTermos" data-toggle="modalTermos">termos de uso.</a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-success" tabindex="4">Próximo</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                            
        <!-- Modal Termos -->
        <div class="modal fade" id="modalTermos" tabindex="-1" role="dialog" aria-labelledby="modalTermosTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTermosTitle">TERMOS E CONDIÇÕES DE USO LoCare</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Por favor, leia os termos de uso antes de utilizar a plataforma LoCare</p>
                        <hr>
                        <p>
                            O presente Termo e Condições de Uso aplica-se àqueles que realizam o cadastro junto a <b>PLATAFORMA LoCare</b> para fins de utilização da mesma.
                        </p>
                        <p>
                            Qualquer pessoa que pretenda utilizar a <b>PLATAFORMA</b> fornecida pela empresa LO CARE deverá aceitar os Termos e Condições de Uso aqui descritos bem como a <b>Política de Privacidade</b> e, posteriormente, realizar o cadastro junto à <b>PLATAFORMA</b>.
                        </p>
                        <p>
                            Antes de realizar o cadastro, por gentileza, certifique-se de ter lido e compreendido todas as informações do presente termo.
                        </p>
                        <p>
                            Ao aderir às regras presentes no Termo de Condições de Uso, os <b>USUÁRIOS (CONTRATANTES E PROFISSIONAIS)</b> 
                            afirmam ter o conhecimento total das condições, regras e normas aqui descritas e concordam que elas regem todos os direitos e obrigações dos <b>USUÁRIOS</b>,
                            consistindo no contrato firmado entre as partes.
                        </p>
                        
                        <hr>
                        <h5>1. Definições</h5>
                        <ul>
                            <li><b>PROFISSIONAL:</b> a pessoa que realiza o cadastro na presente <b>PLATAFORMA</b> com o objetivo de ser contratado (a) como,
                                enfermeiros, técnicos em enfermagem, fisioterapeutas, nutricionista entre outros e que será responsável pelos cuidados inerentes ao familiar confiado pelo <b>CONTRATANTE</b>.</li>
                            <li><b>CONTRATANTE:</b> a pessoa que realiza o cadastro junto à <b>PLATAFORMA</b> com o intuito de realizar a contratação de um profissional para confiar os cuidados de um familiar
                                (bebê, criança, idoso, pessoa com necessidade especial, entre outros) ao <b>PROFISSIONAL.</b></li>
                            <li><b>USUÁRIO:</b> este termo refere-se tanto a <b>PROFISSIONAIS</b> quanto a <b>CONTRATANTE.</b></li>
                            <li><b>LO CARE:</b> empresa responsável por fornecer a plataforma que conecta <b>PROFISSIONAIS e CONTRATANTES</b>.</li>
                            <li><b>PLATAFORMA:</b> local virtual, onde o <b>USUÁRIO</b> insere todas as informações que possibilitam o acesso ao sistema e, consequentemente,
                                os <b>PROFISSIONAIS</b> divulgam seus serviços e horários disponíveis e os <b>CONTRATANTES</b> realizam a contratação dos serviços dos <b>PROFISSIONAIS</b>.</li>
                            <li><b>SUPORTE:</b> equipe de atendimento ao cliente que atende às solicitações de esclarecimento de dúvidas ou outros questionamentos através do formulário preenchido junto na aba Fale Conosco existente junto ao <b>SITE.</b></li>
                            <li><b>SERVIÇOS DE CUIDADOS:</b> ao mencionar tal termo, a <b>LoCARE</b> quer dizer todo e qualquer serviço de cuidado disponível na plataforma, como, por exemplo, consultas com fisioterapeutas e/ou nutricionistas, cuidados de enfermeiros, etc.</li>
                        </ul>
                        
                        <hr>
                        <h5>2. LoCARE</h5>
                        <ul>
                            <li>O <b>LoCARE</b> oferece uma plataforma com o objetivo de realizar a conexão entre <b>PROFISSIONAIS</b> dispostos a prestar serviços de Home Care
                                e pessoas <b>CONTRATANTES</b> destes serviços.</li>
                            <li>A <b>PLATAFORMA</b> consiste em ambiente virtual no qual <b>PROFISSIONAIS</b> podem divulgar os serviços a serem prestados
                                e <b>CONTRATANTES</b> podem contratar os serviços prestados pelos <b>PROFISSIONAIS.</b></li>
                            <li>Para ofertar serviços na <b>PLATAFORMA LoCARE</b>, é necessário cadastro e registro profissional válido.</li>
                            <li>Para visualizar e contratar os serviços ofertados é necessário a cadastrar-se na <b>PLATAFORMA LoCARE</b>.</li>
                            <li>A <b>LoCARE</b> não presta serviço de Home Care aos <b>CONTRATANTES</b> ou familiares,
                                apenas viabiliza a conexão entre <b>PROFISSIONAL e CONTRATANTE</b>, para que estes possam realizar entre contratação dos serviços.
                                Dessa forma, a responsabilidade da <b>LoCARE</b> limita-se à <em>(i) disponibilidade do site e ao (ii) recebimento do pagamento dos serviços dos</em> <b>PROFISSIONAIS</b>.</li>
                            <li>O cadastro e possibilidade de contratar/oferecer serviços limita-se a pessoas maiores de 18 (dezoito) anos e àquelas que não tenham o cadastro inativado pela <b>LoCARE.</b></li>
                            <li><em><b>É PROIBIDO O ACESSO OU UTILIZAÇÃO DO SITE POR MENORES DE 18 (DEZOITO) ANOS.</b></em></li>
                        </ul>
                        
                        <hr>
                        <h5>3. Do Cadastro</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="/Resources/js/jquery-3.3.1.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="/Resources/js/bootstrap.min.js"/>"></script>
        <script>
            $(document).ready(function(){
                $("#aTermos").click(function(){
                    $("#modalTermos").modal();
                });
            });
        </script>
    </body>
</html>


