package com.poo.catedra.controllers;

import com.poo.catedra.dao.CotizacionDAO;
import com.poo.catedra.enums.EstadoCotizacion;
import com.poo.catedra.model.Cotizacion;
import com.poo.catedra.validation.CotizacionValidator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "cotizacionController", value = "/admin/cotizacionController")
public class CotizacionController extends HttpServlet {
    private final CotizacionDAO cotizacionDAO = new CotizacionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        int id = Integer.parseInt(request.getParameter("id"));

        switch (accion) {
            case "toggleEstado":
                // Cambiar el estado de la cotización
                Cotizacion cotizacion = cotizacionDAO.obtenerPorId(id);
                if (cotizacion != null) {
                    EstadoCotizacion nuevoEstado = cotizacion.getEstado() == EstadoCotizacion.EnProceso
                            ? EstadoCotizacion.Finalizada
                            : EstadoCotizacion.EnProceso;
                    cotizacion.setEstado(nuevoEstado);
                    cotizacionDAO.actualizar(cotizacion);
                }
                break;

            case "eliminar":
                // Eliminar la cotización por ID
                cotizacionDAO.eliminar(id);
                break;

            default:
                break;
        }

        response.sendRedirect("cotizaciones.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "crear":
                // Crear una nueva cotización
                Cotizacion nueva = new Cotizacion();
                nueva.setClienteId(Integer.parseInt(request.getParameter("clienteId")));
                nueva.setEstado(EstadoCotizacion.EnProceso);
                nueva.setFechaInicioTentativa(LocalDateTime.parse(request.getParameter("fechaInicioTentativa")));
                nueva.setFechaFinTentativa(LocalDateTime.parse(request.getParameter("fechaFinTentativa")));
                nueva.setCostoAdicionales(Double.parseDouble(request.getParameter("costoAdicionales")));
                nueva.setCreadoPorId((Integer) request.getSession(false).getAttribute("id"));
                nueva.setFechaCreacion(LocalDateTime.now());

                List<String> erroresCrear = CotizacionValidator.validar(nueva);
                if (!erroresCrear.isEmpty()) {
                    request.setAttribute("error", erroresCrear.getFirst());
                    request.getRequestDispatcher("/admin/cotizaciones.jsp").forward(request, response);
                    return;
                }

                cotizacionDAO.insertar(nueva);
                break;

            case "editar":
                // Editar una cotización existente
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Cotizacion existente = cotizacionDAO.obtenerPorId(idEditar);

                if (existente != null) {
                    existente.setClienteId(Integer.parseInt(request.getParameter("clienteId")));
                    existente.setFechaInicioTentativa(LocalDateTime.parse(request.getParameter("fechaInicioTentativa")));
                    existente.setFechaFinTentativa(LocalDateTime.parse(request.getParameter("fechaFinTentativa")));
                    existente.setCostoAdicionales(Double.parseDouble(request.getParameter("costoAdicionales")));

                    List<String> erroresEditar = CotizacionValidator.validar(existente);
                    if (!erroresEditar.isEmpty()) {
                        request.setAttribute("error", erroresEditar.getFirst());
                        request.getRequestDispatcher("/admin/cotizaciones.jsp").forward(request, response);
                        return;
                    }

                    cotizacionDAO.actualizar(existente);
                }
                break;

            default:
                break;
        }

        response.sendRedirect("/admin/cotizaciones.jsp");
    }
}