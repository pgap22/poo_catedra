package com.poo.catedra.model;

public class Subtarea {
    // Atributos
    private int id;
    private int asignacionId;
    private String tituloSubtarea;
    private String descripcion;

    // Constructor vacío
    public Subtarea() {}

    // Constructor con todos los parámetros
    public Subtarea(int id, int asignacionId, String tituloSubtarea, String descripcion) {
        this.id = id;
        this.asignacionId = asignacionId;
        this.tituloSubtarea = tituloSubtarea;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAsignacionId() {
        return asignacionId;
    }

    public void setAsignacionId(int asignacionId) {
        this.asignacionId = asignacionId;
    }

    public String getTituloSubtarea() {
        return tituloSubtarea;
    }

    public void setTituloSubtarea(String tituloSubtarea) {
        this.tituloSubtarea = tituloSubtarea;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    // Método toString para facilitar el debug
    @Override
    public String toString() {
        return "Subtarea{" +
                "id=" + id +
                ", asignacionId=" + asignacionId +
                ", tituloSubtarea='" + tituloSubtarea + '\'' +
                ", descripcion='" + descripcion + '\'' +
                '}';
    }
}