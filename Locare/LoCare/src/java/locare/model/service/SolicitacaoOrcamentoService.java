package locare.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import locare.model.ConnectionManager;
import locare.model.DAO.SolicitacaoOrcamentoDAO;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author gabriel
 */
public class SolicitacaoOrcamentoService {
    public void create(SolicitacaoOrcamento orcamento) throws Exception{
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamentoDAO dao = new SolicitacaoOrcamentoDAO();
        
        try {    
            dao.create(connection, orcamento);
            
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }

    public void completarOrcamento(SolicitacaoOrcamento orcamento) throws Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        SolicitacaoOrcamentoDAO dao = new SolicitacaoOrcamentoDAO();
        
        try {    
            dao.updateOrcamento(connection, orcamento);
            
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
}
