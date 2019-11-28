package locare.model.entity;

/**
 *
 * @author gabrielsilva
 */
public class SolicitacaoOrcamento {
    private Long id;
    private Contratante contrantante;
    private Profissional profissional;
    private String dataInicioAtendimento;
    private String dataFimAtendimento;
    private String horaInicioAtendimento;
    private String tempoAtendimento;
    private String descricaoAtendimento;
    private String statusAtual;
    private String avaliacao;
    private Double valorAtendimento;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Contratante getContrantante() {
        return contrantante;
    }

    public void setContrantante(Contratante contrantante) {
        this.contrantante = contrantante;
    }

    public Profissional getProfissional() {
        return profissional;
    }

    public void setProfissional(Profissional profissional) {
        this.profissional = profissional;
    }

    public String getDataInicioAtendimento() {
        return dataInicioAtendimento;
    }

    public void setDataInicioAtendimento(String dataInicioAtendimento) {
        this.dataInicioAtendimento = dataInicioAtendimento;
    }

    public String getDataFimAtendimento() {
        return dataFimAtendimento;
    }

    public void setDataFimAtendimento(String dataFimAtendimento) {
        this.dataFimAtendimento = dataFimAtendimento;
    }

    public String getHoraInicioAtendimento() {
        return horaInicioAtendimento;
    }

    public void setHoraInicioAtendimento(String horaInicioAtendimento) {
        this.horaInicioAtendimento = horaInicioAtendimento;
    }

    public String getTempoAtendimento() {
        return tempoAtendimento;
    }

    public void setTempoAtendimento(String tempoAtendimento) {
        this.tempoAtendimento = tempoAtendimento;
    }

    public String getDescricaoAtendimento() {
        return descricaoAtendimento;
    }

    public void setDescricaoAtendimento(String descricaoAtendimento) {
        this.descricaoAtendimento = descricaoAtendimento;
    }

    public String getStatusAtual() {
        return statusAtual;
    }

    public void setStatusAtual(String statusAtual) {
        this.statusAtual = statusAtual;
    }

    public String getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(String avaliacao) {
        this.avaliacao = avaliacao;
    }

    public Double getValorAtendimento() {
        return valorAtendimento;
    }

    public void setValorAtendimento(Double valorAtendimento) {
        this.valorAtendimento = valorAtendimento;
    }
    
}
