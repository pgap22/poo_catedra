package com.poo.catedra.mapper;

import com.poo.catedra.model.Usuario;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioMapper implements Mapper<Usuario> {

    public Usuario map(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setId(rs.getInt("id"));
        usuario.setNombreUsuario(rs.getString("nombreUsuario"));
        usuario.setRol(rs.getString("rol"));
        usuario.setPassword(rs.getString("password"));
        return usuario;
    }
}