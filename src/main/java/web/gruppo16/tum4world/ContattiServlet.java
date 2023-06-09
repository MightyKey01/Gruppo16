package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.websocket.Session;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet(name = "ContattiServlet", value = "/ContattiServlet")
public class ContattiServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String destinatario = request.getParameter("emailcont");
        PrintWriter out = response.getWriter();
        if(Postino.invia(destinatario)){
            response.sendRedirect(response.encodeURL("invioConfermato.jsp"));
        }else{
            out.println("Oh Oh...Qualcosa è andato storto...");
        }
    }
}
