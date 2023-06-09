<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>
    <link rel="icon" href="./images/logo.png" >
    <link rel="stylesheet" href="./css/aderente.css">
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
    <button type="button" class="btn btn-primary" onclick="showInfo()" style="width:20%;">Personal Info</button>
    <button type="button" class="btn btn-primary" onclick="showActivity()" style="width:20%;">Iscriviti Attività</button>
    <a href="<% out.print(response.encodeURL("./CancellaAccountServlet"));%>" role="button" class="btn btn-primary" style="width:20%;">Rimuovi iscrizione sito</a>
    <button type="button" class="btn btn-primary" onclick="showDonation()" style="width:20%;">Donazione</button>
</div>

<div class='px-5 text-center' hidden='hidden' id='donazioni'>
    <form action="DonationServlet" method="post" class="row g-3">
        <div class="row-auto" style="width:20%">
            <label >Ammontare &euro;: </label>
            <input type="number" class="form-control" name="ammontareform" placeholder="5">
        </div>
        <div class="row-auto">
            <button type="submit" class="btn btn-primary mb-3">Dona</button>
        </div>
    </form>
</div>

