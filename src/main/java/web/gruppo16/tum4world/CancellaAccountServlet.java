package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "CancellaAccountServlet", value = "/CancellaAccountServlet")
public class CancellaAccountServlet extends HttpServlet {

    String dbURL = "jdbc:derby://localhost:1527/gruppo16DB";
    Connection conn = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL);
            HttpSession s = request.getSession(false);
            PreparedStatement ps = conn.prepareStatement("DELETE FROM UTENTI WHERE USERNAME = ?");
            ps.setString(1,(String) s.getAttribute("username"));
            ps.executeUpdate();
            ps = conn.prepareStatement("DELETE FROM ISCRIZIONI WHERE USERNAME = ?");
            ps.setString(1,(String) s.getAttribute("username"));
            ps.executeUpdate();

            s.removeAttribute("username");
            s.removeAttribute("ruolo");
            s.removeAttribute("logged");
            conn.close();
            response.sendRedirect("index.jsp");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}
