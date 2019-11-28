package locare.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import locare.model.entity.Contratante;
import locare.model.entity.Profissional;
import locare.model.entity.SolicitacaoOrcamento;
import locare.model.service.ProfissionalService;
import locare.model.service.SolicitacaoOrcamentoService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author gabriel
 */

@RestController
public class MapController {
    
    @RequestMapping(value="/getProfissional", method = RequestMethod.GET)
    public List<Profissional> getProfissional(HttpSession session) throws SQLException {
        ProfissionalService service = new ProfissionalService();
        List<Profissional> profissionaisList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        
        profissionaisList = service.getProfissionaisCidade(contratante);
        
        return profissionaisList;
    }
    
    @RequestMapping(value="/getProfissionalCidade", method = RequestMethod.GET)
    public List<Profissional> getProfissionalCidade(HttpSession session) throws SQLException {
        ProfissionalService service = new ProfissionalService();
        
        List<Profissional> profissionaisList = new ArrayList<>();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        
        profissionaisList = service.getProfissionaisCidadeProcurada(contratante);
        
        return profissionaisList;
    }
    
    // OK !
    @RequestMapping(value = "/enviarMensagem", method = RequestMethod.POST)
    public ModelAndView enviarMensagem(String profissional, Long profissional_id, String horas, String mensagem, String dataAtendimento, String horaInicial, HttpSession session) throws Exception {
        SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
        SolicitacaoOrcamentoService service = new SolicitacaoOrcamentoService();
        Contratante contratante = new Contratante();
        Profissional p = new Profissional();
        ModelAndView mv = null;
        
        try {
            contratante = (Contratante) session.getAttribute("usuarioLogado");
            p.setEmail(profissional);
            p.setId(profissional_id);
            
            orcamento.setContrantante(contratante);
            orcamento.setProfissional(p);
            orcamento.setDataInicioAtendimento(dataAtendimento);
            orcamento.setTempoAtendimento(horas);
            orcamento.setDescricaoAtendimento(mensagem);
            orcamento.setHoraInicioAtendimento(horaInicial);
            
            service.create(orcamento);
            mv = new ModelAndView("redirect:/dashboardCliente");
        } catch (Exception e) {
            throw e;
        }
        
        return mv;
    }
    
}
