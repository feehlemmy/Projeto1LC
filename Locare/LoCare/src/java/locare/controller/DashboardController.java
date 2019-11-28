package locare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 
 * @author gabriel
 */

@Controller
public class DashboardController {
    
    @RequestMapping(value = "/dashboardCliente", method = RequestMethod.GET)
    public ModelAndView getDashboardCliente() {
        ModelAndView mv = null;
        try {
            mv = new ModelAndView("dashboardCliente");
            //mv.addObject("dashboardCliente", contratanteList);
        } catch (Exception ex) {
            mv = new ModelAndView("error");
        }
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteOrcamento", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteOrcamento(){
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteOrcamento");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteAvaliar", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteAvaliar(){
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteAvaliar");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteHistory", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteHistory() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteHistory");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteCalendar", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteCalendar() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteCalendar");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteChat", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteChat() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteChat");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardClienteDuvidas", method = RequestMethod.GET)
    public ModelAndView getDashboardClienteDuvidas() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardClienteDuvidas");
        
        return mv;
    }
    
    // Requisições Dashboard Profissional
    @RequestMapping(value = "/dashboardProfissional", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissional() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissional");
               
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalProfile", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalProfile() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalProfile");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalHistory", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalHistory() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalHistory");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalCalendar", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalCalendar() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalCalendar");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalChat", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalChat() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalChat");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalCharts", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalCharts() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalCharts");
        
        return mv;
    }
    
    @RequestMapping(value = "/dashboardProfissionalDuvidas", method = RequestMethod.GET)
    public ModelAndView getDashboardProfissionalDuvidas() {
        ModelAndView mv = null;
        
        mv = new ModelAndView("dashboardProfissionalDuvidas");
        
        return mv;
    }
}
