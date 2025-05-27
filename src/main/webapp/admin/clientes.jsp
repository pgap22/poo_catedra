<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.ClienteDAO" %>
<%@ page import="com.poo.catedra.model.Cliente" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    // Obtener todos los clientes desde el DAO
    ClienteDAO clienteDAO = new ClienteDAO();
    List<Cliente> clientes = clienteDAO.obtenerTodos();
%>

<%@ include file="/partials/admin/header.jsp" %>

<div class="container mx-auto p-4">
    <h1 class="font-bold text-2xl mb-6">Gestión de Clientes</h1>
    <%@ include file="/admin/formCliente.jsp" %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 border-t border-zinc-700 mt-4 pt-4">
        <% if (clientes != null && !clientes.isEmpty()) { %>
        <% for (Cliente c : clientes) { %>
        <div class="bg-zinc-800 rounded-xl border border-zinc-700 p-5 shadow-sm hover:shadow-zinc-700/20 transition-all duration-200">
            <!-- Header with name and status -->
            <div class="flex justify-between items-start mb-4">
                <h2 class="text-xl font-semibold text-zinc-100"><%= c.getNombre() %></h2>
                <span class="text-xs px-2 py-1 rounded-full <%= c.getEstado() ? "bg-emerald-900/30 text-emerald-400" : "bg-red-900/30 text-red-400" %>">
                <%= c.getEstado() ? "Activo" : "Inactivo" %>
            </span>
            </div>

            <!-- Main client info -->
            <div class="space-y-3 text-sm">
                <div class="flex justify-between">
                    <span class="text-zinc-400">Documento:</span>
                    <span class="text-zinc-200 font-medium"><%= c.getDocumentoIdentificacion() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Tipo:</span>
                    <span class="text-zinc-200 font-medium"><%= c.getTipoPersona() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Teléfono:</span>
                    <span class="text-zinc-200 font-medium"><%= c.getTelefono() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Correo:</span>
                    <a href="mailto:<%= c.getCorreo() %>" class="text-zinc-200 font-medium hover:text-red-400 transition-colors"><%= c.getCorreo() %></a>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Dirección:</span>
                    <span class="text-zinc-200 font-medium"><%= c.getDireccion() %></span>
                </div>
            </div>

            <!-- Dates section -->
            <div class="mt-4 pt-3 border-t border-zinc-700 space-y-2 text-xs text-zinc-400">
                <div class="flex justify-between">
                    <span>Creado:</span>
                    <span class="text-zinc-300"><%= c.getFechaCreacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %></span>
                </div>
                <div class="flex justify-between">
                    <span>Actualizado:</span>
                    <span class="text-zinc-300"><%= c.getFechaActualizacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %></span>
                </div>
                <% if (c.getFechaInactivacion() != null) { %>
                <div class="flex justify-between text-red-400">
                    <span>Inactivado:</span>
                    <span><%= c.getFechaInactivacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %></span>
                </div>
                <% } %>
            </div>

            <!-- Action buttons -->
            <div class="mt-5 flex space-x-2">
                <!-- Edit button -->
                <a href="/admin/clientes.jsp?id=<%= c.getId() %>"
                   class="flex-1 py-1.5 px-3 bg-zinc-700 hover:bg-zinc-600 text-zinc-200 text-sm rounded-md text-center transition-colors">
                    Editar
                </a>

                <!-- Toggle status button -->
                <form action="/admin/clienteController" method="get" class="flex-1">
                    <input type="hidden" name="accion" value="toggleEstado">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit"
                            class="w-full py-1.5 px-3 <%= c.getEstado() ? "bg-amber-700 hover:bg-amber-600" : "bg-emerald-700 hover:bg-emerald-600" %> text-white text-sm rounded-md transition-colors"
                            onclick="return confirm('¿Confirmar cambio de estado?')">
                        <%= c.getEstado() ? "Inactivar" : "Activar" %>
                    </button>
                </form>

                <!-- Delete button -->
                <form action="/admin/clienteController" method="get" class="flex-1">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit"
                            class="w-full py-1.5 px-3 bg-red-800 hover:bg-red-700 text-white text-sm rounded-md transition-colors"
                            onclick="return confirm('¿Eliminar este cliente permanentemente?')">
                        Eliminar
                    </button>
                </form>
            </div>
        </div>
        <% } %>
        <% } else { %>
        <div class="col-span-full py-10 text-center text-zinc-400">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-zinc-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <p class="mt-3 text-lg">No hay clientes registrados</p>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="/partials/admin/footer.jsp" %>