<%@ page import="com.poo.catedra.dao.UsuarioDAO" %>
<%@ page import="com.poo.catedra.model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    int idSesion = (Integer) session.getAttribute("id");
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> usuarios = dao.obtenerTodos();
%>

<%@ include file="/partials/admin/header.jsp" %>

<h1 class="font-bold text-2xl">Gestión de Usuarios</h1>
<%@ include file="/admin/formUsuario.jsp" %>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 border-t border-zinc-700 mt-4 pt-4">
    <%
        for (Usuario u : usuarios) {
            if (u.getId() != idSesion) {
    %>
    <div class="bg-zinc-800 rounded-xl shadow-lg p-4 border border-zinc-700 hover:border-red-400/30 transition-colors duration-200 group">
        <div class="flex justify-between items-start mb-2">
            <h3 class="text-lg font-semibold text-red-400 group-hover:text-red-300 transition-colors"><%= u.getEmail() %></h3>
            <span class="text-xs px-2 py-1 rounded-full <%= u.getEstado() ? "bg-emerald-900/50 text-emerald-400" : "bg-red-900/50 text-red-400" %>">
                <%= u.getEstado() ? "Activo" : "Inactivo" %>
            </span>
        </div>

        <div class="text-sm text-zinc-300 mb-3">
            <p class="font-medium">Rol: <span class="text-zinc-100"><%= u.getRol() %></span></p>
        </div>

        <div class="space-y-1 text-xs text-zinc-400 border-t border-zinc-700 pt-2 mb-3">
            <div class="flex justify-between items-center">
                <span class="text-zinc-400">Creado:</span>
                <span class="text-zinc-300 font-mono text-[0.7rem]">
                    <%= u.getFecha_creacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %>
                </span>
            </div>
            <div class="flex justify-between items-center">
                <span class="text-zinc-400">Actualizado:</span>
                <span class="text-zinc-300 font-mono text-[0.7rem]">
                    <%= u.getFecha_actualizacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %>
                </span>
            </div>
            <% if (u.getFecha_inactivacion() != null) { %>
            <div class="flex justify-between items-center text-red-400/80">
                <span>Inactivado:</span>
                <span class="font-mono text-[0.7rem]">
                    <%= u.getFecha_inactivacion().format(DateTimeFormatter.ofPattern("dd MMM yyyy, HH:mm")) %>
                </span>
            </div>
            <% } %>
        </div>

        <!-- Botones de acción -->
        <div class="flex gap-2 border-t border-zinc-700 pt-3">
            <!-- Botón Editar -->
            <a href="/admin/index.jsp?id=<%= u.getId() %>"
               class="flex-1 bg-zinc-700 hover:bg-zinc-600 text-white py-1 px-3 rounded text-sm text-center transition-colors">
                Editar
            </a>

            <!-- Botón Inactivar/Activar -->
            <form action="/usuarioController" method="post" class="flex-1">
                <input type="hidden" name="accion" value="toggleEstado">
                <input type="hidden" name="id" value="<%= u.getId() %>">
                <button type="submit" class="w-full <%= u.getEstado() ? "bg-amber-600 hover:bg-amber-700" : "bg-emerald-600 hover:bg-emerald-700" %> text-white py-1 px-3 rounded text-sm transition-colors">
                    <%= u.getEstado() ? "Inactivar" : "Activar" %>
                </button>
            </form>

            <!-- Botón Eliminar -->
            <form action="/usuarioController" method="post" class="flex-1">
                <input type="hidden" name="accion" value="eliminar">
                <input type="hidden" name="id" value="<%= u.getId() %>">
                <button type="submit" class="w-full bg-red-600 hover:bg-red-700 text-white py-1 px-3 rounded text-sm transition-colors"
                        onclick="return confirm('¿Estás seguro de eliminar este usuario?')">
                    Eliminar
                </button>
            </form>
        </div>
    </div>
    <%
            }
        }
    %>
</div>

<%@ include file="/partials/admin/footer.jsp" %>
