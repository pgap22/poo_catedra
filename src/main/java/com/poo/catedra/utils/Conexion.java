package com.poo.catedra.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.function.Function;
import java.util.logging.Logger;

/**
 * Clase Conexion para gestionar la conexión a una base de datos MySQL
 * y ejecutar consultas (querys) y actualizaciones (updates) en un entorno
 * de Jakarta Servlets.
 */
public final class Conexion {

    private static final Logger LOGGER = Logger.getLogger(Conexion.class.getName());

    // Parámetros de conexión (configurables según el entorno)
    private static final String URL = "jdbc:mysql://localhost:3306/db_poo";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "root"; // TODO: CAMBIAR SU CONTRA

    // Bloque estático para cargar el driver MySQL
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            LOGGER.info("Driver MySQL cargado correctamente.");
        } catch (ClassNotFoundException e) {
            LOGGER.severe("No se pudo cargar el driver MySQL: " + e.getMessage());
            throw new IllegalStateException("No se pudo cargar el driver MySQL", e);
        }
    }

    // Constructor privado para evitar instanciación
    private Conexion() {
        // No se permite la instanciación
    }

    /**
     * Obtiene una conexión a la base de datos MySQL.
     *
     * @return objeto {@link Connection} listo para usarse.
     * @throws IllegalStateException si no se puede establecer la conexión.
     */
    public static Connection obtenerConexion() {
        LOGGER.info("Conectando a la base de datos...");
        try {
            Connection conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            LOGGER.info("¡Base de datos conectada!");
            return conexion;
        } catch (SQLException e) {
            LOGGER.severe("Error al conectar a la base de datos: " + e.getMessage());
            throw new IllegalStateException("¡No se puede conectar a la base de datos!", e);
        }
    }

    /**
     * Ejecuta una consulta SELECT y procesa el ResultSet mediante un handler.
     *
     * @param <T> El tipo de resultado que se devolverá.
     * @param consulta La consulta SQL a ejecutar.
     * @param handler Una función que procesa el ResultSet y devuelve un resultado.
     * @return El resultado procesado por el handler.
     * @throws IllegalStateException si ocurre algún error durante la ejecución.
     */
    public static <T> T ejecutarConsulta(String consulta, Function<ResultSet, T> handler) {
        LOGGER.info("Ejecutando consulta: " + consulta);
        try (Connection conexion = obtenerConexion();
             Statement sentencia = conexion.createStatement();
             ResultSet resultado = sentencia.executeQuery(consulta)) {

            return handler.apply(resultado);
        } catch (SQLException e) {
            LOGGER.severe("Error al ejecutar la consulta: " + e.getMessage());
            throw new IllegalStateException("¡Error al ejecutar la consulta!", e);
        }
    }

    /**
     * Ejecuta una actualización (INSERT, UPDATE, DELETE) y devuelve el número de filas afectadas.
     *
     * @param consulta La consulta SQL de actualización.
     * @return Número de filas afectadas.
     * @throws IllegalStateException si ocurre algún error durante la ejecución.
     */
    public static int ejecutarActualizacion(String consulta) {
        LOGGER.info("Ejecutando actualización: " + consulta);
        try (Connection conexion = obtenerConexion();
             Statement sentencia = conexion.createStatement()) {

            int filasAfectadas = sentencia.executeUpdate(consulta);
            LOGGER.info("Filas afectadas: " + filasAfectadas);
            return filasAfectadas;
        } catch (SQLException e) {
            LOGGER.severe("Error al ejecutar la actualización: " + e.getMessage());
            throw new IllegalStateException("¡Error al ejecutar la actualización!", e);
        }
    }

        /**
     * Ejecuta una consulta utilizando un PreparedStatement y procesa el ResultSet mediante un handler.
     * Este método es útil para consultas parametrizadas.
     *
     * @param <T> El tipo de resultado que se devolverá.
     * @param consulta La consulta SQL parametrizada.
     * @param handler Una función que procesa el ResultSet y devuelve un resultado.
     * @param parametros Los parámetros que se establecerán en el PreparedStatement.
     * @return El resultado procesado por el handler.
     * @throws IllegalStateException si ocurre algún error durante la ejecución.
     */
    public static <T> T ejecutarConsultaPreparada(String consulta, Function<ResultSet, T> handler, Object... parametros) {
        LOGGER.info("Ejecutando consulta preparada: " + consulta);
        try (Connection conexion = obtenerConexion();
             PreparedStatement preparedStatement = conexion.prepareStatement(consulta)) {

            for (int i = 0; i < parametros.length; i++) {
                preparedStatement.setObject(i + 1, parametros[i]);
            }

            try (ResultSet resultado = preparedStatement.executeQuery()) {
                return handler.apply(resultado);
            }
        } catch (SQLException e) {
            LOGGER.severe("Error al ejecutar la consulta preparada: " + e.getMessage());
            throw new IllegalStateException("¡Error al ejecutar la consulta preparada!", e);
        }
    }

    /**
     * Ejecuta una actualización utilizando un PreparedStatement y devuelve el número de filas afectadas.
     * Este método es útil para operaciones parametrizadas.
     *
     * @param consulta La consulta SQL de actualización parametrizada.
     * @param parametros Los parámetros que se establecerán en el PreparedStatement.
     * @return Número de filas afectadas.
     * @throws IllegalStateException si ocurre algún error durante la ejecución.
     */
    public static int ejecutarActualizacionPreparada(String consulta, Object... parametros) {
        LOGGER.info("Ejecutando actualización preparada: " + consulta);
        try (Connection conexion = obtenerConexion();
             PreparedStatement preparedStatement = conexion.prepareStatement(consulta)) {

            for (int i = 0; i < parametros.length; i++) {
                preparedStatement.setObject(i + 1, parametros[i]);
            }

            int filasAfectadas = preparedStatement.executeUpdate();
            LOGGER.info("Filas afectadas: " + filasAfectadas);
            return filasAfectadas;
        } catch (SQLException e) {
            LOGGER.severe("Error al ejecutar la actualización preparada: " + e.getMessage());
            throw new IllegalStateException("¡Error al ejecutar la actualización preparada!", e);
        }
    }

    /**
     * Ejecuta una consulta escalar que retorna un único valor.
     *
     * @param <T>  El tipo de resultado que se espera.
     * @param consulta La consulta SQL a ejecutar.
     * @param tipo La clase del tipo que se espera retornar.
     * @return El valor de la primera columna de la primera fila, o null si no hay resultados.
     * @throws IllegalStateException si ocurre algún error durante la ejecución.
     */
    public static <T> T ejecutarConsultaEscalar(String consulta, Class<T> tipo) {
        LOGGER.info("Ejecutando consulta escalar: " + consulta);
        try (Connection conexion = obtenerConexion();
             Statement sentencia = conexion.createStatement();
             ResultSet rs = sentencia.executeQuery(consulta)) {

            if (rs.next()) {
                return tipo.cast(rs.getObject(1));
            } else {
                return null;
            }
        } catch (SQLException e) {
            LOGGER.severe("Error al ejecutar la consulta escalar: " + e.getMessage());
            throw new IllegalStateException("¡Error al ejecutar la consulta escalar!", e);
        }
    }

}
