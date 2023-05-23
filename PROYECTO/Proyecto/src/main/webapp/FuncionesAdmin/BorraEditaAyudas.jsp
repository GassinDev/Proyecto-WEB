<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - MENU</title>
  <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body id="contenedor">

<!-- AQUI GUARDAMOS LOS RESULTADOS DE UNA QUERY Y CON SUS DATOS RELLENAMOS UNA TABLA -->

<%
  Statement s = HelloServlet.conectarBD();
  Connection conexion = HelloServlet.nombradorBD();

  ResultSet listado = s.executeQuery ("SELECT * FROM Ayudas");

%>
<div class="edicion">
  <ul>
    <li><a class="inicio" href="../RegistradoIni/perfilAdmin.jsp">Salir Ver/Editar Ayudas</a></li>
  </ul>
</div>

<table border="1" class="tabla1">
  <caption>Lista de Ayudas</caption>
  <tr><th>Solicitante</th><th>Contribuyente</th><th>Ayuda</th><th>Comentario</th><th>Fecha Inicial</th><th>Fecha Final</th><th>Disponibilidad</th></tr>
  <%
    while (listado.next()) {
      out.println("<td>" + listado.getString("Solicitante") + "</td>");
      out.println("<td>" + listado.getString("Contribuyente") + "</td>");
      out.println("<td>" + listado.getString("Ayuda") + "</td>");
      out.println("<td>" + listado.getString("Comentario") + "</td>");
      out.println("<td>" + listado.getString("FechaIni") + "</td>");
      out.println("<td>" + listado.getString("FechaFin") + "</td>");
      out.println("<td>" + listado.getString("Disponibilidad") + "</td>");
  %>
  <td>
    <form method="get" action="FuncionesUsuAyu/BorraAyuda.jsp">
      <input type="hidden" name="Id" value="<%=listado.getString("Id") %>"/>
      <input type="submit" value="Borrar" class="boton2">
    </form>
  </td>
  <td>
    <form method="get" action="FuncionesUsuAyu/FormularioEditaAyudas.jsp">
      <input type="hidden" name="Id" value="<%=listado.getString("Id") %>"/>
      <input type="submit" value="Editar" class="boton2">
    </form>
  </td></tr>
<%
  }
  listado.close();
  conexion.close();
%>
</table>
</body>
</html>
