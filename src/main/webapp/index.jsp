<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.poo.catedra.utils.Conexion" %>
<html>
<head>
    <title>Prueba SELECT 1</title>
</head>
<body>
<h2>Resultado de SELECT 1</h2>
<%
    // Ejecutar la consulta usando la clase Conexion
    Long resultado = Conexion.ejecutarConsultaEscalar("SELECT 1 AS valor", Long.class);

    // Mostrar el resultado en el JSP
    out.println("El resultado es: " + resultado);
%>
</body>
</html>
