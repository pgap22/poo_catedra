package com.poo.catedra.dao;

import com.poo.catedra.mapper.EmpleadoMapper;
import com.poo.catedra.model.Empleado;
import com.poo.catedra.utils.Conexion;

import java.util.List;

public class EmpleadoDAO {

    private final EmpleadoMapper mapper = new EmpleadoMapper();

    public List<Empleado> obtenerTodos() {
        String sql = "SELECT * FROM empleados ORDER BY nombre ASC";
        return Conexion.query(sql, mapper);
    }

    public Empleado obtenerPorId(int id) {
        String sql = "SELECT * FROM empleados WHERE id = ?";
        return Conexion.queryOne(sql, mapper, id);
    }

    public int insertar(Empleado empleado) {
        String sql = """
            INSERT INTO empleados (
                nombre,
                documentoIdentificacion,
                tipoPersona,
                tipoContratacion,
                telefono,
                correo,
                direccion,
                estado,
                creadoPorId,
                fechaCreacion,
                fechaActualizacion
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """;
        return Conexion.execute(sql,
                empleado.getNombre(),
                empleado.getDocumentoIdentificacion(),
                empleado.getTipoPersona().name(),
                empleado.getTipoContratacion().name(),
                empleado.getTelefono(),
                empleado.getCorreo(),
                empleado.getDireccion(),
                empleado.getEstado(),
                empleado.getCreadoPorId(),
                empleado.getFechaCreacion(),
                empleado.getFechaActualizacion()
        );
    }

    public int actualizar(Empleado empleado) {
        String sql = """
            UPDATE empleados SET
                nombre = ?,
                documentoIdentificacion = ?,
                tipoPersona = ?,
                tipoContratacion = ?,
                telefono = ?,
                correo = ?,
                direccion = ?,
                estado = ?,
                creadoPorId = ?,
                fechaActualizacion = ?,
                fechaInactivacion = ?
            WHERE id = ?
            """;
        return Conexion.execute(sql,
                empleado.getNombre(),
                empleado.getDocumentoIdentificacion(),
                empleado.getTipoPersona().name(),
                empleado.getTipoContratacion().name(),
                empleado.getTelefono(),
                empleado.getCorreo(),
                empleado.getDireccion(),
                empleado.getEstado(),
                empleado.getCreadoPorId(),
                empleado.getFechaActualizacion(),
                empleado.getFechaInactivacion(),
                empleado.getId()
        );
    }

    public int eliminar(int id) {
        String sql = "DELETE FROM empleados WHERE id = ?";
        return Conexion.execute(sql, id);
    }

    public Empleado obtenerPorDocumentoIdentificacion(String documentoIdentificacion) {
        String sql = "SELECT * FROM empleados WHERE documentoIdentificacion = ?";
        return Conexion.queryOne(sql, mapper, documentoIdentificacion);
    }

    public List<Empleado> obtenerEmpleadosActivos() {
        String sql = "SELECT * FROM empleados WHERE estado = 1";
        return Conexion.query(sql, mapper);
    }
}