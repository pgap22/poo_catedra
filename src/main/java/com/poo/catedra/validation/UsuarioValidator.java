package com.poo.catedra.validation;

import com.poo.catedra.model.Usuario;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class UsuarioValidator {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[\\w-.]+@[\\w-]+\\.[a-z]{2,}$", Pattern.CASE_INSENSITIVE);

    private static final int PASSWORD_MIN_LENGTH = 6;



    // Devuelve una lista con mensajes de error
    public static List<String> validarErrores(Usuario usuario) {
        List<String> errores = new ArrayList<>();

        if (usuario == null) {
            errores.add("El usuario no puede ser nulo.");
            return errores;
        }

        if (usuario.getEmail() == null || usuario.getEmail().isBlank()) {
            errores.add("El email es obligatorio.");
        } else if (!EMAIL_PATTERN.matcher(usuario.getEmail()).matches()) {
            errores.add("El email tiene un formato inválido.");
        }

        if (usuario.getPassword() == null || usuario.getPassword().isBlank()) {
            errores.add("La contraseña es obligatoria.");
        } else if (usuario.getPassword().length() < PASSWORD_MIN_LENGTH) {
            errores.add("La contraseña debe tener al menos " + PASSWORD_MIN_LENGTH + " caracteres.");
        }

        if (usuario.getRol() == null || usuario.getRol().isBlank()) {
            errores.add("El rol es obligatorio.");
        }

        if (usuario.getEstado() == null) {
            errores.add("El estado no puede ser nulo.");
        }

        // Podrías agregar más validaciones como fechas o valores específicos

        return errores;
    }

    // Valida solo email y password para login
    public static List<String> validarLogin(String email, String password) {
        List<String> errores = new ArrayList<>();

        if (email == null || email.isBlank()) {
            errores.add("El email es obligatorio.");
        } else if (!EMAIL_PATTERN.matcher(email).matches()) {
            errores.add("El email tiene un formato inválido.");
        }

        if (password == null || password.isBlank()) {
            errores.add("La contraseña es obligatoria.");
        }

        return errores;
    }
}
