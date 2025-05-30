package com.poo.catedra.utils;

import com.poo.catedra.mapper.Mapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * Clase utilitaria para gestionar la conexión y operaciones con la base de datos.
 * Proporciona métodos estáticos para ejecutar consultas, obtener listas de resultados,
 * obtener un único resultado, ejecutar comandos de actualización y obtener valores escalares.
 */
public final class Conexion {

    private static final Logger LOGGER = Logger.getLogger(Conexion.class.getName());

    // URL, usuario y contraseña de la base de datos
    private static final String URL = "jdbc:mysql://localhost:3306/db_poo";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = "";

    // Cargar el driver de MySQL al iniciar la clase
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
    private Conexion() {}

    /**
     * Obtiene una conexión activa con la base de datos.
     *
     * @return objeto Connection listo para usarse.
     */
    public static Connection obtenerConexion() {
        try {
            Connection conexion = DriverManager.getConnection(URL, USUARIO, CONTRASENA);
            LOGGER.info("Base de datos conectada");
            return conexion;
        } catch (SQLException e) {
            LOGGER.severe("Error al conectar a la base de datos: " + e.getMessage());
            throw new IllegalStateException("No se puede conectar a la base de datos!", e);
        }
    }

    /**
     * Ejecuta una consulta SELECT que devuelve múltiples resultados.
     *
     * @param sql    Consulta SQL con placeholders.
     * @param mapper Mapper que transforma cada fila del ResultSet a un objeto del tipo T.
     * @param params Parámetros de la consulta.
     * @return Lista de resultados mapeados.
     * @param <T>    Tipo del objeto de resultado.
     */
    public static <T> List<T> query(String sql, Mapper<T> mapper, Object... params) {
        LOGGER.info("Ejecutando query: " + sql);
        List<T> resultados = new ArrayList<>();
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    resultados.add(mapper.map(rs));
                }
            }
        } catch (SQLException e) {
            LOGGER.severe("Error en query: " + e.getMessage());
            throw new IllegalStateException("Error al ejecutar query", e);
        }
        return resultados;
    }

    /**
     * Ejecuta una consulta SELECT que devuelve un único resultado.
     *
     * @param sql    Consulta SQL con placeholders.
     * @param mapper Mapper que transforma una fila del ResultSet en un objeto del tipo T.
     * @param params Parámetros de la consulta.
     * @return Objeto mapeado o null si no hay resultados.
     * @param <T>    Tipo del objeto de resultado.
     */
    public static <T> T queryOne(String sql, Mapper<T> mapper, Object... params) {
        LOGGER.info("Ejecutando queryOne: " + sql);
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapper.map(rs);
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            LOGGER.severe("Error en queryOne: " + e.getMessage());
            throw new IllegalStateException("Error al ejecutar queryOne", e);
        }
    }

    /**
     * Ejecuta una instrucción INSERT, UPDATE o DELETE.
     * Si se trata de un INSERT, retorna el ID generado automáticamente.
     *
     * @param sql    Consulta SQL a ejecutar.
     * @param params Parámetros para el PreparedStatement.
     * @return Número de filas afectadas o ID generado si es un INSERT.
     */
    public static int execute(String sql, Object... params) {
        LOGGER.info("Ejecutando executeUpdate: " + sql);

        // Detectar si es una sentencia INSERT
        boolean isInsert = sql.trim().toUpperCase().startsWith("INSERT");

        try (Connection con = obtenerConexion();
             PreparedStatement ps = isInsert
                     ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
                     : con.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }

            int filasAfectadas = ps.executeUpdate();
            LOGGER.info("Filas afectadas: " + filasAfectadas);

            if (isInsert) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        int idGenerado = keys.getInt(1);
                        LOGGER.info("ID generado: " + idGenerado);
                        return idGenerado;
                    }
                }
                return -1;
            } else {
                return filasAfectadas;
            }
        } catch (SQLException e) {
            LOGGER.severe("Error en executeUpdate: " + e.getMessage());
            throw new IllegalStateException("Error al ejecutar actualización", e);
        }
    }

    /**
     * Ejecuta una consulta que retorna un solo valor escalar (como COUNT, MAX, MIN, etc.).
     *
     * @param sql    Consulta SQL.
     * @param tipo   Clase del tipo esperado de resultado.
     * @param params Parámetros de la consulta.
     * @param <T>    Tipo de Ddato esperado.
     * @return Valor escalar o null si no hay resultados.
     */
    public static <T> T queryScalar(String sql, Class<T> tipo, Object... params) {
        LOGGER.info("Ejecutando queryScalar: " + sql);
        try (Connection con = obtenerConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                ps.setObject(i + 1, params[i]);
            }

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return tipo.cast(rs.getObject(1));
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            LOGGER.severe("Error en queryScalar: " + e.getMessage());
            throw new IllegalStateException("Error al ejecutar consulta escalar", e);
        }
    }
}
