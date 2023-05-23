<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="../CSS/menu.css">
</head>
<body>


<div class="opcion">
    <h2 class="tfor">ELIJE COMO QUIERES REGISTRARTE</h2>

    <!-- CON ESTE FORMULARIO QUE GUARDA UN SELECT NOS ELIJE EN EL IF A QUE TIPO DE FORMULARIO TE ENVIARÁ-->

    <form method="get" action="registro.jsp" class="fde">
        <select name="tipo">
            <option >Contribuyente</option>
            <option>Solicitante</option>
            <br><input type="submit" value="Aceptar" class="boton">
        </select>
    </form>
</div>

<%
    if(Objects.equals(request.getParameter("tipo"), "Contribuyente")){
        response.sendRedirect("formularioContribuyente.jsp");
    }else if(Objects.equals(request.getParameter("tipo"), "Solicitante")){
        response.sendRedirect("formularioSolicitante.jsp");
    }
%>



<br/>

</body>
</html>
