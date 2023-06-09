package web.gruppo16.tum4world;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Iterator;

@WebFilter(filterName = "Visualizzazioni")
public class Visualizzazioni implements Filter {
    private FilterConfig config;

    @Override
    public void init(FilterConfig config) {
        this.config = config;
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String servletPath = httpRequest.getServletPath();

        File file = new File(config.getServletContext().getRealPath("/")+"\\visualizzazioni.json");
        JSONParser parser = new JSONParser();
        JSONArray ris = new JSONArray();

        try(FileReader r = new FileReader(file)){
            JSONObject jo = (JSONObject) parser.parse(r);
            JSONArray arr = (JSONArray) jo.get("visualizzazioni");
            for(int i = 0; i < arr.size(); i++){
                JSONObject t = (JSONObject) arr.get(i);
                if(t.get("pagina").equals(servletPath)){
                    int v = ((Long)t.get("vis")).intValue()+1;
                    t.replace("vis",v);
                }
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

        chain.doFilter(request, response);
    }
}
