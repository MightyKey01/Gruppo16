package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet(name = "SignInServlet", value = "/SignInServlet")
public class SignInServlet extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/gruppo16DB";
    Connection conn = null;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String nome = request.getParameter("nomesignin");
        String cognome = request.getParameter("cognomesignin");
        String data = request.getParameter("datasignin");
        String email = request.getParameter("emailsignin");
        String tel = request.getParameter("numerosignin");
        String ruolo = request.getParameter("ruolosignin");
        String username = request.getParameter("usernamesignin");
        String pass = request.getParameter("passwordsignin");


        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM UTENTI WHERE USERNAME = ?");
            ps.setString(1,username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                request.getSession().setAttribute("errorSignIn", "16: Username gia utilizzato!");
                response.sendRedirect(response.encodeURL("sign_in.jsp"));
            }else{
                request.getSession().removeAttribute("errorSignIn");
                ps = conn.prepareStatement("INSERT INTO UTENTI values (?,?,?,?,?,?,?,?)");
                ps.setString(1,nome);
                ps.setString(2,cognome);
                ps.setString(3,data);
                ps.setString(4,email);
                ps.setString(5,tel);
                ps.setString(6,ruolo);
                ps.setString(7,username);
                ps.setString(8,pass);
                ps.executeUpdate();
                response.sendRedirect(response.encodeURL("registrazioneConfermata.jsp"));
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();

        }
    }
}

