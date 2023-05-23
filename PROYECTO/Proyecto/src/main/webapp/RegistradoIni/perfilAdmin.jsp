<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - MENU</title>
  <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body>

<!-- BASICAMENTE ES UNA BIENVENIDA CON TRES ACCIONES MEDIANTE ENLACES -->

<%
  ServletContext sc = request.getServletContext();

  String usuario = (String) sc.getAttribute("Usuario");
%>


<h1 class="titulo">Bienvenido <%= usuario%> </h1>

<div id="barraNavegacion" class="edicion">
  <ul>
    <li><a class=enla href=../FuncionesAdmin/BorraEditaAyudas.jsp>Editar / Borrar Ayudas</a></li>
    <li><a class=enla href=../FuncionesAdmin/BorraEditaAdmin.jsp >Editar / Borrar Usuarios</a></li>
    <li><a class=enla href=../RegistradoIni/cerrarSesion.jsp >Cerrar sesión</a></li>
  </ul>
</div>

</body>
</html>




