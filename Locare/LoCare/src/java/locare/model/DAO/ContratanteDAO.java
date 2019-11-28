package locare.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import locare.model.entity.Contratante;
import locare.model.entity.Mensagem;
import locare.model.entity.Profissional;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author felipeleme
 */
public class ContratanteDAO{
    
    // OK !
    public void create(Connection connection, Contratante entity) throws Exception {
        String sql = "UPDATE pessoa SET cpf=?, data_nascimento=?, telefone=?, endereco=?, cep=?, cidade=?, estado=?, conta_confirmada=TRUE WHERE email = ?;";
             
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getCpf());
        preparedStatement.setString(2,  entity.getDataNascimento());
        preparedStatement.setString(3, entity.getTelefone());
        preparedStatement.setString(4, entity.getEndereco());
        preparedStatement.setString(5, entity.getCep());
        preparedStatement.setString(6, entity.getCidade());
        preparedStatement.setString(7, entity.getEstado());
        preparedStatement.setString(8, entity.getEmail());
           
        preparedStatement.execute();
        continueCreateContratante(connection, entity);
        preparedStatement.close();
    }
    
    // OK!
    public Contratante readByLogin(String email, String senha, Connection connection) throws SQLException {
        String sql = "SELECT P.id,  P.cpf, P.nome, P.email, P.endereco, P.cidade, P.estado, P.cep FROM pessoa P INNER JOIN contratante C ON C.pessoa_id_contratante = P.id WHERE P.email=? AND P.senha=? AND conta_confirmada=TRUE;";
           
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, senha);
        Contratante contratante = null;
        ResultSet resultSet = preparedStatement.executeQuery();
        
        if (resultSet.next()) {
            contratante = new Contratante();
            contratante.setId(resultSet.getLong("id"));
            contratante.setNome(resultSet.getString("nome"));
            contratante.setCpf(resultSet.getString("cpf"));
            contratante.setEmail(resultSet.getString("email"));
            contratante.setEndereco(resultSet.getString("endereco"));
            contratante.setCidade(resultSet.getString("cidade"));
            contratante.setEstado(resultSet.getString("estado"));
            contratante.setCep(resultSet.getString("cep"));   
        }

        return contratante;
    }
    
    // OK !
    public void delete(Connection connection, Contratante entity) throws SQLException {
        String sql = "DELETE FROM pessoa P WHERE P.email = ?;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getEmail());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }
    
    // OK !
    public void updateSenha(Connection connection, Contratante entity) throws SQLException {
        String sql = "UPDATE pessoa P SET senha=? WHERE P.email = ? ;";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getSenha());
        preparedStatement.setString(2, entity.getEmail());
        preparedStatement.executeUpdate();
        preparedStatement.close();
    }
    
    // OK!
    public List<SolicitacaoOrcamento> readByOrcamento(Connection connection, SolicitacaoOrcamento entity) throws SQLException {
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        String sql = "SELECT SO.id, SO.id_profissional, SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.tempo_atendimento, SO.descricao_atendimento, SO.valor_atendimento, P.nome, PP.formacao FROM solicitacao_orcamento SO INNER JOIN pessoa P on P.id = SO.id_profissional INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional WHERE SO.id_contratante =? AND SO.status_atual='RESPONDIDO';";
        SolicitacaoOrcamento orcamento = null;
        Profissional profissional = null;
        Contratante contratante = entity.getContrantante();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, contratante.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()){
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            
            profissional.setId((resultSet.getLong("id_profissional")));
            profissional.setNome(resultSet.getString("nome"));
            profissional.setFormacao(resultSet.getString("formacao"));
            
            orcamento.setProfissional(profissional);
            orcamento.setId(resultSet.getLong("id"));
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setHoraInicioAtendimento(resultSet.getString("horario_inicio_atendimento"));
            orcamento.setTempoAtendimento(resultSet.getString("tempo_atendimento"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));
            orcamento.setValorAtendimento(resultSet.getDouble("valor_atendimento"));

            orcamentoList.add(orcamento);
        }
        
        return orcamentoList;      
    }
    
    // OK!
    public List<Servico> readbyServico(Connection connection, Servico entity) throws Exception {
        String sql = "SELECT S.id, SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.tempo_atendimento, SO.descricao_atendimento, P.nome, PP.formacao, PP.pessoa_id_profissional FROM servico S INNER JOIN solicitacao_orcamento SO on SO.id = S.id_solicitacao_orcamento INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional INNER JOIN pessoa P on P.id = PP.pessoa_id_profissional WHERE SO.id_contratante=?;";
        List<Servico> servicoList = new ArrayList<>();
        SolicitacaoOrcamento orcamento = entity.getSolicitacaoOrcamento();
        Contratante contratante = orcamento.getContrantante();
        Profissional profissional = null;
        Servico servico = null;
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, contratante.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
            
        while (resultSet.next()) {
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            servico = new Servico();
            
            profissional.setNome(resultSet.getString("nome"));
            profissional.setFormacao(resultSet.getString("formacao"));
            profissional.setId(resultSet.getLong("pessoa_id_profissional"));
            
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setHoraInicioAtendimento(resultSet.getString("horario_inicio_atendimento"));
            orcamento.setTempoAtendimento(resultSet.getString("tempo_atendimento"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));
            orcamento.setProfissional(profissional);
            
            servico.setId(resultSet.getLong("id"));
            servico.setSolicitacaoOrcamento(orcamento);
            
            servicoList.add(servico);
        }
            
        return servicoList;   
    }
    
    // OK !
    public void preCreate(Connection connection, Contratante entity) throws SQLException {
        String sql = "INSERT INTO pessoa (security_key, email, senha, nome) VALUES (?, ?, ?, ?);";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, entity.getSecurityKey());
        preparedStatement.setString(2, entity.getEmail());
        preparedStatement.setString(3, entity.getSenha());
        preparedStatement.setString(4, entity.getNome());
   
        preparedStatement.execute();
        preparedStatement.close();  
    }
    
    // OK !
    public Contratante readPreCadastro(String email, Connection connection) throws SQLException {
        String sql = "SELECT P.id, P.email, P.security_key, P.senha, P.nome FROM pessoa P WHERE email = ?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, email);
        Contratante contratante = null;
        ResultSet resultSet = preparedStatement.executeQuery();
            
        if (resultSet.next()) {
            contratante = new Contratante();
            contratante.setId(resultSet.getLong("id"));
            contratante.setEmail(resultSet.getString("email"));
            contratante.setSecurityKey(resultSet.getString("security_key"));
            contratante.setSenha(resultSet.getString("senha"));
            contratante.setNome(resultSet.getString("nome"));
        }
        
        return contratante;           
    }
    
    // OK !
    private void continueCreateContratante(Connection connection, Contratante entity) throws SQLException {
        String sql = "INSERT INTO contratante (pessoa_id_contratante) VALUES (?);";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, entity.getId());
        
        preparedStatement.execute();
    }

    public List<Mensagem> readbyMensagem(Connection connection, Servico entity) throws SQLException {
        String sql = "SELECT M.id, M.mensagem,M.id_servico , SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.tempo_atendimento, SO.descricao_atendimento, P.nome, PP.formacao,  PP.pessoa_id_profissional FROM mensagem M INNER JOIN servico S on S.id = M.id_servico  INNER JOIN solicitacao_orcamento SO on SO.id = S.id_solicitacao_orcamento INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional  INNER JOIN pessoa P on P.id = PP.pessoa_id_profissional WHERE SO.id_contratante=?;";
        List<Mensagem> mensagemList = new ArrayList<>();
        SolicitacaoOrcamento orcamento = entity.getSolicitacaoOrcamento();
        Contratante contratante = orcamento.getContrantante();
        Profissional profissional = null;
        Servico servico = null;
        Mensagem mensagem = null;
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, contratante.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
            
        while (resultSet.next()) {
            mensagem = new Mensagem();
            mensagem.setId(resultSet.getLong("id"));
            mensagem.setMensagem(resultSet.getString("mensagem"));
            mensagem.setIdServico(resultSet.getLong("id_servico"));

            mensagemList.add(mensagem);
        }
        return mensagemList;
    }

    public void createMensagem(Connection connection, Mensagem entity) throws SQLException {
        String sql = "INSERT INTO Mensagem (id_servico, mensagem) VALUES (?, ?);";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, entity.getIdServico());
        preparedStatement.setString(2, entity.getMensagem());
       
   
        preparedStatement.execute();
        preparedStatement.close();  
    }
    
    public List<Servico> readbyAtendimentosAnteriores(Connection connection, Servico entity) throws Exception {
        String sql = "SELECT S.id, SO.data_inicio_atendimento, SO.horario_inicio_atendimento, SO.descricao_atendimento, SO.status_atual, P.nome, PP.pessoa_id_profissional FROM servico S INNER JOIN solicitacao_orcamento SO on SO.id = S.id_solicitacao_orcamento INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional INNER JOIN pessoa P on P.id = PP.pessoa_id_profissional WHERE SO.id_contratante=? AND SO.data_inicio_atendimento<=? AND SO.status_atual='APROVADO';";
        List<Servico> servicoList = new ArrayList<>();
        SolicitacaoOrcamento orcamento = entity.getSolicitacaoOrcamento();
        Contratante contratante = orcamento.getContrantante();
        Profissional profissional = null;
        Servico servico = null;
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setLong(1, contratante.getId());
        preparedStatement.setString(2, orcamento.getDataInicioAtendimento());
        ResultSet resultSet = preparedStatement.executeQuery();
            
        while (resultSet.next()) {
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            servico = new Servico();
            
            profissional.setNome(resultSet.getString("nome"));
            profissional.setId(resultSet.getLong("pessoa_id_profissional"));
            
            orcamento.setDataInicioAtendimento(resultSet.getString("data_inicio_atendimento"));
            orcamento.setHoraInicioAtendimento(resultSet.getString("horario_inicio_atendimento"));
            orcamento.setDescricaoAtendimento(resultSet.getString("descricao_atendimento"));
            orcamento.setStatusAtual(resultSet.getString("status_atual"));
            orcamento.setProfissional(profissional);
            
            servico.setId(resultSet.getLong("id"));
            servico.setSolicitacaoOrcamento(orcamento);
            
            servicoList.add(servico);
        }
            
        return servicoList;   
    }

    public List<SolicitacaoOrcamento> readByHistorico(Connection connection, SolicitacaoOrcamento entity) throws SQLException {
        String sql = "SELECT SO.id, SO.data_inicio_atendimento, SO.status_atual, SO.descricao_atendimento, SO.valor_atendimento, P.nome, PP.formacao FROM solicitacao_orcamento SO INNER JOIN pessoa P on P.id = SO.id_profissional INNER JOIN profissional PP on PP.pessoa_id_profissional = SO.id_profissional WHERE SO.id_contratante=?;";
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        SolicitacaoOrcamento orcamento = null;
        Profissional profissional = null;
        Contratante contratante = entity.getContrantante();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, contratante.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()){
            orcamento = new SolicitacaoOrcamento();
            profissional = new Profissional();
            
            profissional.setNome(resultSet.getString("nome"));
            profissional.setFormacao(resultSet.getString("formacao"));
            
            orcamento.setProfissional(profissional);
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

