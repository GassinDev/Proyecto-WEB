<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<!-- EJECUTAMOS UNA QUERY PARA BORRAR LA AYUDA DESEADA -->

<%

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    s.executeUpdate("DELETE FROM Ayudas WHERE Id ='" + request.getParameter("Id") + "'");
    response.sendRedirect("../VerMisAyudas.jsp");
%>

</body>
</html>
