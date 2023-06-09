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
<div class="text-white fixed-top">
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
<br><br><br><br><br><br>

<div>
    <% if(request.getParameter("activity").equals("1")) { %>
    <div class="container text-left">
    <div class="row">
        <div class="col">
            <div class="w-99 h-75">
                Adottare un alveare è un gesto semplice e alla portata di tutti, un piccolissimo investimento che può fare davvero la differenza per la salvaguardia della natura e la protezione di piccoli meravigliosi insetti che rischiano di estinguersi. 
Adottare un alveare significa preservare nel modo più concreto una popolazione di api, preziose impollinatrici e generose alleate dell’uomo. Infatti le api sono fondamentali per la nostra vita: sono loro che, grazie all’impollinazione, ci permettono di portare in tavola molti frutti e molte verdure per noi irrinunciabili.
Garantire la loro sopravvivenza sulla Terra significa perciò garantire l’esistenza stessa della specie umana e di numerosi prodotti agricoli. Con questo piccolo gesto si può quindi garantire la sallvaguardia delle api ma anche delle nostre abitudini alimentari
<br><br>
            </div>
        </div>
    </div>    
    <div class="row">
        <div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Api1.jpg" alt="att1_desc1" width="320" height="213.25"></a>
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Api2.jpg" alt="att1_desc2" width="320" height="213.25"></a>
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Api3.jpg" alt="att1_desc3" width="320" height="213.25"></a>
            </div>
        </div>
    </div>
    <%} else if(request.getParameter("activity").equals("2")) { %>
    <div class="container text-left">
    <div class="row">
        <div class="col">
            <div class="w-99 h-75">
                Con il progetto "Pianta un albero" utilizziamo le donazioni ricevuti per finanziare vari contadini locali in varie parti del mondo in modo da riuscire a piantare più alberi possibili. Questo permette non solo di contrastare il cambiamento climato e ridurre la quantità di CO2 nell'aria ma anche di preservare gli habitat naturali che stiamo perdendo. Quindi con una qualsiasi donazione si contribuirà ad un mondo più sostenibile e permette di slavaguardare oltre che molte specie vegetali anche molti animali che vivono in quei habitat
            </div>
        </div>
    </div>    
    <div class="row">
        <div class="col-4">
            <div class="w-25 h-25"><br>
               <img src="images/Albero1.jpg" alt="att1_desc1" width="320" height="213.25">
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Albero2.jpg" alt="att1_desc2" width="320" height="213.25">
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Albero3.jpg" alt="att1_desc3" width="320" height="213.25">
            </div>
        </div>
    </div>
    <%} else if(request.getParameter("activity").equals("3")) { %>
    <div class="container text-left">
    <div class="row">
        <div class="col">
            <div class="w-99 h-75">
                La nostra associazione è convinta che per tutelare al meglio l'ambiente bisogna fare squadra e per questo collaboriamo a stretto contatto con le maggiori associazioni ambietaliste. Tra le principali ci sono il WWF, associazione impegnata nel preservare la biodiversità, Greenpeace, impegnata principalmente alla lotta contro il cambiamento climatico e in Italia il Fondo per l'ambiente italiano (FAI), fondazione che mira a tutelare sia gli aspetti naturali del territorio sia quelli storico-culturali ed è impegnata su tematiche come il consumo del suolo, dell'acqua e dell'energia, il cambiamento climati, l'uso consapevole delle risorese e il mantenimento della biodiversità. Qui vi permettiamo di fare una donazione che verrà utilizzata per finanziare progetti in collaborazione con queste associazioni.
<br><br>
            </div>
        </div>
    </div>    
    <div class="row">
        <div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Associazione1.jpg" alt="att1_desc1" width="320" height="213.25">
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Associazione2.jpg" alt="att1_desc2" width="320" height="213.25">
            </div>
        </div>
	<div class="col-4">
            <div class="w-25 h-25"><br>
                <img src="images/Associazione3.png" alt="att1_desc3" width="320" height="213.25">
            </div>
        </div>
    </div>
    <%}%>
</div>
        <div id="frase" style="position: absolute;top: 90%;left:60%"></div>
<br><br>
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