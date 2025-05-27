<%@ page import="com.poo.catedra.dao.UsuarioDAO" %>
<%@ page import="com.poo.catedra.model.Usuario" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Obtener el parámetro id
    String idParam = request.getParameter("id");
    Usuario usuario = null;
    boolean esEdicion = false;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            usuario = new UsuarioDAO().obtenerPorId(id);
            if (usuario != null) {
                esEdicion = true;
            } else {
                // No existe el usuario, redirigir a lista o mostrar error
                response.sendRedirect(request.getContextPath());
                return;
            }
        } catch (NumberFormatException e) {
            // id no válido, redirigir a lista
            response.sendRedirect(request.getContextPath());
            return;
        }
    }
%>

<form action="<%= esEdicion ? "/usuarioController?accion=editar" : "/usuarioController?accion=crear" %>" method="post" class="rounded" novalidate>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>


    <% if (esEdicion) { %>
    <input type="hidden" name="id" value="<%= usuario.getId() %>">
    <% } %>

    <div class="grid grid-cols-3 gap-4">
        <div>
            <label for="email" class="block mb-1 font-semibold text-zinc-200">Email:</label>
            <input
                    type="email" id="email" name="email" required
                    value="<%= esEdicion ? usuario.getEmail() : "" %>"
                    placeholder="Ingresa tu correo electrónico"
                    class="bg-zinc-900 text-zinc-100 border border-zinc-700 rounded w-full py-2 px-3 leading-tight focus:outline-none focus:ring-2 focus:ring-red-500/50 focus:border-red-500 transition-colors"
            />
        </div>

        <div>
            <label for="password" class="block mb-1 font-semibold text-zinc-200">Contraseña:</label>
            <input
                    type="password" id="password" name="password" required
                    placeholder="Ingresa tu contraseña"
                    class="bg-zinc-900 text-zinc-100 border border-zinc-700 rounded w-full py-2 px-3 leading-tight focus:outline-none focus:ring-2 focus:ring-red-500/50 focus:border-red-500 transition-colors"
            />
        </div>

        <div>
            <label for="rol" class="block mb-1 font-semibold text-zinc-200">Rol:</label>
            <select
                    id="rol" name="rol" required
                    class="bg-zinc-900 text-zinc-100 border border-zinc-700 rounded w-full py-2 px-3 leading-tight focus:outline-none focus:ring-2 focus:ring-red-500/50 focus:border-red-500 transition-colors"
            >
                <option value="admin" <%= esEdicion && "admin".equals(usuario.getRol()) ? "selected" : "" %>>Admin</option>
                <option value="gerente" <%= esEdicion && "gerente".equals(usuario.getRol()) ? "selected" : "" %>>Gerente</option>
            </select>
        </div>

        <div>
            <button type="submit" class="font-semibold bg-zinc-800  cursor-pointer py-2 px-6 rounded hover:bg-zinc-700/80 focus:outline-none focus:ring-2 focus:ring-red-500/50 border border-zinc-700 transition-colors">
                <%= esEdicion ? "Actualizar Usuario" : "Crear Usuario" %>
            </button>
        </div>
    </div>

</form>