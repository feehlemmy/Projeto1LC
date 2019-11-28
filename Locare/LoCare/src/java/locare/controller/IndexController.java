package locare.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import locare.model.entity.Contratante;
import locare.model.entity.Profissional;
import locare.model.service.ContratanteService;
import locare.model.service.ProfissionalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLoginCliente(){
        ModelAndView mv = null;
        
        mv = new ModelAndView("login");
        
        return mv;
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String usuario, String senha,String options, HttpSession session) throws SQLException {
        ModelAndView mv = null;
        
        //Teste se tem sessão ativa
        Contratante sessaoatual = new Contratante();
        sessaoatual = (Contratante) session.getAttribute("usuarioLogado");
        if(sessaoatual !=null){
            session.removeAttribute("usuarioLogado");
        }

        //Login
        if (options.equals("cliente")) {
            ContratanteService service = new ContratanteService();
            Contratante contratante = new Contratante();
            contratante = service.verifyLogin(usuario, senha);
            
            if (contratante != null){
                session.setAttribute("usuarioLogado", contratante);
                mv = new ModelAndView("redirect:/dashboardCliente");
            }else{
                mv = new ModelAndView("redirect:/login");
                mv.addObject("erro", 1);

            }
        } else if(options.equals("profissional")) {
            ProfissionalService service = new ProfissionalService();
            Profissional profissional = new Profissional();
            profissional = service.verifyLogin(usuario, senha);
            
            if (profissional != null){
                session.setAttribute("usuarioLogado", profissional);
                mv = new ModelAndView("redirect:/dashboardProfissional");
            } else {
                mv = new ModelAndView("redirect:/login");
                mv.addObject("erro", 1);    
            }
        }
        
        return mv;
    }
    
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView getError(){
        ModelAndView mv = null;

        mv = new ModelAndView("error");

        return mv;
    }
}
