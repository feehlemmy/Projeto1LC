package locare.interceptor;

public class AAInterceptor extends BaseAAInterceptor {

    @Override
    protected String getContexto() {
        return "/LoCare";
    }

    @Override
    protected String getSessionAttributeName() {
        return "usuarioLogado";
    }

    @Override
    protected void loadFreeURIs() {
        addFreeURI("/Resources");
        addFreeURI("/login");       
        addFreeURI("/create");
        addFreeURI("/profissional/create");
        addFreeURI("/confimarEmail");
        addFreeURI("/profissional/confimarEmail");
        addFreeURI("/error");


        

    }

   

}
