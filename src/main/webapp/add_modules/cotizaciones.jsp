<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cotizaciones</title>
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
                        'mw-input': '#374151', // Fondo de los inputs
                        'mw-input-text': '#d1d5db', // Texto placeholder de los inputs
                        'mw-button': '#4a5568', // Botón Crear Cotizacion
                        'mw-button-hover': '#6b7280',
                        'mw-add-assign': '#5C2B2B', // Botón Agregar Asignacion
                        'mw-card': '#272727', // Fondo de la sección Subneteo
                    },
                    fontSize: {
                        'sm': '0.875rem',
                        'xs': '0.75rem',
                    },
                    spacing: {
                        '4.5': '1.125rem', // Espacio entre secciones
                        '5': '1.25rem',
                    },
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
    <h1 class="text-2xl font-bold text-mw-text-light mb-1">Cotizaciones</h1>
    <p class="text-sm text-mw-text-secondary mb-6">Crear cotizacion</p>

    <section class="mb-5">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-x-4 gap-y-3">
            <div>
                <label for="cliente" class="block text-sm text-mw-text-secondary mb-1">Cliente</label>
                <input type="text" id="cliente" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="costo_adicionales" class="block text-sm text-mw-text-secondary mb-1">Costo de adicionales</label>
                <input type="text" id="costo_adicionales" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="fecha_inicio" class="block text-sm text-mw-text-secondary mb-1">Fecha de inicio</label>
                <input type="text" id="fecha_inicio" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="fecha_finalizacion" class="block text-sm text-mw-text-secondary mb-1">Fecha de finalizacion</label>
                <input type="text" id="fecha_finalizacion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="cantidad_horas" class="block text-sm text-mw-text-secondary mb-1">Cantidad de horas del proyecto</label>
                <input type="text" id="cantidad_horas" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="costo_asignaciones" class="block text-sm text-mw-text-secondary mb-1">Costo de asignaciones</label>
                <input type="text" id="costo_asignaciones" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
        </div>
    </section>

    <section class="mb-5">
        <h2 class="text-xl font-bold text-mw-text-light mb-4">Asignaciones de la cotizacion</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-4 gap-y-3">
            <div class="flex flex-col justify-end">
                <div class="grid grid-cols-1 gap-y-3 mb-3">
                    <div>
                        <label for="titulo_asignacion" class="block text-sm text-mw-text-secondary mb-1">Titulo</label>
                        <input type="text" id="titulo_asignacion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
                    </div>
                    <div>
                        <label for="empleado_asignacion" class="block text-sm text-mw-text-secondary mb-1">Empleado</label>
                        <input type="text" id="empleado_asignacion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
                    </div>
                    <div>
                        <label for="descripcion_asignacion" class="block text-sm text-mw-text-secondary mb-1">Descripcion</label>
                        <textarea id="descripcion_asignacion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder"></textarea>
                    </div>
                </div>
                <div>
                    <button style="background-color: #5C2B2B;" class="text-mw-text-light rounded-md py-3 px-6 text-sm w-full">
                        Agregar Asignacion
                    </button>
                </div>
            </div>
            <div class="flex flex-col justify-between">
                <div class="bg-mw-card rounded-md p-4">
                    <div class="flex items-center mb-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-mw-text-light mr-2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.125h15.002M9.75 21.75l-3 1.5-3-1.5m9.75-3l3 1.5 3-1.5M6.75 7.5l3 4.5-3 4.5m13.5-3l-3 4.5 3 4.5" />
                        </svg>
                        <h3 class="text-sm font-bold text-mw-text-light">Subneteo IPv4</h3>
                        <h4 class="text-sm font-bold text-mw-text-light ml-2">Empleado Nombre</h4>
                    </div>
                    <p class="text-xs text-mw-text-secondary mb-2">Configuración de red interna para la IP V4 x.x.x.x/x, realizando subneteo para aislamiento de grupos según requerimientos de segmentación.</p>
                    <div class="flex items-center justify-end">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light mr-2 cursor-pointer">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light cursor-pointer">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12-.5c-.4 0-.77.045-1.13.122a19.091 19.091 0 01-1.616 3.442m1.99-1.99a6 6 0 00-3.84 3.84l-2.174 2.175m5.853-10.84a24.803 24.803 0 01-2.861 5.95m-.82-1.286a23.404 23.404 0 01-3.91 7.576m1.155-1.155a48.109 48.109 0 01-1.06-.05 48.086 48.086 0 01-3.41-.058m1.942-1.942a6 6 0 0010.5 0" />
                        </svg>
                    </div>
                </div>
                <div>
                    <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-3 px-6 text-sm w-full">
                        Crear Cotizacion
                    </button>
                </div>
            </div>
        </div>
    </section>
</main>
</body>
</html>