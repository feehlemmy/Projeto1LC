package locare.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import locare.model.entity.Profissional;
import locare.model.entity.SolicitacaoOrcamento;
import locare.model.service.SolicitacaoOrcamentoService;
import locare.model.service.ProfissionalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProfissionalController {
String Email;

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    @RequestMapping(value = "/profissional/create", method = RequestMethod.GET)
    public ModelAndView getForm(){
        ModelAndView mv = new ModelAndView("formularioProfissional");
        return mv;
    }
    
    @RequestMapping(value = "profissional/create", method = RequestMethod.POST)
    public ModelAndView create(String nome, String email, String senha){
        String securityKey;
        Profissional profissional = new Profissional();

            profissional.setNome(nome);
            profissional.setEmail(email);
            profissional.setSenha(senha);
            ModelAndView mv = null;
        try {
            ProfissionalService service = new ProfissionalService();
            securityKey=service.sendEmail(profissional);
            profissional.setSecurityKey(securityKey);
            service.precreate(profissional);

            mv = new ModelAndView("preCadastro");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        return mv;
    }
    
    @RequestMapping(value = "/confimarEmailProfissional", method = RequestMethod.GET)
    public ModelAndView getForm2(){
        ModelAndView mv = new ModelAndView("confimarEmailProfissional");
        return mv;
    }
    
    @RequestMapping(value = "/confimarEmailProfissional", method = RequestMethod.POST)
    public ModelAndView continueCreate(String securityKey2, HttpSession session, String email) throws Exception{
        Profissional profissional = new Profissional();
        ProfissionalService service = new ProfissionalService();
        ModelAndView mv = null;
        
        profissional = service.readPreCadastro(email);
        setEmail(email);
        
        if(profissional.getSecurityKey().equals(securityKey2)){
            session.setAttribute("usuarioLogado", securityKey2);
            mv= new ModelAndView("redirect:/completarCadastroProfissional");
        }else{
            mv= new ModelAndView("redirect:/confirmarEmail");
        }
        return mv;
    }
   
    @RequestMapping(value = "/profissional/dashboardProfissionalProfile", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteProfile() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("profissional/dashboardProfissionalProfile");
        
        return mv;
    }
    
    @RequestMapping(value = "/completarCadastroProfissional", method = RequestMethod.GET)
    public ModelAndView getCompletarCadastroProfissional(){
        ModelAndView mv = new ModelAndView("completarCadastroProfissional");
        
        return mv;
    }
    
    @RequestMapping(value = "/completarCadastroProfissional", method = RequestMethod.POST)
    public ModelAndView finishCreate(HttpSession session, String cpf, String telefone, String dataNascimento, String endereco, String cidade, String estado, String cep, String formacao, String ufRegistro, String dataRegistro, String numeroRegistro) throws SQLException{
        Profissional profissional = new Profissional();
        ProfissionalService service = new ProfissionalService();
        ModelAndView mv = null;
        
        profissional = service.readPreCadastro(getEmail());
        profissional.setCep(cep);
        profissional.setCidade(cidade);
        profissional.setDataNascimento(dataNascimento);
        profissional.setCpf(cpf);
        profissional.setTelefone(telefone);
        profissional.setEndereco(endereco);
        profissional.setEstado(estado);
        profissional.setFormacao(formacao);
        profissional.setNumeroRegistro(numeroRegistro);
        profissional.setUfRegistro(ufRegistro);
        profissional.setDataFormacao(dataRegistro);
        
        try {
            service.create(profissional);
            session.removeAttribute("usuarioLogado");
            session.setAttribute("usuarioLogado", profissional);
            
            mv = new ModelAndView("redirect:/dashboardProfissional");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        return mv;
     }
    
    @RequestMapping(value = "/dashboardProfissionalProfile", method = RequestMethod.POST)
    public ModelAndView updateProfissional(HttpSession session, String cpf, String telefone, String dataNascimento, String endereco, String cidade, String estado, String cep, String formacao, String ufRegistro, String dataRegistro, String numeroRegistro) throws SQLException{
        Profissional profissional = new Profissional();
        ProfissionalService service = new ProfissionalService();
        ModelAndView mv = null;
        
        profissional = service.readPreCadastro(getEmail());
        profissional.setCep(cep);
        profissional.setCidade(cidade);
        profissional.setDataNascimento(dataNascimento);
        profissional.setCpf(cpf);
        profissional.setTelefone(telefone);
        profissional.setEndereco(endereco);
        profissional.setEstado(estado);
        profissional.setFormacao(formacao);
        profissional.setNumeroRegistro(numeroRegistro);
        profissional.setUfRegistro(ufRegistro);
        profissional.setDataFormacao(dataRegistro);
        
        try {
            service.create(profissional);
            session.removeAttribute("usuarioLogado");
            session.setAttribute("usuarioLogado", profissional);
            
            mv = new ModelAndView("redirect:/dashboardProfissional");
        } catch (Exception e) {
            mv = new ModelAndView("error");
        }
        return mv;
     }   
    
    @RequestMapping(value = "/dashboardProfissional", method = RequestMethod.POST)
    public ModelAndView inviteOrçamento(String valor){
        ModelAndView mv = null;
        return mv;

    }
    
    @RequestMapping(value = "/responderOrcamento", method = RequestMethod.POST)
    public ModelAndView responderOrcamento(String id, String valor_orcamento, String orcamentoAprovado, HttpSession session) throws Exception{
        ModelAndView mv = null;
        
        if (orcamentoAprovado.equals("sim")) {
            SolicitacaoOrcamento orcamento = null;
            SolicitacaoOrcamentoService service = new SolicitacaoOrcamentoService();

            try{
                orcamento = new SolicitacaoOrcamento();
                orcamento.setId(Long.parseLong(id));
                orcamento.setValorAtendimento(Double.parseDouble(valor_orcamento.replace(",", ".")));
                orcamento.setStatusAtual("APROVADO");

                service.completarOrcamento(orcamento);
                mv = new ModelAndView("redirect:/dashboardProfissional");
            } catch (Exception e){
                throw e;
            }
            
        } else if(orcamentoAprovado.equals("nao")) {
            ProfissionalService service = new ProfissionalService();
            SolicitacaoOrcamento orcamento = new SolicitacaoOrcamento();
            
            orcamento.setId(Long.parseLong(id));
            orcamento.setStatusAtual("REPROVADO");
            
            service.concluirOrcamento(orcamento);
            
            mv = new ModelAndView("redirect:/dashboardProfissional");
        }
        
        return mv;
    }
        
    @RequestMapping(value = "/logoutProfissional", method = RequestMethod.POST)
    public ModelAndView logoutProfissional(HttpSession session){
         ModelAndView mv = null;
        session.removeAttribute("usuarioLogado");
        mv = new ModelAndView("redirect:/");
        
        return mv;
    }
    
    @RequestMapping(value = "/deleteProfissional", method = RequestMethod.POST)
    public ModelAndView deleteProfissional(HttpSession session) throws SQLException{
        ModelAndView mv = null;
        ProfissionalService service = new ProfissionalService();
        Profissional profissional = new Profissional();
        profissional = (Profissional) session.getAttribute("usuarioLogado");
        service.delete(profissional);
        session.removeAttribute("usuarioLogado");
        mv = new ModelAndView("redirect:/");
        
        return mv;
    } 
    
    @RequestMapping(value = "/updateSenhaProfissional", method = RequestMethod.POST)
    public ModelAndView updateSenha(HttpSession session, String senha) throws SQLException{
        ModelAndView mv = null;
        ProfissionalService service = new ProfissionalService();
        Profissional profissional = new Profissional();
        profissional = (Profissional) session.getAttribute("usuarioLogado");
        profissional.setSenha(senha);
        service.updateSenha(profissional);
        session.removeAttribute("usuarioLogado");
        mv = new ModelAndView("redirect:/dashboardProfissional");

       return mv;
    }    
}

