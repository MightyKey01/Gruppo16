package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        s.removeAttribute("username");
        s.removeAttribute("ruolo");
        s.removeAttribute("logged");
        s.invalidate();
        response.sendRedirect("index.jsp");
    }
}
