package com.poo.catedra.controllers;

import com.poo.catedra.dao.SubtareaDAO;
import com.poo.catedra.model.Subtarea;
import com.poo.catedra.validation.SubtareaValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "subtareaController", value = "/module/subtareaController")
public class SubtareaController extends HttpServlet {
    private final SubtareaDAO subtareaDAO = new SubtareaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");
        int id = Integer.parseInt(request.getParameter("id_subtarea"));

        switch (accion) {
            case "eliminar":
                // Eliminar la subtarea por ID
                subtareaDAO.eliminar(id);
                break;

            default:
                break;
        }

        response.sendRedirect("/"+rol+"/"+"subtareas.jsp?id=" + request.getParameter("id"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");

        switch (accion) {
            case "crear":
                // Crear una nueva subtarea
                Subtarea nueva = new Subtarea();
                nueva.setAsignacionId(Integer.parseInt(request.getParameter("asignacionId")));
                nueva.setTituloSubtarea(request.getParameter("tituloSubtarea"));
                nueva.setDescripcion(request.getParameter("descripcion"));

                // Validar los datos antes de insertar
                List<String> erroresCrear = SubtareaValidator.validar(nueva);
                if (!erroresCrear.isEmpty()) {
                    request.setAttribute("error", erroresCrear.getFirst()); // Mostrar el primer error
                    request.getRequestDispatcher("/" + rol + "/subtareas.jsp?id=" + nueva.getAsignacionId()).forward(request, response);
                    return;
                }

                // Insertar la subtarea en la base de datos
                subtareaDAO.insertar(nueva);
                break;

            case "editar":
                // Editar una subtarea existente
                int idEditar = Integer.parseInt(request.getParameter("id_subtarea"));
                Subtarea existente = subtareaDAO.obtenerPorId(idEditar);

                if (existente != null) {
                    existente.setAsignacionId(Integer.parseInt(request.getParameter("asignacionId")));
                    existente.setTituloSubtarea(request.getParameter("tituloSubtarea"));
                    existente.setDescripcion(request.getParameter("descripcion"));

                    // Validar los datos actualizados
                    List<String> erroresEditar = SubtareaValidator.validar(existente);
                    if (!erroresEditar.isEmpty()) {
                        request.setAttribute("error", erroresEditar.getFirst()); // Mostrar el primer error
                        request.getRequestDispatcher("/" + rol + "/subtareas.jsp?id=" + existente.getAsignacionId()).forward(request, response);
                        return;
                    }

                    // Actualizar la subtarea en la base de datos
                    subtareaDAO.actualizar(existente);
                }
                break;

            default:
                break;
        }

        // Redirigir al listado de subtareas
        response.sendRedirect("/" + rol + "/subtareas.jsp?id="+request.getParameter("asignacionId"));
    }
}