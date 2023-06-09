<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>
    <link rel="stylesheet" href="./css/amministratore.css">
    <link rel="icon" href="./images/logo.png" >
</head>
<body>

<div class="text-white">
    <h1 class="text-center">Turn4World</h1>
    <nav class="navbar" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./index.jsp"));%>">Home</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./chi_siamo.jsp"));%>">Chi siamo</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./attività.jsp"));%>">Attività</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./contatti.jsp"));%>">Contatti</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./ProfiloServlet"));%>">Profilo</a>
            <a class="navbar-brand" href="<% out.print(response.encodeURL("./LogoutServlet"));%>">Logout</a>
        </div>
    </nav>
</div>
<br>
<div class="text-center">
    <button type="button" class="btn btn-primary px-3" onclick="showUtenti()" style="width:17%;">Utenti registrati</button>
    <button type="button" class="btn btn-primary px-3" onclick="showSimp()" style="width:17%;">Simpatizzanti</button>
    <button type="button" class="btn btn-primary px-3" onclick="showAde()" style="width:17%;">Aderenti</button>
    <button type="button" class="btn btn-primary px-3" onclick="showGrafVis()" style="width:17%;">Visite</button>
    <button type="button" class="btn btn-primary px-3" onclick="showGravDon()" style="width:17%;">Donazioni</button>
</div>
<div id="grafvis" hidden="hidden" style="width:100%; height:400px;"></div>
<div class="text-center" hidden="hidden" id="rst">
    <p id="vistot"></p>
    <a href="<% out.print(response.encodeURL("./ResetContatoriServlet"));%>" role="button" class="btn btn-primary" style="width:20%;">Resetta Contatori</a>
</div>
<div id="grafdon" hidden="hidden" style="width:100%; height:400px;"></div>