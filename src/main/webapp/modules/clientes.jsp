<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Modulo de clientes</title>
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
            'mw-button': '#4a5568', // Gris más oscuro para el botón
            'mw-button-hover': '#6b7280',
            'mw-active': '#288351C9',
            'mw-inactive': '#832828C9',
            'mw-icon-bg': '#374151', // Fondo gris para el círculo del icono
          },
          fontSize: {
            'sm': '0.875rem',
            'xs': '0.75rem',
          },
          spacing: {
            '2.5': '0.625rem',
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
        <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372m-16.39-2.128a9.38 9.38 0 012.626-.372m4-8v6a3 3 0 01-3 3H9a3 3 0 01-3-3V5a3 3 0 013-3h6a3 3 0 013 3v6m-4-13c-2.21 0-4 1.79-4 4s4 8 4 8m-1.08-9.05a9.5 9.5 0 011.783.463m-1.296 5.323a9.75 9.75 0 00-.139.586m-1.28-3.182l-1.397-1.546a.25.25 0 00-.358 0l-1.397 1.546c-.18.2-.422.2-.602 0a.25.25 0 01-.358-.31l.5-5.518a9.75 9.75 0 00.343-.105m1.783 5.463a9.5 9.5 0 011.154-.342m-1.296-6.323c-.141-.39-.515-.39-.656 0l-1.397 1.546c-.18.2-.421.2-.601 0a.25.25 0 01-.358-.31l.5-5.518a9.75 9.75 0 001.026.247m1.783-4.463a9.5 9.5 0 01.521.138" />
      </svg>
      <span class="text-sm text-mw-text-light">Clientes</span>
    </div>
  </div>
</aside>

<main class="flex-1 p-8">
  <h1 class="text-2xl font-bold text-mw-text-light mb-1">Modulo de clientes</h1>
  <p class="text-sm text-mw-text-secondary mb-6">Bienvenido al modulo de clientes</p>

  <h2 class="text-xl font-bold text-mw-text-light mb-4">Resúmenes de clientes</h2>

  <div class="grid grid-cols-1 md:grid-cols-3 gap-x-6 gap-y-4">
    <div class="bg-mw-card rounded-md p-4">
      <div class="flex items-center mb-2">
        <div class="bg-mw-icon-bg rounded-full w-8 h-8 flex items-center justify-center mr-2">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.125h15.002M9.75 21.75l-3 1.5-3-1.5m9.75-3l3 1.5 3-1.5M6.75 7.5l3 4.5-3 4.5m13.5-3l-3 4.5 3 4.5" />
          </svg>
        </div>
        <h3 class="text-sm font-bold text-mw-text-light">Persona Natural Con Su Nombre</h3>
      </div>
      <span class="inline-flex items-center rounded-md bg-mw-active px-2 py-0.5 text-xs font-medium text-white mb-2.5">
                    Activo
                </span>
      <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-2 px-4 text-sm w-full">
        Ver mas informacion
      </button>
    </div>

    <div class="bg-mw-card rounded-md p-4">
      <div class="flex items-center mb-2">
        <div class="bg-mw-icon-bg rounded-full w-8 h-8 flex items-center justify-center mr-2">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.125h15.002M9.75 21.75l-3 1.5-3-1.5m9.75-3l3 1.5 3-1.5M6.75 7.5l3 4.5-3 4.5m13.5-3l-3 4.5 3 4.5" />
          </svg>
        </div>
        <h3 class="text-sm font-bold text-mw-text-light">Persona Natural Con Su Nombre</h3>
      </div>
      <span class="inline-flex items-center rounded-md bg-mw-active px-2 py-0.5 text-xs font-medium text-white mb-2.5">
                    Activo
                </span>
      <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-2 px-4 text-sm w-full">
        Ver mas informacion
      </button>
    </div>

    <div class="bg-mw-card rounded-md p-4">
      <div class="flex items-center mb-2">
        <div class="bg-mw-icon-bg rounded-full w-8 h-8 flex items-center justify-center mr-2">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.125h15.002M9.75 21.75l-3 1.5-3-1.5m9.75-3l3 1.5 3-1.5M6.75 7.5l3 4.5-3 4.5m13.5-3l-3 4.5 3 4.5" />
          </svg>
        </div>
        <h3 class="text-sm font-bold text-mw-text-light">Persona Natural Con Su Nombre</h3>
      </div>
      <span class="inline-flex items-center rounded-md bg-mw-inactive px-2 py-0.5 text-xs font-medium text-white mb-2.5">
                    Inactivo
                </span>
      <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-2 px-4 text-sm w-full">
        Ver mas informacion
      </button>
    </div>

    <div class="bg-mw-card rounded-md p-4">
      <div class="flex items-center mb-2">
        <div class="bg-mw-icon-bg rounded-full w-8 h-8 flex items-center justify-center mr-2">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-mw-text-light">
            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 3h10.5a.75.75 0 01.75.75v8.578a.75.75 0 01-.75.75H6.75a.75.75 0 01-.75-.75V3.75a.75.75 0 01.75-.75z" />
          </svg>
        </div>
        <h3 class="text-sm font-bold text-mw-text-light">Empres Jurídica</h3>
      </div>
      <span class="inline-flex items-center rounded-md bg-mw-active px-2 py-0.5 text-xs font-medium text-white mb-2.5">
                    Activo
                </span>
      <button class="bg-mw-button hover:bg-mw-button-hover text-mw-text-light rounded-md py-2 px-4 text-sm w-full">
        Ver mas informacion
      </button>
    </div>
  </div>
</main>
</body>
</html>