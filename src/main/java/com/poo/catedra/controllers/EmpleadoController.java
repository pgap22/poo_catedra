package com.poo.catedra.controllers;

import com.poo.catedra.dao.EmpleadoDAO;
import com.poo.catedra.enums.TipoContratacion;
import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Empleado;
import com.poo.catedra.validation.EmpleadoValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "empleadoController", value = "/module/empleadoController")
public class EmpleadoController extends HttpServlet {
    private final EmpleadoDAO empleadoDAO = new EmpleadoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");
        switch (accion) {
            case "toggleEstado":
                Empleado empleado = empleadoDAO.obtenerPorId(id);
                if (empleado != null) {
                    empleado.setEstado(!empleado.getEstado()); // Invierte el estado actual (true -> false, false -> true)
                    empleado.setFechaActualizacion(LocalDateTime.now());
                    if (!empleado.getEstado()) { // Si se inactiva
                        empleado.setFechaInactivacion(LocalDateTime.now());
                    } else { // Si se activa nuevamente
                        empleado.setFechaInactivacion(null);
                    }
                    empleadoDAO.actualizar(empleado);
                }
                break;

            case "eliminar":
                // Eliminar el empleado por ID
                empleadoDAO.eliminar(id);
                break;

            default:
                break;
        }

        response.sendRedirect("/"+rol+"/empleados.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");

        switch (accion) {
            case "crear":
                Empleado nuevo = new Empleado();
                nuevo.setNombre(request.getParameter("nombre"));
                nuevo.setDocumentoIdentificacion(request.getParameter("documentoIdentificacion"));
                nuevo.setTipoPersona(TipoPersona.valueOf(request.getParameter("tipoPersona") != null ? request.getParameter("tipoPersona") : "Natural"));
                nuevo.setTipoContratacion(TipoContratacion.valueOf(request.getParameter("tipoContratacion") != null ? request.getParameter("tipoContratacion") : "Permanente"));
                nuevo.setTelefono(request.getParameter("telefono"));
                nuevo.setCorreo(request.getParameter("correo"));
                nuevo.setDireccion(request.getParameter("direccion"));
                nuevo.setEstado(Boolean.parseBoolean(request.getParameter("estado")));
                nuevo.setCreadoPorId((Integer) request.getSession(false).getAttribute("id"));

                List<String> erroresCrear = EmpleadoValidator.validar(nuevo);
                Logger log = Logger.getLogger("EmpleadoController");
                log.info(nuevo.toString());
                if (!erroresCrear.isEmpty()) {
                    // Guardar errores en request y redirigir al formulario
                    request.setAttribute("error", erroresCrear.getFirst());
                    request.getRequestDispatcher("/"+rol+"/empleados.jsp").forward(request, response);
                    return;
                }

                Empleado empleadoMismoDocumento = empleadoDAO.obtenerPorDocumentoIdentificacion(nuevo.getDocumentoIdentificacion());
                if (empleadoMismoDocumento != null) {
                    request.setAttribute("error", "Empleado con mismo documento de identificación");
                    request.getRequestDispatcher("/"+rol+"/empleados.jsp").forward(request, response);
                    return;
                }

                empleadoDAO.insertar(nuevo);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Empleado existente = empleadoDAO.obtenerPorId(idEditar);

                if (existente != null) {
                    existente.setNombre(request.getParameter("nombre"));
                    existente.setDocumentoIdentificacion(request.getParameter("documentoIdentificacion"));
                    existente.setTipoPersona(TipoPersona.valueOf(request.getParameter("tipoPersona") != null ? request.getParameter("tipoPersona") : "Natural"));
                    existente.setTipoContratacion(TipoContratacion.valueOf(request.getParameter("tipoContratacion") != null ? request.getParameter("tipoContratacion") : "Permanente"));
                    existente.setTelefono(request.getParameter("telefono"));
                    existente.setCorreo(request.getParameter("correo"));
                    existente.setDireccion(request.getParameter("direccion"));
                    existente.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

                    List<String> erroresEditar = EmpleadoValidator.validar(existente);
                    if (!erroresEditar.isEmpty()) {
                        // Guardar errores en request y redirigir al formulario
                        request.setAttribute("error", erroresEditar.getFirst());
                        request.getRequestDispatcher("/"+rol+"/empleados.jsp").forward(request, response);
                        return;
                    }

                    Empleado empleadoMismoDocumentoEditar = empleadoDAO.obtenerPorDocumentoIdentificacion(existente.getDocumentoIdentificacion());
                    if (empleadoMismoDocumentoEditar != null && empleadoMismoDocumentoEditar.getId() != existente.getId()) {
                        request.setAttribute("error", "Empleado con mismo documento de identificación");
                        request.getRequestDispatcher("/"+rol+"/empleados.jsp").forward(request, response);
                        return;
                    }

                    empleadoDAO.actualizar(existente);
                }
                break;

            default:
                break;
        }

        response.sendRedirect("/"+rol+"/empleados.jsp");
    }
}