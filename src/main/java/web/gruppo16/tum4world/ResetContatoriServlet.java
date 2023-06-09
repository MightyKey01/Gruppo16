package web.gruppo16.tum4world;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "ResetContatoriServlet", value = "/ResetContatoriServlet")
public class ResetContatoriServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        File file = new File(getServletContext().getRealPath("/")+"\\visualizzazioni.json");
        JSONParser parser = new JSONParser();
        JSONArray ris = new JSONArray();

        try(FileReader r = new FileReader(file)){
            JSONObject jo = (JSONObject) parser.parse(r);
            JSONArray arr = (JSONArray) jo.get("visualizzazioni");
            for(int i = 0; i < arr.size(); i++){
                JSONObject t = (JSONObject) arr.get(i);
                t.replace("vis",0);
                ris.add(t);
            }
        }catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try(FileWriter p = new FileWriter(file)){
            JSONObject print = new JSONObject();
            print.put("visualizzazioni", ris);
            p.write(print.toJSONString());

        }catch (FileNotFoundException e){
            e.printStackTrace();
        }

        response.sendRedirect(response.encodeURL("./ProfiloServlet"));
    }
}
