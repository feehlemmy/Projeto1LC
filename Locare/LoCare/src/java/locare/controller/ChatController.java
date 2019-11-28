/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locare.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import locare.model.entity.Mensagem;
import locare.model.service.ContratanteService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author felipeleme
 */
public class ChatController {
     @RequestMapping(value = "/dashboardClienteChat}", method = RequestMethod.GET)
    public ModelAndView createServico(HttpSession session, Long idServico, String mensagemChat) throws SQLException, Exception{
        ModelAndView mv = null;
        
        ContratanteService service = new ContratanteService();
        Mensagem mensagem = new Mensagem();

        mensagem.setIdServico(idServico);
        mensagem.setMensagem(mensagemChat);


        service.createMensagem(mensagem);

        mv = new ModelAndView("redirect:/dashboardClienteChat");

        return mv;
    }
}
