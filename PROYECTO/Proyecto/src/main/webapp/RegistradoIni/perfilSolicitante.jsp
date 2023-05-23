<%@ page import="com.example.proyecto.Usuarios" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body>

<!-- BIENVENIDA DEL USUARIO CON UNA FUNCION PARA CONSEGUIR LOS DATOS DE SU PERFIL Y TRES ACCION MEDIANTE ENLACE -->
<%
    Usuarios usu = new Usuarios();

    ServletContext sc = request.getServletContext();
    String usuario = (String) sc.getAttribute("Usuario");

    String datos = String.valueOf(usu.datosSolicitantes(usuario));
%>

<h1 class="titulo">Bienvenido <%= usuario%> </h1>

<article class="effe">
    <img src="../Recursos/Imagenes/perfillogo.jpg">
    <p class="fusi"><%=datos%></p>
</article>

<div id="barraNavegacion">
    <ul>
        <li><a class=enla href=../FuncionesSolicitantes/FormularioAyuda.jsp>Crear nueva ayuda</a></li>
        <li><a class=enla href=../FuncionesSolicitantes/VerMisAyudas.jsp>Ver/Editar mis ayudas</a></li>
        <li><a class=enla href=../RegistradoIni/cerrarSesion.jsp >Cerrar sesión</a></li>
    </ul>
</div>

</body>
</html>
