<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.AsignacionDAO" %>
<%@ page import="com.poo.catedra.model.Asignacion" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    String rol = (String) session.getAttribute("rol");

    // Obtener el ID de la cotización desde la URL
    int cotizacionId = Integer.parseInt(request.getParameter("id"));

    // Obtener todas las asignaciones relacionadas con la cotización desde el DAO
    AsignacionDAO asignacionDAO = new AsignacionDAO();
    List<Asignacion> asignaciones = asignacionDAO.obtenerPorCotizacionId(cotizacionId); // Método personalizado en el DAO
%>

<div class="container mx-auto p-4">
    <h1 class="font-bold text-2xl mb-6">Gestión de Asignaciones</h1>
    <%@ include file="form.jsp" %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 border-t border-zinc-700 mt-4 pt-4">
        <% if (asignaciones != null && !asignaciones.isEmpty()) { %>
        <% for (Asignacion a : asignaciones) { %>
        <div class="bg-zinc-800 rounded-xl border border-zinc-700 p-5 shadow-sm hover:shadow-zinc-700/20 transition-all duration-200">
            <!-- Header with assignment details -->
            <div class="flex justify-between items-start mb-4">
                <h2 class="text-xl font-semibold text-zinc-100"><%=a.getTituloActividad()%></h2>
                <span class="text-xs px-2 py-1 rounded-full bg-emerald-900/30 text-emerald-400">
                    <%= a.getAreaAsignada() %>
                </span>
            </div>

            <!-- Main assignment info -->
            <div class="space-y-3 text-sm">
                <div class="flex justify-between">
                    <span class="text-zinc-400">Empleado ID:</span>
                    <span class="text-zinc-200 font-medium"><%= a.getEmpleadoId() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Inicio:</span>
                    <span class="text-zinc-200 font-medium"><%= a.getFechaHoraInicio().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Fin:</span>
                    <span class="text-zinc-200 font-medium"><%= a.getFechaHoraFin().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Costo por Hora:</span>
                    <span class="text-zinc-200 font-medium">$<%= String.format("%.2f", a.getCostoPorHora()) %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Incremento Extra (%):</span>
                    <span class="text-zinc-200 font-medium"><%= String.format("%.2f", a.getIncrementoExtraPorcentaje()) %>%</span>
                </div>

                <div class="flex justify-between">
                    <span class="text-zinc-400">Cantidad de Horas Aproximadas:</span>
                    <span class="text-zinc-200 font-medium"><%= String.format("%.2f", a.getCantidadHorasAproximadas()) %>H</span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Costo Base:</span>
                    <span class="text-zinc-200 font-medium">$<%= String.format("%.2f", a.getCostoBase()) %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Costo Total:</span>
                    <span class="text-zinc-200 font-medium">$<%= String.format("%.2f", a.getTotal()) %></span>
                </div>
            </div>

            <!-- Action buttons -->
            <div class="mt-5 flex space-x-2">
                <!-- Edit button -->
                <a href="/<%=rol%>/asignaciones.jsp?id=<%= cotizacionId %>&accion=editar&id_asignacion=<%= a.getId() %>"
                   class="flex-1 py-1.5 px-3 bg-zinc-700 hover:bg-zinc-600 text-zinc-200 text-sm rounded-md text-center transition-colors">
                    Editar
                </a>

                <!-- Delete button -->
                <form action="/module/asignacionController" method="get" class="flex-1">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id" value="<%= a.getId() %>">
                    <button type="submit"
                            class="w-full py-1.5 px-3 bg-red-800 hover:bg-red-700 text-white text-sm rounded-md transition-colors"
                            onclick="return confirm('¿Eliminar esta asignación permanentemente?')">
                        Eliminar
                    </button>
                </form>
            </div>
            <div class="mt-2 w-full">
                <a href="/<%=rol%>/subtareas.jsp?id=<%= a.getId() %>">
                    <div class="w-full py-2 px-4 bg-blue-900 hover:bg-blue-800 text-white text-sm rounded-md text-center transition-colors">
                        Gestionar Subtareas
                    </div>
                </a>
            </div>
        </div>
        <% } %>
        <% } else { %>
        <div class="col-span-full py-10 text-center text-zinc-400">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mx-auto text-zinc-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <p class="mt-3 text-lg">No hay asignaciones registradas para esta cotización</p>
        </div>
        <% } %>
    </div>
</div>