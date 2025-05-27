package com.poo.catedra.validation;

import com.poo.catedra.enums.EstadoCotizacion;
import com.poo.catedra.model.Cotizacion;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CotizacionValidator {

    public static List<String> validar(Cotizacion cotizacion) {
        List<String> errores = new ArrayList<>();

        // Validar que el objeto no sea nulo
        if (cotizacion == null) {
            errores.add("La cotización no puede ser nula.");
            return errores;
        }

        // Validar clienteId
        if (cotizacion.getClienteId() <= 0) {
            errores.add("El cliente es obligatorio y debe ser válido.");
        }

        // Validar estado
        if (cotizacion.getEstado() == null ||
                (!cotizacion.getEstado().equals(EstadoCotizacion.EnProceso) &&
                        !cotizacion.getEstado().equals(EstadoCotizacion.Finalizada))) {
            errores.add("El estado debe ser 'EnProceso' o 'Finalizada'.");
        }

        // Validar fechaInicioTentativa
        if (cotizacion.getFechaInicioTentativa() == null) {
            errores.add("La fecha de inicio tentativa es obligatoria.");
        }

        // Validar fechaFinTentativa
        if (cotizacion.getFechaFinTentativa() == null) {
            errores.add("La fecha de fin tentativa es obligatoria.");
        } else if (cotizacion.getFechaFinTentativa().isBefore(cotizacion.getFechaInicioTentativa())) {
            errores.add("La fecha de fin tentativa debe ser posterior a la fecha de inicio tentativa.");
        }

        // Validar costoAdicionales
        if (cotizacion.getCostoAdicionales() < 0) {
            errores.add("El costo adicional no puede ser negativo.");
        }

        // Validar creadoPorId
        if (cotizacion.getCreadoPorId() <= 0) {
            errores.add("El usuario creador es obligatorio y debe ser válido.");
        }

        // Validar fechaCreacion
        if (cotizacion.getFechaCreacion() == null) {
            errores.add("La fecha de creación es obligatoria.");
        }

        return errores;
    }
}