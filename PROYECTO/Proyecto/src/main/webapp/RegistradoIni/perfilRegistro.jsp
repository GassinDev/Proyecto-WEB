<%@ page import="com.example.proyecto.Usuarios" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - MENU</title>
  <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body>

<!-- GUARDAMOS LOS DATOS DE LOS INPUTS PARA METERLOS EN FILTROS PARA SABER A QUE PERFIL MANDAR AL USUARIO -->

<%
  Usuarios lucontri = new Usuarios();

  String usuario = request.getParameter("Usuario");
  String contraseña = request.getParameter("Contraseña");

  ServletContext sc = request.getServletContext();

  if(lucontri.cargarMisDartosUsuarioContri(usuario,contraseña) != null){
    sc.setAttribute("Usuario",usuario);
    response.sendRedirect("perfilContribuyente.jsp");
  } else if (lucontri.cargarMisDartosUsuarioSoli(usuario,contraseña) != null) {
    sc.setAttribute("Usuario", usuario);
    response.sendRedirect("perfilSolicitante.jsp");
  } else if(Objects.equals(usuario, "admin") && Objects.equals(contraseña, "Aa1234")){
    sc.setAttribute("Usuario", usuario);
    response.sendRedirect("perfilAdmin.jsp");
  }else{
    response.sendRedirect("sesion.jsp");
    sc.setAttribute("Mensaje", "<p>Contraseña o usuario incorrecto, inténtelo de nuevo</p>");
  }
%>

<br/>
</body>
</html>
