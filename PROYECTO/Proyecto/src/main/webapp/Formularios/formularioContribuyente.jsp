<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
  <h2 class="tfor2"> REGISTRO PARA CONTRIBUYENTES </h2>
</head>
<body>

<!-- FORMULARIO PARA PODER REGISTRARTE COMO CONTRIBUYENTE -->

<form method="get" action="../recibeInfoContribuyente.jsp" class="fde">
  Nombre*    <input type="text" name="Nombre" required/></br>
  Apellidos* <input type="text" name="Apellidos" required/></br>
  Teléfono  <input type="tel" name="Telefono"/></br>
  Especialidad* <input type="text" name="Especialidad" required/></br>
  Usuario* <input type="text" name="Usuario" required/></br>
  Contraseña* <input type="password" name="Contraseña" required/></br>
  </br><input type="submit" value="Aceptar" class="boton">
</form>

<p class="campos">Los campos con un * son obligatorios</p>

<br/>
</body>
</html>
