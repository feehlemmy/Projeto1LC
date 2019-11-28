package locare.model.entity;

/**
 *
 * @author gabrielsilva
 */
public class Cartao {
    private String numeroCartao;
    private String codigoSeguranca;
    private String bandeia;

    public String getNumeroCartao() {
        return numeroCartao;
    }

    public void setNumeroCartao(String numeroCartao) {
        this.numeroCartao = numeroCartao;
    }

    public String getCodigoSeguranca() {
        return codigoSeguranca;
    }

    public void setCodigoSeguranca(String codigoSeguranca) {
        this.codigoSeguranca = codigoSeguranca;
    }

    public String getBandeia() {
        return bandeia;
    }

    public void setBandeia(String bandeia) {
        this.bandeia = bandeia;
    }
}
