package com.poo.catedra.validation;

import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Cliente;

import java.util.ArrayList;
import java.util.List;

public class ClienteValidator {

    private static final String DUI_PATTERN = "^\\d{8}-\\d$";
    private static final String NIT_PATTERN = "^\\d{4}-\\d{6}-\\d{3}-\\d$";

    public static List<String> validar(Cliente cliente) {
        List<String> errores = new ArrayList<>();

        if (cliente == null) {
            errores.add("El cliente no puede ser nulo.");
            return errores;
        }

        if (cliente.getNombre() == null || cliente.getNombre().isBlank()) {
            errores.add("El nombre es obligatorio.");
        }

        if (cliente.getDocumentoIdentificacion() == null || cliente.getDocumentoIdentificacion().isBlank()) {
            errores.add("El documento de identificación es obligatorio.");
        } else {
            boolean esDUIValido = cliente.getDocumentoIdentificacion().matches(DUI_PATTERN);
            boolean esNITValido = cliente.getDocumentoIdentificacion().matches(NIT_PATTERN);
            if (!esDUIValido && !esNITValido) {
                errores.add("El documento de identificación debe ser un DUI o NIT válido.");
            }
        }

        if (cliente.getTipoPersona() == null) {
            errores.add("El tipo de persona es obligatorio.");
        } else {
            boolean valido = false;
            for (TipoPersona tp : TipoPersona.values()) {
                if (tp == cliente.getTipoPersona()) {
                    valido = true;
                    break;
                }
            }
            if (!valido) {
                errores.add("El tipo de persona no es válido.");
            }
        }

        if (cliente.getTelefono() == null || cliente.getTelefono().isBlank()) {
            errores.add("El teléfono es obligatorio.");
        }

        if (cliente.getCorreo() == null || cliente.getCorreo().isBlank()) {
            errores.add("El correo es obligatorio.");
        } else if (!cliente.getCorreo().matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            errores.add("El correo tiene un formato inválido.");
        }

        if (cliente.getDireccion() == null || cliente.getDireccion().isBlank()) {
            errores.add("La dirección es obligatoria.");
        }

        if (cliente.getEstado() == null) {
            errores.add("El estado es obligatorio.");
        }

        return errores;
    }
}
