package com.poo.catedra.utils;

import com.poo.catedra.model.Usuario;
import jakarta.servlet.http.HttpServletRequest;

public class SesionHelper {

    // Método para iniciar sesión: guarda datos del usuario en la sesión HTTP
    public static void iniciarSesion(HttpServletRequest req, Usuario usuario) {
        req.getSession().setAttribute("nombreUsuario", usuario.getEmail());
        req.getSession().setAttribute("id", usuario.getId());
        req.getSession().setAttribute("rol", usuario.getRol());
    }

    // Método para cerrar sesión: invalida toda la sesión actual
    public static void cerrarSesion(HttpServletRequest req) {
        req.getSession().invalidate(); // Elimina todos los atributos y cierra la sesión
    }

    // Método para verificar si hay una sesión activa
    public static boolean sesionActiva(HttpServletRequest req) {
        // Comprueba si existe una sesión y si el atributo "usuario" está presente
        return req.getSession(false) != null && req.getSession().getAttribute("usuario") != null;
    }
}
