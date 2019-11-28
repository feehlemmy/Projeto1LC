package locare.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locare.model.entity.Contratante;
import locare.model.entity.Mensagem;
import locare.model.entity.Profissional;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author felipeleme
 */
public class ProfissionalDAO{

    public void create(Connection connection, Profissional entity) throws Exception {
        String sql = "UPDATE pessoa SET cpf=?, data_nascimento=?, telefone=?, endereco=?, cep=?, cidade=?, estado=?, conta_confirmada=TRUE WHERE email = ?;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getCpf());
        preparedStatement.setString(2,entity.getDataNascimento());
        preparedStatement.setString(3, entity.getTelefone());
        preparedStatement.setString(4, entity.getEndereco());
        preparedStatement.setString(5,entity.getCep());
        preparedStatement.setString(6, entity.getCidade());
        preparedStatement.setString(7,entity.getEstado());
        preparedStatement.setString(8, entity.getEmail());

        preparedStatement.execute();
        continueCreate(connection, entity);
        preparedStatement.close();  
        
    }
    
    // OK !
    public List<Profissional> readbyCidade(Connection connection, Profissional entity) throws SQLException {
        List<Profissional> profissionalList = new ArrayList<>();
        String sql = "SELECT P.cpf, P.nome, P.email, P.cidade, P.id, P.endereco, PP.numero_registro, PP.formacao FROM pessoa P INNER JOIN profissional PP ON P.id = PP.pessoa_id_profissional WHERE P.cidade=?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getCidade());
        ResultSet resultSet = preparedStatement.executeQuery();
        Profissional profissional = null;
        
        while (resultSet.next()) {
            profissional = new Profissional();
            profissional.setCpf(resultSet.getString("cpf"));
            profissional.setNome(resultSet.getString("nome"));
            profissional.setEmail(resultSet.getString("email"));
            profissional.setId(resultSet.getLong("id"));
            profissional.setEndereco(resultSet.getString("endereco"));
            profissional.setCidade(resultSet.getString("cidade"));
            profissional.setNumeroRegistro(resultSet.getString("numero_registro"));
            profissional.setFormacao(resultSet.getString("formacao"));
            
            profissionalList.add(profissional);
        }
        
        resultSet.close();
        preparedStatement.close();
        return profissionalList;
    }
    
    public List<Profissional> readbyCidadeProcurada(Connection connection, Profissional entity) throws SQLException {
        List<Profissional> profissionalList = new ArrayList<>();
        String sql = "SELECT P.cpf, P.nome, P.email, P.cidade, P.id, P.endereco, PP.numero_registro, PP.formacao FROM pessoa P INNER JOIN profissional PP ON P.id = PP.pessoa_id_profissional WHERE P.cidade=?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getCidade());
        ResultSet resultSet = preparedStatement.executeQuery();
        Profissional profissional = null;
        
        while (resultSet.next()) {
            profissional = new Profissional();
            profissional.setCpf(resultSet.getString("cpf"));
            profissional.setNome(resultSet.getString("nome"));
            profissional.setEmail(resultSet.getString("email"));
            profissional.setId(resultSet.getLong("id"));
            profissional.setEndereco(resultSet.getString("endereco"));
            profissional.setCidade(resultSet.getString("cidade"));
            profissional.setNumeroRegistro(resultSet.getString("numero_registro"));
            profissional.setFormacao(resultSet.getString("formacao"));
            
            profissionalList.add(profissional);
        }
        
        resultSet.close();
        preparedStatement.close();
        return profissionalList;
    }

    public Profissional readByLogin(String email, String senha, Connection connection) throws SQLException {
        String sql = "SELECT P.id, P.cpf, P.nome, P.email, P.endereco, P.cidade, P.estado, P.cep FROM pessoa P, profissional S WHERE P.id = S.pessoa_id_profissional AND P.email=? AND P.senha=? AND conta_confirmada=TRUE;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, senha);
        Profissional profissional = null;
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            profissional = new Profissional();
            profissional.setId(resultSet.getLong("id"));
            profissional.setNome(resultSet.getString("nome"));
            profissional.setCpf(resultSet.getString("cpf"));
            profissional.setEmail(resultSet.getString("email"));
            profissional.setEndereco(resultSet.getString("endereco"));
            profissional.setCidade(resultSet.getString("cidade"));
            profissional.setEstado(resultSet.getString("estado"));
            profissional.setCep(resultSet.getString("cep"));
        }
        
        resultSet.close();
        preparedStatement.close();

        return profissional;
    }
    
    public List<SolicitacaoOrcamento> readBySolicitacao(Connection connection, SolicitacaoOrcamento entity) throws SQLException {
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        String sql = "SELECT SO.id, SO.id_contratante, SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.tempo_atendimento, SO.descricao_atendimento, P.nome, P.endereco FROM solicitacao_orcamento SO INNER JOIN pessoa P on P.id = SO.id_contratante INNER JOIN contratante PC on PC.pessoa_id_contratante = SO.id_contratante INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional WHERE SO.id_profissional=? AND SO.status_atual='SOLICITADO';";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        SolicitacaoOrcamento orcamento = null;
        Profissional profissional = entity.getProfissional();
        Contratante contratante = null;
        
        preparedStatement.setLong(1, profissional.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()){
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            contratante = new Contratante();
            
            contratante.setId(resultSet.getLong("id_contratante"));
            contratante.setNome(resultSet.getString("nome"));
            contratante.setEndereco(resultSet.getString("endereco"));
            
            orcamento.setContrantante(contratante);
            orcamento.setId(resultSet.getLong("id"));
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setHoraInicioAtendimento(resultSet.getString("horario_inicio_atendimento"));
            orcamento.setTempoAtendimento(resultSet.getString("tempo_atendimento"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));

            orcamentoList.add(orcamento);
        }
        return orcamentoList;
    }

    public void delete(Connection connection, Profissional entity) throws SQLException {
        String sql = "DELETE FROM pessoa P WHERE P.id = ? ;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, entity.getId());
        
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public void updateSenha(Connection connection, Profissional entity) throws SQLException {
        String sql = "UPDATE pessoa P SET senha = ? WHERE P.id = ? ;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setString(1, entity.getSenha());
        preparedStatement.setLong(2, entity.getId());
        
        preparedStatement.executeUpdate();
        preparedStatement.close();    
    }
    
    public List<Servico> readbyServico(Connection connection, Servico entity) throws Exception {
        String sql = "SELECT S.id, SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.tempo_atendimento, SO.descricao_atendimento, SO.valor_atendimento, P.nome, P.endereco FROM servico S INNER JOIN solicitacao_orcamento SO on SO.id = S.id_solicitacao_orcamento INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional INNER JOIN pessoa P on P.id = SO.id_contratante WHERE SO.id_profissional=?;";
        List<Servico> servicoList = new ArrayList<>();
        SolicitacaoOrcamento orcamento = entity.getSolicitacaoOrcamento();
        Profissional profissional = orcamento.getProfissional();
        Contratante contratante = null;
        Servico servico = null;
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, profissional.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
            
        while (resultSet.next()) {
            orcamento = new SolicitacaoOrcamento();
            contratante = new Contratante();
            servico = new Servico();
            
            contratante.setNome(resultSet.getString("nome"));
            contratante.setEndereco(resultSet.getString("endereco"));
            
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setHoraInicioAtendimento(resultSet.getString("horario_inicio_atendimento"));
            orcamento.setTempoAtendimento(resultSet.getString("tempo_atendimento"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));
            orcamento.setValorAtendimento(resultSet.getDouble("valor_atendimento"));
            orcamento.setContrantante(contratante);
            
            servico.setId(resultSet.getLong("id"));
            servico.setSolicitacaoOrcamento(orcamento);
            servicoList.add(servico);
        }
            
        return servicoList;   
    }

    public void precreate(Connection connection, Profissional entity) throws SQLException {
        String sql = "INSERT INTO pessoa(security_key, email, senha,nome) VALUES (?, ?, ?,?);";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getSecurityKey());
        preparedStatement.setString(2, entity.getEmail());
        preparedStatement.setString(3, entity.getSenha());
        preparedStatement.setString(4, entity.getNome());

        preparedStatement.execute();
        preparedStatement.close();    
    }

    public Profissional readPreCadastro(String email, Connection connection) throws SQLException {
        String sql = "SELECT P.id, P.email, P.senha, P.security_key, P.nome FROM pessoa P WHERE email = ?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,email);
        Profissional profissional = null;
        ResultSet resultSet = preparedStatement.executeQuery();
            
        if (resultSet.next()) {
            profissional = new Profissional();
            profissional.setId(resultSet.getLong("id"));
            profissional.setEmail(resultSet.getString("email"));
            profissional.setSecurityKey(resultSet.getString("security_key"));
            profissional.setSenha(resultSet.getString("senha"));
            profissional.setNome(resultSet.getString("nome"));
        }
        
        return profissional;           
    }    

    public void deleteMensagens(Connection connection, Mensagem entity) throws SQLException {
        String sql = "DELETE FROM solicitacao_orcamento SO WHERE SO.id = ? ;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, entity.getId());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    private void continueCreate(Connection connection, Profissional entity) throws SQLException {
        String sql = "INSERT INTO profissional(pessoa_id_profissional, numero_registro, uf_registro, data_formacao, formacao) VALUES (?, ?, ?, ?, ?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, entity.getId());
        preparedStatement.setString(2, entity.getNumeroRegistro());
        preparedStatement.setString(3, entity.getUfRegistro());
        preparedStatement.setString(4, entity.getDataFormacao());
        preparedStatement.setString(5, entity.getFormacao());
        
        preparedStatement.execute(); 
    }

    public List<SolicitacaoOrcamento> readByHistorico(Connection connection, SolicitacaoOrcamento entity) throws SQLException {
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        String sql = "SELECT SO.id, SO.data_inicio_atendimento, SO.status_atual, SO.descricao_atendimento, SO.valor_atendimento, P.nome, P.endereco FROM solicitacao_orcamento SO INNER JOIN pessoa P on P.id = SO.id_contratante INNER JOIN contratante PC on PC.pessoa_id_contratante = SO.id_contratante INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional WHERE SO.id_profissional=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        SolicitacaoOrcamento orcamento = null;
        Profissional profissional = entity.getProfissional();
        Contratante contratante = null;
        
        preparedStatement.setLong(1, profissional.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()){
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            contratante = new Contratante();
            
            contratante.setNome(resultSet.getString("nome"));
            contratante.setEndereco(resultSet.getString("endereco"));
            
            orcamento.setContrantante(contratante);
            orcamento.setId(resultSet.getLong("id"));
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setStatusAtual(resultSet.getString("status_atual"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));
            orcamento.setValorAtendimento(resultSet.getDouble("valor_atendimento"));

            orcamentoList.add(orcamento);
        }
        return orcamentoList;
    }
}
