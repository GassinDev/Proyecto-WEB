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

<!-- SE EJECUTA UNA QUERY PARA OBTENER LAS AYUDAS Y LUEGO INTRODUCIRLAS EN UNA TABLA-->

<%
    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    ServletContext sc = request.getServletContext();
    String usuario = (String) sc.getAttribute("Usuario");

    ResultSet listado = s.executeQuery ("SELECT * FROM Ayudas WHERE Disponibilidad='Disponible'");

%>
<div class="edicion">
    <ul>
        <li><a class="inicio" href="../RegistradoIni/perfilContribuyente.jsp">Salir de Ayudas Disponibles</a></li>
    </ul>
</div>

<table border="1" class="tabla1">
    <caption>Lista de Ayudas Disponibles</caption>
    <tr><th>Solicitante</th><th>Ayuda</th><th>Comentario</th><th>Fecha Inicial</th></tr>
    <%
        while (listado.next()) {
            out.println("<td>" + listado.getString("Solicitante") + "</td>");
            out.println("<td>" + listado.getString("Ayuda") + "</td>");
            out.println("<td>" + listado.getString("Comentario") + "</td>");
            out.println("<td>" + listado.getString("FechaIni") + "</td>");
    %>
    <td>
        <form method="get" action="FuncionesContriAyudas/FormularioAceptarAyuda.jsp">
            <input type="hidden" name="Id" value="<%=listado.getString("Id") %>"/>
            <input type="submit" value="Aceptar" class="boton2">
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
