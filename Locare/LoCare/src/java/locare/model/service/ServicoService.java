package locare.model.service;

import java.sql.Connection;
import locare.model.ConnectionManager;
import locare.model.DAO.ServicoDAO;
import locare.model.DAO.SolicitacaoOrcamentoDAO;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author gabrielsilva
 */
public class ServicoService {
    public void avaliarServico(SolicitacaoOrcamento orcamento) throws Exception {
        Connection connection = ConnectionManager.getInstance().getConnection();
        ServicoDAO dao = new ServicoDAO();
        SolicitacaoOrcamentoDAO orcamentoDAO = new SolicitacaoOrcamentoDAO();
                
        
        try {    
            orcamentoDAO.avaliarSolicitacaoOrcamento(connection, orcamento);
            dao.avaliarServico(connection, orcamento);
            connection.commit();
            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            throw e;
        }
    }
}
