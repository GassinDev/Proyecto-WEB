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
<%
    //UNA SIMPLE EJECUCION DE UNA QUERY LA CUÁL ELIMINA UNA AYUDA ESPECIFICA
    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    s.executeUpdate("DELETE FROM Ayudas WHERE Id ='" + request.getParameter("Id") + "'");
    response.sendRedirect("../BorraEditaAyudas.jsp");
%>

</body>
</html>
