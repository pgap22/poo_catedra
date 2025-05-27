package com.poo.catedra.mapper;

import com.poo.catedra.enums.TipoPersona;
import com.poo.catedra.model.Cliente;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class ClienteMapper implements Mapper<Cliente> {

    @Override
    public Cliente map(ResultSet rs) throws SQLException {
        Cliente cliente = new Cliente();

        cliente.setId(rs.getInt("id"));
        cliente.setNombre(rs.getString("nombre"));
        cliente.setDocumentoIdentificacion(rs.getString("documentoIdentificacion"));
        cliente.setTipoPersona(TipoPersona.valueOf(rs.getString("tipoPersona").toUpperCase()));
        cliente.setTelefono(rs.getString("telefono"));
        cliente.setCorreo(rs.getString("correo"));
        cliente.setDireccion(rs.getString("direccion"));
        cliente.setEstado(rs.getBoolean("estado"));
        cliente.setCreadoPorId(rs.getInt("creadoPorId"));
        cliente.setFechaCreacion(rs.getObject("fechaCreacion", LocalDateTime.class));
        cliente.setFechaActualizacion(rs.getObject("fechaActualizacion", LocalDateTime.class));

        if (rs.getObject("fechaInactivacion") != null) {
            cliente.setFechaInactivacion(rs.getObject("fechaInactivacion", LocalDateTime.class));
        }

        return cliente;
    }
}
