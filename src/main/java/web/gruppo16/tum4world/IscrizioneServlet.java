package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "IscrizioneServlet", value = "/IscrizioneServlet")
public class IscrizioneServlet extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/gruppo16DB";
    Connection conn = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idattivita = request.getParameter("id");
        HttpSession s = request.getSession(false);
        String username = (String) s.getAttribute("username");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM ISCRIZIONI WHERE IDATTIVITA = ? AND USERNAME = ?");
            ps.setString(1,idattivita);
            ps.setString(2,username);
            ResultSet rs = ps.executeQuery();
            PrintWriter out = response.getWriter();
            if(!rs.next()){
                ps = conn.prepareStatement("INSERT INTO ISCRIZIONI VALUES (?,?)");
                ps.setString(1,idattivita);
                ps.setString(2,username);
                ps.executeUpdate();
            }
            conn.close();
        }catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}
