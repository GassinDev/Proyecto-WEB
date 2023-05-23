<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link rel="stylesheet" type="text/css" href="../../CSS/menu.css">
  <h2 class="tfor2">INDICANDO FECHA FINAL</h2>
</head>
<body>

<!-- FORMULARIO PARA AÑADIR UNA FECHA FINAL A UNA AYUDA -->

<form method="get" action="AceptarAyudas.jsp" class="fde">
  Fecha Final<input type="date" name="FechaFin"/></br>
  <input type="hidden" name="Id" value="<%=request.getParameter("Id")%>"/></br>
  </br><input type="submit" value="Aceptar" class="boton">
</form>
<br/>
</body>
</html>
