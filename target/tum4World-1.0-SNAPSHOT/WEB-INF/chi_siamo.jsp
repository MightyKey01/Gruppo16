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


<div class="container text-center" >
    <div class="container text-center" >
        <br><br><br><br><br><br>
        <div class="w-25 mx-auto p-2" >
            Albert Einstein disse: <q  class="fst-italic">Il mondo è un posto pericoloso, non a causa di quelli che compiono azioni malvagie ma per quelli che osservano senza fare nulla.</q><br>
        </div>
    </div>

    <div class="container text-left">
        <div class="row">
            <div class="col">
                <div class="w-99 h-75">
                    Tum4World è stata fondata col chiaro obbiettivo  di non essere parte di coloro che guardano senza fare nulla.<br>
                    La nostra associazione fu fondata nel 1961 da un giovane attivista di nome Gino Bianchi insieme ai suoi amici,
                    e nel tempo grazie alla loro determinazione e all'aiuto dei nostri donatori, si è espansa, e ad oggi possiede 6 sedi attive nel mondo,
                    di cui 3 in Africa, 2 in America del Sud, ed una in Italia.<br>
                    L'associazione Tum4World si occupa da più di sessant'anni della salvaguardia degli habitat naturali delle specie a rischio d'estizione, e della difesa dei diritti degli animali,
                    collaborando a stretto contatto con altre associazioni, e con i governi locali,
                    al fine di impedire la loro distruzione, e di creare un futuro in armonia con la Natura e tutti i suoi abitanti.<br><br>

                    Nella storia di Tum4World abbiamo ottenuto importanti successi in particolare: contro i bracconieri nell'Africa centrale e vicino al confine tra Mozambico e Tanzania, salvando oltre 5000 rinoceronti e 15 mila elefanti;
                    e impedendo varie deforestazioni massicce nella zona dell' Appennino e nella foresta amazzonica.<br>
                    Qui di seguito riportiamo uno storico delle principali missioni e progetti a cui la nostra associazione ha partecipato, ottenendo grandi risultati:<br><br>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-9">
                <div class="w-50">
                    <h3>1979 - Italia:</h3><br>
                    Negl'anni '70, arriva la prima grande vittoria di  Tum4World: riusciamo a far approvare tramite petizione un disegno di legge che limita lo sfruttamento delle zone boschive
                    nel Piemonte, a tutela del animali di quella regione.
                </div>
            </div>
            <div class="col-3">
                <div class="w-25 h-25"><br>
                    <img src="images/disboscamento-in-italia.jpg" alt="disboscamento in italia negl'anni '70" width="320" height="213.25">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-9">
                <div class="w-50">
                    <h3>1988 - Italia:</h3><br>
                    Negl'anni 80, l'associazione Tum4World fa da mediatore principale fra le aziende e lo stato per garantire una "rinnovabilità" degl'alberi toscani.
                    Di questo successo se ne parlerà sui giornali regionali, e il sindaco di Grosseto riconoscerà al fondatore Gino Bianchi il titolo formale di "cavaliere verde".<br><br><br>
                </div>
            </div>
            <div class="col-3">
                <div class="w-25 h-25"><br>
                    <img src="images/deforestazione.jpg" alt="deforestazione in italia negl'anni '80" width="320" height="213.25">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-9">
                <div class="w-50">
                    <h3>1995 - Mozambico:</h3><br>
                    Dopo 2 anni viene aperta una sede di Tum4World a Maputo, capitale del Mozambico;
                    dopo 5 anni, grazie ad una stretta collarazione con le forze forestali del luogo, viene scovato e confiscato un grande magazzino pieno di zanne di elefanti
                    e vengono arrestati i bracconieri responsabili.
                </div>
            </div>
            <div class="col-3">
                <div class="w-25 h-25"><br>
                    <img src="images/Bracconaggio.jpg" alt="Bracconaggio in Mozambico negl'anni '90" width="320" height="213.25">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-9">
                <div class="w-50">
                    <h3>2008 - Brasile:</h3><br>
                    In Brasile nel 2008, collaboriamo insieme ad altre associazioni ed insieme riusciamo ad ottenere un aumeto dei controlli forestali,
                    in modo da prevenire la distruzione di zone appartenenti agl'habitat protetti dei giaguari.<br><br>
                </div>
            </div>
            <div class="col-3">
                <div class="w-25 h-25"><br>
                    <img src="images/brasile deforestazione.jpeg" alt="disboscamento in Brasile negl'anni duemila" width="320" height="213.25">
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-9">
                <div class="w-50">
                    <h3>2019 - Tanzania:</h3><br>
                    A seguito dei successi, partiti nel 1995, e poi proseguiti nel tempo, fra cui anche la creazione di due parchi protetti per i rinoceronti,
                    viene assegnata dallo stato della Tanzania un'onoreficenza al valore dell'associazione per l'impegno mostrato ed i risultati ottenuti.<br>
                </div>
            </div>
            <div class="col-3">
                <div class="w-25 h-25"><br>
                    <img src="images/rinoceronte.jpg" alt="rinoceronte in Tanzania" width="320" height="213.25">
                </div>
            </div>
        </div>



        <div <% if(session.getAttribute("firstvisit") == Boolean.TRUE) {%> hidden <%} else { request.getSession().setAttribute("firstvisit",true);}%>
                                                                           id="modale" style="position: absolute; top: 80%;left:2%;border-style: dashed;background-color: beige;padding: 3px; box-shadow: 10px 10px lightblue;">
            <p>Informativa riguardo la privacy e l'utilizzo dei cookie:</p>
            <button type="button" class="btn btn-primary" style="top: 80%;left:2%;" onclick="nascondi()">Ho Capito</button>
            <br>
        </div>
        <br>
        <div id="frase" style="position:absolute; left:60%"></div>
        <br><br><br>
        <div class="text-white fixed-bottom">
            <p class="fst-italic text-center">Turn4World, via Fittizia 0, CAP: 16000, Citta Fittizia, Nazione Fittizia</p>
        </div></div></div>
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
