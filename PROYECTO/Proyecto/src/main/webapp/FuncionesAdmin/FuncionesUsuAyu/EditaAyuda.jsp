<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@ page import="java.util.Objects" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    /*GUARDAMOS LOS DATOS DE LOS INPUTS EN VARIABLES, LAS VARIABLES LAS PASAMOS POR UN FILTRO Y LUEGO AL FINAL LAS METEMOS
    * EN UNA QUERY QUE ACTUALICE LOS DATOS ANTIGUOS*/

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    String nuevaAyuda = request.getParameter("Ayuda");
    String nuevoComentario = request.getParameter("Comentario");
    String nuevaFechaIni = request.getParameter("FechaIni");
    String nuevaFechaFin = request.getParameter("FechaFin");


    ResultSet listado = s.executeQuery("SELECT * FROM Ayudas WHERE Id =" + Integer.parseInt(request.getParameter("Id")));

    if(Objects.equals(request.getParameter("Ayuda"), "")){
        nuevaAyuda = listado.getString("Ayuda");
    }
    if(Objects.equals(request.getParameter("Comentario"), "")){
        nuevoComentario = listado.getString("Comentario");
    }
    if(Objects.equals(request.getParameter("FechaIni"), "")){
        nuevaFechaIni = listado.getString("FechaIni");
    }
    if(Objects.equals(request.getParameter("FechaFin"), "")){
        nuevaFechaFin = listado.getString("FechaFin");
    }

    s.executeUpdate("UPDATE Ayudas SET Ayuda='" + nuevaAyuda + "',Comentario='" + nuevoComentario
            + "',FechaIni='" + nuevaFechaIni + "',FechaFin='" + nuevaFechaFin + "' WHERE Id=" + Integer.parseInt(request.getParameter("Id")));

    listado.close();
    conexion.close();

    response.sendRedirect("../BorraEditaAyudas.jsp");
%>

</body>
</html>
