package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AccessoProfilo implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {  }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);

        boolean logged = (session != null && session.getAttribute("logged") == Boolean.TRUE);

        if(logged){
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            request.getSession().setAttribute("errorLogin", "16: Devi prima eseguire il login!");
            response.sendRedirect(response.encodeURL("login.jsp"));
        }
     }

    public void destroy() { }
}
