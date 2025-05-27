package com.poo.catedra.model;

import com.poo.catedra.enums.EstadoCotizacion;

import java.time.LocalDateTime;

public class Cotizacion {
    private int id;
    private int clienteId;
    private EstadoCotizacion estado; // Usamos String para mapear ENUM ('EnProceso', 'Finalizada')
    private LocalDateTime fechaInicioTentativa;
    private LocalDateTime fechaFinTentativa;
    private double costoAdicionales;
    private int creadoPorId;
    private LocalDateTime fechaCreacion;

    // Constructor vacío
    public Cotizacion() {
        this.fechaCreacion = LocalDateTime.now();
    }
    // Constructor completo
    public Cotizacion(int id, int clienteId, EstadoCotizacion estado, LocalDateTime fechaInicioTentativa,
                      LocalDateTime fechaFinTentativa, double costoAdicionales, int creadoPorId, LocalDateTime fechaCreacion) {
        this.id = id;
        this.clienteId = clienteId;
        this.estado = estado;
        this.fechaInicioTentativa = fechaInicioTentativa;
        this.fechaFinTentativa = fechaFinTentativa;
        this.costoAdicionales = costoAdicionales;
        this.creadoPorId = creadoPorId;
        this.fechaCreacion = fechaCreacion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClienteId() {
        return clienteId;
    }

    public void setClienteId(int clienteId) {
        this.clienteId = clienteId;
    }

    public EstadoCotizacion getEstado() {
        return estado;
    }

    public void setEstado(EstadoCotizacion estado) {
        this.estado = estado;
    }

    public LocalDateTime getFechaInicioTentativa() {
        return fechaInicioTentativa;
    }

    public void setFechaInicioTentativa(LocalDateTime fechaInicioTentativa) {
        this.fechaInicioTentativa = fechaInicioTentativa;
    }

    public LocalDateTime getFechaFinTentativa() {
        return fechaFinTentativa;
    }

    public void setFechaFinTentativa(LocalDateTime fechaFinTentativa) {
        this.fechaFinTentativa = fechaFinTentativa;
    }

    public double getCostoAdicionales() {
        return costoAdicionales;
    }

    public void setCostoAdicionales(double costoAdicionales) {
        this.costoAdicionales = costoAdicionales;
    }

    public int getCreadoPorId() {
        return creadoPorId;
    }

    public void setCreadoPorId(int creadoPorId) {
        this.creadoPorId = creadoPorId;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}