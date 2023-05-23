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

<!-- LA PRIMERA QUERY GUARDA LOS DATOS ANTIGUOS PARA USARLOS EN LOS FILTROS Y LA SIGUIENTE QUERY METE LOS NUEVOS DATOS
CON AYUDA DE LOS DATOS DE LOS INPUT GUARDADOS EN LAS VARIABLES -->
<%

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    String nuevaAyuda = request.getParameter("Ayuda");
    String nuevoComentario = request.getParameter("Comentario");


    ResultSet listado = s.executeQuery("SELECT * FROM Ayudas WHERE Id =" + Integer.parseInt(request.getParameter("Id")));

    if(Objects.equals(request.getParameter("Ayuda"), "")){
        nuevaAyuda = listado.getString("Ayuda");
    }
    if(Objects.equals(request.getParameter("Comentario"), "")){
        nuevoComentario = listado.getString("Comentario");
    }

    s.executeUpdate("UPDATE Ayudas SET Ayuda='" + nuevaAyuda + "',Comentario='" + nuevoComentario
            + "' WHERE Id=" + Integer.parseInt(request.getParameter("Id")));

        listado.close();
        conexion.close();

        response.sendRedirect("../VerMisAyudas.jsp");
%>

</body>
</html>

