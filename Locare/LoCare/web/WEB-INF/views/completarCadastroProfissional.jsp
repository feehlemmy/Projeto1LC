<%-- 
    Document   : completarCadastroProfissional
    Created on : 15/10/2018, 16:34:02
    Author     : gabrielsilva
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/Resources/css/bootstrap.min.css"/>">
        <!-- Scripts necessários para as máscaras -->
        <script src="<c:url value="Resources/js/jquery.js"/>"></script>
        <script src="<c:url value="Resources/js/jquery.mask.js"/>"></script>
        
        <title>Complete seu cadastro</title>
    </head>
    <body>
        <div class="container align-self-center d-flex justify-content-center">
            <div class="container-fluid" id="box">
                <div class="card card-login mx-auto mt-5">
                    <div class="card-header">Antes de continuar, complete seu cadastro.</div>
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
                                    <input type="text" class="form-control" id="inputCidade" required="true" name="numeroRegistro" maxlength="20" value="${profissional.numeroRegistro}">
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
                                        <option value="" selected>Escolha</option>
                                        <option value="Enfermagem">Enfermagem</option>
                                        <option value="Tecnico">Técnico em Enfermagem</option>
                                        <option value="Fisioterapeuta">Fisioterapeuta</option>
                                        <option value="Nutricionista">Nutricionista</option>
                                    </select>
                                </div>
                            </div>
                            <button class="btn btn-primary" type="submit">Confirmar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                                
        <!-- Inclusão dos arquivos necessários para o Bootstrap -->
        <script src="<c:url value="Resources/js/popper.min.js"/>"></script>
        <script src="<c:url value="Resources/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="Resources/js/CidadesAPI.js"/>"></script>
        <script>
            $(document).ready(function () {
                $('.cpf').mask('000.000.000-00');
                $('.telefone').mask('(00) 00000-0000');
                $('.cep').mask('00.000-000');
            });
        </script>
    </body>
</html>
