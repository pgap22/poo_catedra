package com.poo.catedra.dao;

import com.poo.catedra.mapper.CotizacionMapper;
import com.poo.catedra.model.Cotizacion;
import com.poo.catedra.utils.Conexion;

import java.util.List;

public class CotizacionDAO {
    private final CotizacionMapper mapper = new CotizacionMapper();

    /**
     * Obtiene todas las cotizaciones de la base de datos.
     *
     * @return Lista de cotizaciones ordenadas por fecha de creación descendente.
     */
    public List<Cotizacion> obtenerTodos() {
        String sql = "SELECT * FROM cotizaciones ORDER BY fechaCreacion DESC";
        return Conexion.query(sql, mapper);
    }

    /**
     * Obtiene una cotización por su ID.
     *
     * @param id El ID de la cotización a buscar.
     * @return La cotización encontrada, o null si no existe.
     */
    public Cotizacion obtenerPorId(int id) {
        String sql = "SELECT * FROM cotizaciones WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    /**
     * Inserta una nueva cotización en la base de datos.
     *
     * @param cotizacion La cotización a insertar.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int insertar(Cotizacion cotizacion) {
        String sql = """
            INSERT INTO cotizaciones
            (clienteId, estado, fechaInicioTentativa, fechaFinTentativa, costoAdicionales, creadoPorId)
            VALUES (?, ?, ?, ?, ?, ?)
            """;
        return Conexion.execute(sql,
                cotizacion.getClienteId(),
                cotizacion.getEstado().name(), // Convertir enum a String
                cotizacion.getFechaInicioTentativa(),
                cotizacion.getFechaFinTentativa(),
                cotizacion.getCostoAdicionales(),
                cotizacion.getCreadoPorId()
        );
    }

    /**
     * Actualiza una cotización existente en la base de datos.
     *
     * @param cotizacion La cotización con los datos actualizados.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int actualizar(Cotizacion cotizacion) {
        String sql = """
            UPDATE cotizaciones SET
                clienteId = ?,
                estado = ?,
                fechaInicioTentativa = ?,
                fechaFinTentativa = ?,
                costoAdicionales = ?,
                creadoPorId = ?
            WHERE id = ?
            """;
        return Conexion.execute(sql,
                cotizacion.getClienteId(),
                cotizacion.getEstado().name(), // Convertir enum a String
                cotizacion.getFechaInicioTentativa(),
                cotizacion.getFechaFinTentativa(),
                cotizacion.getCostoAdicionales(),
                cotizacion.getCreadoPorId(),
                cotizacion.getId()
        );
    }

    /**
     * Elimina una cotización de la base de datos por su ID.
     *
     * @param id El ID de la cotización a eliminar.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int eliminar(int id) {
        String sql = "DELETE FROM cotizaciones WHERE id = ?";
        return Conexion.execute(sql, id);
    }
}