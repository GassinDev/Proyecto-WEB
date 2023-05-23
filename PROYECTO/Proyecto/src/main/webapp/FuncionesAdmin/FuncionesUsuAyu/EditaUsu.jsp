<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.example.proyecto.HelloServlet" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.proyecto.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    /*GUARDAMOS LOS DATOS DE LOS INPUTS EN VARIABLES, LAS VARIABLES LAS PASAMOS POR UN FILTRO Y LUEGO AL FINAL LAS METEMOS
     * EN UNA QUERY QUE ACTUALICE LOS DATOS ANTIGUOS*/

    Statement s = HelloServlet.conectarBD();
    Connection conexion = HelloServlet.nombradorBD();

    String nuevoNombre = request.getParameter("Nombre");
    String nuevoApellidos = request.getParameter("Apellidos");
    String nuevoTelefono = request.getParameter("Telefono");
    String nuevaEspecialidad = request.getParameter("Especialidad");

    Usuarios usu = new Usuarios();

    if(usu.compruebaUsuarioContri(request.getParameter("Usuario"))){

        ResultSet listado = s.executeQuery("SELECT * FROM Contribuyentes WHERE Usuario ='" + request.getParameter("Usuario") + "'");

        if(Objects.equals(request.getParameter("Nombre"), "")){
            nuevoNombre = listado.getString("Nombre");
        }
        if(Objects.equals(request.getParameter("Apellidos"), "")){
            nuevoApellidos = listado.getString("Apellidos");
        }
        if(Objects.equals(request.getParameter("Telefono"), "")){
            nuevoTelefono = listado.getString("Telefono");
        }
        if(Objects.equals(request.getParameter("Especialidad"), "")){
            nuevaEspecialidad = listado.getString("Especialidad");
        }

        s.executeUpdate("UPDATE Contribuyentes SET Nombre='" + nuevoNombre
                        + "',Apellidos='" + nuevoApellidos + "',Telefono='" + nuevoTelefono
                        + "',Especialidad='" + nuevaEspecialidad + "' WHERE Usuario='"
                        + request.getParameter("Usuario") + "'");

        listado.close();
        conexion.close();
    }else{
        ResultSet listado2 = s.executeQuery("SELECT * FROM Solicitantes WHERE Usuario ='" + request.getParameter("Usuario") + "'");

        if(Objects.equals(request.getParameter("Nombre"), "")){
            nuevoNombre = listado2.getString("Nombre");
        }
        if(Objects.equals(request.getParameter("Apellidos"), "")){
            nuevoApellidos = listado2.getString("Apellidos");
        }
        if(Objects.equals(request.getParameter("Telefono"), "")){
            nuevoTelefono = listado2.getString("Telefono");
        }
        s.executeUpdate("UPDATE Solicitantes SET Nombre='" + nuevoNombre
                + "',Apellidos='" + nuevoApellidos + "',Telefono='" + nuevoTelefono
                + "' WHERE Usuario='" + request.getParameter("Usuario") + "'");

        listado2.close();
        conexion.close();
    }
%>
<script>document.location = "../BorraEditaAdmin.jsp"</script>
</body>
</html>

