package locare.model.entity;

/**
 *
 * @author felipeleme
 */
public class Servico {
    private Long id;
    private SolicitacaoOrcamento solicitacaoOrcamento;
    private String statusServico;
    private String avalicaoServico;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public SolicitacaoOrcamento getSolicitacaoOrcamento() {
        return solicitacaoOrcamento;
    }

    public void setSolicitacaoOrcamento(SolicitacaoOrcamento solicitacaoOrcamento) {
        this.solicitacaoOrcamento = solicitacaoOrcamento;
    }

    public String getStatusServico() {
        return statusServico;
    }

    public void setStatusServico(String statusServico) {
        this.statusServico = statusServico;
    }

    public String getAvalicaoServico() {
        return avalicaoServico;
    }

    public void setAvalicaoServico(String avalicaoServico) {
        this.avalicaoServico = avalicaoServico;
    }
    
}