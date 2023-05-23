<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@ page import="com.example.proyecto.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%

    /*AQUI TENEMOS LA CREACION DE UN OBJETO USUARIOS DONDE SE GENERAN LAS DOS LISTAS Y LUEGO CON UNAS FUNCIONES
    * EN LOS IF COMPROBAMOS SI EL USUARIO QUE VAMOS A BORRAR  ES UN CONTRIBUYENTE O UN SOLICITANTE, Y CON
    * QUERY LO BORRAMOS*/

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    String usuario = request.getParameter("Usuario");

    Usuarios us = new Usuarios();

    if(us.compruebaUsuarioContri(usuario)){
        s.executeUpdate("DELETE FROM Contribuyentes WHERE Usuario ='" + usuario + "'");
        s.executeUpdate("DELETE FROM Usuarios WHERE Usuario ='" + usuario + "'");
        s.executeUpdate("UPDATE Ayudas SET Contribuyente='',FechaFin='',Disponibilidad='Disponible' WHERE Contribuyente='" + usuario + "'");
    }else {
        s.executeUpdate("DELETE FROM Solicitantes WHERE Usuario ='" + usuario + "'");
        s.executeUpdate("DELETE FROM Usuarios WHERE Usuario ='" + usuario + "'");
        s.executeUpdate("DELETE FROM Ayudas WHERE Solicitante='" + usuario + "'");
    }

    response.sendRedirect("../BorraEditaAdmin.jsp");
%>
</body>
</html>
