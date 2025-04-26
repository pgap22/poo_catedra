<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empleados</title>
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
                        'mw-button': '#4a5568', // Botón Crear Empleado
                        'mw-button-hover': '#6b7280',
                        'mw-table-border': '#4a5568', // Bordes de la tabla
                        'mw-edit': '#AAAC5FBD', // Botón Editar
                        'mw-delete': '#AC5F5FBD', // Botón Borrar
                    },
                    fontSize: {
                        'sm': '0.875rem',
                        'xs': '0.75rem',
                    },
                    spacing: {
                        '3': '0.75rem',
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
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h5.25M7.5 12h5.25M7.5 9h5.25M3 19.5a1.5 1.5 0 01-1.5-1.5V6A1.5 1.5 0 013 4.5h18A1.5 1.5 0 0122.5 6v12a1.5 1.5 0 01-1.5 1.5H3z" />
            </svg>
            <span class="text-sm text-mw-text-light">Empleado</span>
        </div>
    </div>
</aside>

<main class="flex-1 p-8">
    <h1 class="text-2xl font-bold text-mw-text-light mb-1">Empleados</h1>
    <p class="text-sm text-mw-text-secondary mb-6">Administra tus empleados</p>

    <section class="mb-8">
        <h2 class="text-xl font-bold text-mw-text-light mb-4">Añadir nuevo empleado</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-x-4 gap-y-3 mb-4">
            <div>
                <label for="nombre" class="block text-sm text-mw-text-secondary mb-1">Nombre del cliente</label>
                <input type="text" id="nombre" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="documento" class="block text-sm text-mw-text-secondary mb-1">Documento De Identificacion</label>
                <input type="text" id="documento" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="tipo" class="block text-sm text-mw-text-secondary mb-1">Tipo de empleado</label>
                <input type="text" id="tipo" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="contacto" class="block text-sm text-mw-text-secondary mb-1">Numero de contacto</label>
                <input type="text" id="contacto" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="correo" class="block text-sm text-mw-text-secondary mb-1">Correo de contacto</label>
                <input type="email" id="correo" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="direccion" class="block text-sm text-mw-text-secondary mb-1">Direccion</label>
                <input type="text" id="direccion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="estado" class="block text-sm text-mw-text-secondary mb-1">Estado</label>
                <input type="text" id="estado" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div>
                <label for="contratacion" class="block text-sm text-mw-text-secondary mb-1">Tipo de contratacion</label>
                <input type="text" id="contratacion" class="bg-mw-input text-mw-input-text rounded-md p-2 w-full placeholder-mw-input-text" placeholder="Placeholder">
            </div>
            <div></div>
        </div>
        <div class="flex justify-start">
            <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-2 px-6 text-sm">
                Crear Empleado
            </button>
        </div>
    </section>

    <section>
        <h2 class="text-xl font-bold text-mw-text-light mb-4"></h2>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-mw-table-border">
                <thead class="bg-mw-card">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">ID</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">Nombre del empleado</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">Tipo de Empleado</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">Tipo de contratacion</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">Estado</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-mw-text-secondary uppercase tracking-wider">Acciones</th>
                </tr>
                </thead>
                <tbody class="bg-mw-bg divide-y divide-mw-table-border">
                <tr>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">1</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Empleado 1</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Natural</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Permanente</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Activo</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm">
                        <button style="background-color: #AAAC5FBD;" class="text-white rounded-md py-1 px-3 text-xs mr-2">Editar</button>
                        <button style="background-color: #AC5F5FBD;" class="text-white rounded-md py-1 px-3 text-xs">Borrar</button>
                    </td>
                </tr>
                <tr>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">2</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Empleado 1</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Natural</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Permanente</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Activo</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm">
                        <button style="background-color: #AAAC5FBD;" class="text-white rounded-md py-1 px-3 text-xs mr-2">Editar</button>
                        <button style="background-color: #AC5F5FBD;" class="text-white rounded-md py-1 px-3 text-xs">Borrar</button>
                    </td>
                </tr>
                <tr>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">3</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Empleado 1</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Natural</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Permanente</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm text-mw-text-light">Activo</td>
                    <td class="px-6 py-3 whitespace-nowrap text-sm">
                        <button style="background-color: #AAAC5FBD;" class="text-white rounded-md py-1 px-3 text-xs mr-2">Editar</button>
                        <button style="background-color: #AC5F5FBD;" class="text-white rounded-md py-1 px-3 text-xs">Borrar</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</main>
</body>
</html>