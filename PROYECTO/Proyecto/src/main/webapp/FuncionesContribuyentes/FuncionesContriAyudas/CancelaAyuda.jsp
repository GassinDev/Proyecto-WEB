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

  /* EJECUTAMOS UNA QUERY PARA EDITAR AYUDAS DE MANERA QUE SE QUEDARIA DISPONIBLE*/

  Statement s = HelloServlet.conectarBD();
  Connection conexion = HelloServlet.nombradorBD();

  s.executeUpdate("UPDATE Ayudas SET Contribuyente='',FechaFin='',Disponibilidad='Disponible' WHERE Id =" + Integer.parseInt(request.getParameter("Id")));

  response.sendRedirect("../VerAyudasAceptadas.jsp");
%>
</body>
</html>
