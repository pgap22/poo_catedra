package com.poo.catedra.validation;

import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Cliente;

import java.util.ArrayList;
import java.util.List;

public class ClienteValidator {

    // Expresión regular para validar formato DUI (ej. 12345678-9)
    private static final String DUI_PATTERN = "^\\d{8}-\\d$";

    // Expresión regular para validar formato NIT (ej. 1234-123456-123-1)
    private static final String NIT_PATTERN = "^\\d{4}-\\d{6}-\\d{3}-\\d$";

    // Método principal que valida los campos del objeto Cliente
    public static List<String> validar(Cliente cliente) {
        List<String> errores = new ArrayList<>();

        // Verifica si el cliente es nulo
        if (cliente == null) {
            errores.add("El cliente no puede ser nulo.");
            return errores;
        }

        // Valida que el nombre no sea nulo o vacío
        if (cliente.getNombre() == null || cliente.getNombre().isBlank()) {
            errores.add("El nombre es obligatorio.");
        }

        // Verifica que el documento no esté vacío y sea un DUI o NIT válido
        if (cliente.getDocumentoIdentificacion() == null || cliente.getDocumentoIdentificacion().isBlank()) {
            errores.add("El documento de identificación es obligatorio.");
        } else {
            boolean esDUIValido = cliente.getDocumentoIdentificacion().matches(DUI_PATTERN);
            boolean esNITValido = cliente.getDocumentoIdentificacion().matches(NIT_PATTERN);
            if (!esDUIValido && !esNITValido) {
                errores.add("El documento de identificación debe ser un DUI o NIT válido.");
            }
        }

        // Verifica que el tipo de persona no sea nulo y esté dentro de los valores del enum
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

        // Verifica que el teléfono no esté vacío
        if (cliente.getTelefono() == null || cliente.getTelefono().isBlank()) {
            errores.add("El teléfono es obligatorio.");
        }

        // Verifica que el correo no esté vacío y tenga un formato válido
        if (cliente.getCorreo() == null || cliente.getCorreo().isBlank()) {
            errores.add("El correo es obligatorio.");
        } else if (!cliente.getCorreo().matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            errores.add("El correo tiene un formato inválido.");
        }

        // Verifica que la dirección no esté vacía
        if (cliente.getDireccion() == null || cliente.getDireccion().isBlank()) {
            errores.add("La dirección es obligatoria.");
        }

        // Verifica que el estado no sea nulo
        if (cliente.getEstado() == null) {
            errores.add("El estado es obligatorio.");
        }

        return errores;
    }
}
