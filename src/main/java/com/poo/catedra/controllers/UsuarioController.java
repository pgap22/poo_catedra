package com.poo.catedra.controllers;

import com.poo.catedra.dao.UsuarioDAO;
import com.poo.catedra.model.Usuario;
import com.poo.catedra.utils.HashChecker;
import com.poo.catedra.utils.SesionHelper;
import com.poo.catedra.validation.UsuarioValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "usuarioController", value = "/admin/usuarioController")
public class UsuarioController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<String> errores;
        if (accion == null) {
            response.sendRedirect("/admin/index.jsp");
            return;
        }

        switch (accion) {
            case "crear":
                Usuario nuevo = new Usuario();
                nuevo.setEmail(request.getParameter("email"));
                nuevo.setPassword(request.getParameter("password"));
                nuevo.setRol(request.getParameter("rol"));
                nuevo.setEstado(true);
                nuevo.setFecha_creacion(LocalDateTime.now());
                nuevo.setFecha_actualizacion(LocalDateTime.now());

                errores = UsuarioValidator.validarErrores(nuevo);

                Usuario usurioMismoEmail = usuarioDAO.obtenerPorEmail(nuevo.getEmail());

                if(usurioMismoEmail != null) {
                    request.setAttribute("error", "Ya existe un usuario con ese email");
                    request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
                    return;
                }

                if (!errores.isEmpty()) {
                    request.setAttribute("error", errores.getFirst());
                    request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
                    return;
                }
                nuevo.setPassword(HashChecker.sha256(request.getParameter("password"))); // HASH
                usuarioDAO.insertar(nuevo);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Usuario actualizado = usuarioDAO.obtenerPorId(idEditar);



                if (actualizado != null) {

                    actualizado.setEmail(request.getParameter("email"));
                    actualizado.setRol(request.getParameter("rol"));

                    String nuevaPassword = request.getParameter("password");
                    actualizado.setFecha_actualizacion(LocalDateTime.now());

                    if (nuevaPassword != null && !nuevaPassword.isBlank()) {
                        //actualizado.setPassword(HashChecker.sha256(nuevaPassword)); // HASH solo si se cambió
                        actualizado.setPassword(nuevaPassword);
                    }


                    errores = UsuarioValidator.validarErrores(actualizado);

                    if (nuevaPassword != null && !nuevaPassword.isBlank()) {
                        actualizado.setPassword(HashChecker.sha256(nuevaPassword)); // HASH solo si se cambió
                    }

                    if (!errores.isEmpty()) {
                        request.setAttribute("error", errores.getFirst());
                        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
                        return;
                    }
                    usuarioDAO.actualizar(actualizado);
                }
                break;

            case "toggleEstado":
                int idToggle = Integer.parseInt(request.getParameter("id"));
                Usuario usuario = usuarioDAO.obtenerPorId(idToggle);

                if (usuario != null) {
                    boolean nuevoEstado = !usuario.getEstado(); // invertimos el estado actual
                    usuario.setEstado(nuevoEstado);
                    usuario.setFecha_actualizacion(LocalDateTime.now());

                    if (nuevoEstado) {
                        usuario.setFecha_inactivacion(null); // activando: limpiar la fecha
                    } else {
                        usuario.setFecha_inactivacion(LocalDateTime.now()); // inactivando
                    }
                    Logger log = Logger.getLogger(this.getClass().getName());
                    log.info("Estado actualizado: " + usuario.getEstado());
                    usuarioDAO.actualizar(usuario);
                }
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                usuarioDAO.eliminar(idEliminar);
                break;

            default:
                break;
        }

        response.sendRedirect("/admin/index.jsp");
    }

}