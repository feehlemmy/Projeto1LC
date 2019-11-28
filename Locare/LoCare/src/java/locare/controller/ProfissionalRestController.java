package locare.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import locare.model.entity.Profissional;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;
import locare.model.service.ProfissionalService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author gabriel
 */
@RestController
public class ProfissionalRestController {
    
    @RequestMapping("/getOrcamentoProfissional")
    public List<SolicitacaoOrcamento> getOrcamentos(HttpSession session) throws Exception{
        ProfissionalService service = new ProfissionalService();
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        Profissional profissional = new Profissional();
        
        profissional  = (Profissional) session.getAttribute("usuarioLogado");
              
        orcamentoList = service.getOrcamentoProfissional(profissional);
        
        return orcamentoList;
    }
    
    @RequestMapping("/getServicosProfissional")
    public List<Servico> getServicos(HttpSession session) throws Exception{
        ProfissionalService service = new ProfissionalService();
        List<Servico> servicoList = new ArrayList<>();
        Profissional profissional = new Profissional();
        
        profissional  = (Profissional) session.getAttribute("usuarioLogado");
              
        servicoList = service.getServico(profissional);
        
        return servicoList;
    }
    
    @RequestMapping("/getHistoricoProfissional")
    public List<SolicitacaoOrcamento> getHistoricoProfissional(HttpSession session) throws Exception{
        ProfissionalService service = new ProfissionalService();
        List<SolicitacaoOrcamento> orcamentoList = new ArrayList<>();
        Profissional profissional = new Profissional();
        
        profissional  = (Profissional) session.getAttribute("usuarioLogado");
              
        orcamentoList = service.getHistoricoProfissional(profissional);
        
        return orcamentoList;
    }
}
