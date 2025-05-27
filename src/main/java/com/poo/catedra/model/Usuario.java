package com.poo.catedra.model;

import java.time.LocalDateTime;

public class Usuario {
    private int id;
    private String email;
    private String password;
    private String rol;
    private Boolean estado;
    private LocalDateTime fecha_creacion;
    private LocalDateTime fecha_actualizacion;
    private LocalDateTime fecha_inactivacion;

    public Usuario() {
    }

    public Usuario(int id, String email, String rol, String password, Boolean estado, LocalDateTime fecha_creacion, LocalDateTime fecha_modificacion) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.estado = false;
        this.fecha_creacion = LocalDateTime.now();
        this.fecha_actualizacion = LocalDateTime.now();
    }

    // Getters y Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public LocalDateTime getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(LocalDateTime fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public LocalDateTime getFecha_actualizacion() {
        return fecha_actualizacion;
    }

    public void setFecha_actualizacion(LocalDateTime fecha_actualizacion) {
        this.fecha_actualizacion = fecha_actualizacion;
    }

    public LocalDateTime getFecha_inactivacion() {
        return fecha_inactivacion;
    }

    public void setFecha_inactivacion(LocalDateTime fecha_inactivacion) {
        this.fecha_inactivacion = fecha_inactivacion;
    }

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", rol='" + rol + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
