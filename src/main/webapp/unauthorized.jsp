<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Acceso No Autorizado - Multi-Works Group</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        'dm-sans': ['DM Sans', 'sans-serif'],
                    },
                    colors: {
                        'mw-red': '#dc2626',
                        'mw-bg': '#000000',
                        'mw-container': '#171717',
                        'mw-input': '#262626',
                        'mw-input-border': '#3f3f3f',
                        'mw-text-light': '#f5f5f5',
                        'mw-text-label': '#d4d4d4',
                        'mw-placeholder': '#737373',
                        'mw-button': '#404040',
                        'mw-button-hover': '#525252',
                    },
                },
            },
        }
    </script>
</head>
<body class="bg-gradient-to-br from-black via-mw-bg to-gray-900 text-mw-text-light font-dm-sans min-h-screen flex items-center justify-center px-4">

<div class="bg-mw-container p-12 rounded-3xl shadow-xl max-w-xl w-full text-center">
    <div class="flex items-center justify-center mb-6 space-x-3">
        <!-- Ícono de advertencia -->
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-mw-red" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M12 9v2m0 4h.01M21 12c0 4.97-4.03 9-9 9s-9-4.03-9-9 4.03-9 9-9 9 4.03 9 9z" />
        </svg>
        <h1 class="text-3xl font-extrabold text-white select-none">Acceso No Autorizado</h1>
    </div>
    <p class="mb-8 text-mw-text-label text-lg leading-relaxed">
        No tienes permiso para acceder a esta página.<br>
        Por favor, inicia sesión con una cuenta que tenga los permisos necesarios.
    </p>

    <a href="/<%=rol%>/index.jsp"
       class="inline-block px-8 py-4 bg-mw-red text-white font-semibold rounded-xl shadow-md hover:bg-red-700 hover:shadow-lg transition-all duration-100 transform hover:scale-105 focus:outline-none focus:ring-4 focus:ring-red-500">
        Ir a Inicio
    </a>
</div>

</body>
</html>
