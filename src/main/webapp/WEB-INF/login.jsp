<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>
</head>
<body>
<div class="bg-dark text-white">
    <h1 class="text-center">Turn4World</h1>
    <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Home</a>
            <a class="navbar-brand" href="chi_siamo.jsp">Chi siamo</a>
            <a class="navbar-brand" href="attività.jsp">Attività</a>
            <a class="navbar-brand" href="contatti.jsp">Contatti</a>
            <a class="navbar-brand" href="sign_in.jsp">Sign-in</a>
            <a class="navbar-brand" href="login.jsp">Login</a>
        </div>
    </nav>
</div>
<div class="container text-center" >
    <div class="row w-25" style="margin: auto;width: 50%;">
        <form name="loginForm" action="LoginServlet" method="post" class="row g-3">
            <div class="row-auto">
                <h2>Accedi</h2>
            </div>
            <div class="row-auto">
                <input type="text" class="form-control" name="usernamelogin" placeholder="Username">
            </div>
            <div class="row-auto">
                <input type="password" class="form-control"  name="passwordlogin" placeholder="Password">
            </div>
            <div class="row-auto">
                <button type="submit" class="btn btn-primary mb-3">Login</button>
            </div>
        </form>
    </div>
    <div class="row position-static bottom-0" id="errormessage" style="color: #FF0000;">
        <h5>${errorMessage}</h5>
    </div>
    <div class="row" id="frase" style="position: absolute;top: 90%;left:38%">
        <p>culo</p>
    </div>
</div>
<div class="bg-dark text-white fixed-bottom">
    <p class="fst-italic text-center">Turn4World, via Fittizia 0, CAP: 16000, Citta Fittizia, Nazione Fittizia</p>
</div>
</body>
</html>

