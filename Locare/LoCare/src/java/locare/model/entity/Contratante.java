package locare.model.entity;

public class Contratante extends Pessoa{
    private Pessoa pessoa;
    private Double saldo;
    private String numeroCartao;
    private String securityKey;
    private String cidadeProcurada;

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo;
    }

    public String getNumeroCartao() {
        return numeroCartao;
    }

    public void setNumeroCartao(String numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    public String getSecurityKey() {
        return securityKey;
    }

    public void setSecurityKey(String securityKey) {
        this.securityKey = securityKey;
    }

    public String getCidadeProcurada() {
        return cidadeProcurada;
    }

    public void setCidadeProcurada(String cidadeProcurada) {
        this.cidadeProcurada = cidadeProcurada;
    }
    
}
