<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.CotizacionDAO" %>
<%@ page import="com.poo.catedra.model.Cotizacion" %>
<%@ page import="com.poo.catedra.enums.EstadoCotizacion" %>
<%@ page import="com.poo.catedra.model.Cliente" %>
<%@ page import="com.poo.catedra.dao.ClienteDAO" %>
<%
    // Detectar si se está editando (existe el parámetro "id")
    Integer idCotizacion = null;
    Cotizacion cotizacion = null;

    List<Cliente> clientes = (new ClienteDAO()).obtenerTodosActivos();

    if (request.getParameter("id") != null) {
        try {
            idCotizacion = Integer.parseInt(request.getParameter("id"));
            CotizacionDAO dao = new CotizacionDAO();
            cotizacion = dao.obtenerPorId(idCotizacion);
        } catch (NumberFormatException e) {
            // Manejar error si el ID no es válido
        }
    }

    // Determinar la acción del formulario
    String action = cotizacion != null ? "/module/cotizacionController?accion=editar&id=" + idCotizacion : "/module/cotizacionController?accion=crear";
%>

<form action="<%= action %>" method="POST" class="space-y-2" novalidate>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <!-- Cliente ID -->
        <div class="space-y-1">
            <label for="clienteId" class="block text-sm font-medium text-zinc-300">Cliente</label>
            <select id="clienteId"
                    class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                    name="clienteId">
                <option value="">Selecciona un Cliente</option>
                <% for (Cliente c : clientes) { %>
                <option <%= cotizacion != null && cotizacion.getClienteId()==c.getId() ? "selected" : "" %> value="<%= c.getId() %>"><%= c.getNombre() %></option>
                <% } %>
            </select>
        </div>

        <!--
        <div class="space-y-1">
            <label for="estado" class="block text-sm font-medium text-zinc-300">Estado</label>
            <select id="estado" name="estado"
                    class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                    required>
                <option value="EnProceso" <%= cotizacion != null && cotizacion.getEstado() == EstadoCotizacion.EnProceso ? "selected" : "" %>>En Proceso</option>
                <option value="Finalizada" <%= cotizacion != null && cotizacion.getEstado() == EstadoCotizacion.Finalizada ? "selected" : "" %>>Finalizada</option>
            </select>
        </div> Estado -->

        <!-- Fecha Inicio Tentativa -->
        <div class="space-y-1">
            <label for="fechaInicioTentativa" class="block text-sm font-medium text-zinc-300">Fecha Inicio Tentativa</label>
            <input type="datetime-local" id="fechaInicioTentativa" name="fechaInicioTentativa"
                   value="<%= cotizacion != null ? cotizacion.getFechaInicioTentativa().toString().replace('T', ' ') : "" %>"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Fecha Fin Tentativa -->
        <div class="space-y-1">
            <label for="fechaFinTentativa" class="block text-sm font-medium text-zinc-300">Fecha Fin Tentativa</label>
            <input type="datetime-local" id="fechaFinTentativa" name="fechaFinTentativa"
                   value="<%= cotizacion != null ? cotizacion.getFechaFinTentativa().toString().replace('T', ' ') : "" %>"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Costo Adicionales -->
        <div class="space-y-1">
            <label for="costoAdicionales" class="block text-sm font-medium text-zinc-300">Costo Adicionales</label>
            <input type="number" step="0.01" id="costoAdicionales" name="costoAdicionales"
                   value="<%= cotizacion != null ? cotizacion.getCostoAdicionales() : "" %>"
                   placeholder="Ej: 100.00"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>
    </div>
    <div class="pt-2">
        <button type="submit"
                class="px-5 py-2 bg-zinc-800 cursor-pointer hover:bg-zinc-700 text-zinc-200 hover:text-white border border-zinc-700 rounded-md transition-colors duration-150 focus:outline-none focus:ring-1 focus:ring-zinc-500">
            <%= cotizacion != null ? "Actualizar Cotización" : "Crear Cotización" %>
        </button>
    </div>
</form>