<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modulo de cotizaciones</title>
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
                        'mw-red': '#b91c1c',
                        'mw-bg': '#181818',
                        'mw-sidebar': '#272727',
                        'mw-sidebar-active': '#3b3b3b',
                        'mw-text-light': '#e5e5e5',
                        'mw-text-secondary': '#a3a3a3',
                        'mw-card': '#272727',
                        'mw-button': '#3b3b3b',
                        'mw-button-hover': '#4d4d4d',
                        'mw-border': '#6b7280', // Gris más claro para la línea
                        'mw-title': '#cbd5e0', // Gris más claro para el título de la actividad
                        'mw-description': '#9ca3af', // Gris más claro para la descripción
                        'mw-button-bg': '#374151', // Fondo ligeramente más claro para el botón
                    },
                    fontSize: {
                        'xxs': '0.6rem',
                        'sm': '0.875rem', // Ajuste del tamaño de fuente general
                        'cost': '1rem', // Tamaño para los costos
                    },
                    spacing: {
                        '3.5': '0.875rem', // Espacio entre título y descripción
                    },
                    borderWidth: {
                        'px': '1px', // Línea divisoria de 1px
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-mw-bg font-dm-sans antialiased flex h-screen">
<aside class="bg-mw-sidebar w-64 flex flex-col p-4">
    <div class="mt-8 ml-4 mb-8">
        <div class="flex items-center">
            <div class="w-3 h-3 bg-mw-red rounded-md mr-2"></div>
            <span class="text-sm font-semibold text-mw-text-light">Multi-Works Group</span>
        </div>
    </div>
    <div class="mb-4">
        <div class="flex items-center rounded-md p-4 cursor-pointer hover:bg-mw-sidebar-active">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light mr-3">
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.05-.05.12-.078.19-.078H19.5a2.25 2.25 0 012.25 2.25v10.5a2.25 2.25 0 01-2.25 2.25H4.5a2.25 2.25 0 01-2.25-2.25V12z" />
            </svg>
            <span class="text-sm text-mw-text-light">Inicio Modulo</span>
        </div>
    </div>
    <div>
        <div class="flex items-center rounded-md p-4 cursor-pointer bg-mw-sidebar-active">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light mr-3">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 008.716-4.037c.133-.154.269-.31.407-.465a9.024 9.024 0 001.72-5.126C22.66 6.556 19.077 3 14.862 3a9.004 9.004 0 00-8.716 4.037c-.133.154-.269.31-.407.465a9.024 9.024 0 00-1.72 5.126C1.334 17.444 4.923 21 9.138 21z" />
            </svg>
            <span class="text-sm text-mw-text-light">Cotizaciones</span>
        </div>
    </div>
</aside>

<main class="flex-1 p-8">
    <h1 class="text-2xl font-bold text-mw-text-light mb-1">Modulo de cotizaciones</h1>
    <p class="text-sm text-mw-text-secondary mb-6">Bienvenido al modulo de empleados</p>

    <h2 class="text-xl font-bold text-mw-text-light mb-4">Resúmenes de cotizaciones</h2>

    <div class="bg-mw-card rounded-md p-6 w-full max-w-md">
        <div class="flex items-center mb-2">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6 text-blue-500 mr-2">
                <path fill-rule="evenodd" d="M6.32 2.577a49.255 49.255 0 0111.36 0c1.497.174 2.57 1.46 2.57 2.93V21a.75.75 0 01-.75.75H3.75a.75.75 0 01-.75-.75V5.507c0-1.47 1.073-2.756 2.57-2.93zm1.74.93a47.747 47.747 0 01-1.676.174A3 3 0 005.25 5.507V19.5h13.5V5.507a3 3 0 00-1.313-2.006c-.28-.02-.565-.056-.857-.086a47.747 47.747 0 01-1.676-.174l.051.022-.176.663zM9 13.25a.75.75 0 00-1.5 0v3.75a.75.75 0 001.5 0v-3.75zm3 1.25a.75.75 0 00-1.5 0v2.5a.75.75 0 001.5 0v-2.5zm3 .75a.75.75 0 00-1.5 0v1.75a.75.75 0 001.5 0v-1.75z" clip-rule="evenodd" />
            </svg>
            <h3 class="text-lg font-semibold text-mw-title">Titulo Actividad</h3>
        </div>
        <p class="text-xxs text-mw-description mb-3.5">Descripcion de la actividad</p>
        <div class="grid grid-cols-2 gap-y-2 text-sm text-mw-text-secondary mb-4">
            <div>Empleado Asignado</div>
            <div class="text-mw-text-light">Empleado Asignado</div>
            <div>Cliente</div>
            <div class="text-mw-text-light">Cliente Asignado</div>
            <div>Estado</div>
            <div class="text-mw-text-light">En Progreso</div>
            <div>Fecha de inicio</div>
            <div class="text-mw-text-light">01-01-2025 8:00 AM</div>
            <div>Fecha de fin</div>
            <div class="text-mw-text-light">05-01-2025 8:00 AM</div>
            <div>Estado</div>
            <div class="text-mw-text-light">En Progreso</div>
        </div>
        <hr class="border-mw-border border-px mb-4">
        <div class="grid grid-cols-3 gap-y-2 text-sm text-mw-text-secondary mb-4">
            <div class="text-center">Costo por asignacion <div class="text-mw-text-light text-cost">$10/h</div></div>
            <div class="text-center">Total de horas <div class="text-mw-text-light text-cost">40h</div></div>
            <div class="text-center">Costos Adicionales <div class="text-mw-text-light text-cost">$10</div></div>
        </div>
        <div class="flex justify-center">
            <button class="bg-mw-button-bg hover:bg-mw-button-hover text-mw-text-light rounded-md py-2.5 px-6 text-sm">
                Ver mas informacion
            </button>
        </div>
    </div>
</main>
</body>
</html>