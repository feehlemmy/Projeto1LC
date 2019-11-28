package locare.interceptor;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public abstract class BaseAAInterceptor extends HandlerInterceptorAdapter {

    protected String contexto;
    protected String attributeName;
    protected List<String> freeURIList;

    public BaseAAInterceptor() {
        freeURIList = new ArrayList<>();
        this.contexto = getContexto();
        this.attributeName = getSessionAttributeName();
        this.loadFreeURIs();
    }

    protected abstract String getContexto();

    protected abstract String getSessionAttributeName();

    protected abstract void loadFreeURIs();

    protected void addFreeURI(String uri) {
        freeURIList.add(getContexto() + uri);
    }

    protected boolean isAFreeURI(String uri) {
        boolean ok = false;
        for (String freeUri : freeURIList) {
            if (uri.startsWith(freeUri)) {
                ok = true;
                break;
            }
        }
        return ok;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        boolean ok = false;
        String uri = request.getRequestURI();
        if (isAFreeURI(uri)) {
            ok = true;
        } else {
            if (request.getSession().getAttribute(attributeName) != null) {
                ok = true;
            } else {
                response.sendRedirect(contexto);
            }
        }
        return ok;
    }

}
