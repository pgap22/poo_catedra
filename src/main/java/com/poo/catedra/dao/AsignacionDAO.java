package com.poo.catedra.dao;

import com.poo.catedra.mapper.AsignacionMapper;
import com.poo.catedra.model.Asignacion;
import com.poo.catedra.utils.Conexion;

import java.util.List;

public class AsignacionDAO {
    private final AsignacionMapper mapper = new AsignacionMapper();

    /**
     * Obtiene todas las asignaciones de la base de datos.
     *
     * @return Lista de asignaciones ordenadas por fechaHoraInicio descendente.
     */
    public List<Asignacion> obtenerTodos() {
        String sql = "SELECT * FROM asignaciones ORDER BY fechaHoraInicio DESC";
        return Conexion.query(sql, mapper);
    }

    /**
     * Obtiene una asignación por su ID.
     *
     * @param id El ID de la asignación a buscar.
     * @return La asignación encontrada, o null si no existe.
     */
    public Asignacion obtenerPorId(int id) {
        String sql = "SELECT * FROM asignaciones WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    /**
     * Inserta una nueva asignación en la base de datos.
     *
     * @param asignacion La asignación a insertar.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int insertar(Asignacion asignacion) {
        String sql = """
            INSERT INTO asignaciones
            (cotizacionId, empleadoId, areaAsignada, tituloActividad, fechaHoraInicio, fechaHoraFin, costoPorHora, incrementoExtraPorcentaje, cantidadHorasAproximadas)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """;
        return Conexion.execute(sql,
                asignacion.getCotizacionId(),
                asignacion.getEmpleadoId(),
                asignacion.getAreaAsignada(),
                asignacion.getTituloActividad(),
                asignacion.getFechaHoraInicio(),
                asignacion.getFechaHoraFin(),
                asignacion.getCostoPorHora(),
                asignacion.getIncrementoExtraPorcentaje(),
                asignacion.getCantidadHorasAproximadas()
        );
    }

    /**
     * Actualiza una asignación existente en la base de datos.
     *
     * @param asignacion La asignación con los datos actualizados.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int actualizar(Asignacion asignacion) {
        String sql = """
            UPDATE asignaciones SET
                cotizacionId = ?,
                empleadoId = ?,
                areaAsignada = ?,
                tituloActividad = ?,
                fechaHoraInicio = ?,
                fechaHoraFin = ?,
                costoPorHora = ?,
                incrementoExtraPorcentaje = ?,
                cantidadHorasAproximadas = ?
            WHERE id = ?
            """;
        return Conexion.execute(sql,
                asignacion.getCotizacionId(),
                asignacion.getEmpleadoId(),
                asignacion.getAreaAsignada(),
                asignacion.getTituloActividad(),
                asignacion.getFechaHoraInicio(),
                asignacion.getFechaHoraFin(),
                asignacion.getCostoPorHora(),
                asignacion.getIncrementoExtraPorcentaje(),
                asignacion.getCantidadHorasAproximadas(),
                asignacion.getId()
        );
    }

    /**
     * Elimina una asignación de la base de datos por su ID.
     *
     * @param id El ID de la asignación a eliminar.
     * @return El número de filas afectadas (1 si fue exitoso).
     */
    public int eliminar(int id) {
        String sql = "DELETE FROM asignaciones WHERE id = ?";
        return Conexion.execute(sql, id);
    }

    /**
     * Obtiene todas las asignaciones relacionadas con una cotización específica.
     *
     * @param cotizacionId El ID de la cotización.
     * @return Lista de asignaciones filtradas por cotizacionId.
     */
    public List<Asignacion> obtenerPorCotizacionId(int cotizacionId) {
        String sql = "SELECT * FROM asignaciones WHERE cotizacionId = ? ORDER BY fechaHoraInicio DESC";
        return Conexion.query(sql, mapper, cotizacionId);
    }

}