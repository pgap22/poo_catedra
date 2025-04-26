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
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.125h15.002M9.75 21.75l-3 1.5-3-1.5m9.75-3l3 1.5 3-1.5M6.75 7.5l3 4.5-3 4.5m13.5-3l-3 4.5 3 4.5" />
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
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-12 h-12 text-mw-icon self-end">
          <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 3h10.5a.75.75 0 01.75.75v8.578a.75.75 0 01-.75.75H6.75a.75.75 0 01-.75-.75V3.75a.75.75 0 01.75-.75z" />
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
          <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 12.76c0 1.6 1.123 2.994 2.707 3.227m-2.707-9.94l-3 3m3-3 3 3m9-8.78l-3 3 3-3 3 3m-3-3c.166.48.42.882.768 1.192m0-3.5-.11-.09a1.562 1.562 0 00-.402-.555m0-3.5-.11-.09c.166.48.42.882.768 1.192m-.346-1.999-3 3m3-3c-.166.48-.42.882-.768-1.192m0 3.5.11.09a1.562 1.562 0 00.402.555m0 3.5.11.09c-.166-.48-.42-.882-.768-1.192m.346-1.999 3-3m-3 3c.166-.48-.42-.882-.768-1.192m0-3.5-.11.09a1.562 1.562 0 00.402-.555m0-3.5-.11-.09c.166.48.42.882.768-1.192m-.346-1.999-3 3m3-3c-.166.48-.42.882-.768-1.192m0 3.5.11-.09a1.562 1.562 0 00.402.555m0 3.5.11-.09c-.166-.48-.42-.882-.768-1.192m.346-1.999 3-3" />
        </svg>
      </div>
    </div>
  </div>
</div>
</body>
</html>