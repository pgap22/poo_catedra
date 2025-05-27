<%--
  Created by IntelliJ IDEA.
  User: Gerardo
  Date: 25/5/2025
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/input.css">
</head>
<body class="bg-[#07090A] min-h-screen text-white flex justify-center p-4">
<div class="container">
    <header class="flex items-center gap-2 p-4 font-bold mb-6">
        <div class="bg-[#9A1C1E] aspect-square rounded-sm w-6">

        </div>
        <p>Multi-Works Group</p>
    </header>
    <div class="grid grid-cols-[max-content_1fr] gap-4">
        <nav>
            <div class="flex flex-col gap-2 w-[200px]">
                <a href="/admin/index.jsp">
                    <div class="p-4 rounded-lg font-bold cursor-pointer hover:bg-[#262626] w-full">
                        <span>Usuarios</span>
                    </div>
                </a>
                <a href="/admin/clientes.jsp">
                    <div class="p-4 rounded-lg font-bold cursor-pointer hover:bg-[#262626] w-full">
                        <span>Clientes</span>
                    </div>
                </a>
                <a href="/admin/empleados.jsp">
                    <div class="p-4 rounded-lg font-bold cursor-pointer hover:bg-[#262626] w-full">
                        <span>Empleados</span>
                    </div>
                </a>
                <a href="/admin/cotizaciones.jsp">
                    <div class="p-4 rounded-lg font-bold cursor-pointer hover:bg-[#262626] w-full">
                        <span>Cotizaciones</span>
                    </div>
                </a>
                <a href="/sesionController?logout=1" class="block p-4 rounded-lg font-medium cursor-pointer bg-red-900/50 hover:bg-red-900 text-red-100 hover:text-white transition-colors w-full text-left">
                    <div class="flex items-center justify-start gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9" />
                        </svg>
                        <span>Cerrar sesión</span>
                    </div>
                </a>
            </div>
        </nav>
        <main class="bg-[#191A1B] p-4 rounded-lg w-full">
