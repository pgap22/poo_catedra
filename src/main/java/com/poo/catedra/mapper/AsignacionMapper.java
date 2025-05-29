package com.poo.catedra.mapper;

import com.poo.catedra.model.Asignacion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class AsignacionMapper implements Mapper<Asignacion> {

    @Override
    public Asignacion map(ResultSet rs) throws SQLException {
        Asignacion asignacion = new Asignacion();
        asignacion.setId(rs.getInt("id"));
        asignacion.setCotizacionId(rs.getInt("cotizacionId"));
        asignacion.setEmpleadoId(rs.getInt("empleadoId"));
        asignacion.setAreaAsignada(rs.getString("areaAsignada"));
        asignacion.setTituloActividad(rs.getString("tituloActividad"));
        asignacion.setFechaHoraInicio(rs.getObject("fechaHoraInicio", LocalDateTime.class));
        asignacion.setFechaHoraFin(rs.getObject("fechaHoraFin", LocalDateTime.class));
        asignacion.setCostoPorHora(rs.getDouble("costoPorHora"));
        asignacion.setIncrementoExtraPorcentaje(rs.getDouble("incrementoExtraPorcentaje"));
        asignacion.setCantidadHorasAproximadas(rs.getDouble("cantidadHorasAproximadas"));
        return asignacion;
    }
}