package locare.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import locare.model.ConnectionManager;
import locare.model.DAO.ContratanteDAO;
import locare.model.DAO.ServicoDAO;
import locare.model.DAO.SolicitacaoOrcamentoDAO;
import locare.model.entity.Contratante;
import locare.model.entity.Mensagem;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author felipeleme
 */
public class ContratanteService {
    private static List<Contratante> contratanteList = new ArrayList<>();

    public void create(Contratante contratante) throws Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ContratanteDAO dao = new ContratanteDAO();
            dao.create(connection, contratante);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
    
    public String sendEmail(Contratante contratante){
        String securityKey; 
        EmailFactory mail = new EmailFactory(); 
        securityKey = mail.sendMail(contratante);
        
        return securityKey;
    }
    
    // OK!
    public Contratante verifyLogin(String email, String senha) throws SQLException{
        Connection connection = ConnectionManager.getInstance().getConnection();
        Contratante contratante = new Contratante();
        ContratanteDAO dao = new ContratanteDAO();
        
        contratante = dao.readByLogin(email, senha, connection);

        return contratante; 
    }

    public void delete(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ContratanteDAO dao = new ContratanteDAO();
            dao.delete(connection, contratante);
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }

    public void updateSenha(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ContratanteDAO dao = new ContratanteDAO();
            dao.updateSenha(connection, contratante);
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
    
    // OK!
    public List<SolicitacaoOrcamento> getOrcamentos(Contratante contratante) throws SQLException{
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ContratanteDAO dao = new ContratanteDAO();
        
        orcamento.setContrantante(contratante);
        
        List<SolicitacaoOrcamento> orcamentoProfissional = dao.readByOrcamento(connection, orcamento);
        
        return orcamentoProfissional;
    
    }
    
    // OK!
    public List<Servico> getServico(Contratante contratante) throws SQLException, Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Servico servico = new Servico();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ContratanteDAO dao = new ContratanteDAO();
        
        orcamento.setContrantante(contratante);
        
        servico.setSolicitacaoOrcamento(orcamento);
        
        List<Servico> servicoProfissional =  dao.readbyServico(connection, servico);
        
        return servicoProfissional;
    
    }
    
    // OK !
    public void createServico(Servico servico) throws Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ServicoDAO dao = new ServicoDAO();
            dao.create(connection, servico);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    
    }
    
    // OK !
    public void preCreate(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        
        try {
            ContratanteDAO dao = new ContratanteDAO();
            dao.preCreate(connection, contratante);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    
    }
    
    // OK !
    public Contratante readPreCadastro(String email) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Contratante contratante = new Contratante();
        ContratanteDAO dao = new ContratanteDAO();
        contratante = dao.readPreCadastro(email, connection);

        return contratante; 
    }
    
    // OK !
    public void concluirOrcamento(SolicitacaoOrcamento orcamento) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        
        try {
            SolicitacaoOrcamentoDAO dao = new SolicitacaoOrcamentoDAO();
            dao.concluirOrcamento(connection, orcamento);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }

    public List<Mensagem> getMensagem(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Servico servico = new Servico();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        Mensagem mensagem = new Mensagem();
        ContratanteDAO dao = new ContratanteDAO();      
        
        orcamento.setContrantante(contratante);
        servico.setSolicitacaoOrcamento(orcamento);
        mensagem.setServico(servico);
        
        List<Mensagem> mensagemContratante =  dao.readbyMensagem(connection, servico);
        
        return mensagemContratante;    }

    public void createMensagem(Mensagem mensagem) throws SQLException {
      Connection connection = ConnectionManager.getInstance().getConnection();
        
        try {
            ContratanteDAO dao = new ContratanteDAO();
            dao.createMensagem(connection, mensagem);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }

    public List<Servico> getAtendimentosAnteriores(Contratante contratante, String data) throws SQLException, Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Servico servico = new Servico();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ContratanteDAO dao = new ContratanteDAO();
        
        orcamento.setContrantante(contratante);
        orcamento.setDataInicioAtendimento(data);
        
        servico.setSolicitacaoOrcamento(orcamento);
        
        List<Servico> servicoProfissional = dao.readbyAtendimentosAnteriores(connection, servico);
        
        return servicoProfissional;
    }

    public List<SolicitacaoOrcamento> getHistorico(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ContratanteDAO dao = new ContratanteDAO();
        
        orcamento.setContrantante(contratante);
        
        List<SolicitacaoOrcamento> listHistorico = dao.readByHistorico(connection, orcamento);
        
        return listHistorico;
    }

    public void reprovarOrcamento(SolicitacaoOrcamento orcamento) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        
        try {
            SolicitacaoOrcamentoDAO dao = new SolicitacaoOrcamentoDAO();
            dao.reprovarOrcamento(connection, orcamento);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
}
