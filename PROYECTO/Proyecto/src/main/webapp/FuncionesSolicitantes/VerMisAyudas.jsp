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

<!-- EJECUTAMOS UNAS QUERYS PARA SABER CUALES SON LAS AYUDAS DE UN USUARIO EN ESPECIFICO Y LAS METEMOS EN DOS TABLA PARA
 MOSTRALO POR PANTALLA -->

<%
    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    ServletContext sc = request.getServletContext();

    String usuario = (String) sc.getAttribute("Usuario");

    ResultSet listado = s.executeQuery ("SELECT * FROM Ayudas WHERE Disponibilidad ='Ocupada' AND Solicitante='" + usuario + "'");

%>
<div class="edicion">
    <ul>
        <li><a class="inicio" href="../RegistradoIni/perfilSolicitante.jsp">Salir de Mis Ayudas</a></li>
    </ul>
</div>

<table border="1" class="tabla1">
    <caption>Lista de Mis Ayudas - Aceptadas</caption>
    <tr><th>Contribuyente</th><th>Ayuda</th><th>Comentario</th><th>Fecha Inicial</th><th>Fecha Final</th></tr>
    <%
        while (listado.next()) {
            out.println("<td>" + listado.getString("Contribuyente") + "</td>");
            out.println("<td>" + listado.getString("Ayuda") + "</td>");
            out.println("<td>" + listado.getString("Comentario") + "</td>");
            out.println("<td>" + listado.getString("FechaIni") + "</td>");
            out.println("<td>" + listado.getString("FechaFin") + "</td>");

    %>
    <td>
        <form method="get" action="FuncionesAyudas/BorraAyuda.jsp">
            <input type="hidden" name="Id" value="<%=listado.getString("Id") %>"/>
            <input type="submit" value="Borrar" class="boton2">
        </form>
    </td>
    <td>
        <form method="get" action="FuncionesAyudas/FormularioEditaAyuda.jsp">
            <input type="hidden" name="Id" value="<%=listado.getString("Id") %>"/>
            <input type="submit" value="Editar" class="boton2">
        </form>
    </td></tr>
</table>
    <%
        }
        listado.close();

        ResultSet listado2 = s.executeQuery ("SELECT * FROM Ayudas WHERE Disponibilidad ='Disponible' AND Solicitante='" + usuario + "'");
    %>

    <table border="1" class="tabla2">
        <caption>Lista de Mis Ayudas - No Aceptadas</caption>
        <tr><th>Ayuda</th><th>Comentario</th><th>Fecha Inicial</th></tr>
            <%
        while (listado2.next()) {
            out.println("<td>" + listado2.getString("Ayuda") + "</td>");
            out.println("<td>" + listado2.getString("Comentario") + "</td>");
            out.println("<td>" + listado2.getString("FechaIni") + "</td>");
    %>
        <td>
            <form method="get" action="FuncionesAyudas/BorraAyuda.jsp">
                <input type="hidden" name="Id" value="<%=listado2.getString("Id") %>"/>
                <input type="submit" value="Borrar" class="boton2">
            </form>
        </td>
        <td>
            <form method="get" action="FuncionesAyudas/FormularioEditaAyuda.jsp">
                <input type="hidden" name="Id" value="<%=listado2.getString("Id") %>"/>
                <input type="submit" value="Editar" class="boton2">
            </form>
        </td></tr>
<%
        }
        listado2.close();
        conexion.close();
%>
</table>
</body>
</html>
