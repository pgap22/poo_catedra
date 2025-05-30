<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenido al Sistema</title>
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
            'mw-module': '#1e1e1e', // Fondo gris oscuro y uniforme para los módulos
            'mw-text-light': '#f5f5f5', // Texto general claro
            'mw-text-secondary': '#d1d5db', // Gris más claro para descripciones
            'mw-link': '#d4d4d4', // Gris claro para "Ir al módulo"
            'mw-icon': '#f5f5f5', // Blanco para los iconos
          },
        },
      },
    }
  </script>
</head>
<body class="bg-mw-bg font-dm-sans antialiased">
<div class="absolute top-6 left-6 flex items-center">
  <div class="w-5 h-5 bg-mw-red rounded-md mr-2"></div>
  <h1 class="text-xl font-semibold text-mw-text-light">Multi-Works Group</h1>
</div>

<div class="container mx-auto px-4 py-24">
  <div class="text-center mb-12">
    <h2 class="text-3xl font-bold text-mw-text-light mb-4">Bienvenido al sistema <span class="text-yellow-400">👋</span></h2>
    <p class="text-mw-text-secondary text-lg text-left">Explora y accede sin esfuerzo al módulo que mejor se adapta a tus necesidades. Gestiona personal, proyectos y costos de manera intuitiva y eficiente.</p>
  </div>

  <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
    <div class="bg-mw-module rounded-xl p-8 flex flex-col justify-between h-64">
      <div class="mb-0.5">
        <h3 class="text-xl font-bold text-mw-text-light mb-0">Clientes</h3>
        <p class="text-lg text-mw-text-secondary mb-1">Módulo de clientes.</p>
      </div>
      <div class="flex items-center justify-between">
        <a href="#" class="text-sm font-bold text-mw-link flex items-center">
          Ir al módulo
          <span class="ml-1 w-3 h-3 rounded-full border border-mw-link flex items-center justify-center align-middle">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-2 h-2 text-mw-link">
                                <path fill-rule="evenodd" d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z" clip-rule="evenodd" />
                            </svg>
                        </span>
        </a>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-mw-icon self-end">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 7.5V6.108c0-1.135.845-2.098 1.976-2.192.373-.03.748-.057 1.123-.08M15.75 18H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08M15.75 18.75v-1.875a3.375 3.375 0 0 0-3.375-3.375h-1.5a1.125 1.125 0 0 1-1.125-1.125v-1.5A3.375 3.375 0 0 0 6.375 7.5H5.25m11.9-3.664A2.251 2.251 0 0 0 15 2.25h-1.5a2.251 2.251 0 0 0-2.15 1.586m5.8 0c.065.21.1.433.1.664v.75h-6V4.5c0-.231.035-.454.1-.664M6.75 7.5H4.875c-.621 0-1.125.504-1.125 1.125v12c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V16.5a9 9 0 0 0-9-9Z" />
        </svg>

      </div>
    </div>

    <div class="bg-mw-module rounded-xl p-8 flex flex-col justify-between h-64">
      <div class="mb-0.5">
        <h3 class="text-xl font-bold text-mw-text-light mb-0">Empresas</h3>
        <p class="text-lg text-mw-text-secondary mb-1">Módulo de empresas.</p>
      </div>
      <div class="flex items-center justify-between">
        <a href="#" class="text-sm font-bold text-mw-link flex items-center">
          Ir al módulo
          <span class="ml-1 w-3 h-3 rounded-full border border-mw-link flex items-center justify-center align-middle">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-2 h-2 text-mw-link">
                                <path fill-rule="evenodd" d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z" clip-rule="evenodd" />
                            </svg>
                        </span>
        </a>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="-12 h-12 text-mw-icon self-end">
          <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
        </svg>

      </div>
    </div>

    <div class="bg-mw-module rounded-xl p-8 flex flex-col justify-between h-64">
      <div class="mb-0.5">
        <h3 class="text-xl font-bold text-mw-text-light mb-0">Cotizaciones</h3>
        <p class="text-lg text-mw-text-secondary mb-1">Módulo de cotizaciones.</p>
      </div>
      <div class="flex items-center justify-between">
        <a href="#" class="text-sm font-bold text-mw-link flex items-center">
          Ir al módulo
          <span class="ml-1 w-3 h-3 rounded-full border border-mw-link flex items-center justify-center align-middle">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-2 h-2 text-mw-link">
                                <path fill-rule="evenodd" d="M3 10a.75.75 0 01.75-.75h10.638L10.23 5.29a.75.75 0 111.04-1.08l5.5 5.25a.75.75 0 010 1.08l-5.5 5.25a.75.75 0 11-1.04-1.08l4.158-3.96H3.75A.75.75 0 013 10z" clip-rule="evenodd" />
                            </svg>
                        </span>
        </a>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-mw-icon self-end">
          <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 8.25h19.5M2.25 9h19.5m-16.5 5.25h6m-6 2.25h3m-3.75 3h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Z" />
        </svg>


      </div>
    </div>
  </div>
</div>
</body>
</html>