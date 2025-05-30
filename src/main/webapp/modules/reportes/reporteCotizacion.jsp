<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%
    String error = (String) request.getAttribute("error");
%>

<div class="max-w-2xl mx-auto p-6 bg-zinc-900 rounded shadow-md text-white">
    <h2 class="text-xl font-semibold mb-4">Generar reporte de cotizaciones</h2>

    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
        <span><%= error %></span>
    </div>
    <% } %>

    <form action="/reporte/cotizacionReportes" method="get" class="space-y-4" novalidate>
        <div>
            <label for="fechaInicio" class="block mb-1">Fecha Inicio:</label>
            <input type="date" id="fechaInicio" name="fechaInicio" required
                   class="bg-zinc-800 border border-zinc-700 text-white rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-red-500/50" />
        </div>

        <div>
            <label for="fechaFin" class="block mb-1">Fecha Fin:</label>
            <input type="date" id="fechaFin" name="fechaFin" required
                   class="bg-zinc-800 border border-zinc-700 text-white rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-red-500/50" />
        </div>

        <button type="submit"
                class="font-semibold bg-zinc-800  cursor-pointer py-2 px-6 rounded hover:bg-zinc-700/80 focus:outline-none focus:ring-2 focus:ring-red-500/50 border border-zinc-700 transition-colors"
        >
            Generar PDF
        </button>
    </form>
</div>
