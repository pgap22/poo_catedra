package com.poo.catedra.controllers;

import com.poo.catedra.dao.ClienteDAO;
import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Cliente;
import com.poo.catedra.validation.ClienteValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "clienteController", value = "/admin/clienteController")
public class ClienteController extends HttpServlet {
    private final ClienteDAO clienteDAO = new ClienteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");
        int id = Integer.parseInt(request.getParameter("id"));

        switch (accion) {
            case "toggleEstado":
                // Obtener el cliente y cambiar su estado (activo/inactivo)
                Cliente cliente = clienteDAO.obtenerPorId(id);
                if (cliente != null) {
                    boolean nuevoEstado = !cliente.getEstado(); // Invierte el estado actual
                    cliente.setEstado(nuevoEstado);

                    // Actualizar fechas según el nuevo estado
                    if (nuevoEstado) {
                        cliente.setFechaInactivacion(null); // Si se reactiva, limpia fecha de inactivación
                    } else {
                        cliente.setFechaInactivacion(LocalDateTime.now()); // Si se inactiva, registra fecha
                    }

                    cliente.setFechaActualizacion(LocalDateTime.now()); // Siempre actualiza esta fecha
                    clienteDAO.actualizar(cliente);
                }
                break;

            case "eliminar":
                // Eliminar el cliente por ID
                clienteDAO.eliminar(id);
                break;

            default:
                break;
        }

        response.sendRedirect("clientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "crear":
                Cliente nuevo = new Cliente();
                nuevo.setNombre(request.getParameter("nombre"));
                nuevo.setDocumentoIdentificacion(request.getParameter("documentoIdentificacion"));
                nuevo.setTipoPersona(TipoPersona.valueOf(request.getParameter("tipoPersona") != null ? request.getParameter("tipoPersona") : "Natural" ));
                nuevo.setTelefono(request.getParameter("telefono"));
                nuevo.setCorreo(request.getParameter("correo"));
                nuevo.setDireccion(request.getParameter("direccion"));
                nuevo.setEstado(Boolean.parseBoolean(request.getParameter("estado")));
                nuevo.setCreadoPorId((Integer) request.getSession(false).getAttribute("id"));

                List<String> erroresCrear = ClienteValidator.validar(nuevo);
                Logger log = Logger.getLogger("ClienteController");
                log.info(nuevo.toString());
                if (!erroresCrear.isEmpty()) {
                    // Guardar errores en request y redirigir al formulario
                    request.setAttribute("error", erroresCrear.getFirst());
                    request.getRequestDispatcher("/admin/clientes.jsp").forward(request, response);
                    return;
                }

                Cliente clienteMismoDocumento = clienteDAO.obtenerPorDocumentoIdentificacion(nuevo.getDocumentoIdentificacion());
                if (clienteMismoDocumento != null) {
                    request.setAttribute("error", "Cliente con mismo documento de identificacion");
                    request.getRequestDispatcher("/admin/clientes.jsp").forward(request, response);
                    return;
                }

                clienteDAO.insertar(nuevo);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Cliente existente = clienteDAO.obtenerPorId(idEditar);

                if (existente != null) {
                    existente.setNombre(request.getParameter("nombre"));
                    existente.setDocumentoIdentificacion(request.getParameter("documentoIdentificacion"));
                    existente.setTipoPersona(TipoPersona.valueOf(request.getParameter("tipoPersona") != null ? request.getParameter("tipoPersona") : "Natural" ));
                    existente.setTelefono(request.getParameter("telefono"));
                    existente.setCorreo(request.getParameter("correo"));
                    existente.setDireccion(request.getParameter("direccion"));
                    existente.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

                    List<String> erroresEditar = ClienteValidator.validar(existente);
                    if (!erroresEditar.isEmpty()) {
                        // Guardar errores en request y redirigir al formulario
                        request.setAttribute("error", erroresEditar.getFirst());
                        request.getRequestDispatcher("/admin/clientes.jsp").forward(request, response);
                        return;
                    }

                    Cliente clienteMismoDocumentoEditar = clienteDAO.obtenerPorDocumentoIdentificacion(existente.getDocumentoIdentificacion());
                    if (clienteMismoDocumentoEditar != null && clienteMismoDocumentoEditar.getId() != existente.getId()) {
                        request.setAttribute("error", "Cliente con mismo documento de identificacion");
                        request.getRequestDispatcher("/admin/clientes.jsp").forward(request, response);
                        return;
                    }

                    clienteDAO.actualizar(existente);
                }
                break;

            default:
                break;
        }

        response.sendRedirect("clientes.jsp");
    }
}