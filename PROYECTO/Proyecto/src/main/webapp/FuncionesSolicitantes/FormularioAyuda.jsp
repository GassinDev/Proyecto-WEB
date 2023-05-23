<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
  <h2 class="tfor2"> CREADOR DE AYUDAS </h2>
</head>
<body>

<!-- FORMULARIO DE NUEVA AYUDA -->

<form method="get" action="CreadorAyuda.jsp" class="fde">
  Ayuda <input type="text" name="Ayuda"/></br>
  Comentario  </br><textarea name="Comentario"></textarea></br>
  Fecha Inicial <input type="date" name="FechaIni"/></br>
  </br><input type="submit" value="Aceptar" class="boton">
</form>

<br/>
</body>
</html>
