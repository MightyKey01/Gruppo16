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

    <div class="container text-center">
        <div class="w-50 p-3" style="position: absolute;top: 15%;left:25%">
            <p><h6>Tum4world</h6></p>
            <div class="row-auto">
                <p>L'associazione Tum4World si occupa da più di sessant'anni della salvaguardia degli habitat naturali delle specie a rischio d'estizione, e della difesa dei diritti degli animali, collaborando a stretto contatto con altre associazioni, e con i governi locali, al fine di impedire la loro distruzione, e di creare un futuro in armonia con la Natura e tutti i suoi abitanti.</p>
                <img src="images/logo.png" alt="Logo" style="width: 250px;">
            </div>
            <div class="row-auto">

                <a href="images/volantino Tum4World.pdf" download>
                    <button style="alignment: center"class="btn btn-primary mb-3">Scarica il volantino pdf</button>
                </a>
            </div>

        </div>
    </div>

    <div <% if(session.getAttribute("firstvisit") == Boolean.TRUE) {%> hidden <%} else { request.getSession().setAttribute("firstvisit",true);}%>
    id="modale" style="position: absolute; top: 80%;left:2%;border-style: dashed;background-color: beige;padding: 3px; box-shadow: 10px 10px lightblue;">
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
