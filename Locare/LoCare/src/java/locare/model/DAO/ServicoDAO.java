package locare.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author felipeleme
 */
public class ServicoDAO {
    
    public void create(Connection connection, Servico entity) throws Exception {
        String sql = "INSERT INTO servico(id_solicitacao_orcamento) VALUES (?);";
        SolicitacaoOrcamento orcamento = entity.getSolicitacaoOrcamento();
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, orcamento.getId());
        
        preparedStatement.execute();
        preparedStatement.close();
    }

    public void avaliarServico(Connection connection, SolicitacaoOrcamento entity) throws SQLException {
        String sql = "UPDATE servico SET status_servico=?, avaliacao_servico=? WHERE id_solicitacao_orcamento=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setString(1, entity.getStatusAtual());
        preparedStatement.setString(2, entity.getAvaliacao());
        preparedStatement.setLong(3, entity.getId());
        
        preparedStatement.execute();
        preparedStatement.close();
    }
}
