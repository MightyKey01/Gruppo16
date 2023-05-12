<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>Tum4World</title>
</head>
<body>
<div class="bg-dark text-white sticky-top">
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
<div class="container text-center">
    <br><br>
    <div class="row" id="errormessage">

    </div>
    <div class="row w-25 mx-auto p-2">
        <form name="signinForm" action="SignInServlet" method="post" onsubmit="return validateForm()" class="row g-3">
            <div class="row-auto">
                <h2>Registrati</h2>
            </div>
            <div class="row-auto">
                <input type="text" class="form-control" name="nomesignin" placeholder="Nome" required>
            </div>
            <div class="row-auto">
                <input type="text" class="form-control" name="cognomesignin" placeholder="Cognome" required>
            </div>
            <div class="row-auto">
                <input type="date" class="form-control" name="datasignin" required>
            </div>
            <div class="row-auto">
                <input type="text" class="form-control" name="emailsignin" placeholder="Email" required>
            </div>
            <div class="row-auto">
                <input type="tel" class="form-control" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="numerosignin" placeholder="Cellulare" required>
            </div>
            <div class="row-auto">
                <select class="form-select" aria-label="Default select example">
                    <option value="1">Simpatizzante</option>
                    <option value="2">Aderente</option>
                </select>
            </div>
            <div class="row-auto">
                <input type="text" class="form-control" name="usernamesignin" placeholder="Username" required>
            </div>
            <div class="row-auto">
                <input type="password" class="form-control" name="passwordsignin" placeholder="Password" required>
                <!-- Aggiungere info dialog su come deve essere la password -->
            </div>
            <div class="row-auto">
                <button type="submit" class="btn btn-primary mb-3">Sign In</button>
                <button type="submit" class="btn btn-primary mb-3">Reset</button>
            </div>
        </form>
    </div>
    <div class="row" id="frase">

    </div>
</div>
<div class="bg-dark text-white fixed-bottom">
    <p class="fst-italic text-center">Turn4World, via Fittizia 0, CAP: 16000, Citta Fittizia, Nazione Fittizia</p>
</div>
</body>
</html>

<script>

    function validateForm(){
        let x = document.forms["signinForm"]["datasignin"].value;
        let y = document.forms["signinForm"]["passwordsignin"].value;
        console.log(document.forms["signinForm"]["passwordsignin"].value)
        if(!underAgeValidate(x)){
            alert("L'utente deve essere maggiorenne per potersi registrare");
            return false;
        }

        if(!passwordValidate(y)){
            alert("La password deve essere lunga 8 caratteri, deve contenere la prima lettera dei nomi propri di ciascuno di voi, almeno un carattere numerico, un carattere maiuscolo e un carattere tra $, ! e ?");
            return false;
        }
    }


    function underAgeValidate(birthday){
        var optimizedBirthday = birthday.replace(/-/g, "/");
        var myBirthday = new Date(optimizedBirthday);
        var currentDate = new Date().toJSON().slice(0,10)+' 01:00:00';
        var myAge = ~~((Date.now(currentDate) - myBirthday) / (31557600000));
        if(myAge < 18) {
            return false;
        }else{
            return true;
        }
    }

    function passwordValidate(pass){
        if(pass.length != 8){
            return false;
        }
        let nome = (document.forms["signinForm"]["nomesignin"].value).substring(0,1);

        if(pass.indexOf(nome) == -1 && pass.indexOf(nome.toUpperCase()) == -1){
            return false;
        }

        if(!(/[A-Z]/.test(pass)) && !(/[0-9]/.test(pass))){
            return false;
        }

        if(pass.indexOf('?') == -1 && pass.indexOf('!') == -1 && pass.indexOf('$') == -1){
            return false;
        }

        return true;
    }

</script>
