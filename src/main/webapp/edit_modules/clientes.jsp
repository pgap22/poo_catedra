<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
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
                        'mw-red': '#AC5F5FBD',
                        'mw-bg': '#181818',
                        'mw-sidebar': '#272727',
                        'mw-sidebar-active': '#3b3b3b',
                        'mw-text-light': '#e5e5e5',
                        'mw-text-secondary': '#a3a3a3',
                        'mw-card': '#272727',
                        'mw-modal-bg': 'rgba(0, 0, 0, 0.5)',
                        'mw-modal-card': '#272727',
                        'mw-button-red': '#8C5252',
                        'mw-button-gray': '#4A5568',
                    },
                    fontSize: {
                        'sm': '0.875rem',
                        'xs': '0.75rem',
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
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12l8.954-8.955c.05-.05.12-.078.19-.078H19.5a2.25 2.25 0 012.25 2.25v10.5a2.25 2.25 0 01-2.25-2.25H4.5a2.25 2.25 0 01-2.25-2.25V12z" />
            </svg>
            <span class="text-sm text-mw-text-light">Inicio Modulo</span>
        </div>
    </div>
    <div>
        <div class="flex items-center rounded-md p-4 cursor-pointer bg-mw-sidebar-active">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light mr-3">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 008.716-4.037c.133-.154.269-.31.407-.465a9.024 9.024 0 001.72-5.126C22.66 6.556 19.077 3 14.862 3a9.004 9.004 0 00-8.716 4.037c-.133.154-.269.31-.407.465a9.024 9.024 0 00-1.72 5.126C1.334 17.444 4.923 21 9.138 21z" />
            </svg>
            <span class="text-sm text-mw-text-light">Clientes</span>
        </div>
    </div>
</aside>

<main class="flex-1 p-8">
    <h1 class="text-2xl font-bold text-mw-text-light mb-2">Clientes</h1>
    <p class="text-sm text-mw-text-secondary mb-6">Administra tus clientes</p>

    <section class="bg-mw-card rounded-md p-6">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-bold text-mw-text-light">Cliente #1 <button id="openDeleteModal" class="bg-mw-red text-mw-text-light rounded-md py-2 px-4 text-sm ml-2">Borrar</button></h2>
        </div>
        <p class="text-xs text-mw-text-secondary mb-1">Creado por admin</p>
        <p class="text-xs text-mw-text-secondary mb-1">Fecha de creacion: 2020-01-10</p>
        <p class="text-xs text-mw-text-secondary mb-4">Fecha de actualizacion: 2021-02-21</p>
        <p class="text-xs text-mw-text-secondary mb-6">Fecha de inactivacion:</p>

        <div class="grid grid-cols-2 gap-y-3 text-sm text-mw-text-light">
            <div><span class="font-semibold">Nombre del cliente</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">Nombre del cliente</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Documento De Identificacion</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">2020202-1</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Numero de contacto</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">7070-7070</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Tipo de persona</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">Natural</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Estado</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">Activo</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Correo de contacto</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">correo@correo.com</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
            <div><span class="font-semibold">Direccion</span></div>
            <div class="flex items-center justify-end"><span class="text-mw-text-secondary">Calle 1 Pte</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 text-mw-text-light cursor-pointer ml-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.687a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931m0 0L19.5 7.125m-2.633 4.26l-1.062-.062a1.125 1.125 0 01-1.143 1.143l-.062 1.062" />
                </svg>
            </div>
        </div>
    </section>

    <div id="deleteModal" class="fixed z-10 inset-0 overflow-y-auto hidden" aria-labelledby="modal-title" role="dialog" aria-modal="true">
        <div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
            <div class="fixed inset-0 bg-mw-modal-bg transition-opacity" aria-hidden="true"></div>

            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

            <div class="inline-block align-bottom bg-mw-modal-card rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                <div class="bg-mw-modal-card px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                    <div class="sm:flex sm:items-start">
                        <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-mw-red sm:mx-0 sm:h-10 sm:w-10">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-mw-text-light">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5-4.5m-4.5 0a4.5 4.5 0 116.364 6.364m-4.5 0a4.5 4.5 0 00-6.364-6.364m6.364 6.364l3-3m-3-3l-3 3m9-3a9 9 0 019 9m-9-9c0 1.087-.01 2.179-.038 3.269m-4 0a6 6 0 01-6-6m12 0a6 6 0 01-6 6" />
                            </svg>
                        </div>
                        <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                            <h3 class="text-lg leading-6 font-medium text-mw-text-light" id="modal-title">
                                Eliminar Cliente
                            </h3>
                            <div class="mt-2">
                                <p class="text-sm text-mw-text-secondary">
                                    ¿Estás seguro de eliminar este cliente?
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-mw-modal-card px-4 py-3 sm:px-6 flex flex-col">
                    <button type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-mw-button-red text-base font-medium text-mw-text-light hover:opacity-90 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-mw-button-red sm:ml-3 sm:w-auto sm:text-sm mb-2" onclick="closeDeleteModal()">
                        Eliminar Cliente
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
</main>
</body>
</html>