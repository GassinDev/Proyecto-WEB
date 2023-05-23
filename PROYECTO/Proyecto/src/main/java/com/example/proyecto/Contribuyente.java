package com.example.proyecto;

public class Contribuyente {

    //ATRIBUTOS
    String usuario;
    String nombre;
    String apellidos;
    int telefono;
    String especialidad;

    //CONSTRUCTOR
    public Contribuyente(String usuario, String nombre, String apellidos, int telefono, String especialidad) {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.especialidad = especialidad;
    }

    //METODOS
    public String getUsuario() { return usuario; }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    @Override
    public String toString() {
        return "<br>" + "Nombre: " + nombre + "<br>" +
               "Apellidos: " + apellidos + "<br>" +
               "Teléfono: " + telefono + "<br>" +
               "Especialidades: " + especialidad;
    }
}
