<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
    <META HTTP-EQUIV="REFRESH" CONTENT="5;URL=../RegistradoIni/perfilSolicitante.jsp">
</head>
<body class="loading">

<!-- EJECUTAMOS UNA QUERY PARA SABER LAS ID EXISTENTES Y CON UNA FUNCION VAMOS GENERANDO UNA ID INEXISTENTE Y LUEGO UNA
QUERY PARA AÑADIR LA NUEVA AYUDA-->
<%
    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    ServletContext sc = request.getServletContext();

    String usuario = (String) sc.getAttribute("Usuario");

    ResultSet resul = s.executeQuery("SELECT Id FROM Ayudas");

    int id = 1;

    while(resul.next()){
        if(resul.getInt("Id") == id){
            id++;
        }
    }


    String insercion = "INSERT INTO Ayudas VALUES (" + id + ",'"
            + usuario
            + "','','"+ request.getParameter("Ayuda")
            + "','" +  request.getParameter("Comentario")
            + "','" + request.getParameter("FechaIni")
            + "','','Disponible')";

    s.execute(insercion);
    conexion.close();
%>

<h2 class="tfor">Ayuda generada con éxito, en 5 segundos serás redirigido a tu menú de usuario</h2>
<div class="loader"></div>
<br/>
</body>
</html>