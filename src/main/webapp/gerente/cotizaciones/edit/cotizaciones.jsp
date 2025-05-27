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
                        'mw-red-icon': '#AC5F5FBD',
                        'mw-bg': '#181818',
                        'mw-sidebar': '#272727',
                        'mw-sidebar-active': '#3b3b3b',
                        'mw-text-light': '#e5e5e5',
                        'mw-text-secondary': '#a3a3a3',
                        'mw-card': '#272727',
                        'mw-input': '#3b3b3b',
                        'mw-button-primary': '#5F9E5F',   // Verde (Finalizar Cotizacion)
                        'mw-button-secondary': '#8C5252', // Rojo oscuro (Borrar, Agregar Asignacion)
                        'mw-button-accent': '#6b46c1',    // Morado (Marcar Como Completado)
                        'mw-modal-bg': 'rgba(0, 0, 0, 0.5)',
                        'mw-modal-card': '#272727',
                        'mw-button-red': '#8C5252',
                        'mw-button-gray': '#4A5568',
                    },
                    fontSize: {
                        'sm': '0.875rem', // 14px
                        'xs': '0.75rem',  // 12px
                    },
                },
            },
        }
    </script>
</head>
<body class="bg-mw-bg font-dm-sans antialiased flex h-screen text-mw-text-light">

<aside class="bg-mw-sidebar w-64 flex flex-col p-4 flex-shrink-0">
    <div class="mt-4 ml-4 mb-8">
        <div class="flex items-center">
            <div class="w-3 h-3 bg-mw-red-icon rounded-sm mr-2"></div>
            <span class="text-sm font-semibold text-mw-text-light">Multi-Works Group</span>
        </div>
    </div>
    <nav class="flex flex-col space-y-2">
        <a href="#" class="flex items-center rounded-md py-2 px-4 cursor-pointer hover:bg-mw-sidebar-active group">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-mw-text-secondary group-hover:text-mw-text-light mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
            </svg>
            <span class="text-sm text-mw-text-secondary group-hover:text-mw-text-light">Inicio Modulo</span>
        </a>
        <a href="#" class="flex items-center rounded-md py-2 px-4 cursor-pointer bg-mw-sidebar-active group">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-mw-text-light mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-5 5a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
            </svg>
            <span class="text-sm text-mw-text-light">Cotizaciones</span>
        </a>
    </nav>
</aside>

<main class="flex-1 p-6 overflow-y-auto">
    <h1 class="text-2xl font-bold text-mw-text-light mb-1">Cotizaciones</h1>
    <p class="text-sm text-mw-text-secondary mb-6">Administra tus cotizaciones</p>

    <section class="bg-mw-card rounded-lg p-6 mb-6 shadow-lg">
        <div class="flex items-center justify-between mb-4">
            <div class="flex items-center space-x-4">
                <h2 class="text-xl font-semibold text-mw-text-light">Cotización #1</h2>
                <button id="openDeleteModal" class="bg-mw-button-secondary text-mw-text-light rounded-md py-1.5 px-4 text-sm font-medium hover:opacity-90">
                    Borrar
                </button>
            </div>
        </div>

        <div class="grid grid-cols-2 gap-x-8 gap-y-3 text-sm">
            <div class="text-mw-text-secondary">Nombre de cliente</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>Pedro Cliente</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
            <div class="text-mw-text-secondary">Fecha de inicio</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>2025-02-02</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
            <div class="text-mw-text-secondary">Fecha de finalización</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>2025-04-03</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
            <div class="text-mw-text-secondary">Cantidad de horas del proyecto</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>100</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
            <div class="text-mw-text-secondary">Costo de asignaciones</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>$200</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
            <div class="text-mw-text-secondary">Costo Adicionales</div>
            <div class="flex items-center justify-end text-mw-text-light">
                <span>$20</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-mw-text-secondary hover:text-mw-text-light cursor-pointer ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
            </div>
        </div>
    </section>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">

        <section class="bg-mw-card rounded-lg p-6 shadow-lg flex flex-col">
            <h2 class="text-lg font-semibold text-mw-text-light mb-4">Asignaciones de la cotización</h2>
            <div class="flex-grow space-y-4">
                <div>
                    <label for="titulo" class="block text-xs font-medium text-mw-text-secondary mb-1">Título</label>
                    <input type="text" id="titulo" placeholder="Placeholder" class="appearance-none border-none rounded w-full py-2 px-3 text-mw-text-light leading-tight focus:outline-none focus:ring-2 focus:ring-mw-button-accent bg-mw-input text-sm">
                </div>
                <div>
                    <label for="empleado" class="block text-xs font-medium text-mw-text-secondary mb-1">Empleado</label>
                    <input type="text" id="empleado" placeholder="Placeholder" class="appearance-none border-none rounded w-full py-2 px-3 text-mw-text-light leading-tight focus:outline-none focus:ring-2 focus:ring-mw-button-accent bg-mw-input text-sm">
                </div>
                <div>
                    <label for="descripcion" class="block text-xs font-medium text-mw-text-secondary mb-1">Descripción</label>
                    <textarea id="descripcion" rows="3" placeholder="Placeholder" class="appearance-none border-none rounded w-full py-2 px-3 text-mw-text-light leading-tight focus:outline-none focus:ring-2 focus:ring-mw-button-accent bg-mw-input text-sm"></textarea>
                </div>
            </div>
            <button class="mt-4 w-full bg-mw-button-secondary text-mw-text-light rounded-md py-2 px-4 text-sm font-medium hover:opacity-90">Agregar Asignacion</button>
        </section>

        <section class="bg-mw-card rounded-lg p-6 shadow-lg flex flex-col justify-between"> <div> <div class="flex items-center justify-between mb-2">
            <span class="text-base font-semibold text-mw-text-light">Subneteo IPv4</span>
            <div class="flex items-center space-x-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-mw-text-secondary hover:text-mw-text-light cursor-pointer" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                </svg>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-mw-text-secondary hover:text-mw-red-icon cursor-pointer" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                </svg>
            </div>
        </div>
            <div class="mb-3">
                    <span class="text-xs font-medium text-mw-text-secondary block">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 inline mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                        </svg>
                        Empleado Nombre
                     </span>
            </div>
            <p class="text-xs text-mw-text-secondary mb-4 leading-relaxed">
                Configuración de red interna para la IP v4 x.x.x.x/x, realizando subneteo para aislamiento de grupos según requerimientos de segmentación.
            </p>
            <button class="w-full bg-mw-button-accent text-mw-text-light rounded-md py-2 px-4 text-sm font-medium hover:opacity-90">Marcar Como Completado</button>
        </div>

            <div> <button class="mt-4 w-full bg-mw-button-primary text-mw-text-light rounded-md py-2 px-6 text-sm font-medium hover:opacity-90">Finalizar Cotizacion</button>
            </div>
        </section>

    </div>
</main>

<div id="deleteModal" class="fixed z-10 inset-0 overflow-y-auto hidden" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-mw-modal-bg transition-opacity" aria-hidden="true"></div>

        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <div class="inline-block align-bottom bg-mw-modal-card rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
            <div class="bg-mw-modal-card px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                <div class="sm:flex sm:items-start">
                    <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-mw-button-secondary sm:mx-0 sm:h-10 sm:w-10">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-mw-text-light">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5-4.5m-4.5 0a4.5 4.5 0 116.364 6.364m-4.5 0a4.5 4.5 0 00-6.364-6.364m6.364 6.364l3-3m-3-3l-3 3m9-3a9 9 0 019 9m-9-9c0 1.087-.01 2.179-.038 3.269m-4 0a6 6 0 01-6-6m12 0a6 6 0 01-6 6" />
                        </svg>
                    </div>
                    <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                        <h3 class="text-lg leading-6 font-medium text-mw-text-light" id="modal-title">
                            Eliminar Cotización
                        </h3>
                        <div class="mt-2">
                            <p class="text-sm text-mw-text-secondary">
                                ¿Estás seguro de eliminar esta cotización?
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-mw-modal-card px-4 py-3 sm:px-6 flex flex-col">
                <button type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-mw-button-secondary text-base font-medium text-mw-text-light hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-mw-button-secondary sm:ml-3 sm:w-auto sm:text-sm mb-2" onclick="closeDeleteModal()">
                    Eliminar Cotización
                </button>
                <button type="button" class="w-full inline-flex justify-center rounded-md border border-mw-button-gray shadow-sm px-4 py-2 bg-mw-button-gray text-base font-medium text-mw-text-light hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-mw-button-gray sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm" onclick="closeDeleteModal()">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    const deleteModal = document.getElementById('deleteModal');
    const openDeleteModalButton = document.getElementById('openDeleteModal');

    openDeleteModalButton.addEventListener('click', () => {
        deleteModal.classList.remove('hidden');
    });

    function closeDeleteModal() {
        deleteModal.classList.add('hidden');
    }
</script>

</body>
</html>