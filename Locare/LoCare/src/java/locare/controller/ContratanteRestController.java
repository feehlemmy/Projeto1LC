package locare.controller;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import locare.model.entity.Contratante;
import locare.model.entity.Mensagem;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;
import locare.model.service.ContratanteService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author felipeleme
 */
@RestController
public class ContratanteRestController {
    
    // OK !
    @RequestMapping("/getOrcamentos")
    public List<SolicitacaoOrcamento> getOrcamentos(HttpSession session) throws Exception{
        ContratanteService service = new ContratanteService();
        List<SolicitacaoOrcamento> orcamentosList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
              
        orcamentosList = service.getOrcamentos(contratante);
        
        return orcamentosList;
    }
    
    // OK !
    @RequestMapping("/getServicos")
    public List<Servico> getServicos(HttpSession session) throws Exception{
        ContratanteService service = new ContratanteService();
        List<Servico> servicoList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
              
        servicoList = service.getServico(contratante);
        
        return servicoList;
    }
    
    @RequestMapping("/getMensagens")
    public List<Mensagem> getMensagens(HttpSession session) throws Exception{  
        ContratanteService service = new ContratanteService();
        List<Mensagem> mensagemList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
              
        mensagemList = service.getMensagem(contratante);
        
        return mensagemList;
    }
    
    @RequestMapping(value = "/enviarServico", method = RequestMethod.POST)
    public String createServico(@RequestBody String idRecebido) throws SQLException, Exception{
        ContratanteService service = new ContratanteService();
        Servico servico = null;
        SolicitacaoOrcamento orcamento = null;
        
        try{
            orcamento = new SolicitacaoOrcamento();
            servico = new Servico();
            
            String[] getId = idRecebido.split("=");
            orcamento.setId(Long.parseLong(getId[1]));
            orcamento.setStatusAtual("APROVADO");

            servico.setSolicitacaoOrcamento(orcamento);

            service.createServico(servico);
            service.concluirOrcamento(orcamento);
        } catch (Exception e){
            throw e;
        }

        return "ok";
    }
    
    @RequestMapping("/getAtendimentosAnteriores")
    public List<Servico> getAtendimentosAnteriores(HttpSession session) throws Exception{
        ContratanteService service = new ContratanteService();
        List<Servico> servicoList = new ArrayList<>();
        Contratante contratante = new Contratante();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
        String data = dateFormat.format(date);
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
              
        servicoList = service.getAtendimentosAnteriores(contratante, data);
        
        return servicoList;
    }
    
    @RequestMapping("/getHistorico")
    public List<SolicitacaoOrcamento> getHistorico(HttpSession session) throws Exception{
        ContratanteService service = new ContratanteService();
        List<SolicitacaoOrcamento> orcamentosList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
              
        orcamentosList = service.getHistorico(contratante);
        
        return orcamentosList;
    }
    
    @RequestMapping("/getCidadeSession")
    public String getCidadeSession(HttpSession session) throws Exception{
        Contratante contratante = new Contratante();
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        String cidade = contratante.getCidadeProcurada();
        
        return cidade;
    }  
}
