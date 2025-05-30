<%@ page import="com.poo.catedra.dao.AsignacionDAO" %>
<%@ page import="com.poo.catedra.model.Asignacion" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Obtener todas las asignaciones para el select
    AsignacionDAO dao = new AsignacionDAO();
    List<Asignacion> asignaciones = dao.obtenerTodos();

    // Manejar errores
    String error = (String) request.getAttribute("error");
%>

<form action="<%= request.getContextPath() %>/reporte/subtareasReporte" method="post" class="rounded p-6 bg-zinc-900 text-zinc-100 space-y-4" novalidate>

    <!-- Título -->
    <h1 class="text-2xl font-bold text-center">Reporte de Subtareas</h1>

    <!-- Mostrar mensaje de error si existe -->
    <% if (error != null) { %>
    <div class="mb-4 bg-red-900/30 border border-red-700 text-red-300 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>

    <!-- Campo para seleccionar la asignación -->
    <div>
        <label for="asignacionId" class="block mb-1 font-semibold">Selecciona una Asignación:</label>
        <select name="asignacionId" id="asignacionId" required
                class="bg-zinc-800 text-zinc-100 border border-zinc-700 rounded w-full py-2 px-3 leading-tight focus:outline-none focus:ring-2 focus:ring-red-500/50 focus:border-red-500 transition-colors">
            <option value="">Seleccione una asignación</option>
            <% for (Asignacion asignacion : asignaciones) { %>
            <option value="<%= asignacion.getId() %>">
                ID <%= asignacion.getId() %> - <%= asignacion.getTituloActividad() %> (<%= asignacion.getFechaHoraInicio() %>)
            </option>
            <% } %>
        </select>
    </div>

    <!-- Botón de envío -->
    <div class="text-center">
        <button type="submit"
                class="font-semibold bg-zinc-800  cursor-pointer py-2 px-6 rounded hover:bg-zinc-700/80 focus:outline-none focus:ring-2 focus:ring-red-500/50 border border-zinc-700 transition-colors"
        >
            Generar PDF
        </button>
    </div>

</form>