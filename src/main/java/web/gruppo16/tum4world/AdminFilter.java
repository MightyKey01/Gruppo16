package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httprequest = (HttpServletRequest) request;
        HttpServletResponse httpresponse = (HttpServletResponse) response;
        HttpSession session = httprequest.getSession(false);

        boolean permission = (session != null && session.getAttribute("ruolo").equals("Admin"));

        if(permission){
            chain.doFilter(httprequest,httpresponse);
        }else{
            httpresponse.sendRedirect(httpresponse.encodeURL("index.jsp"));
        }
    }
}
