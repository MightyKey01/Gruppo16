package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ProfiloServlet", value = "/ProfiloServlet")
public class ProfiloServlet extends HttpServlet {
    String dbURL = "jdbc:derby://localhost:1527/gruppo16DB";
    Connection conn = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        String ruolo = (String) s.getAttribute("ruolo");
        String username = (String) s.getAttribute("username");
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL);

            try (PrintWriter out = response.getWriter()) {

                if (ruolo.equals("Admin")) {
                    request.getRequestDispatcher("/fragments/admintop.jsp").include(request, response);

                    out.println("<div hidden='hidden' class='text-center' id='utentireg'>");
                    out.println("<table class=\"table\"><thead><tr><th scope=\"col\">Username</th><th scope=\"col\">Nome</th><th scope=\"col\">Cognome</th><th scope=\"col\">Ruolo</th></tr></thead><tbody>");
                    PreparedStatement ps = conn.prepareStatement("SELECT USERNAME, NOME, COGNOME, RUOLO FROM UTENTI WHERE RUOLO <> 'Admin'");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        out.println("<tr>");
                        out.println("<td>" + rs.getString(1) + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td></tr>");
                    }

                    out.println("</tbody></table></div>");

                    out.println("<div hidden='hidden' class='text-center' id='simpreg'>");
                    out.println("<table class=\"table\"><thead><tr><th scope=\"col\">Username</th><th scope=\"col\">Nome</th><th scope=\"col\">Cognome</th><th scope=\"col\">Ruolo</th></tr></thead><tbody>");
                    ps = conn.prepareStatement("SELECT USERNAME, NOME, COGNOME, RUOLO FROM UTENTI WHERE RUOLO = 'Simpatizzante'");
                    rs = ps.executeQuery();
                    while(rs.next()){
                        out.println("<tr>");
                        out.println("<td>" + rs.getString(1) + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td></tr>");
                    }

                    out.println("</tbody></table></div>");

                    out.println("<div hidden='hidden' class='text-center' id='adereg'>");
                    out.println("<table class=\"table\"><thead><tr><th scope=\"col\">Username</th><th scope=\"col\">Nome</th><th scope=\"col\">Cognome</th><th scope=\"col\">Ruolo</th></tr></thead><tbody>");
                    ps = conn.prepareStatement("SELECT USERNAME, NOME, COGNOME, RUOLO FROM UTENTI WHERE RUOLO = 'Aderente'");
                    rs = ps.executeQuery();
                    while(rs.next()){
                        out.println("<tr>");
                        out.println("<td>" + rs.getString(1) + "</td>");
                        out.println("<td>" + rs.getString(2) + "</td>");
                        out.println("<td>" + rs.getString(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td></tr>");
                    }

                    out.println("</tbody></table></div>");


                    request.getRequestDispatcher("/fragments/admindown.html").include(request, response);
                }
                else {
                    if (ruolo.equals("Aderente")) {
                        request.getRequestDispatcher("/fragments/adetop.jsp").include(request, response);
                    }
                    if (ruolo.equals("Simpatizzante")) {
                        request.getRequestDispatcher("/fragments/simptop.jsp").include(request, response);
                    }

                    out.println("<div hidden='hidden' class='text-center' id='personalinfo'>");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM UTENTI WHERE USERNAME = ?");
                    ps.setString(1, username);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        out.println("<br>");
                        out.println("<p>NOME: " + rs.getString(1) + "</p>");
                        out.println("<p>COGNOME: " + rs.getString(2) + "</p>");
                        out.println("<p>DATA NASCITA: " + rs.getString(3) + "</p>");
                        out.println("<p>EMAIL: " + rs.getString(4) + "</p>");
                        out.println("<p>TELEFONO: " + rs.getString(5) + "</p>");
                        out.println("<p>RUOLO: " + rs.getString(6) + "</p>");
                        out.println("<p>USERNAME: " + rs.getString(7) + "</p>");
                        out.println("<p>PASSWORD: " + rs.getString(8) + "</p>");
                    }
                    out.println("</div>");

                    out.println("</div>");

                    out.println("<br>");
                    out.println("<div class='px-5 text-center' hidden='hidden' id='cardsactivity'>");
                    ps = conn.prepareStatement("SELECT * FROM Attivita");
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        out.println("<form name='iscrizionecard' action='" + response.encodeURL("./IscrizioneServlet") + "' method='post'>");
                        out.println("<div class='card' style='width: 18rem;'>");
                        out.println("<div class='card-header' style='background-color: #80ced6;'>" + rs.getString(2) + "</div>");
                        out.println("<div class='card-body' style='background-color: #d5f4e6;'>");
                        out.println("<p class='card-text'>" + rs.getString(3) + "</p>");
                        out.println("<input hidden='hidden' type='text' name='id' value=" + rs.getString(1) + ">");
                        out.println("<button type='submit' class='btn btn-primary mb-3'>Iscriviti</button>");
                        out.println("</div></div></form>");
                    }
                    out.println("</div>");


                    if (ruolo.equals("Aderente")) {
                        request.getRequestDispatcher("/fragments/adedown.html").include(request, response);
                    }
                    if (ruolo.equals("Simpatizzante")) {
                        request.getRequestDispatcher("/fragments/simpdown.html").include(request, response);
                    }

                }
            }
        }catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
