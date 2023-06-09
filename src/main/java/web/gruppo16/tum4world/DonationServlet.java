package web.gruppo16.tum4world;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

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
        JSONObject donazione = new JSONObject();
        donazione.put("donatore", (String)request.getSession(false).getAttribute("username"));
        donazione.put("ammontare",Integer.parseInt(ammontare));
        Date d = new Date();
        donazione.put("data", d.toString());

        JSONParser parser = new JSONParser();
        JSONArray arr;
        JSONObject result = new JSONObject();



        File file = new File(getServletContext().getRealPath("/")+"\\donazioni.json");
        try(FileReader r = new FileReader(file)){
            JSONObject jo = (JSONObject) parser.parse(r);
            arr = (JSONArray) jo.get("donazioni");
            arr.add(donazione);
            result.put("donazioni",arr);

        }catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try(FileWriter p = new FileWriter(file)){
            p.write(result.toJSONString());

        }catch (FileNotFoundException e){
           e.printStackTrace();
        }

        response.sendRedirect(response.encodeURL("./ProfiloServlet"));
    }
}



