<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Multi-Works Group</title>
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
        <!-- Ícono industrial (engranaje) -->
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-mw-red" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 3v1.5m4.5 0V3m-7.5 7.5H3m1.5 4.5H3m16.5 0h-1.5m1.5-4.5h-1.5M4.5 7.5l1.06 1.06m10.88 10.88l1.06 1.06M7.5 4.5L6.44 5.56m10.88 10.88l-1.06 1.06M9 15a3 3 0 106 0 3 3 0 00-6 0z" />
        </svg>
        <h1 class="text-3xl font-extrabold text-white hover:text-mw-red transition-all duration-300 select-none">Multi-Works Group</h1>
    </div>
    <p class="mb-8 text-mw-text-label text-lg leading-relaxed">
        Bienvenido al sistema de gestión de personal y proyectos industriales.<br>
        Este sistema está diseñado para optimizar procesos y mejorar el control de actividades
        en áreas como ingeniería, electricidad, electrónica y mecánica.
    </p>

    <a href="login/login.jsp"
       class="inline-block px-8 py-4 bg-mw-red text-white font-semibold rounded-xl shadow-md hover:bg-red-700 hover:shadow-lg transition-all duration-100 transform hover:scale-105 focus:outline-none focus:ring-4 focus:ring-red-500">
        Iniciar sesión
    </a>
</div>

</body>
</html>