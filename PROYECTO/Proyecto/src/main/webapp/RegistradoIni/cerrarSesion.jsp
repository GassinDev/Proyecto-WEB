<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- SIMPLEMETE ELIMINA LA VARIABLE DE USUARIO DE INICIO DE SESION Y NOS REDIRECCIONA AL INICIO DE SESION -->

<%
  ServletContext sc = request.getServletContext();
  sc.removeAttribute("Usuario");
  response.sendRedirect("sesion.jsp");
%>
</body>
</html>
