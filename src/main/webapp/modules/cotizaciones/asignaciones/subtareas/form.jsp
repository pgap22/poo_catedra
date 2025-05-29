<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.SubtareaDAO" %>
<%@ page import="com.poo.catedra.model.Subtarea" %>
<%
    // Detectar si se está editando (existe el parámetro "id_subtarea")
    Integer idSubtarea = null;
    Subtarea subtarea = null;

    if (request.getParameter("id_subtarea") != null) {
        try {
            idSubtarea = Integer.parseInt(request.getParameter("id_subtarea"));
            SubtareaDAO dao = new SubtareaDAO();
            subtarea = dao.obtenerPorId(idSubtarea);
        } catch (NumberFormatException e) {
            // Manejar error si el ID no es válido
        }
    }

    // Determinar la acción del formulario
    String action = subtarea != null ? "/module/subtareaController?accion=editar&id_subtarea=" + idSubtarea : "/module/subtareaController?accion=crear";
%>

<form action="<%= action %>" method="POST" class="space-y-2" novalidate>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>
    <div class="flex flex-col w-full gap-4">
        <!-- Asignación ID (oculto) -->
        <div class="space-y-1 hidden">
            <label for="asignacionId" class="block text-sm font-medium text-zinc-300">Asignación</label>
            <input type="number" id="asignacionId" name="asignacionId" value="<%= subtarea != null ? subtarea.getAsignacionId() : request.getParameter("id") %>"
                   placeholder="Ej: 1"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Título de la Subtarea -->
        <div class="space-y-1">
            <label for="tituloSubtarea" class="block text-sm font-medium text-zinc-300">Título de la Subtarea</label>
            <input type="text" id="tituloSubtarea" name="tituloSubtarea" value="<%= subtarea != null ? subtarea.getTituloSubtarea() : "" %>"
                   placeholder="Ej: Diseño de Logotipo"
                   class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                   required>
        </div>

        <!-- Descripción de la Subtarea -->
        <div class="space-y-1">
            <label for="descripcion" class="block text-sm font-medium text-zinc-300">Descripción</label>
            <textarea id="descripcion" name="descripcion"
                      placeholder="Ej: Crear un logotipo moderno y minimalista..."
                      class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
                      required><%= subtarea != null ? subtarea.getDescripcion() : "" %></textarea>
        </div>
    </div>
    <div class="pt-2">
        <button type="submit"
                class="px-5 py-2 bg-zinc-800 cursor-pointer hover:bg-zinc-700 text-zinc-200 hover:text-white border border-zinc-700 rounded-md transition-colors duration-150 focus:outline-none focus:ring-1 focus:ring-zinc-500">
            <%= subtarea != null ? "Actualizar Subtarea" : "Crear Subtarea" %>
        </button>
    </div>
</form>