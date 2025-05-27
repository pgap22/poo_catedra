<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.EmpleadoDAO" %>
<%@ page import="com.poo.catedra.model.Empleado" %>
<%@ page import="com.poo.catedra.enums.TipoContratacion" %>
<%@ page import="com.poo.catedra.enums.TipoPersona" %>

<%
  // Detectar si se está editando (existe el parámetro "id")
  Integer idEmpleado = null;
  Empleado empleado = null;

  if (request.getParameter("id") != null) {
    try {
      idEmpleado = Integer.parseInt(request.getParameter("id"));
      EmpleadoDAO dao = new EmpleadoDAO();
      empleado = dao.obtenerPorId(idEmpleado);
    } catch (NumberFormatException e) {
      // Manejar error si el ID no es válido
    }
  }

  // Determinar la acción del formulario
  String action = empleado != null ? "empleadoController?accion=editar&id=" + idEmpleado : "empleadoController?accion=crear";
%>

<form action="<%= action %>" method="POST" class="space-y-2" novalidate>
  <% String error = (String) request.getAttribute("error"); %>
  <% if (error != null) { %>
  <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
    <span class="block sm:inline"><%= error %></span>
  </div>
  <% } %>
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
    <!-- Nombre -->
    <div class="space-y-1">
      <label for="nombre" class="block text-sm font-medium text-zinc-300">Nombre</label>
      <input type="text" id="nombre" name="nombre" value="<%= empleado != null ? empleado.getNombre() : "" %>"
             placeholder="Ej: Juan Pérez"
             class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
             required>
    </div>

    <!-- Documento de Identificación -->
    <div class="space-y-1">
      <label for="documentoIdentificacion" class="block text-sm font-medium text-zinc-300">Documento</label>
      <input type="text" id="documentoIdentificacion" name="documentoIdentificacion"
             value="<%= empleado != null ? empleado.getDocumentoIdentificacion() : "" %>"
             placeholder="Ej: 12345678A"
             class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
             required>
    </div>

    <!-- Tipo de Persona -->
    <div class="space-y-1">
      <label for="tipoPersona" class="block text-sm font-medium text-zinc-300">Tipo de Persona</label>
      <select id="tipoPersona" name="tipoPersona"
              class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
              required>
        <option value="Natural" <%= empleado != null && empleado.getTipoPersona().toString().equals("Natural") ? "selected" : "" %>>Natural</option>
        <option value="Juridica" <%= empleado != null && empleado.getTipoPersona().toString().equals("Juridica") ? "selected" : "" %>>Jurídica</option>
      </select>
    </div>

    <!-- Tipo de Contratación -->
    <div class="space-y-1">
      <label for="tipoContratacion" class="block text-sm font-medium text-zinc-300">Tipo de Contratación</label>
      <select id="tipoContratacion" name="tipoContratacion"
              class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
              required>
        <option value="Permanente" <%= empleado != null && empleado.getTipoContratacion().toString().equals("Permanente") ? "selected" : "" %>>Permanente</option>
        <option value="PorHoras" <%= empleado != null && empleado.getTipoContratacion().toString().equals("PorHoras") ? "selected" : "" %>>Por Horas</option>
      </select>
    </div>

    <!-- Teléfono -->
    <div class="space-y-1">
      <label for="telefono" class="block text-sm font-medium text-zinc-300">Teléfono</label>
      <input type="text" id="telefono" name="telefono" value="<%= empleado != null ? empleado.getTelefono() : "" %>"
             placeholder="Ej: +34 600 123 456"
             class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
             required>
    </div>

    <!-- Correo -->
    <div class="space-y-1">
      <label for="correo" class="block text-sm font-medium text-zinc-300">Correo</label>
      <input type="email" id="correo" name="correo" value="<%= empleado != null ? empleado.getCorreo() : "" %>"
             placeholder="Ej: empleado@empresa.com"
             class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
             required>
    </div>

    <!-- Dirección -->
    <div class="space-y-1">
      <label for="direccion" class="block text-sm font-medium text-zinc-300">Dirección</label>
      <input type="text" id="direccion" name="direccion" value="<%= empleado != null ? empleado.getDireccion() : "" %>"
             placeholder="Ej: Calle Principal 123"
             class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 placeholder-zinc-500 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
             required>
    </div>

    <!-- Estado -->
    <div class="space-y-1">
      <label for="estado" class="block text-sm font-medium text-zinc-300">Estado</label>
      <select id="estado" name="estado"
              class="w-full px-3 py-2 bg-zinc-800/70 border border-zinc-700 rounded-md shadow-sm text-zinc-200 focus:outline-none focus:ring-2 focus:ring-red-500/80 focus:border-transparent transition-all duration-150"
              required>
        <option value="true" <%= empleado != null && empleado.getEstado() ? "selected" : "" %>>Activo</option>
        <option value="false" <%= empleado != null && !empleado.getEstado() ? "selected" : "" %>>Inactivo</option>
      </select>
    </div>
  </div>
  <div class="pt-2">
    <button type="submit"
            class="px-5 py-2 bg-zinc-800 cursor-pointer hover:bg-zinc-700 text-zinc-200 hover:text-white border border-zinc-700 rounded-md transition-colors duration-150 focus:outline-none focus:ring-1 focus:ring-zinc-500">
      <%= empleado != null ? "Actualizar Empleado" : "Crear Empleado" %>
    </button>
  </div>
</form>