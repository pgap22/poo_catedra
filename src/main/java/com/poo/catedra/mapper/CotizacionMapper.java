package com.poo.catedra.mapper;

import com.poo.catedra.enums.EstadoCotizacion;
import com.poo.catedra.model.Cotizacion;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class CotizacionMapper implements Mapper<Cotizacion> {

    @Override
    public Cotizacion map(ResultSet rs) throws SQLException {
        Cotizacion cotizacion = new Cotizacion();
        cotizacion.setId(rs.getInt("id"));
        cotizacion.setClienteId(rs.getInt("clienteId"));

        // Mapear el estado usando el enum EstadoCotizacion
        String estado = rs.getString("estado");
        if (estado != null) {
            cotizacion.setEstado(EstadoCotizacion.valueOf(estado));
        }

        cotizacion.setFechaInicioTentativa(rs.getObject("fechaInicioTentativa", LocalDateTime.class));
        cotizacion.setFechaFinTentativa(rs.getObject("fechaFinTentativa", LocalDateTime.class));
        cotizacion.setCostoAdicionales(rs.getDouble("costoAdicionales"));
        cotizacion.setCreadoPorId(rs.getInt("creadoPorId"));
        cotizacion.setFechaCreacion(rs.getObject("fechaCreacion", LocalDateTime.class));

        return cotizacion;
    }
}