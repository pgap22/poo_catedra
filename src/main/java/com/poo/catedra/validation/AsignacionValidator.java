package com.poo.catedra.validation;

import com.poo.catedra.model.Asignacion;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AsignacionValidator {

    public static List<String> validar(Asignacion asignacion) {
        List<String> errores = new ArrayList<>();

        // Validar que el objeto no sea nulo
        if (asignacion == null) {
            errores.add("La asignación no puede ser nula.");
            return errores;
        }

        // Validar cotizacionId
        if (asignacion.getCotizacionId() <= 0) {
            errores.add("La cotización es obligatoria y debe ser válida.");
        }

        // Validar empleadoId
        if (asignacion.getEmpleadoId() <= 0) {
            errores.add("El empleado asignado es obligatorio y debe ser válido.");
        }

        // Validar areaAsignada
        if (asignacion.getAreaAsignada() == null || asignacion.getAreaAsignada().isBlank()) {
            errores.add("El área asignada es obligatoria.");
        }

        // Validar tituloActividad
        if (asignacion.getTituloActividad() == null || asignacion.getTituloActividad().isBlank()) {
            errores.add("El título de la actividad es obligatorio.");
        }

        // Validar fechaHoraInicio
        if (asignacion.getFechaHoraInicio() == null) {
            errores.add("La fecha y hora de inicio son obligatorias.");
        }

        // Validar fechaHoraFin
        if (asignacion.getFechaHoraFin() == null) {
            errores.add("La fecha y hora de fin son obligatorias.");
        } else if (asignacion.getFechaHoraFin().isBefore(asignacion.getFechaHoraInicio())) {
            errores.add("La fecha y hora de fin deben ser posteriores a la fecha y hora de inicio.");
        }

        // Validar costoPorHora
        if (asignacion.getCostoPorHora() <= 0) {
            errores.add("El costo por hora debe ser mayor que cero.");
        }

        // Validar incrementoExtraPorcentaje
        if (asignacion.getIncrementoExtraPorcentaje() < 0) {
            errores.add("El incremento extra (%) no puede ser negativo.");
        }

        // Validar getCantidadHorasAproximadas
        if (asignacion.getCantidadHorasAproximadas() < 0) {
            errores.add("La cantidad de horas aproximadas no puede ser negativo.");
        }

        return errores;
    }
}