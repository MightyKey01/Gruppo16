<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>

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
    <div class="text-white fixed-top">
        <h1 class="text-center">Turn4World</h1>
        <nav class="navbar" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Home</a>
                <a class="navbar-brand" href="chi_siamo.jsp">Chi siamo</a>
                <a class="navbar-brand" href="attività.jsp">Attività</a>
                <a class="navbar-brand" href="contatti.jsp">Contatti</a>
                <% if(session.getAttribute("logged")!=null && session.getAttribute("logged") == Boolean.TRUE) {%>
                    <a class="navbar-brand" href="#">Profilo</a>
                    <a class="navbar-brand" href="#">Logout</a>
                <%} else { %>
                    <a class="navbar-brand" href="sign_in.jsp">Sign-in</a>
                    <a class="navbar-brand" href="login.jsp">Login</a>
                <% } %>
            </div>
        </nav>
    </div>
    <div id="frase" style="position: absolute;top: 90%;left:2%">

    </div>
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
        let scelta = Math.floor(Math.random() * 7);

        document.getElementById("frase").innerHTML = "";
        document.getElementById("frase").innerHTML = "<i>" + result[scelta] + "</i>";
    }
    readTxt();
    setInterval(function (){
        readTxt();
    }, 20000);

</script>
