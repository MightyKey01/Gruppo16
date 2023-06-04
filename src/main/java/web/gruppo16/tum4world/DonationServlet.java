package web.gruppo16.tum4world;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.Date;


@WebServlet(name = "DonationServlet", value = "/DonationServlet")
public class DonationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ammontare = request.getParameter("ammontareform");
        Donazione d = new Donazione((String)request.getSession(false).getAttribute("username"),Integer.parseInt(ammontare));
        String filecontent = "";

        File file = new File(getServletContext().getRealPath("/")+"\\donazioni.json");
        try(FileReader r = new FileReader(file)){
            char[] chars = new char[(int) file.length()];
            r.read(chars);
            chars[((int) file.length())-1] = ',';
            filecontent = new String(chars);
        }catch (IOException e) {
            e.printStackTrace();
        }

        filecontent += d.toJSON() + "]";

        try(FileWriter p = new FileWriter(file)){
            p.write(filecontent);
        }catch (FileNotFoundException e){
           e.printStackTrace();
        }

        response.sendRedirect("./ProfiloServlet");
    }

}

class Donazione{
    String donatore;
    int ammontare;
    Date data;

    Donazione(String _donatore, int _ammontare){
        donatore = _donatore;
        ammontare = _ammontare;
        data = new Date();
    }

    public String toJSON(){
        String json = "{ \"donatore\": \""+donatore+"\",";
        json += "\"ammontare\": \""+ammontare+"\",";
        json += "\"data\": \""+data+"\"}";
        return json;
    }
}

