package com.example.proyecto;

public class Solicitante {

    //ATRIBUTOS
    String usuario;
    String nombre;
    String apellidos;
    int telefono;

    //CONSTRUCTOR
    public Solicitante(String usuario, String nombre, String apellidos, int telefono) {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
    }

    public Solicitante() {
    }

    //METODOS


    public String getUsuario() {
        return usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public int getTelefono() {
        return telefono;
    }


    @Override
    public String toString() {
        return "<br>" + "Nombre: " + nombre + "<br>" +
                "Apellidos: " + apellidos + "<br>" +
                "Teléfono: " + telefono;
    }
}
