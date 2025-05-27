package com.poo.catedra.validation;

import com.poo.catedra.enums.TipoContratacion;
import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Empleado;

import java.util.ArrayList;
import java.util.List;

public class EmpleadoValidator {

    private static final String DUI_PATTERN = "^\\d{8}-\\d$";
    private static final String NIT_PATTERN = "^\\d{4}-\\d{6}-\\d{3}-\\d$";

    public static List<String> validar(Empleado empleado) {
        List<String> errores = new ArrayList<>();

        if (empleado == null) {
            errores.add("El empleado no puede ser nulo.");
            return errores;
        }

        // Validar nombre
        if (empleado.getNombre() == null || empleado.getNombre().isBlank()) {
            errores.add("El nombre es obligatorio.");
        }

        // Validar documento de identificación
        if (empleado.getDocumentoIdentificacion() == null || empleado.getDocumentoIdentificacion().isBlank()) {
            errores.add("El documento de identificación es obligatorio.");
        } else {
            boolean esDUIValido = empleado.getDocumentoIdentificacion().matches(DUI_PATTERN);
            boolean esNITValido = empleado.getDocumentoIdentificacion().matches(NIT_PATTERN);
            if (!esDUIValido && !esNITValido) {
                errores.add("El documento de identificación debe ser un DUI o NIT válido.");
            }
        }

        // Validar tipo de persona
        if (empleado.getTipoPersona() == null) {
            errores.add("El tipo de persona es obligatorio.");
        } else {
            boolean valido = false;
            for (TipoPersona tp : TipoPersona.values()) {
                if (tp == empleado.getTipoPersona()) {
                    valido = true;
                    break;
                }
            }
            if (!valido) {
                errores.add("El tipo de persona no es válido.");
            }
        }

        // Validar tipo de contratación
        if (empleado.getTipoContratacion() == null) {
            errores.add("El tipo de contratación es obligatorio.");
        } else {
            boolean valido = false;
            for (TipoContratacion tc : TipoContratacion.values()) {
                if (tc == empleado.getTipoContratacion()) {
                    valido = true;
                    break;
                }
            }
            if (!valido) {
                errores.add("El tipo de contratación no es válido.");
            }
        }

        // Validar teléfono
        if (empleado.getTelefono() == null || empleado.getTelefono().isBlank()) {
            errores.add("El teléfono es obligatorio.");
        }

        // Validar correo
        if (empleado.getCorreo() == null || empleado.getCorreo().isBlank()) {
            errores.add("El correo es obligatorio.");
        } else if (!empleado.getCorreo().matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            errores.add("El correo tiene un formato inválido.");
        }

        // Validar dirección
        if (empleado.getDireccion() == null || empleado.getDireccion().isBlank()) {
            errores.add("La dirección es obligatoria.");
        }

        // Validar estado
        if (empleado.getEstado() == null) {
            errores.add("El estado es obligatorio.");
        } else if (!empleado.getEstado().equals(true) && !empleado.getEstado().equals(false)) {
            errores.add("El estado debe ser 'true' o 'false'.");
        }

        return errores;
    }
}