package com.example.proyecto;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Objects;

import static java.lang.System.out;

public class Usuarios {

    //ATRIBUTOS
    ArrayList<Contribuyente> listaContribuidores;
    ArrayList<Solicitante> listaSolicitantes;

    //CONSTRUCTOR - EL SIGUIENTE CONSTRUCTOR INICIA DOS LISTAS Y INTRODUCE OBJETOS EN CADA UNA DE ELLAS SEGUN
    //LOS CRITERIOS DE ESTOS
    public Usuarios() {
        Statement s = HelloServlet.conectarBD();
        Connection conexion = HelloServlet.nombradorBD();

        listaContribuidores = new ArrayList<>();
        listaSolicitantes = new ArrayList<>();
        leeUsuarios(s,conexion);
    }

    //METODO

    //LA SIGUIENTE FUNCION LEE CON DOS QUERY LAS LISTAS DE CONTRIBUYENTES Y  DE SOLICITANTES, Y RECOJE POR PARTES SUS
    //VALORES Y LOS INTRODUCE EN VARIBALES QUE ESTAS SON AÑADIDAS EN CONTRUCTORES, QUE GENERAN UN OBJETO Y ESTE SE
    //INTRODUCE EN UNA LISTA.
    public void leeUsuarios(Statement s, Connection conexion){

        try {

            String query = "SELECT * FROM Contribuyentes";
            ResultSet resul = s.executeQuery(query);


            if(resul != null){
                while(resul.next()){

                   String usuario = resul.getString("Usuario");
                   String nombre = resul.getString("Nombre");
                   String apellidos = resul.getString("Apellidos");
                   int telefono = resul.getInt("Telefono");
                   String especialidad = resul.getString("Especialidad");

                   listaContribuidores.add(new Contribuyente(usuario,nombre,apellidos,telefono,especialidad));

                }
            }

            String query2 = "SELECT * FROM Solicitantes";
            ResultSet resul2 = s.executeQuery(query2);

            if(resul2 != null){
                while(resul2.next()){

                    String usuario = resul2.getString("Usuario");
                    String nombre = resul2.getString("Nombre");
                    String apellidos = resul2.getString("Apellidos");
                    int telefono = resul2.getInt("Telefono");

                    listaSolicitantes.add(new Solicitante(usuario,nombre,apellidos,telefono));

                }
            }

            resul.close();
            resul2.close();
            conexion.close();

        } catch (SQLException e) {

            out.println("erro!" + e.getMessage());

        }
    }

    //FUNCIONES BASICA QUE LEEMOS UNA LISTA Y LA GUARDAMOS EN UN STRING, PARA PODER VERLA SI QUEREMOS POR PANTALLA
    public String listarDatosContributentes(){

        String s = "";

        for(Contribuyente c: listaContribuidores){
            s += c.toString() + "\n";
        }

        return s;
    }

    public String listarDatosSolicitantes(){

        String s = "";

        for(Solicitante soli: listaSolicitantes){
            s += soli.toString() + "\n";
        }

        return s;
    }

    /*FUNCION EN LA CUÁL EJECUTAMOS UNA QUERY Y GUARDAMOS EL RESULTADO OBTENIDO, PARA PODER LEERLO CON UN WHILE Y
    * PODER ENCONTRAR EN LA TABLA USUARIOS UN USUARIO Y CONTRASEÑA QUE COINCIDAN CON LOS INTRODUCIDOS POR EL USUARIO,
    * CUANDO YA HEMOS COMPROBADO QUE SI EXISTE PASARIAMOS A UN FOR QUE LEE LA LISTA DE CONTRIBUYENTES Y ESTE SI
    * ENCUENTRA UN USUARIO CON EL MISMO USUARIO QUE HA SIDO INTORDUCIDO, DEVOLVERIA ESE OBJETO, EN EL CASO DE QUE NO,
    *  DEVOLVERIA NULL*/
    public Contribuyente cargarMisDartosUsuarioContri(String usuario, String contraseña){

        try {
            String query = "SELECT * FROM Usuarios";
            Statement s = HelloServlet.conectarBD();
            Connection conexion = HelloServlet.nombradorBD();
            ResultSet resul =  s.executeQuery(query);

            if(resul != null){
                while(resul.next()){
                    if(Objects.equals(resul.getString("Usuario"), usuario) && Objects.equals(resul.getString("Contraseña"), contraseña)){

                        for (Contribuyente c: listaContribuidores){
                            if(Objects.equals(c.getUsuario(), usuario)){
                                resul.close();
                                conexion.close();
                                return c;
                            }
                        }
                    }
                }
            }

            resul.close();
            conexion.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    /*ES UNA VERSION MENOS ESPECIFICA DE LA FUNCION DE ARRIBA PERO ESTA DEVOLVERIA TRUE/FALSE, MUY UTIL PARA USARLOS
    * EN LOS IF PARA FILTRAR CONTRIBUYENTES DE SOLICITANTES*/
    public Boolean compruebaUsuarioContri(String usuario){

        for (Contribuyente c: listaContribuidores){
            if(Objects.equals(c.getUsuario(), usuario)){
                return true;
            }
        }

        return false;
    }

    //EXACTAMENTE IGUAL QUE LA FUNCION DE CARGARMISDATOSCONTRI PERO ESTA SERÍA PARA LOS SOLICITANTES
    public Solicitante cargarMisDartosUsuarioSoli(String usuario, String contraseña){

        try {
            String query = "SELECT * FROM Usuarios";
            Statement s = HelloServlet.conectarBD();
            Connection conexion = HelloServlet.nombradorBD();
            ResultSet resul =  s.executeQuery(query);

            if(resul != null){
                while(resul.next()){
                    if(Objects.equals(resul.getString("Usuario"), usuario) && Objects.equals(resul.getString("Contraseña"), contraseña)){

                        for (Solicitante soli: listaSolicitantes){
                            if(Objects.equals(soli.getUsuario(), usuario)){
                                resul.close();
                                conexion.close();
                                return soli;
                            }
                        }
                    }
                }
            }

            resul.close();
            conexion.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    //FUNCIONES PARA SACAR MEDIANTE UN FOR QUE LEE LA LISTA LOS DATOS DE LOS USUARIOS DEVOLVIENDO EL OBJETO NECESARIO
    public Contribuyente datosContribuyente(String usuario){

        for(Contribuyente c:listaContribuidores){
            if(Objects.equals(c.getUsuario(), usuario)){
                return c;
            }
        }

        return null;
    }

    public Solicitante datosSolicitantes(String usuario){

        for(Solicitante s:listaSolicitantes){
            if(Objects.equals(s.getUsuario(), usuario)){
                return s;
            }
        }

        return null;
    }

}