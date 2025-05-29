<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.poo.catedra.dao.SubtareaDAO" %>
<%@ page import="com.poo.catedra.model.Subtarea" %>
<%@ page import="java.util.List" %>

<%
    String rol = (String) session.getAttribute("rol");

    // Obtener el ID de la asignación desde la URL
    int asignacionId = Integer.parseInt(request.getParameter("id"));

    // Obtener todas las subtareas relacionadas con la asignación desde el DAO
    SubtareaDAO subtareaDAO = new SubtareaDAO();
    List<Subtarea> subtareas = subtareaDAO.obtenerPorAsignacionId(asignacionId); // Método personalizado en el DAO
%>

<div class="container mx-auto p-4">
    <h1 class="font-bold text-2xl mb-6">Gestión de Subtareas</h1>
    <%@ include file="form.jsp" %>
    <div class="flex flex-col w-full gap-4 border-t border-zinc-700 mt-4 pt-4">
        <% if (subtareas != null && !subtareas.isEmpty()) { %>
        <% for (Subtarea s : subtareas) { %>
        <div class="bg-zinc-800 rounded-xl border border-zinc-700 p-5 shadow-sm hover:shadow-zinc-700/20 transition-all duration-200">
            <!-- Header with subtarea details -->
            <div class="flex justify-between items-start mb-4">
                <h2 class="text-xl font-semibold text-zinc-100"><%= s.getTituloSubtarea() %></h2>
                <span class="text-xs px-2 py-1 rounded-full bg-emerald-900/30 text-emerald-400">
                    Subtarea
                </span>
            </div>

            <!-- Main subtarea info -->
            <div class="space-y-3 text-sm">
                <div class="flex justify-between">
                    <span class="text-zinc-400">ID:</span>
                    <span class="text-zinc-200 font-medium"><%= s.getId() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="text-zinc-400">Descripción:</span>
                    <span class="text-zinc-200 font-medium"><%= s.getDescripcion() %></span>
                </div>
            </div>

            <!-- Action buttons -->
            <div class="mt-5 flex space-x-2">
                <!-- Edit button -->
                <a href="/<%=rol%>/subtareas.jsp?id=<%= asignacionId %>&accion=editar&id_subtarea=<%= s.getId() %>"
                   class="flex-1 py-1.5 px-3 bg-zinc-700 hover:bg-zinc-600 text-zinc-200 text-sm rounded-md text-center transition-colors">
                    Editar
                </a>

                <!-- Delete button -->
                <form action="/module/subtareaController" method="get" class="flex-1">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="id_subtarea" value="<%= s.getId() %>">
                    <input type="hidden" name="id" value="<%= asignacionId %>">
                    <button type="submit"
                            class="w-full py-1.5 px-3 bg-red-800 hover:bg-red-700 text-white text-sm rounded-md transition-colors"
                            onclick="return confirm('¿Eliminar esta subtarea permanentemente?')">
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
            <p class="mt-3 text-lg">No hay subtareas registradas para esta asignación</p>
        </div>
        <% } %>
    </div>
</div>