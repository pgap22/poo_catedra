package com.poo.catedra.reportes;

import com.poo.catedra.utils.Conexion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "CotizacionReportes", value = "/reporte/cotizacionReportes")
public class CotizacionReportes extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CotizacionReportes.class.getName());
    private static final String JASPER_FILE = "/POOreporte.jasper";
    private static final String OUTPUT_FILE_NAME = "ReporteCotizaciones.pdf";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String rol = (String) session.getAttribute("rol");

        // Obtener y validar parámetros
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");

        if (fechaInicio == null || fechaFin == null || fechaInicio.isEmpty() || fechaFin.isEmpty()) {
            request.setAttribute("error", "Parámetros 'fechaInicio' y 'fechaFin' son obligatorios.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/" + rol + "/reporteCotizacion.jsp");
            dispatcher.forward(request, response);
            return;
        }


        // Obtener conexión
        try (Connection conexion = Conexion.obtenerConexion()) {

            if (conexion == null) {
                LOGGER.severe("No se pudo obtener la conexión a la base de datos.");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error de conexión con la base de datos.");
                return;
            }

            // Preparar parámetros para el reporte
            Map<String, Object> parameters = new HashMap<>();
            String reportDir = getServletContext().getRealPath("/") + System.getProperty("file.separator");
            parameters.put("REPORT_DIR", reportDir);


            // Start of day
            Timestamp fechaIniciostr = Timestamp.valueOf(fechaInicio + " 00:00:00");

            // End of day
            Timestamp fechaFinstr = Timestamp.valueOf(fechaFin + " 23:59:59");

            parameters.put("fechaInicio", fechaIniciostr);
            parameters.put("fechaFin", fechaFinstr);

            // Obtener ruta del archivo .jasper
            String pathReporte = getServletContext().getRealPath(JASPER_FILE);
            if (pathReporte == null) {
                LOGGER.severe("No se encontró el archivo del reporte: " + JASPER_FILE);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Archivo de reporte no encontrado.");
                return;
            }

            LOGGER.info("Generando reporte con ruta: " + pathReporte);
            LOGGER.info("Parámetros: fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin);

            JasperReport reporte = (JasperReport) JRLoader.loadObjectFromFile(pathReporte);
            JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parameters, conexion);

            // Configurar la respuesta HTTP
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + OUTPUT_FILE_NAME + "\"");

            try (ServletOutputStream out = response.getOutputStream()) {
                JRPdfExporter exporter = new JRPdfExporter();
                exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
                exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
                exporter.exportReport();
            }

        } catch (JRException | SQLException e) {
            LOGGER.log(Level.SEVERE, "Error generando el reporte", e);
            request.setAttribute("error", "Error al generar el reporte: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/" + rol + "/reporteCotizacion.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
