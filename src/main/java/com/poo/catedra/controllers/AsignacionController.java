package com.poo.catedra.controllers;

import com.poo.catedra.dao.AsignacionDAO;
import com.poo.catedra.model.Asignacion;
import com.poo.catedra.validation.AsignacionValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "asignacionController", value = "/module/asignacionController")
public class AsignacionController extends HttpServlet {
    private final AsignacionDAO asignacionDAO = new AsignacionDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");

        switch (accion) {
            case "eliminar":
                // Eliminar la asignación por ID
                asignacionDAO.eliminar(id);
                break;

            default:
                break;
        }

        response.sendRedirect("/"+rol+"/asignaciones.jsp?id=" + id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");

        switch (accion) {
            case "crear":
                // Crear una nueva asignación
                Asignacion nueva = new Asignacion();
                nueva.setCotizacionId(Integer.parseInt(request.getParameter("cotizacionId")));
                nueva.setEmpleadoId(Integer.parseInt(request.getParameter("empleadoId")));
                nueva.setAreaAsignada(request.getParameter("areaAsignada"));
                nueva.setTituloActividad(request.getParameter("tituloActividad"));

                // Validar fechas (evitar null o formatos incorrectos)
                String fechaInicioStr = request.getParameter("fechaHoraInicio");
                String fechaFinStr = request.getParameter("fechaHoraFin");

                if (fechaInicioStr == null || fechaInicioStr.isEmpty()) {
                    request.setAttribute("error", "Fecha de inicio vacia");
                    request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+nueva.getCotizacionId()).forward(request, response);
                    return;
                }
                if (fechaFinStr == null || fechaFinStr.isEmpty()) {
                    request.setAttribute("error", "Fecha de fin vacia");
                    request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+nueva.getCotizacionId()).forward(request, response);
                    return;
                }

                nueva.setFechaHoraInicio(LocalDateTime.parse(request.getParameter("fechaHoraInicio")));
                nueva.setFechaHoraFin(LocalDateTime.parse(request.getParameter("fechaHoraFin")));
                nueva.setCostoPorHora(Double.parseDouble(request.getParameter("costoPorHora")));
                nueva.setIncrementoExtraPorcentaje(Double.parseDouble(request.getParameter("incrementoExtraPorcentaje")));
                nueva.setCantidadHorasAproximadas(Integer.parseInt(request.getParameter("cantidadHorasAproximadas")));

                List<String> erroresCrear = AsignacionValidator.validar(nueva);
                if (!erroresCrear.isEmpty()) {
                    request.setAttribute("error", erroresCrear.getFirst());
                    request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+nueva.getCotizacionId()).forward(request, response);
                    return;
                }

                asignacionDAO.insertar(nueva);
                break;

            case "editar":
                // Editar una asignación existente
                int idEditar = Integer.parseInt(request.getParameter("id_asignacion"));
                Asignacion existente = asignacionDAO.obtenerPorId(idEditar);

                if (existente != null) {
                    existente.setCotizacionId(Integer.parseInt(request.getParameter("cotizacionId")));
                    existente.setEmpleadoId(Integer.parseInt(request.getParameter("empleadoId")));
                    existente.setAreaAsignada(request.getParameter("areaAsignada"));
                    existente.setTituloActividad(request.getParameter("tituloActividad"));

                    // Validar fechas (evitar null o formatos incorrectos)
                    String fechaInicioStr2 = request.getParameter("fechaHoraInicio");
                    String fechaFinStr2 = request.getParameter("fechaHoraFin");

                    if (fechaInicioStr2 == null || fechaInicioStr2.isEmpty()) {
                        request.setAttribute("error", "Fecha de inicio vacia");
                        request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+existente.getCotizacionId()).forward(request, response);
                        return;
                    }
                    if (fechaFinStr2 == null || fechaFinStr2.isEmpty()) {
                        request.setAttribute("error", "Fecha de fin vacia");
                        request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+existente.getCotizacionId()).forward(request, response);
                        return;
                    }

                    existente.setCostoPorHora(Double.parseDouble(request.getParameter("costoPorHora")));
                    existente.setIncrementoExtraPorcentaje(Double.parseDouble(request.getParameter("incrementoExtraPorcentaje")));
                    existente.setCantidadHorasAproximadas(Integer.parseInt(request.getParameter("cantidadHorasAproximadas")));


                    List<String> erroresEditar = AsignacionValidator.validar(existente);
                    if (!erroresEditar.isEmpty()) {
                        request.setAttribute("error", erroresEditar.getFirst());
                        request.getRequestDispatcher("/"+rol+"/asignaciones.jsp?id="+existente.getCotizacionId()).forward(request, response);
                        return;
                    }

                    asignacionDAO.actualizar(existente);
                }
                break;

            default:
                break;
        }

        response.sendRedirect("/"+rol+"/asignaciones.jsp?id="+request.getParameter("cotizacionId"));
    }
}