package com.poo.catedra.mapper;

import com.poo.catedra.model.Usuario;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class UsuarioMapper implements Mapper<Usuario> {

    @Override
    public Usuario map(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setId(rs.getInt("id"));
        usuario.setEmail(rs.getString("email"));
        usuario.setRol(rs.getString("rol"));
        usuario.setPassword(rs.getString("password"));
        usuario.setEstado(rs.getBoolean("estado"));
        usuario.setFecha_creacion(rs.getTimestamp("fecha_creacion").toLocalDateTime());
        usuario.setFecha_actualizacion(rs.getTimestamp("fecha_actualizacion").toLocalDateTime());

        Timestamp fecha_inactivacion = rs.getTimestamp("fecha_inactivacion");
        if (fecha_inactivacion != null) {
            usuario.setFecha_inactivacion(fecha_inactivacion.toLocalDateTime());
        } else {
            usuario.setFecha_inactivacion(null);
        }

        return usuario;
    }
}
