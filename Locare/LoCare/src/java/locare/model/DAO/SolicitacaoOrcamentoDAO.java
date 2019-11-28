package locare.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import locare.model.entity.Contratante;
import locare.model.entity.Profissional;
import locare.model.entity.SolicitacaoOrcamento;

/**
 *
 * @author gabriel
 */
public class SolicitacaoOrcamentoDAO {
    public void create(Connection connection, SolicitacaoOrcamento entity) throws Exception {
        String sql = "INSERT INTO solicitacao_orcamento(id_contratante, id_profissional, data_inicio_atendimento, horario_inicio_atendimento, tempo_atendimento, descricao_atendimento) VALUES (?, ?, ?, ?, ?, ?);";
        Profissional profissional = entity.getProfissional();
        Contratante contratante = entity.getContrantante();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, contratante.getId());
        preparedStatement.setLong(2, profissional.getId());
        preparedStatement.setString(3, entity.getDataInicioAtendimento());
        preparedStatement.setString(4, entity.getHoraInicioAtendimento());
        preparedStatement.setString(5, entity.getTempoAtendimento());
        preparedStatement.setString(6, entity.getDescricaoAtendimento());
        
        preparedStatement.execute();
        preparedStatement.close();
       
    }

    public void updateOrcamento(Connection connection, SolicitacaoOrcamento orcamento) throws SQLException {
        String sql = "UPDATE solicitacao_orcamento SET valor_atendimento=?, status_atual='RESPONDIDO' WHERE id=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setDouble(1, orcamento.getValorAtendimento());
        preparedStatement.setLong(2, orcamento.getId());
        
        preparedStatement.execute();
        preparedStatement.close();
    }
    
    public void concluirOrcamento(Connection connection, SolicitacaoOrcamento orcamento) throws SQLException {
        String sql = "UPDATE solicitacao_orcamento SET status_atual=? WHERE id=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setString(1, orcamento.getStatusAtual());
        preparedStatement.setLong(2, orcamento.getId());
        
        preparedStatement.execute();
    }
    
    public void avaliarSolicitacaoOrcamento(Connection connection, SolicitacaoOrcamento entity) throws Exception {
        String sql = "UPDATE solicitacao_orcamento SET status_atual='AVALIADO' WHERE id=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setLong(1, entity.getId());
        
        preparedStatement.execute();
    }

    public void reprovarOrcamento(Connection connection, SolicitacaoOrcamento orcamento) throws SQLException {
        String sql = "UPDATE solicitacao_orcamento SET status_atual=? WHERE id=?;";
        
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        
        preparedStatement.setString(1, orcamento.getStatusAtual());
        preparedStatement.setLong(2, orcamento.getId());
        
        preparedStatement.execute();
    }
}
