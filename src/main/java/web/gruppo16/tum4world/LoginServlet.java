package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/gruppo16DB";
    String user = "impact";
    String password = "derby";
    Connection conn = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("usernamelogin");
        String pass = request.getParameter("passwordlogin");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM UTENTI WHERE USERNAME = ? AND PASSWORD = ?");
            ps.setString(1,username);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                out.println("Accesso Eseguito");
            }
            else{
                response.sendRedirect("login.jsp");
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

    }
}
