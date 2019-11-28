package locare.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import locare.model.entity.Contratante;
import locare.model.entity.Servico;
import locare.model.entity.SolicitacaoOrcamento;
import locare.model.service.ContratanteService;
import locare.model.service.ServicoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContratanteController {
    String Email;

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getForm(){
        ModelAndView mv = new ModelAndView("formularioContratante");
        return mv;
    }
    
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(String nome, String email, String senha){
        String securityKey;
        Contratante contratante = new Contratante();
        ContratanteService service = new ContratanteService();
        ModelAndView mv = null;
        
        contratante.setNome(nome);
        contratante.setEmail(email);
        contratante.setSenha(senha);
        
        try {
            securityKey = service.sendEmail(contratante);
            contratante.setSecurityKey(securityKey);
            service.preCreate(contratante);

            mv = new ModelAndView("preCadastro");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        
        return mv;
    }
    
    @RequestMapping(value = "/confimarEmail", method = RequestMethod.GET)
    public ModelAndView getForm2(){
        ModelAndView mv = new ModelAndView("confimarEmail");
        return mv;
    }

    @RequestMapping(value = "/confimarEmail", method = RequestMethod.POST)
    public ModelAndView continueCreate(HttpSession session, String securityKey2, String email) throws Exception{
        Contratante contratante = new Contratante();
        ContratanteService service = new ContratanteService();
        ModelAndView mv = null;

        contratante = service.readPreCadastro(email);
        setEmail(email);
            
        if(contratante.getSecurityKey().equals(securityKey2)){
            session.setAttribute("usuarioLogado", securityKey2);
            mv= new ModelAndView("redirect:/completarCadastroContratante");
        }else{
            mv= new ModelAndView("redirect:/confirmarEmail");
        }
        
        return mv;
    }
    
    @RequestMapping(value = "/completarCadastroContratante", method = RequestMethod.GET)
    public ModelAndView completarCadastro(){
        ModelAndView mv = new ModelAndView("completarCadastroContratante");
        
        return mv;
    }
    
    @RequestMapping(value = "/completarCadastroContratante", method = RequestMethod.POST)
    public ModelAndView finishCreate(HttpSession session, String cpf, String telefone, String dataNascimento, String endereco, String cidade, String estado, String cep) throws SQLException{
        Contratante contratante = new Contratante();
        ContratanteService service = new ContratanteService();
        ModelAndView mv = null;

        contratante = service.readPreCadastro(getEmail());
        contratante.setCep(cep);
        contratante.setCidade(cidade);
        contratante.setDataNascimento(dataNascimento);
        contratante.setCpf(cpf);
        contratante.setTelefone(telefone);
        contratante.setEndereco(endereco);
        contratante.setEstado(estado);
            
        try {
            service.create(contratante);
            session.removeAttribute("usuarioLogado");
            session.setAttribute("usuarioLogado", contratante);
            
            mv = new ModelAndView("redirect:/dashboardCliente");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteProfile", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteProfile() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteProfile");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteProfile", method = RequestMethod.POST)
    public ModelAndView updateContratante(HttpSession session, String cpf, String telefone, String dataNascimento, String endereco, String cidade, String estado, String cep) throws SQLException{
        Contratante contratante = new Contratante();
        ContratanteService service = new ContratanteService();
        ModelAndView mv = null;

        contratante = service.readPreCadastro(getEmail());
        contratante.setCep(cep);
        contratante.setCidade(cidade);
        contratante.setDataNascimento(dataNascimento);
        contratante.setCpf(cpf);
        contratante.setTelefone(telefone);
        contratante.setEndereco(endereco);
        contratante.setEstado(estado);
            
        try {
            service.create(contratante);
            session.removeAttribute("usuarioLogado");
            session.setAttribute("usuarioLogado", contratante);
            
            mv = new ModelAndView("redirect:/dashboardCliente");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        return mv;
    }  
    
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ModelAndView logout(HttpSession session){
        ModelAndView mv = null;
        session.removeAttribute("usuarioLogado");
        
        mv = new ModelAndView("redirect:/");
        
        return mv;
    }
    
    @RequestMapping(value = "/deletePessoa", method = RequestMethod.POST)
    public ModelAndView deleteContratante(HttpSession session) throws SQLException{
        ModelAndView mv = null;
        ContratanteService service = new ContratanteService();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        service.delete(contratante);
        
        session.removeAttribute("usuarioLogado");
        mv = new ModelAndView("redirect:/");
        
        return mv;
    }
    
    @RequestMapping(value = "/updateSenha", method = RequestMethod.POST)
    public ModelAndView updateSenha(HttpSession session, String senha) throws SQLException{
        ModelAndView mv = null;
        ContratanteService service = new ContratanteService();
        Contratante contratante = new Contratante();
        
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        contratante.setSenha(senha);
        service.updateSenha(contratante);
        
        mv = new ModelAndView("redirect:/dashboardClienteProfile");

        return mv;
    }
    
    @RequestMapping(value = "/enviarAvaliacao", method = RequestMethod.POST)
    public ModelAndView enviarAvaliacao(String id, String nota, String avaliacao_atendimento, HttpSession session) throws Exception{
        ModelAndView mv = null;
            String avaliacao = "" + nota + " - " + avaliacao_atendimento;
            SolicitacaoOrcamento orcamento = null;
            ServicoService service = new ServicoService();

            try{
                orcamento = new SolicitacaoOrcamento();
                orcamento.setId(Long.parseLong(id));
                orcamento.setAvaliacao(avaliacao);
                orcamento.setStatusAtual("AVALIADO");

                service.avaliarServico(orcamento);
                
                mv = new ModelAndView("redirect:/dashboardClienteAvaliar");
            } catch (Exception e){
                throw e;
            }
            
        
        return mv;
    }
    
//    @RequestMapping(value = "/enviarServico", method = RequestMethod.POST)
//    public ModelAndView createServico(HttpSession session, String id, String orcamentoAprovado) throws SQLException, Exception{
//        ModelAndView mv = null;
//        
//        if (orcamentoAprovado.equals("sim")) {
//            ContratanteService service = new ContratanteService();
//            SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
//            Servico servico = new Servico();
//
//            orcamento.setId(Long.parseLong(id));
//            orcamento.setStatusAtual("APROVADO");
//
//            servico.setSolicitacaoOrcamento(orcamento);
//
//            service.createServico(servico);
//            service.concluirOrcamento(orcamento);
//            
//            mv = new ModelAndView("redirect:/dashboardClienteOrcamento");
//            
//        } else if(orcamentoAprovado.equals("nao")) {
//            ContratanteService service = new ContratanteService();
//            SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
//            
//            orcamento.setId(Long.parseLong(id));
//            orcamento.setStatusAtual("REPROVADO");
//            
//            service.concluirOrcamento(orcamento);
//            
//            mv = new ModelAndView("redirect:/dashboardClienteOrcamento");
//        }
//        
//        
//        return mv;
//    }
    
    @RequestMapping(value = "/reprovarOrcamento", method = RequestMethod.POST)
    public ModelAndView reprovarOrcamento(String id, HttpSession session) throws Exception{
        ModelAndView mv = null;
            
            SolicitacaoOrcamento orcamento = null;
            ContratanteService service = new ContratanteService();

            try{
                orcamento = new SolicitacaoOrcamento();
                orcamento.setId(Long.parseLong(id));
                orcamento.setStatusAtual("REPROVADO");
            
                service.reprovarOrcamento(orcamento);
                
                mv = new ModelAndView("redirect:/dashboardClienteOrcamento");
            } catch (Exception e){
                throw e;
            }
            
        return mv;
    }
    
    @RequestMapping(value = "/pesquisarCidade", method = RequestMethod.POST)
    public ModelAndView pesquisarCidade(String cidade, HttpSession session) throws Exception{
        ModelAndView mv = null;
        
        Contratante contratante = new Contratante();
        contratante = (Contratante) session.getAttribute("usuarioLogado");
        contratante.setCidadeProcurada(cidade);
        
        session.removeAttribute("usuarioLogado");
        session.setAttribute("usuarioLogado", contratante);
        
        mv = new ModelAndView("dashboardClienteCidade");
            
        return mv;
    }
}