<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <link rel="stylesheet" type="text/css" href="../../CSS/menu.css">
  <h2 class="tfor2"> EDITOR DE AYUDAS</h2>
</head>
<body>

<!-- FORMULARIO PARA EDITAR AYUDAS -->

<form method="get" action="EditaAyuda.jsp" class="fde">
  Nueva Ayuda <input type="text" name="Ayuda"/></br>
  Nuevo Comentario <input type="text" name="Comentario"/></br>
  Nuevo Fecha Inicial <input type="date" name="FechaIni"/></br>
  Nueva Fecha Final <input type="date" name="FechaFin"/></br>
  <input type="hidden" name="Id" value="<%=request.getParameter("Id")%>"/></br>
  </br><input type="submit" value="Aceptar" class="boton">
</form>
<br/>
</body>
</html>
