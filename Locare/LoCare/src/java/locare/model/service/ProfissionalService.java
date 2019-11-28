package locare.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import locare.model.ConnectionManager;
import locare.model.entity.Profissional;
import locare.model.DAO.ProfissionalDAO;
import locare.model.DAO.SolicitacaoOrcamentoDAO;
import locare.model.entity.Contratante;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author felipeleme
 */
public class ProfissionalService {

    public void create(Profissional profissional) throws Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ProfissionalDAO dao = new ProfissionalDAO();
            dao.create(connection, profissional);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
    public String sendEmail(Profissional profissional){
        String securityKey; 
        EmailFactoryProfissional mail = new EmailFactoryProfissional(); 
        securityKey = mail.sendMail(profissional);
         
        return securityKey;
    }
    
    // OK !
    public List<Profissional> getProfissionaisCidade(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Profissional profissional = new Profissional();
        ProfissionalDAO dao = new ProfissionalDAO();
        
        profissional.setCidade(contratante.getCidade());
        
        List<Profissional> profissionaisCidade = dao.readbyCidade(connection, profissional);
        
        return profissionaisCidade;
    }
    
    public List<Profissional> getProfissionaisCidadeProcurada(Contratante contratante) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Profissional profissional = new Profissional();
        ProfissionalDAO dao = new ProfissionalDAO();
        
        profissional.setCidade(contratante.getCidadeProcurada());
        
        List<Profissional> profissionaisCidade = dao.readbyCidadeProcurada(connection, profissional);
        
        return profissionaisCidade;
    }

    public Profissional verifyLogin(String email, String senha) throws SQLException{
        Connection connection = ConnectionManager.getInstance().getConnection();
        Profissional profissional = new Profissional();
        ProfissionalDAO dao = new ProfissionalDAO();
        profissional = dao.readByLogin(email,senha, connection);
        return profissional;
    }
    
    public List<SolicitacaoOrcamento> getMensagensProfissional(Profissional profissional) throws SQLException{
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ProfissionalDAO dao = new ProfissionalDAO();
        
        orcamento.setProfissional(profissional);
        
        List<SolicitacaoOrcamento> mensagensProfissional = dao.readBySolicitacao(connection, orcamento);
        return mensagensProfissional;
    }

    public void delete(Profissional profissional) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ProfissionalDAO dao = new ProfissionalDAO();
            dao.delete(connection, profissional);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
    
    public void updateSenha(Profissional profissional) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
   
        try {
            ProfissionalDAO dao = new ProfissionalDAO();
            dao.updateSenha(connection, profissional);
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }       

    public List<SolicitacaoOrcamento> getOrcamentoProfissional(Profissional profissional) throws SQLException, Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ProfissionalDAO dao = new ProfissionalDAO();
        orcamento.setProfissional(profissional);
        
        List<SolicitacaoOrcamento> servicoProfissional =  dao.readBySolicitacao(connection, orcamento);
        
        return servicoProfissional;    
    }
    
    public List<Servico> getServico(Profissional profissional) throws SQLException, Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Servico servico = new Servico();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ProfissionalDAO dao = new ProfissionalDAO();
        
        orcamento.setProfissional(profissional);
        
        servico.setSolicitacaoOrcamento(orcamento);        
        List<Servico> servicoProfissional = dao.readbyServico(connection, servico);
        
        return servicoProfissional;
    
    }
    
    public void precreate(Profissional profissional) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();

        try {
            ProfissionalDAO dao = new ProfissionalDAO();
            dao.precreate(connection, profissional);
            connection.commit();
            connection.close();
        } catch (SQLException e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    
    }

    public Profissional readPreCadastro(String email) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        Profissional profissional = new Profissional();
        ProfissionalDAO dao = new ProfissionalDAO();
        profissional = dao.readPreCadastro(email, connection);

        return profissional; 
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

    public List<SolicitacaoOrcamento> getHistoricoProfissional(Profissional profissional) throws SQLException {
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        ProfissionalDAO dao = new ProfissionalDAO();
        
        orcamento.setProfissional(profissional);
        
        List<SolicitacaoOrcamento> listHistoricoProfissional =  dao.readByHistorico(connection, orcamento);
        
        return listHistoricoProfissional;
    }
}

