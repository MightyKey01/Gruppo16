<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>
    <link rel="icon" href="images/logo.png" >

    <% if(session.getAttribute("ruolo")==null) { %>
    <link rel="stylesheet" href="css/base.css">
    <%} else if(session.getAttribute("ruolo").equals("Admin")){ %>
    <link rel="stylesheet" href="css/amministratore.css">
    <%} else if(session.getAttribute("ruolo").equals("Aderente")){ %>
    <link rel="stylesheet" href="css/aderente.css">
    <%} else if(session.getAttribute("ruolo").equals("Simpatizzante")){ %>
    <link rel="stylesheet" href="css/simpatizzante.css">
    <%}%>

</head>
<body>
<div class="text-white">
    <h1 class="text-center">Turn4World</h1>
    <nav class="navbar" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<% out.print(response.encodeURL("index.jsp"));%>">Home</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("chi_siamo.jsp"));%>">Chi siamo</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("attività.jsp"));%>">Attività</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("contatti.jsp"));%>">Contatti</a>
            <% if(session.getAttribute("logged")!=null && session.getAttribute("logged") == Boolean.TRUE) {%>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./ProfiloServlet"));%>">Profilo</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./LogoutServlet"));%>">Logout</a>
            <%} else { %>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("sign_in.jsp"));%>">Sign-in</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("login.jsp"));%>">Login</a>
            <% } %>
        </div>
    </nav>
</div>
<div class="container text-left">
    <div class="row">
        <div class="col-3" style="text-align:center;margin:auto;vertical-align:center">
            <h3>Adotta un alveare</h3><br>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=1"));%>"><img src="images/Api1.jpg" alt="att1_desc1" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=1"));%>"><img src="images/Api2.jpg" alt="att1_desc2" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=1"));%>"><img src="images/Api3.jpg" alt="att1_desc3" width="320" height="213.25"></a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-3" style="text-align:center;margin:auto;vertical-align:center">
            <h3>Progetto "pianta un albero"</h3><br>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=2"));%>"><img src="images/Albero1.jpg" alt="att2_desc1" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=2"));%>"><img src="images/Albero2.jpg" alt="att2_desc2" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=2"));%>"><img src="images/Albero3.jpg" alt="att2_desc3" width="320" height="213.25"></a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-3" style="text-align:center;margin:auto;vertical-align:center">
            <h3>Conllaborazione con associazioni ambietaliste</h3><br>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=3"));%>"><img src="images/Associazione1.jpg" alt="att3_desc1" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=3"));%>"><img src="images/Associazione2.jpg" alt="att3_desc2" width="320" height="213.25"></a>
            </div>
        </div>
        <div class="col-3">
            <div class="w-25 h-25"><br>
                <a href="<% out.print(response.encodeURL("pagina_attività.jsp?activity=3"));%>"><img src="images/Associazione3.png" alt="att3_desc3" width="320" height="190.25"></a>
            </div>
        </div>
    </div>
</div>
<div <% if(session.getAttribute("firstvisit") == Boolean.TRUE) {%> hidden <%} else { request.getSession().setAttribute("firstvisit",true);}%> id="modale" style="position: absolute; top: 80%;left:2%;border-style: dashed;background-color: beige;padding: 3px; box-shadow: 10px 10px lightblue;">
    <p>Informativa riguardo la privacy e l'utilizzo dei cookie:</p>
    <button type="button" class="btn btn-primary" style="top: 80%;left:2%;" onclick="nascondi()">Ho Capito</button>
    <br>
</div>

<div id="frase" style="position: absolute;top: 90%;left:60%"></div>
<div class="text-white fixed-bottom">
    <p class="fst-italic text-center">Turn4World, via Fittizia 0, CAP: 16000, Citta Fittizia, Nazione Fittizia</p>
</div>
</body>
</html>

<script>

    const readTxt = async() =>{
        let file = "frasi_filosofiche.txt";
        let response = await fetch(file);
        const txt = await response.text().then((str) => {
            return str.split('\r\n');
        });

        const result = txt;
        let scelta = Math.floor(Math.random() * 5);

        document.getElementById("frase").innerHTML = "";
        document.getElementById("frase").innerHTML = "<i>" + result[scelta] + "</i>";
    }
    readTxt();
    setInterval(function (){
        readTxt();
    }, 20000);

    function nascondi(){
        let mod = document.getElementById("modale");
        mod.setAttribute("hidden", "hidden");
    }

</script>