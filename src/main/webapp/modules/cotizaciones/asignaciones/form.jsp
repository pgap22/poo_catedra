<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.AsignacionDAO" %>
<%@ page import="com.poo.catedra.model.Asignacion" %>
<%@ page import="com.poo.catedra.model.Empleado" %>
<%@ page import="com.poo.catedra.dao.EmpleadoDAO" %>
<%
    // Detectar si se está editando (existe el parámetro "id_asignacion")
    Integer idAsignacion = null;
    Asignacion asignacion = null;

    List<Empleado> empleados = (new EmpleadoDAO()).obtenerEmpleadosActivos();

    if (request.getParameter("id_asignacion") != null) {
        try {
            idAsignacion = Integer.parseInt(request.getParameter("id_asignacion"));
            AsignacionDAO dao = new AsignacionDAO();
            asignacion = dao.obtenerPorId(idAsignacion);
        } catch (NumberFormatException e) {
            // Manejar error si el ID no es válido
        }
    }

    // Determinar la acción del formulario
    String action = asignacion != null ? "/module/asignacionController?accion=editar&id_asignacion=" + idAsignacion : "/module/asignacionController?accion=crear";
%>

<form action="<%= action %>" method="POST" class="space-y-2" novalidate>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <!-- Cotización ID -->
        <div class="space-y-1 hidden">
            <label for="cotizacionId" class="block text-sm font-medium text-zinc-300">Cotización</label>
            <input type="number" id="cotizacionId" name="cotizacionId" value="<%= asignacion != null ? asignacion.getCotizacionId() : request.getParameter("id") %>"
                   placeholder="Ej: 1"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Empleado ID -->
        <div class="space-y-1">
            <label for="empleadoId" class="block text-sm font-medium text-zinc-300">Empleado</label>
            <select id="empleadoId"
                    class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                    name="empleadoId">
                <option value="">Selecciona un empleado</option>
                <% for (Empleado e : empleados) { %>
                <option <%= asignacion != null && asignacion.getEmpleadoId()==e.getId() ? "selected" : "" %> value="<%= e.getId() %>"><%= e.getNombre() %></option>
                <% } %>
            </select>
        </div>

        <!-- Área Asignada -->
        <div class="space-y-1">
            <label for="areaAsignada" class="block text-sm font-medium text-zinc-300">Área Asignada</label>
            <input type="text" id="areaAsignada" name="areaAsignada" value="<%= asignacion != null ? asignacion.getAreaAsignada() : "" %>"
                   placeholder="Ej: Diseño Gráfico"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Título Actividad -->
        <div class="space-y-1">
            <label for="tituloActividad" class="block text-sm font-medium text-zinc-300">Título Actividad</label>
            <input type="text" id="tituloActividad" name="tituloActividad" value="<%= asignacion != null ? asignacion.getTituloActividad() : "" %>"
                   placeholder="Ej: Crear Prototipo"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Fecha y Hora de Inicio -->
        <div class="space-y-1">
            <label for="fechaHoraInicio" class="block text-sm font-medium text-zinc-300">Fecha y Hora de Inicio</label>
            <input type="datetime-local" id="fechaHoraInicio" name="fechaHoraInicio"
                   value="<%= asignacion != null ? asignacion.getFechaHoraInicio().toString().replace('T', ' ') : "" %>"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Fecha y Hora de Fin -->
        <div class="space-y-1">
            <label for="fechaHoraFin" class="block text-sm font-medium text-zinc-300">Fecha y Hora de Fin</label>
            <input type="datetime-local" id="fechaHoraFin" name="fechaHoraFin"
                   value="<%= asignacion != null ? asignacion.getFechaHoraFin().toString().replace('T', ' ') : "" %>"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Costo por Hora -->
        <div class="space-y-1">
            <label for="costoPorHora" class="block text-sm font-medium text-zinc-300">Costo por Hora</label>
            <input type="number" step="0.01" id="costoPorHora" name="costoPorHora"
                   value="<%= asignacion != null ? asignacion.getCostoPorHora() : "" %>"
                   placeholder="Ej: 50.00"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Incremento Extra (%) -->
        <div class="space-y-1">
            <label for="incrementoExtraPorcentaje" class="block text-sm font-medium text-zinc-300">Incremento Extra (%)</label>
            <input type="number" step="0.01" id="incrementoExtraPorcentaje" name="incrementoExtraPorcentaje"
                   value="<%= asignacion != null ? asignacion.getIncrementoExtraPorcentaje() : "" %>"
                   placeholder="Ej: 10.00"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>
        <!-- Cantidad de horas aproximando -->
        <div class="space-y-1">
            <label for="cantidadHorasAproximadas" class="block text-sm font-medium text-zinc-300">Cantida de Horas Aproximadas</label>
            <input type="number" step="0.01" id="cantidadHorasAproximadas" name="cantidadHorasAproximadas"
                   value="<%= asignacion != null ? asignacion.getCantidadHorasAproximadas() : "" %>"
                   placeholder="Ej: 10.00"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>
    </div>
    <div class="pt-2">
        <button type="submit"
                class="px-5 py-2 bg-zinc-800 cursor-pointer hover:bg-zinc-700 text-zinc-200 hover:text-white border border-zinc-700 rounded-md transition-colors duration-150 focus:outline-none focus:ring-1 focus:ring-zinc-500">
            <%= asignacion != null ? "Actualizar Asignación" : "Crear Asignación" %>
        </button>
    </div>
</form>