package com.poo.catedra.controllers;

import com.poo.catedra.dao.UsuarioDAO;
import com.poo.catedra.model.Usuario;
import com.poo.catedra.utils.SesionHelper;
import com.poo.catedra.validation.UsuarioValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "loginController", value = "/loginController")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        List<String> validaciones = UsuarioValidator.validarLogin(email, password);

        if(!validaciones.isEmpty()) {
            request.setAttribute("error", validaciones.getFirst());
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
            return;
        }

        // Validar login con un DAO
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.autenticar(email, password);

        if (usuario != null) {

            if(!usuario.getEstado()) {
                request.setAttribute("error", "Usuario Inactivo");
                request.getRequestDispatcher("/login/login.jsp").forward(request, response);
                return;
            }

            SesionHelper.iniciarSesion(request, usuario);

            String rol = usuario.getRol();

            response.sendRedirect("/"+rol+"/index.jsp");
        } else {
            request.setAttribute("error", "Credenciales incorrectas");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        }
    }
}
