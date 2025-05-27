package com.poo.catedra.mapper;

import com.poo.catedra.enums.TipoContratacion;
import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Empleado;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class EmpleadoMapper implements Mapper<Empleado> {

    @Override
    public Empleado map(ResultSet rs) throws SQLException {
        Empleado empleado = new Empleado();

        // Mapear campos básicos
        empleado.setId(rs.getInt("id"));
        empleado.setNombre(rs.getString("nombre"));
        empleado.setDocumentoIdentificacion(rs.getString("documentoIdentificacion"));

        // Mapear enums (TipoPersona y TipoContratacion)
        String tipoPersona = rs.getString("tipoPersona");
        if (tipoPersona != null) {
            empleado.setTipoPersona(TipoPersona.valueOf(tipoPersona));
        }

        String tipoContratacion = rs.getString("tipoContratacion");
        if (tipoContratacion != null) {
            empleado.setTipoContratacion(TipoContratacion.valueOf(tipoContratacion));
        }

        // Mapear campos restantes
        empleado.setTelefono(rs.getString("telefono"));
        empleado.setCorreo(rs.getString("correo"));
        empleado.setDireccion(rs.getString("direccion"));
        empleado.setEstado(rs.getBoolean("estado")); // Activo o Inactivo

        empleado.setCreadoPorId(rs.getInt("creadoPorId"));

        // Manejar fechas
        empleado.setFechaCreacion(rs.getObject("fechaCreacion", LocalDateTime.class));
        empleado.setFechaActualizacion(rs.getObject("fechaActualizacion", LocalDateTime.class));

        // Fecha de inactivación puede ser NULL
        if (rs.getObject("fechaInactivacion") != null) {
            empleado.setFechaInactivacion(rs.getObject("fechaInactivacion", LocalDateTime.class));
        }

        return empleado;
    }
}