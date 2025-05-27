<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&display=swap" rel="stylesheet">
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
                        'mw-bg': '#000000', // Fondo negro
                        'mw-container': '#171717', // Fondo gris oscuro del formulario
                        'mw-input': '#262626', // Fondo de los inputs (gris más claro)
                        'mw-input-border': '#3f3f3f', // Borde sutil de los inputs
                        'mw-text-light': '#f5f5f5', // Texto general claro
                        'mw-text-label': '#d4d4d4', // Gris claro para labels
                        'mw-placeholder': '#737373', // Gris para placeholders
                        'mw-button': '#404040', // Fondo del botón
                        'mw-button-hover': '#525252', // Hover del botón
                    },
                },
            },
        }
    </script>
</head>
<body class="bg-mw-bg font-dm-sans antialiased flex items-center justify-center min-h-screen">
<div class="absolute top-6 left-6 flex items-center">
    <div class="w-5 h-5 bg-mw-red rounded-md mr-2"></div>
    <h1 class="text-xl font-semibold text-mw-text-light">Multi-Works Group</h1>
</div>
<div class="bg-mw-container rounded-xl shadow-md p-8 w-96">
    <div class="mb-6">
        <h2 class="text-xl font-semibold text-mw-text-light mb-2">Iniciar Sesión</h2>
        <p class="text-gray-500 text-sm">Accede a tu panel de gestión y lleva el control total de tus proyectos y personal especializado.</p>
    </div>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="mb-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
        <span class="block sm:inline"><%= error %></span>
    </div>
    <% } %>
    <form action='/loginController' method="post" novalidate>
        <div class="mb-4">
            <label for="email" class="block text-mw-text-label text-sm font-semibold mb-2">Email</label>
            <input type="email" id="email" name="email" class="shadow appearance-none border border-mw-input-border rounded w-full py-2 px-3 text-mw-text-light leading-tight focus:outline-none focus:shadow-outline bg-mw-input placeholder-mw-placeholder" placeholder="Ingresa tu correo electrónico">
        </div>
        <div class="mb-6">
            <label for="password" class="block text-mw-text-label text-sm font-semibold mb-2">Contraseña</label>
            <input type="password" id="password" name="password" class="shadow appearance-none border border-mw-input-border rounded w-full py-2 px-3 text-mw-text-light leading-tight focus:outline-none focus:shadow-outline bg-mw-input placeholder-mw-placeholder" placeholder="Ingresa tu contraseña">
        </div>
        <div class="flex items-center justify-center">
            <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                Iniciar Sesión
            </button>
        </div>
    </form>
</div>
</body>
</html>