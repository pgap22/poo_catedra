package com.poo.catedra.dao;

import com.poo.catedra.mapper.SubtareaMapper;
import com.poo.catedra.model.Subtarea;
import com.poo.catedra.utils.Conexion;

import java.util.List;

public class SubtareaDAO {

    private final SubtareaMapper mapper = new SubtareaMapper();

    // Obtener todas las subtareas
    public List<Subtarea> obtenerTodos() {
        String sql = "SELECT * FROM subtareas ORDER BY id ASC";
        return Conexion.query(sql, mapper);
    }

    // Obtener una subtarea por su ID
    public Subtarea obtenerPorId(int id) {
        String sql = "SELECT * FROM subtareas WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    // Obtener todas las subtareas relacionadas con una asignación específica
    public List<Subtarea> obtenerPorAsignacionId(int asignacionId) {
        String sql = "SELECT * FROM subtareas WHERE asignacionId = ? ORDER BY id ASC";
        return Conexion.query(sql, mapper, asignacionId);
    }

    // Insertar una nueva subtarea
    public int insertar(Subtarea subtarea) {
        String sql = """
            INSERT INTO subtareas
            (asignacionId, tituloSubtarea, descripcion)
            VALUES (?, ?, ?)
            """;
        return Conexion.execute(sql,
                subtarea.getAsignacionId(),
                subtarea.getTituloSubtarea(),
                subtarea.getDescripcion()
        );
    }

    // Actualizar una subtarea existente
    public int actualizar(Subtarea subtarea) {
        String sql = """
            UPDATE subtareas SET
                asignacionId = ?,
                tituloSubtarea = ?,
                descripcion = ?
            WHERE id = ?
            """;
        return Conexion.execute(sql,
                subtarea.getAsignacionId(),
                subtarea.getTituloSubtarea(),
                subtarea.getDescripcion(),
                subtarea.getId()
        );
    }

    // Eliminar una subtarea por su ID
    public int eliminar(int id) {
        String sql = "DELETE FROM subtareas WHERE id = ?";
        return Conexion.execute(sql, id);
    }

    // Obtener subtareas por asignación ID
    public List<Subtarea> obtenerSubtareasPorAsignacionId(int asignacionId) {
        String sql = "SELECT * FROM subtareas WHERE asignacionId = ? ORDER BY id ASC";
        return Conexion.query(sql, mapper, asignacionId);
    }

}