package com.poo.catedra.utils;

import com.poo.catedra.model.Usuario;
import jakarta.servlet.http.HttpServletRequest;

public class SesionHelper {
    public static void iniciarSesion(HttpServletRequest req, Usuario usuario) {
        req.getSession().setAttribute("nombreUsuario", usuario.getEmail());
        req.getSession().setAttribute("id", usuario.getId());
        req.getSession().setAttribute("rol", usuario.getRol());
    }

    public static void cerrarSesion(HttpServletRequest req) {
        req.getSession().invalidate();
    }

    public static boolean sesionActiva(HttpServletRequest req) {
        return req.getSession(false) != null && req.getSession().getAttribute("usuario") != null;
    }
}

