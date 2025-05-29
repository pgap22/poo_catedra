package com.poo.catedra.model;

import java.time.Duration;
import java.time.LocalDateTime;

public class Asignacion {
    private int id;
    private int cotizacionId;
    private int empleadoId;
    private String areaAsignada;
    private String tituloActividad;
    private LocalDateTime fechaHoraInicio;
    private LocalDateTime fechaHoraFin;
    private double costoPorHora;
    private double incrementoExtraPorcentaje;
    private double cantidadHorasAproximadas;
    // Constructor vacío
    public Asignacion() {}

    // Constructor completo
    public Asignacion(int id, int cotizacionId, int empleadoId, String areaAsignada, String tituloActividad,
                      LocalDateTime fechaHoraInicio, LocalDateTime fechaHoraFin, double costoPorHora,
                      double incrementoExtraPorcentaje, double cantidadHorasAproximadas) {
        this.id = id;
        this.cotizacionId = cotizacionId;
        this.empleadoId = empleadoId;
        this.areaAsignada = areaAsignada;
        this.tituloActividad = tituloActividad;
        this.fechaHoraInicio = fechaHoraInicio;
        this.fechaHoraFin = fechaHoraFin;
        this.costoPorHora = costoPorHora;
        this.incrementoExtraPorcentaje = incrementoExtraPorcentaje;
        this.cantidadHorasAproximadas = cantidadHorasAproximadas;
    }

    // Getters y Setters...

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCotizacionId() {
        return cotizacionId;
    }

    public void setCotizacionId(int cotizacionId) {
        this.cotizacionId = cotizacionId;
    }

    public int getEmpleadoId() {
        return empleadoId;
    }

    public void setEmpleadoId(int empleadoId) {
        this.empleadoId = empleadoId;
    }

    public String getAreaAsignada() {
        return areaAsignada;
    }

    public void setAreaAsignada(String areaAsignada) {
        this.areaAsignada = areaAsignada;
    }

    public String getTituloActividad() {
        return tituloActividad;
    }

    public void setTituloActividad(String tituloActividad) {
        this.tituloActividad = tituloActividad;
    }

    public LocalDateTime getFechaHoraInicio() {
        return fechaHoraInicio;
    }

    public void setFechaHoraInicio(LocalDateTime fechaHoraInicio) {
        this.fechaHoraInicio = fechaHoraInicio;
    }

    public LocalDateTime getFechaHoraFin() {
        return fechaHoraFin;
    }

    public void setFechaHoraFin(LocalDateTime fechaHoraFin) {
        this.fechaHoraFin = fechaHoraFin;
    }

    public double getCostoPorHora() {
        return costoPorHora;
    }

    public void setCostoPorHora(double costoPorHora) {
        this.costoPorHora = costoPorHora;
    }

    public double getIncrementoExtraPorcentaje() {
        return incrementoExtraPorcentaje;
    }

    public void setIncrementoExtraPorcentaje(double incrementoExtraPorcentaje) {
        this.incrementoExtraPorcentaje = incrementoExtraPorcentaje;
    }

    public void setCantidadHorasAproximadas(double cantidadHorasAproximadas) {
        this.cantidadHorasAproximadas = cantidadHorasAproximadas;
    }

    public double getCantidadHorasAproximadas() {
        return cantidadHorasAproximadas;
    }

    public double getCostoBase() {
        return getCantidadHorasAproximadas() * costoPorHora;
    }

    public double getTotal() {
        double costoBase = getCostoBase();
        return costoBase + (costoBase * (incrementoExtraPorcentaje / 100));
    }

    @Override
    public String toString() {
        return "Asignacion{" +
                "id=" + id +
                ", cotizacionId=" + cotizacionId +
                ", empleadoId=" + empleadoId +
                ", areaAsignada='" + areaAsignada + '\'' +
                ", tituloActividad='" + tituloActividad + '\'' +
                ", fechaHoraInicio=" + fechaHoraInicio +
                ", fechaHoraFin=" + fechaHoraFin +
                ", costoPorHora=" + costoPorHora +
                ", incrementoExtraPorcentaje=" + incrementoExtraPorcentaje +
                ", cantidadHorasAproximadas=" + getCantidadHorasAproximadas() +
                ", costoBase=" + getCostoBase() +
                ", total=" + getTotal() +
                '}';
    }
}